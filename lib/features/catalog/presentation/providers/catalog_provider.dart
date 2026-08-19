import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tag.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/models/catalog_model.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/repositories/catalog_repository.dart';

part 'catalog_provider.freezed.dart';

part 'catalog_provider.g.dart';

@freezed
abstract class CatalogSearchFilters with _$CatalogSearchFilters {
  const CatalogSearchFilters._();

  const factory CatalogSearchFilters({
    String? keyword,
    String? categoryId,
    int? priceMin,
    int? priceMax,
    String? tag,
    String? sort,

    // Where to look: the listing's own snapshot of the seller's pickup address.
    // Send the narrowest level meant — a ward is already inside its province.
    // There is no district: Vietnam goes province to ward, so a listing's
    // snapshot has no district code for one to be matched against.
    String? provinceCode,
    String? wardCode,
    // Codes carry no name, so the chip needs the label the user picked.
    String? areaLabel,

    // Where the buyer is. A saved contact is the usual answer; lat/lon is
    // supported all the way down to the request but no screen sets it, since
    // the app has no geolocation plugin.
    String? nearContactId,
    String? nearLabel,
    double? lat,
    double? lon,
    double? radiusKm,
    @Default(1) int page,
    @Default(20) int size,
  }) = _CatalogSearchFilters;

  bool get hasPosition => nearContactId != null || (lat != null && lon != null);

  bool get hasArea => provinceCode != null || wardCode != null;
}

@freezed
abstract class CatalogProductsState with _$CatalogProductsState {
  const factory CatalogProductsState({
    required List<Listing> products,
    required bool hasMore,
    required bool isLoadingMore,
    required CatalogSearchFilters filters,
    // What the search understood the query to mean, and the phrases it
    // actually ran — both empty for a browse with no query. Carried from the
    // page that started this run and left untouched by `loadNextPage`: the
    // keyword does not change between pages, so re-showing them per page
    // would only risk a flicker for no new information.
    @Default('') String understood,
    @Default([]) List<String> probes,
  }) = _CatalogProductsState;
}

@riverpod
Future<List<Category>> categories(Ref ref) {
  return ref.watch(catalogRepositoryProvider).categories();
}

/// The tag cloud. A tag's id *is* its slug, so what comes back is what `?tag=`
/// takes — no lookup in between. An empty `q` is the trending list; a keyword
/// ranks them against it, which is what makes the row on a result page mean
/// "narrow this search" rather than "here are some tags".
///
/// Keyed by the query string rather than by a list, because a family argument
/// is compared with `==` and a fresh `List` never equals the last one.
final tagSuggestionsProvider = FutureProvider.autoDispose
    .family<List<Tag>, String>((ref, q) {
      return ref.watch(catalogRepositoryProvider).tags(q: q, limit: 20);
    });

/// A fresh run id for the personalised feed. Left out, the server rotates its
/// own default only every fifteen minutes, which is what made reopening the
/// feed answer the same page it just had.
String _newFeedSeed() => Random().nextInt(1 << 32).toRadixString(36);

@riverpod
class CatalogProducts extends _$CatalogProducts {
  /// This run's personalised feed seed, held for every page after the first —
  /// paging has to read the same draw, not a new one — and regenerated
  /// whenever the feed itself restarts: a fresh [build] (screen reopened, pull
  /// to refresh) or an explicit [updateFilters].
  String? _recommendedSeed;

  Future<ListingsPage> _fetch(
    CatalogRepository repo,
    CatalogSearchFilters filters,
  ) {
    return repo.listings(
      keyword: filters.keyword,
      categoryId: filters.categoryId,
      priceMin: filters.priceMin,
      priceMax: filters.priceMax,
      tag: filters.tag,
      sort: filters.sort,
      seed: _recommendedSeed,
      provinceCode: filters.provinceCode,
      wardCode: filters.wardCode,
      nearContactId: filters.nearContactId,
      lat: filters.lat,
      lon: filters.lon,
      radiusKm: filters.radiusKm,
      page: filters.page,
      size: filters.size,
    );
  }

  @override
  FutureOr<CatalogProductsState> build(
    CatalogSearchFilters initialFilters,
  ) async {
    final repo = ref.watch(catalogRepositoryProvider);
    _recommendedSeed = initialFilters.sort == ListingSort.recommended
        ? _newFeedSeed()
        : null;
    final page = await _fetch(repo, initialFilters);
    return CatalogProductsState(
      products: page.listings,
      hasMore: page.listings.length >= initialFilters.size,
      isLoadingMore: false,
      filters: initialFilters,
      understood: page.understood,
      probes: page.probes,
    );
  }

