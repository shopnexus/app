import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/finance_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/bank_account.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_bank_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_withdrawal_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_item.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_checkpoint.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transport_checkpoint_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet_transaction.dart';
import 'package:shopnexus_flutter_app/api/generated/model/withdrawal.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';

part 'seller_repository.g.dart';

/// `oneof=buyer seller`, and every one of these routes refuses a request without
/// it — which is why the old seller screens, asking `order/seller/*`, were empty
/// rather than wrong.
const orderRoleSeller = 'seller';

/// The seller side of the marketplace, read through the same contract the buyer
/// side uses with `role=seller`. There is no seller-specific analytics service
/// and no SPU/SKU tree: the four routes this feature used to call
/// (`analytic/seller-dashboard`, `order/seller/pending`, `order/seller/confirmed`,
/// `catalog/product-{spu,sku}`) are not served, and every screen that called one
/// was permanently empty or permanently in its error state.
class SellerRepository {
  const SellerRepository(this._orderApi, this._catalogApi, this._financeApi);

  final OrderApi _orderApi;
  final CatalogApi _catalogApi;
  final FinanceApi _financeApi;

  // --- Dashboard ---

  /// The counts, the money and the daily series over one window, all describing
  /// the orders *placed* in it. [tz] must be the device's IANA zone: UTC buckets
  /// put a Vietnamese seller's evening sales on the next day. Absent bounds mean
  /// the last 30 days, and the window may span at most a year.
  Future<OrderSummary> salesSummary({
    required String tz,
    DateTime? from,
    DateTime? to,
  }) async {
    final summary = (await _orderApi.ordersSummaryGet(
      role: orderRoleSeller,
      from: from,
      to: to,
      tz: tz,
    )).data?.data;
    if (summary == null) throw StateError('empty order summary');
    return summary;
  }

  /// One `total_count` read per status, in parallel. Four questions rather than
  /// one: counting a page client-side would cap the answer at the page size and
  /// then report it as the total.
  Future<Map<ListingStatus, int>> listingCounts() async {
    final counts = await Future.wait([
      for (final status in ListingStatus.values) _listingCount(status),
    ]);
    return Map.fromIterables(ListingStatus.values, counts);
  }

  Future<int> _listingCount(ListingStatus status) async {
    final page = (await _catalogApi.listingsGet(
      mine: true,
      status: status,
      limit: 1,
    )).data;
    return page?.meta.totalCount ?? 0;
  }

  // --- Sales ---

  /// [state] is what tells the tabs apart. `open` covers everything in flight —
  /// there is no `processing`/`shipping`/`disputing` state, and where the parcel
  /// is comes off `order.transport`, not off the order's own status.
  Future<List<OrderView>> orders({OrderState? state, int limit = 20}) async {
    final page = (await _orderApi.ordersGet(
      role: orderRoleSeller,
      state: state,
      limit: limit,
    )).data;
    final orders = page?.data ?? const <Order>[];
    final listings = await _listingsById(
      orders.expand((order) => order.items ?? const <OrderItem>[]),
    );
    return [
      for (final order in orders)
        OrderView(
          order: order,
          lines: _lines(order.items ?? const [], listings),
        ),
    ];
  }

  /// Paid lines the money has not produced an order for yet — a retry list, not
  /// an inbox: nothing here is waiting on the seller, and there is no route that
  /// would let them approve or refuse it.
  Future<List<OrderLineView>> unsettledItems({int limit = 50}) async {
    final page = (await _orderApi.itemsGet(
      role: orderRoleSeller,
      pending: true,
      limit: limit,
    )).data;
    final items = page?.data ?? const <OrderItem>[];
    return _lines(items, await _listingsById(items));
  }

  /// Either party may cancel while the parcel has not left `pending`; after that
  /// the route answers 409 and a refund is the only way back.
  Future<void> cancelOrder(String orderId) =>
      _orderApi.ordersIdCancellationPost(id: orderId);

  /// One carrier-reported position. Forward-only, so a late checkpoint loses to
  /// one already recorded rather than moving the parcel backwards.
  Future<void> reportCheckpoint(
    String orderId,
    TransportCheckpoint checkpoint,
  ) => _orderApi.ordersIdTransportCheckpointsPost(
    id: orderId,
    transportCheckpointRequest: TransportCheckpointRequest(status: checkpoint),
  );

