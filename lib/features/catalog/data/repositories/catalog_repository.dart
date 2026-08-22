import 'dart:io';

import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/trust_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shelf.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tag.dart';
import 'package:shopnexus_flutter_app/core/storage/hive_storage.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/models/catalog_model.dart';

part 'catalog_repository.g.dart';

/// One page of reviews plus the cursor that follows it. The listing feed is
/// page-paginated and reviews are cursor-paginated, so the two cannot share a
/// page type.
class ReviewsPage {
  const ReviewsPage({required this.reviews, this.nextCursor});

  final List<Review> reviews;
  final String? nextCursor;

  bool get hasMore => nextCursor != null && nextCursor!.isNotEmpty;
}

/// One page of the listing feed, plus what a search understood. Both search
/// fields default to empty: a browse carries none, and neither does a page
/// served from the offline cache — that cache is last page's listings, not a
/// second copy of an understanding the server already answered once.
class ListingsPage {
  const ListingsPage({
    required this.listings,
    this.understood = '',
    this.probes = const [],
  });

  final List<Listing> listings;
  final String understood;
  final List<String> probes;
}

class CatalogRepository {
  const CatalogRepository(this._api, this._trustApi, this._hiveService);

  final CatalogApi _api;

  /// Product reviews live in `trust`, not in catalog: the average they feed into
  /// a listing's `rating` is pushed across, because the two are separate schemas.
  final TrustApi _trustApi;

  final HiveService _hiveService;

  /// `province_code`/`ward_code` filter on the listing's own snapshot of the
  /// seller's pickup address; `nearContactId` (or `lat`+`lon`) is where the buyer
  /// is measuring from, which is what makes every card carry
  /// `location.distance_km`.
  Future<ListingsPage> listings({
    String? keyword,
    bool? mine,
    bool? favorited,
    ListingStatus? status,
    String? categoryId,
    String? vendorId,
    String? tag,
    ListingCondition? condition,
    int? priceMin,
    int? priceMax,
    String? provinceCode,
    String? wardCode,
    double? lat,
    double? lon,
    String? nearContactId,
    double? radiusKm,
    String? sort,
    String? seed,
    int? page,
    int? size,
  }) async {
    // Combinations the API answers 400 to. Dropping the half that cannot stand
    // beats sending a request that has no answer, and it is one place rather
    // than one per screen.
    final hasPosition = nearContactId != null || (lat != null && lon != null);
    final hasQuery = keyword != null && keyword.trim().isNotEmpty;
    final isMine = mine ?? false;
    final isFavorited = favorited ?? false;

    var effectiveSort = sort;
    if (effectiveSort == ListingSort.distance && !hasPosition) {
      effectiveSort = null;
    }
    if (effectiveSort == ListingSort.relevance && !hasQuery) {
      effectiveSort = null;
    }
    if (effectiveSort == ListingSort.recommended && (isMine || isFavorited)) {
      effectiveSort = null;
    }

    // What the cached copy of this page is filed under. Every filter that
    // changes *which* listings come back is in it, so a cached answer can only
    // ever be replayed for the question it answered.
    final cacheKey = _cacheKey(
      keyword: hasQuery ? keyword.trim() : null,
      mine: isMine,
      favorited: isFavorited,
      status: isMine ? status : null,
      categoryId: categoryId,
      tag: tag,
      vendorId: vendorId,
      condition: condition,
      priceMin: priceMin,
      priceMax: priceMax,
      provinceCode: provinceCode,
      wardCode: wardCode,
      lat: lat,
      lon: lon,
      nearContactId: nearContactId,
      radiusKm: radiusKm,
      sort: effectiveSort,
      size: size,
    );

    try {
      final response = await _api.listingsGet(
        q: hasQuery ? keyword.trim() : null,
        mine: isMine ? true : null,
        favorited: isFavorited ? true : null,
        // Only honoured together with mine=true, and refused without it.
        status: isMine ? status : null,
        categoryId: categoryId,
        tag: tag,
        sellerId: vendorId,
        condition: condition,
        minPrice: priceMin,
        maxPrice: priceMax,
        provinceCode: provinceCode,
        // No district_code: Vietnam has two tiers, so the backend drops it and a
        // listing's address snapshot has none to match.
        wardCode: wardCode,
        lat: nearContactId == null ? lat : null,
        lon: nearContactId == null ? lon : null,
        nearContactId: nearContactId,
        radiusKm: hasPosition ? radiusKm : null,
        sort: effectiveSort,
        // Only honoured for sort=recommended; left out, the server rotates its own
        // fallback every fifteen minutes, which is what made a reopened feed look
        // unchanged.
        seed: effectiveSort == ListingSort.recommended ? seed : null,
        page: page,
        limit: size,
      );
      final listings = response.data?.data ?? const [];
      if (listings.isNotEmpty && (page == null || page <= 1)) {
        await _saveCachedListings(cacheKey, listings);
      }
      return ListingsPage(
        listings: listings,
        understood: response.data?.understood ?? '',
        probes: response.data?.probes ?? const [],
      );
    } catch (e) {
      // Offline fallback, and only that: a browse that reached the server and
      // was answered `400` or `500` has to surface as the error it is. Serving
      // the last page that happened to succeed instead is how a category page
      // ended up showing listings from outside the category.
      if (_isOffline(e) && (page == null || page <= 1)) {
        final cached = await _getCachedListings(cacheKey);
        if (cached.isNotEmpty) return ListingsPage(listings: cached);
      }
      rethrow;
    }
  }