  /// Tải trang tiếp theo (Cuộn vô hạn)
  Future<void> loadNextPage() async {
    final currentState = state.asData?.value;
    if (currentState == null ||
        currentState.isLoadingMore ||
        !currentState.hasMore) {
      return;
    }

    state = AsyncValue.data(currentState.copyWith(isLoadingMore: true));

    final repo = ref.read(catalogRepositoryProvider);
    final nextFilters = currentState.filters.copyWith(
      page: currentState.filters.page + 1,
    );

    try {
      final page = await _fetch(repo, nextFilters);
      final newProducts = page.listings;

      state = AsyncValue.data(
        currentState.copyWith(
          products: [...currentState.products, ...newProducts],
          hasMore:
              newProducts.isNotEmpty && newProducts.length >= nextFilters.size,
          isLoadingMore: false,
          filters: nextFilters,
        ),
      );
    } catch (e) {
      state = AsyncValue.data(
        currentState.copyWith(isLoadingMore: false, hasMore: false),
      );
    }
  }

  /// Cập nhật bộ lọc và làm mới lại danh sách từ trang 1
  Future<void> updateFilters(CatalogSearchFilters newFilters) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repo = ref.read(catalogRepositoryProvider);
      _recommendedSeed = newFilters.sort == ListingSort.recommended
          ? _newFeedSeed()
          : null;
      final page = await _fetch(repo, newFilters);
      return CatalogProductsState(
        products: page.listings,
        hasMore: page.listings.length >= newFilters.size,
        isLoadingMore: false,
        filters: newFilters,
        understood: page.understood,
        probes: page.probes,
      );
    });
  }
}

/// `keepAlive` vì cùng lý do với `checkoutProvider`: bộ lọc được **đặt ở một màn
/// và đọc ở màn khác**.
///
/// Trang Danh mục gọi `setCategory(id)` rồi `context.push('/search')`. Ở chế độ
/// autoDispose, không widget nào watch provider trong khoảng giữa hai câu đó, nên
/// nó bị bỏ đi và màn tìm kiếm mở ra với `categoryId` null — chạm vào một danh mục
/// cho ra *toàn bộ* sàn.
///
/// Bộ lọc còn lại giữa hai lần vào là chấp nhận được: trang Danh mục luôn gọi
/// `reset()` ngay trước khi đặt, nên đường vào đó luôn sạch, còn người vào thẳng
/// `/search` thường muốn thấy lại lần tìm trước.
@Riverpod(keepAlive: true)
class ActiveSearchFilters extends _$ActiveSearchFilters {
  @override
  CatalogSearchFilters build() {
    return const CatalogSearchFilters();
  }

  void setKeyword(String? keyword) {
    state = state.copyWith(keyword: keyword, page: 1);
  }

  void setCategory(String? categoryId) {
    state = state.copyWith(categoryId: categoryId, page: 1);
  }

  void setPriceRange(int? min, int? max) {
    state = state.copyWith(priceMin: min, priceMax: max, page: 1);
  }

  void setSort(String? sort) {
    state = state.copyWith(sort: sort, page: 1);
  }

  /// One tag at a time — `?tag=` takes a single slug, so a second pick replaces
  /// the first rather than intersecting with it.
  void setTag(String? tag) {
    state = state.copyWith(tag: tag, page: 1);
  }

  /// The administrative area to look in. Pass the narrowest level meant — a ward
  /// is already inside its province — and nothing to clear both.
  void setArea({String? provinceCode, String? wardCode, String? label}) {
    state = state.copyWith(
      provinceCode: provinceCode,
      wardCode: wardCode,
      areaLabel: label,
      page: 1,
    );
  }

  /// Where to measure from. Clearing it also drops a distance sort and the
  /// radius, which the API refuses without a position.
  void setNearby({
    String? contactId,
    String? label,
    double? lat,
    double? lon,
    double? radiusKm,
  }) {
    final hasPosition = contactId != null || (lat != null && lon != null);
    state = state.copyWith(
      nearContactId: contactId,
      nearLabel: label,
      lat: lat,
      lon: lon,
      radiusKm: hasPosition ? radiusKm : null,
      sort: !hasPosition && state.sort == ListingSort.distance
          ? null
          : state.sort,
      page: 1,
    );
  }

  /// Applies a whole draft at once, which is what a filter sheet edits.
  void apply(CatalogSearchFilters filters) {
    state = filters.copyWith(page: 1);
  }

