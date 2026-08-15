import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/finance_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/bank_account.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_bank_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transaction.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_bank_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_variant_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_variant_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_withdrawal_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order.dart';
import 'package:shopnexus_flutter_app/api/generated/model/decline_order_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_item.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_state.dart';
import 'package:shopnexus_flutter_app/api/generated/model/order_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/publish_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tax_info.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_listing_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/upsert_tax_info_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet_transaction.dart';
import 'package:shopnexus_flutter_app/api/generated/model/wallet_transaction_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/withdrawal.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/order_view.dart';

part 'seller_repository.g.dart';

/// `oneof=buyer seller`, and every one of these routes refuses a request without
/// it — which is why the old seller screens, asking `order/seller/*`, were empty
/// rather than wrong.
const orderRoleSeller = 'seller';

/// Bao nhiêu đơn ở một trạng thái, và cái hạn gần nhất trong số đó.
///
/// Hạn đi kèm số vì một con số không nói được cái gấp: "3 đơn chờ bạn xác nhận"
/// và "3 đơn chờ bạn xác nhận · còn 2 giờ" là hai mức độ khác nhau. Null khi
/// trạng thái đó không có hạn nào — `open` chẳng hạn, hạn xác nhận đã hết vai.
class OrderStateCount {
  const OrderStateCount(this.count, {this.soonestDeadline});

  final int count;
  final DateTime? soonestDeadline;
}

/// Một lượt đọc sổ ví. `totalCount` là tổng số dòng khớp bộ lọc, kể cả những
/// dòng không nằm trong lượt đọc này.
class WalletLedgerPage {
  const WalletLedgerPage({required this.entries, this.totalCount});

  final List<WalletTransaction> entries;
  final int? totalCount;