  /// Whether the request never got an answer. A response with a status code —
  /// however unhappy — is an answer, and answering it from cache would be
  /// making one up.
  static bool _isOffline(Object error) {
    if (error is! DioException) return false;
    switch (error.type) {
      case DioExceptionType.connectionError:
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return true;
      case DioExceptionType.unknown:
        return error.error is SocketException;
      // A response arrived, or the client itself gave up on one it had: neither
      // is the network being absent.
      default:
        return false;
    }
  }

  /// Filters that decide *which* listings come back, in a fixed order. `page` is
  /// left out because only the first page is cached.
  static String _cacheKey({
    String? keyword,
    required bool mine,
    required bool favorited,
    ListingStatus? status,
    String? categoryId,
    String? tag,
    String? vendorId,
    ListingCondition? condition,
    int? priceMin,
    int? priceMax,
    String? provinceCode,
    String? wardCode,
    double? lat,
    double? lon,
    String? nearContactId,
    double? radiusKm,
    String? sort,
    int? size,
  }) {
    return [
      keyword ?? '',
      mine ? '1' : '',
      favorited ? '1' : '',
      status?.value ?? '',
      categoryId ?? '',
      tag ?? '',
      vendorId ?? '',
      condition?.value ?? '',
      priceMin?.toString() ?? '',
      priceMax?.toString() ?? '',
      provinceCode ?? '',
      wardCode ?? '',
      lat?.toString() ?? '',
      lon?.toString() ?? '',
      nearContactId ?? '',
      radiusKm?.toString() ?? '',
      sort ?? '',
      size?.toString() ?? '',
    ].join(' ');
  }

  /// How many distinct browses keep an offline copy. Small on purpose: this is a
  /// courtesy for the last few screens visited, not a mirror of the catalogue.
  static const _cachedBrowseLimit = 8;

  /// The whole card is kept, not a [RecentListing] of it: that projection drops
  /// `category_id`, `favorited` and `status`, so a restored page used to render
  /// products that belonged to no category at all.
  Future<void> _saveCachedListings(String key, List<Listing> listings) async {
    try {
      final box = _hiveService.recentBox;
      final cache = _readCache(box);
      // Re-inserted rather than updated in place, so the map stays in
      // least-recently-written order and the eviction below drops the oldest.
      cache.remove(key);
      cache[key] = listings.map((l) => l.toJson()).toList();
      while (cache.length > _cachedBrowseLimit) {
        cache.remove(cache.keys.first);
      }
      await box.put('cached_listings', cache);
    } catch (_) {}
  }

  Future<List<Listing>> _getCachedListings(String key) async {
    try {
      final raw = _readCache(_hiveService.recentBox)[key];
      if (raw is! List) return [];
      return raw
          .map((e) => Listing.fromJson(Map<String, dynamic>.from(e as Map)))
          .toList();
    } catch (_) {
      return [];
    }
  }

  /// Hive hands nested structures back as `Map<dynamic, dynamic>`, and the older
  /// shape under this key was a bare `List`. Both read as "nothing cached".
  Map<String, dynamic> _readCache(Box<dynamic> box) {
    final stored = box.get('cached_listings');
    if (stored is! Map) return <String, dynamic>{};
    return Map<String, dynamic>.from(stored);
  }

  /// Trang chủ dưới dạng kệ: mỗi hàng mang theo *lý do* nó có mặt.
  ///
  /// Không gộp được vào [listings]. `sort=recommended` trộn cả bốn hướng sở thích
  /// của một người vào một thứ hạng duy nhất, nên người đọc nhận một trang và
  /// không có cách nào biết hướng nào sinh ra thẻ nào; route này đưa từng hướng ra
  /// riêng một hàng, cùng hàng "tương tự cái vừa xem" và mấy hàng của cả sàn.
  /// Bao nhiêu hàng là câu trả lời của server — [limit] chỉ nói số thẻ *mỗi* hàng.
  ///
  /// Không cache offline: một kệ dựng từ hành vi mới nhất của người đọc, nên bản
  /// chép của lần trước là một lời nói sai về chính họ. Rỗng không phải lỗi —
  /// khách chưa đăng nhập nhận trang ngắn hơn, và một sàn quá ít tin sống thì
  /// không đủ thẻ cho hàng nào cả.
  Future<List<Shelf>> shelves({int limit = 12}) async =>
      (await _api.listingsShelvesGet(limit: limit)).data?.data ?? const [];

