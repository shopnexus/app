import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_summary.dart';
import 'package:shopnexus_flutter_app/features/account/presentation/providers/account_provider.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';
import 'package:shopnexus_flutter_app/features/seller/presentation/providers/seller_products_provider.dart';

part 'seller_dashboard_provider.freezed.dart';

part 'seller_dashboard_provider.g.dart';

/// The windows the dashboard offers. A year is the longest `GET /orders/summary`
/// accepts, so there is no "all time".
abstract final class DashboardWindow {
  static const week = 7;
  static const month = 30;
  static const quarter = 90;
  static const year = 365;
}

/// The sales figures and the listing totals, from two different routes:
/// `/orders/summary` counts orders, `/listings` counts what is on sale.
@freezed
abstract class SellerDashboard with _$SellerDashboard {
  const SellerDashboard._();

  const factory SellerDashboard({
    required OrderSummary summary,
    required Map<ListingStatus, int> listings,
  }) = _SellerDashboard;

  int listingsWith(ListingStatus status) => listings[status] ?? 0;
}

@riverpod
class DashboardWindowDays extends _$DashboardWindowDays {
  @override
  int build() => DashboardWindow.month;

  void setDays(int days) => state = days;
}

@riverpod
class SellerDashboardNotifier extends _$SellerDashboardNotifier {
  @override
  Future<SellerDashboard> build() async {
    final days = ref.watch(dashboardWindowDaysProvider);
    // The account's own IANA zone: Dart exposes only an abbreviation, and UTC
    // buckets would move a Vietnamese seller's evening sales to the next day.
    final timezone = (await ref.watch(profileProvider.future)).timezone;
    final repository = ref.watch(sellerRepositoryProvider);

    final to = DateTime.now().toUtc();
    final (summary, listings) = await (
      repository.salesSummary(
        tz: timezone,
        from: to.subtract(Duration(days: days)),
        to: to,
      ),
      ref.watch(sellerListingCountsProvider.future),
    ).wait;

    return SellerDashboard(summary: summary, listings: listings);
  }

  Future<void> refresh() async {
    ref.invalidate(sellerListingCountsProvider);
    ref.invalidateSelf();
    await future;
  }
}