  /// Sổ dài hơn những gì vừa đọc được — màn hình phải nói ra thay vì cắt ngang.
  bool get truncated => totalCount != null && totalCount! > entries.length;
}

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
    final listings = await _listingsById(orders.expand((order) => order.items));
    return [
      for (final order in orders)
        OrderView(order: order, lines: _lines(order.items, listings)),
    ];
  }

  /// Đếm đơn ở một trạng thái. Route trả cursor và không trả tổng, nên con số
  /// duy nhất đúng là đi hết các trang; chặn ở [maxPages] để một hàng đợi bất
  /// thường không giữ màn hình tài khoản mãi không vẽ.
  ///
  /// Không dùng `summary.open`: `open` là đơn *đã* được xác nhận (nên việc gấp
  /// nhất không nằm trong đó), và summary bị giới hạn theo cửa sổ thời gian của
  /// nó nên bỏ sót đơn cũ hơn cửa sổ — đúng hai lỗi mà một con số trên badge
  /// không cách nào để lộ ra.
  Future<OrderStateCount> countOrders({
    required OrderState state,
    int limit = 50,
    int maxPages = 5,
  }) async {
    var total = 0;
    DateTime? soonest;
    String? cursor;

    for (var page = 0; page < maxPages; page++) {
      final result = (await _orderApi.ordersGet(
        role: orderRoleSeller,
        state: state,
        cursor: cursor,
        limit: limit,
      )).data;
      final orders = result?.data ?? const <Order>[];
      total += orders.length;
      for (final order in orders) {
        final deadline = order.confirmationDeadlineAt;
        if (deadline != null &&
            (soonest == null || deadline.isBefore(soonest))) {
          soonest = deadline;
        }
      }
      cursor = result?.meta.nextCursor;
      if (cursor == null || orders.isEmpty) break;
    }

    return OrderStateCount(total, soonestDeadline: soonest);
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

  /// The seller accepting a paid sale. Nothing reaches the carrier before this, so it is what
  /// moves an order out of `awaiting-confirmation`. Not re-runnable: a second confirmation would
  /// book a second parcel for one sale, which the route answers 409 for.
  Future<void> confirmOrder(String orderId) =>
      _orderApi.ordersIdConfirmationPost(id: orderId);

  /// Refusing one. The buyer is refunded in full, delivery included, because the parcel never
  /// left — so the reason is required and it is kept on the order.
  Future<void> declineOrder(String orderId, String reason) =>
      _orderApi.ordersIdDeclinePost(
        id: orderId,
        declineOrderRequest: DeclineOrderRequest(reason: reason),
      );

  /// Either party may cancel while the parcel has not left `pending`; after that
  /// the route answers 409 and a refund is the only way back.
  Future<void> cancelOrder(String orderId) =>
      _orderApi.ordersIdCancellationPost(id: orderId);

  // A seller does not report where the parcel is: the carrier does, on its own
  // webhook, and a moderator corrects it. The route answers 403 to either party —
  // `Shipped()` decides whether the buyer may still cancel, so a claim with
  // nothing behind it bought days of theirs for one request. Seeing it wrong is an
  // `order-issue` ticket.

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

  /// The words a moderator chose to tell the seller, null when they chose not to.
  /// A detail read per row, on purpose: the card carries the *fact* of a takedown
  /// (`taken_down_at`) and the reason is a sentence, so only a row that is
  /// actually down ever pays for it.
  Future<String?> takedownReason(String id) async =>
      (await _catalogApi.listingsIdGet(id: id)).data?.data.takedownReason;

  /// The whole listing, which is what an edit form has to start from: the card in
  /// the list is a `Listing` and carries no description, tags or category, so a
  /// form built from one would show blanks the seller never wrote and save them.
  Future<ListingDetail> listingDetail(String id) async {
    final listing = (await _catalogApi.listingsIdGet(id: id)).data?.data;
    if (listing == null) throw StateError('empty listing response');
    return listing;
  }

  Future<void> updateListing(String id, UpdateListingRequest request) =>
      _catalogApi.listingsIdPatch(id: id, updateListingRequest: request);

  Future<void> deleteListing(String id) => _catalogApi.listingsIdDelete(id: id);

  /// Hiding is deleting the publication, not deleting the listing: the rows and
  /// the past sales stay, it simply stops being public.
  Future<void> hideListing(String id) =>
      _catalogApi.listingsIdPublicationDelete(id: id);

  Future<void> publishListing(String id, {String? pickupContactId}) =>
      _catalogApi.listingsIdPublicationPost(
        id: id,
        publishListingRequest: pickupContactId == null
            ? null
            : PublishListingRequest(pickupContactId: pickupContactId),
      );

  Future<ListingDetail> addVariant(
    String listingId,
    CreateVariantRequest request,
  ) async {
    final response = await _catalogApi.listingsIdVariantsPost(
      id: listingId,
      createVariantRequest: request,
    );
    final detail = response.data?.data;
    if (detail == null) throw StateError('empty add variant response');
    return detail;
  }

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
      page: cursor != null ? int.tryParse(cursor) : 1,
      limit: limit,
    )).data;
    return page?.data ?? const [];
  }

  /// Sổ ví đầy đủ hơn [ledger]: lọc được theo loại giao dịch, và lấy tới trần
  /// 100 dòng của route thay vì 20.
  ///
  /// Không có trang thứ hai để đi tới: hợp đồng khai `cursor` cho route này nhưng
  /// handler đọc `page`, và `page` lại không có trong spec — nên client sinh ra
  /// không có tham số nào nhảy trang được. `totalCount` là thứ nói ra khi sổ dài
  /// hơn những gì màn hình đang hiện, thay vì im lặng cắt ngang.
  Future<WalletLedgerPage> ledgerPage(
    String currency, {
    WalletTransactionKind? kind,
    int limit = 100,
  }) async {
    final page = (await _financeApi.walletsCurrencyTransactionsGet(
      currency: currency,
      kind: kind,
      limit: limit,
    )).data;
    return WalletLedgerPage(
      entries: page?.data ?? const [],
      totalCount: page?.meta.totalCount,
    );
  }

  /// Đăng ký thuế của người nhận tiền, `null` khi chưa khai gì — server trả 404
  /// cho trường hợp đó, và "chưa khai" là một trạng thái bình thường chứ không
  /// phải lỗi cần hiện ra.
  Future<TaxInfo?> taxInfo() async {
    try {
      return (await _financeApi.taxInfoGet()).data?.data;
    } on DioException catch (error) {
      if (error.response?.statusCode == 404) return null;
      rethrow;
    }
  }

  /// Ghi đè cả bản đăng ký, không sửa từng trường: một mã số thuế mới làm verdict
  /// cũ hết giá trị, nên server đặt lại trạng thái xác minh về `pending`.
  Future<TaxInfo> saveTaxInfo(UpsertTaxInfoRequest request) async {
    final saved = (await _financeApi.taxInfoPut(
      upsertTaxInfoRequest: request,
    )).data?.data;
    if (saved == null) throw StateError('empty tax info response');
    return saved;
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

  /// Một lệnh rút cụ thể — `outcome` ở đây là thứ khách hàng đọc, còn `status` là
  /// của payment session bên dưới.
  /// Lịch sử thanh toán: mọi phiên tiền của account này, gồm cả checkout và rút.
  /// Đây là chỗ trả lời "tôi đã trả cái gì, khi nào" — sổ ví chỉ nói số dư đổi ra
  /// sao, không nói nó thuộc lần mua nào.
  Future<List<PaymentSession>> paymentSessions({int limit = 20}) async =>
      (await _financeApi.paymentSessionsGet(limit: limit)).data?.data ??
      const [];

  /// Các chặng tiền của một phiên. Một phiên có thể có nhiều chặng: lần trả trước
  /// bị từ chối vẫn nằm đó, và đó chính là thứ giải thích vì sao một đơn "chờ
  /// thanh toán" lại có hai dòng.
  Future<List<Transaction>> paymentTransactions(String sessionId) async =>
      (await _financeApi.paymentSessionsIdTransactionsGet(
        id: sessionId,
      )).data?.data ??
      const [];

  Future<Withdrawal> withdrawal(String id) async {
    final withdrawal = (await _financeApi.withdrawalsIdGet(id: id)).data?.data;
    if (withdrawal == null) throw StateError('empty withdrawal');
    return withdrawal;
  }

  /// Huỷ một lệnh rút chưa được duyệt, và tiền quay lại ví ngay.
  ///
  /// Đây là đường thoát duy nhất của một lần bấm sai: số tiền bị **trừ khỏi số dư
  /// khả dụng ngay lúc tạo lệnh** — cố ý, để cùng một khoản không rút được hai lần
  /// trong lúc người thật đang xét — nên không có nút này thì tiền nằm ngoài tầm
  /// với cho tới khi một admin xử.
  Future<void> cancelWithdrawal(String id) =>
      _financeApi.withdrawalsIdDelete(id: id);

  /// Sửa một biến thể: giá, tồn, thuộc tính. Route riêng vì một biến thể không
  /// phải một field của tin — nó có tồn kho, và một lần sửa giá không được ghi đè
  /// con số mà một checkout đang giữ.
  Future<void> updateVariant(String id, UpdateVariantRequest request) =>
      _catalogApi.variantsIdPatch(id: id, updateVariantRequest: request);

  Future<List<BankAccount>> bankAccounts() async =>
      (await _financeApi.bankAccountsGet()).data?.data ?? const [];

  Future<void> addBankAccount(CreateBankAccountRequest request) =>
      _financeApi.bankAccountsPost(createBankAccountRequest: request);

  /// Đặt một tài khoản làm mặc định. Chỉ có `is_default` đổi được: số tài khoản và
  /// tên thụ hưởng là thứ một lệnh rút đã settle trỏ tới, nên sửa chúng sẽ viết lại
  /// nơi mà tiền cũ đã đi — muốn đổi thì thêm tài khoản mới.
  Future<void> setDefaultBankAccount(String id) =>
      _financeApi.bankAccountsIdPatch(
        id: id,
        updateBankAccountRequest: UpdateBankAccountRequest(isDefault: true),
      );

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

    final map = <String, Listing>{};
    try {
      final page = (await _catalogApi.listingsGet(
        ids: ids,
        limit: ids.length.clamp(1, 100),
      )).data;
      for (final listing in page?.data ?? const <Listing>[]) {
        map[listing.id] = listing;
      }
    } catch (e) {
      debugPrint('Lỗi tải danh sách sản phẩm batch seller: $e');
    }

    final missingIds = ids.where((id) => !map.containsKey(id)).toList();
    if (missingIds.isNotEmpty) {
      final fallbackListings = await Future.wait(
        missingIds.map((id) async {
          try {
            final res = await _catalogApi.listingsIdGet(id: id);
            final detail = res.data?.data;
            if (detail != null) {
              return Listing(
                id: detail.id,
                categoryId: detail.category.id,
                condition: detail.condition,
                cover: detail.images.isNotEmpty ? detail.images.first : null,
                createdAt: detail.createdAt,
                currency: detail.currency,
                deletedAt: detail.deletedAt,
                favorited: detail.favorited,
                location: detail.location,
                name: detail.name,
                price: detail.variants.isNotEmpty ? detail.variants.first.price : 0,
                priceMode: detail.priceMode,
                rating: detail.rating,
                reviewCount: detail.reviewCount,
                score: null,
                seller: detail.seller,
                slug: detail.slug,
                sold: detail.sold,
                status: detail.status,
                tags: detail.tags,
                takenDownAt: detail.takenDownAt,
              );
            }
          } catch (e) {
            debugPrint('Lỗi tải thông tin sản phẩm đơn lẻ $id: $e');
          }
          return null;
        }),
      );
      for (final listing in fallbackListings) {
        if (listing != null) {
          map[listing.id] = listing;
        }
      }
    }

    return map;
  }
}

@riverpod
SellerRepository sellerRepository(Ref ref) => SellerRepository(
  ref.watch(orderApiProvider),
  ref.watch(catalogApiProvider),
  ref.watch(financeApiProvider),
);