  /// Also records the listing in the "vừa xem" carousel. A failure to cache is
  /// swallowed: a broken Hive box must not take the product page down with it.
  Future<ListingDetail> listingDetail(String id) async {
    try {
      final response = await _api.listingsIdGet(id: id);
      final detail = response.data?.data;
      if (detail == null) throw StateError('empty listing detail response');

      await _addToRecentlyViewed(RecentListing.fromDetail(detail));
      return detail;
    } catch (e, stack) {
      // ignore: avoid_print
      print('❌ [CatalogRepository] listingDetail ERROR for $id: $e');
      // ignore: avoid_print
      print(stack);
      rethrow;
    }
  }

  Future<List<Category>> categories() async {
    final response = await _api.categoriesGet();
    return response.data?.data ?? const [];
  }

  /// A tag's id is its slug, so what comes back is directly what `?tag=` takes.
  /// `q` ranks them by meaning rather than filtering, which is why a listing's
  /// own tags are the better `near` seed than its title.
  Future<List<Tag>> tags({String? q, List<String>? near, int? limit}) async {
    final response = await _api.tagsGet(
      q: q != null && q.trim().isNotEmpty ? q.trim() : null,
      near: near != null && near.isNotEmpty ? near : null,
      limit: limit,
    );
    return response.data?.data ?? const [];
  }

  /// `rating` narrows to one star bucket; `sort` is the contract's own
  /// (`newest`|`helpful`|`rating-desc`|`rating-asc`), and null means `newest`.
  Future<ReviewsPage> reviews(
    String listingId, {
    int? rating,
    String? sort,
    String? cursor,
    int? limit,
  }) async {
    final response = await _trustApi.listingsListingIDReviewsGet(
      listingID: listingId,
      rating: rating,
      sort: sort,
      cursor: cursor,
      limit: limit,
    );
    final page = response.data;
    return ReviewsPage(
      reviews: page?.data ?? const [],
      nextCursor: page?.meta.nextCursor,
    );
  }

  /// Newest first, most recent at the front, ten at most, no duplicates.
  Future<void> _addToRecentlyViewed(RecentListing listing) async {
    try {
      final box = _hiveService.recentBox;
      final rawList = box.get('recently_viewed') as List?;
      final list = rawList != null
          ? List<Map<String, dynamic>>.from(
              rawList.map((e) => Map<String, dynamic>.from(e as Map)),
            )
          : <Map<String, dynamic>>[];

      list.removeWhere((item) => item['id'] == listing.id);
      list.insert(0, listing.toJson());
      if (list.length > 10) list.removeRange(10, list.length);

      await box.put('recently_viewed', list);
    } catch (e) {
      // Ignored on purpose — see the doc on listingDetail.
    }
  }

  Future<List<RecentListing>> recentlyViewed() async {
    try {
      final box = _hiveService.recentBox;
      final rawList = box.get('recently_viewed') as List?;
      if (rawList == null) return [];
      return rawList
          .map(
            (e) => RecentListing.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList();
    } catch (e) {
      return [];
    }
  }

  /// Search History (lịch sử từ khóa tìm kiếm)
  List<String> getSearchHistory() {
    try {
      final box = _hiveService.recentBox;
      final rawList = box.get('search_history') as List?;
      if (rawList == null) return [];
      return List<String>.from(rawList);
    } catch (e) {
      return [];
    }
  }

  Future<void> saveSearchKeyword(String keyword) async {
    try {
      final trimmed = keyword.trim();
      if (trimmed.isEmpty) return;
      final box = _hiveService.recentBox;
      final list = getSearchHistory();
      list.removeWhere((item) => item.toLowerCase() == trimmed.toLowerCase());
      list.insert(0, trimmed);
      if (list.length > 10) {
        list.removeRange(10, list.length);
      }
      await box.put('search_history', list);
    } catch (e) {
      // Ignored
    }
  }

  Future<void> removeSearchKeyword(String keyword) async {
    try {
      final box = _hiveService.recentBox;
      final list = getSearchHistory();
      list.removeWhere((item) => item.toLowerCase() == keyword.toLowerCase());
      await box.put('search_history', list);
    } catch (e) {
      // Ignored
    }
  }

  Future<void> clearSearchHistory() async {
    try {
      final box = _hiveService.recentBox;
      await box.delete('search_history');
    } catch (e) {
      // Ignored
    }
  }

  Future<void> clearRecentlyViewed() async {
    try {
      final box = _hiveService.recentBox;
      await box.delete('recently_viewed');
    } catch (e) {
      // Ignored
    }
  }

  Future<void> clearCachedListings() async {
    try {
      final box = _hiveService.recentBox;
      await box.delete('cached_listings');
    } catch (e) {
      // Ignored
    }
  }
}

@riverpod
CatalogRepository catalogRepository(Ref ref) {
  return CatalogRepository(
    ref.watch(catalogApiProvider),
    ref.watch(trustApiProvider),
    ref.watch(hiveServiceProvider),
  );
}
