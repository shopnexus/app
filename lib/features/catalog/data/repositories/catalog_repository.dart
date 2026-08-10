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
  Future<List<Listing>> listings({
    String? keyword,
    String? mode,
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

    final response = await _api.listingsGet(
      q: hasQuery ? keyword.trim() : null,
      mode: hasQuery ? mode : null,
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
      page: page,
      limit: size,
    );
    return response.data?.data ?? const [];
  }

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
}

@riverpod
CatalogRepository catalogRepository(Ref ref) {
  return CatalogRepository(
    ref.watch(catalogApiProvider),
    ref.watch(trustApiProvider),
    ref.watch(hiveServiceProvider),
  );
}