  // --- Listings ---

  /// `mine=true` is also what makes [status] honoured: a seller may see their own
  /// drafts and hidden listings, nobody else may.
  Future<List<Listing>> listings({
    ListingStatus? status,
    int page = 1,
    int limit = 20,
  }) async {
    final result = (await _catalogApi.listingsGet(
      mine: true,
      status: status,
      page: page,
      limit: limit,
    )).data;
    return result?.data ?? const [];
  }

  Future<void> updateListing(String id, UpdateListingRequest request) =>
      _catalogApi.listingsIdPatch(id: id, updateListingRequest: request);

  Future<void> deleteListing(String id) => _catalogApi.listingsIdDelete(id: id);

  /// Hiding is deleting the publication, not deleting the listing: the rows and
  /// the past sales stay, it simply stops being public.
  Future<void> hideListing(String id) =>
      _catalogApi.listingsIdPublicationDelete(id: id);

  /// Re-queues a hidden listing for moderation, so it comes back as `pending`
  /// rather than straight to `active`.
  Future<void> publishListing(String id) =>
      _catalogApi.listingsIdPublicationPost(id: id);

  Future<void> deleteVariant(String id) => _catalogApi.variantsIdDelete(id: id);

  // --- Payouts ---
  // Wallets, the ledger and withdrawals are finance's, not seller-specific — but
  // the seller's earnings screen is their only reader in this app.

  Future<List<Wallet>> wallets() async =>
      (await _financeApi.walletsGet()).data?.data ?? const [];

  /// The ledger of one currency's wallet, newest first. Cursor-paged: a `page`
  /// would be ignored.
  Future<List<WalletTransaction>> ledger(
    String currency, {
    String? cursor,
    int limit = 20,
  }) async {
    final page = (await _financeApi.walletsCurrencyTransactionsGet(
      currency: currency,
      cursor: cursor,
      limit: limit,
    )).data;
    return page?.data ?? const [];
  }

  Future<List<Withdrawal>> withdrawals({int limit = 20}) async {
    final page = (await _financeApi.withdrawalsGet(limit: limit)).data;
    return page?.data ?? const [];
  }

  /// A withdrawal names the bank account it pays out to; there is no default the
  /// server would pick, so a seller with none linked cannot withdraw at all.
  Future<Withdrawal> requestWithdrawal({
    required int amount,
    required String currency,
    required String bankAccountId,
  }) async {
    final withdrawal = (await _financeApi.withdrawalsPost(
      createWithdrawalRequest: CreateWithdrawalRequest(
        amount: amount,
        currency: currency,
        bankAccountId: bankAccountId,
      ),
    )).data?.data;
    if (withdrawal == null) throw StateError('empty withdrawal');
    return withdrawal;
  }

  Future<List<BankAccount>> bankAccounts() async =>
      (await _financeApi.bankAccountsGet()).data?.data ?? const [];

  Future<void> addBankAccount(CreateBankAccountRequest request) =>
      _financeApi.bankAccountsPost(createBankAccountRequest: request);

  Future<void> deleteBankAccount(String id) =>
      _financeApi.bankAccountsIdDelete(id: id);

  List<OrderLineView> _lines(
    Iterable<OrderItem> items,
    Map<String, Listing> listings,
  ) => [
    for (final item in items)
      OrderLineView(item: item, listing: listings[item.listingId]),
  ];

  /// One lookup for a whole page. An `ids` read answers even for a listing the
  /// seller has since hidden or deleted, which is why the line denormalizes it.
  Future<Map<String, Listing>> _listingsById(Iterable<OrderItem> items) async {
    final ids = {for (final item in items) item.listingId}.toList();
    if (ids.isEmpty) return const {};
    final page = (await _catalogApi.listingsGet(
      ids: ids,
      limit: ids.length.clamp(1, 100),
    )).data;
    return {
      for (final listing in page?.data ?? const <Listing>[])
        listing.id: listing,
    };
  }
}

@riverpod
SellerRepository sellerRepository(Ref ref) => SellerRepository(
  ref.watch(orderApiProvider),
  ref.watch(catalogApiProvider),
  ref.watch(financeApiProvider),
);