  void reset() {
    state = const CatalogSearchFilters();
  }
}

@riverpod
Future<ListingDetail> productDetail(Ref ref, {required String id}) async {
  return ref.watch(catalogRepositoryProvider).listingDetail(id);
}

@freezed
abstract class ProductReviewsState with _$ProductReviewsState {
  const ProductReviewsState._();

  const factory ProductReviewsState({
    required List<Review> reviews,
    String? nextCursor,
    @Default(false) bool isLoadingMore,
  }) = _ProductReviewsState;

  bool get hasMore => nextCursor != null && nextCursor!.isNotEmpty;
}

/// Which reviews of a listing to read, and in what order.
class ReviewQuery {
  const ReviewQuery({this.rating, this.sort = ReviewSort.newest});

  /// One star bucket, or null for every rating.
  final int? rating;
  final String sort;

  ReviewQuery copyWith({int? rating, String? sort, bool clearRating = false}) {
    return ReviewQuery(
      rating: clearRating ? null : (rating ?? this.rating),
      sort: sort ?? this.sort,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is ReviewQuery && other.rating == rating && other.sort == sort;

  @override
  int get hashCode => Object.hash(rating, sort);
}

/// Held apart from [ProductReviews] so that changing it re-runs `build` —
/// which is also what throws the old cursor away, and a cursor belongs to the
/// sort it was issued under.
class ReviewQueryNotifier extends Notifier<ReviewQuery> {
  @override
  ReviewQuery build() => const ReviewQuery();

  void setRating(int? rating) =>
      state = state.copyWith(rating: rating, clearRating: rating == null);

  void setSort(String sort) => state = state.copyWith(sort: sort);
}

final reviewQueryProvider = NotifierProvider.autoDispose
    .family<ReviewQueryNotifier, ReviewQuery, String>(
      (_) => ReviewQueryNotifier(),
    );

/// Reviews are cursor-paginated, so "show more" carries the cursor the last page
/// ended on — a page number would re-read rows a new review has already shifted.
@riverpod
class ProductReviews extends _$ProductReviews {
  static const _pageSize = 20;

  @override
  FutureOr<ProductReviewsState> build(String listingId) async {
    final query = ref.watch(reviewQueryProvider(listingId));
    final page = await ref
        .watch(catalogRepositoryProvider)
        .reviews(
          listingId,
          rating: query.rating,
          sort: query.sort,
          limit: _pageSize,
        );
    return ProductReviewsState(
      reviews: page.reviews,
      nextCursor: page.nextCursor,
    );
  }

  Future<void> loadNextPage() async {
    final current = state.asData?.value;
    if (current == null || current.isLoadingMore || !current.hasMore) return;

    state = AsyncValue.data(current.copyWith(isLoadingMore: true));

    final query = ref.read(reviewQueryProvider(listingId));
    try {
      final page = await ref
          .read(catalogRepositoryProvider)
          .reviews(
            listingId,
            rating: query.rating,
            sort: query.sort,
            cursor: current.nextCursor,
            limit: _pageSize,
          );
      // `read` on the notifier below means nothing holds it alive across the
      // await; a disposed one must not be written to.
      if (!ref.mounted) return;
      state = AsyncValue.data(
        current.copyWith(
          reviews: [...current.reviews, ...page.reviews],
          nextCursor: page.nextCursor,
          isLoadingMore: false,
        ),
      );
    } catch (e) {
      if (!ref.mounted) return;
      // Keeping the cursor would offer a button that fails again on every press.
      state = AsyncValue.data(
        current.copyWith(isLoadingMore: false, nextCursor: null),
      );
    }
  }
}

@riverpod
Future<List<RecentListing>> recentlyViewedProducts(Ref ref) {
  return ref.watch(catalogRepositoryProvider).recentlyViewed();
}

@riverpod
class RecentSearches extends _$RecentSearches {
  @override
  List<String> build() {
    return ref.watch(catalogRepositoryProvider).getSearchHistory();
  }

  Future<void> add(String keyword) async {
    await ref.read(catalogRepositoryProvider).saveSearchKeyword(keyword);
    ref.invalidateSelf();
  }

  Future<void> remove(String keyword) async {
    await ref.read(catalogRepositoryProvider).removeSearchKeyword(keyword);
    ref.invalidateSelf();
  }

  Future<void> clear() async {
    await ref.read(catalogRepositoryProvider).clearSearchHistory();
    ref.invalidateSelf();
  }
}
