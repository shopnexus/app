import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

part 'seller_products_provider.freezed.dart';

part 'seller_products_provider.g.dart';

/// One total per status, off each page's `meta.total_count`. The filter chips and
/// the dashboard tiles are the same four numbers, so they are read once.
@riverpod
Future<Map<ListingStatus, int>> sellerListingCounts(Ref ref) =>
    ref.watch(sellerRepositoryProvider).listingCounts();

@freezed
abstract class SellerProductsState with _$SellerProductsState {
  const factory SellerProductsState({
    /// Null is every status, which is also the only listing a non-owner may see.
    ListingStatus? status,
    @Default('') String searchQuery,
    @Default([]) List<Listing> listings,
    @Default(true) bool isLoading,
    String? errorMessage,
  }) = _SellerProductsState;
}

@riverpod
class SellerProductsNotifier extends _$SellerProductsNotifier {
  @override
  SellerProductsState build() {
    Future.microtask(_load);
    return const SellerProductsState();
  }

  Future<void> _load() async {
    state = state.copyWith(isLoading: true, errorMessage: null);
    try {
      final listings = await ref
          .read(sellerRepositoryProvider)
          .listings(status: state.status);
      state = state.copyWith(isLoading: false, listings: listings);
    } catch (error) {
      // Shown rather than swallowed: a 404 hidden by `catch (_)` is what made
      // this screen look permanently empty instead of broken.
      state = state.copyWith(isLoading: false, errorMessage: error.toString());
    }
  }

  void setStatusFilter(ListingStatus? status) {
    state = SellerProductsState(status: status, searchQuery: state.searchQuery);
    _load();
  }

  void setSearchQuery(String query) =>
      state = state.copyWith(searchQuery: query);

  Future<void> refresh() async {
    ref.invalidate(sellerListingCountsProvider);
    await _load();
  }

  /// Hiding takes the listing off the public feed; publishing sends it back
  /// through moderation, so it returns as `pending` and not straight to `active`.
  Future<void> toggleVisibility(Listing listing) async {
    final repository = ref.read(sellerRepositoryProvider);
    if (listing.status == ListingStatus.hidden) {
      await repository.publishListing(listing.id);
    } else {
      await repository.hideListing(listing.id);
    }
    await refresh();
  }

  Future<void> deleteListing(String id) async {
    await ref.read(sellerRepositoryProvider).deleteListing(id);
    await refresh();
  }
}
