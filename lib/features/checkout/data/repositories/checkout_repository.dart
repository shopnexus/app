import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/common_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/finance_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/order_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/checkout_offer_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/checkout_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/checkout_result.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_draft_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/draft_order.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/option.dart';
import 'package:shopnexus_flutter_app/api/generated/model/option_category_name.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shipping_quotes.dart';
import 'package:shopnexus_flutter_app/api/generated/model/shipping_quotes_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/start_payment_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/transaction.dart';

part 'checkout_repository.g.dart';

class CheckoutRepository {
  final OrderApi _orderApi;
  final FinanceApi _financeApi;
  final CatalogApi _catalogApi;
  final CommonApi _commonApi;

  CheckoutRepository(
    this._orderApi,
    this._financeApi,
    this._catalogApi,
    this._commonApi,
  );

  /// Đọc thông tin listing của các dòng đang mua.
  ///
  /// One read per distinct listing, not per line: several lines commonly point at
  /// one listing (two colours of the same thing). It is the detail read rather
  /// than `GET /listings?ids=`, because that answers `price` for the cheapest
  /// variant while a line names a specific one — and `variants[]` is the only
  /// place a variant is priced. A listing since withdrawn is skipped, so one gone
  /// line does not blank the whole page.
  Future<Map<String, ListingDetail>> listings(Iterable<String> ids) async {
    final reads = ids.toSet().map((id) async {
      try {
        return (await _catalogApi.listingsIdGet(id: id)).data?.data;
      } catch (_) {
        return null;
      }
    });

    final resolved = <String, ListingDetail>{};
    for (final listing in await Future.wait(reads)) {
      if (listing != null) resolved[listing.id] = listing;
    }
    return resolved;
  }

  /// Tạo một purchase session (DraftOrder) cho 1 listing
  Future<DraftOrder> createDraft(String listingId) async {
    final response = await _orderApi.draftsPost(
      createDraftRequest: CreateDraftRequest(listingId: listingId),
    );
    return _body(response.data?.data, 'draft');
  }

  /// Lấy thông tin draft order theo id
  Future<DraftOrder> getDraft(String id) async {
    final response = await _orderApi.draftsIdGet(id: id);
    return _body(response.data?.data, 'draft');
  }

  /// Hủy purchase session draft
  Future<void> cancelDraft(String id) => _orderApi.draftsIdDelete(id: id);

  /// Thực hiện checkout cho draft order
  Future<CheckoutResult> checkoutDraft(
    String draftId,
    CheckoutRequest request,
  ) async {
    final response = await _orderApi.draftsIdCheckoutPost(
      id: draftId,
      checkoutRequest: request,
    );
    return _body(response.data?.data, 'checkout result');
  }

  /// Thực hiện checkout cho thương lượng (offer) đã được chấp nhận
  Future<CheckoutResult> checkoutOffer(
    String offerId,
    CheckoutOfferRequest request,
  ) async {
    final response = await _orderApi.offersIdCheckoutPost(
      id: offerId,
      checkoutOfferRequest: request,
    );
    return _body(response.data?.data, 'checkout result');
  }

  /// The rails this deployment can charge on, and the only place a valid
  /// `payment_option` comes from. The slug used to be a constant here, which broke the
  /// day the row it named was retired — and which rails a deployment offers is not
  /// something a client can know.
  Future<List<Option>> paymentOptions() async {
    final response = await _commonApi.optionsGet(
      category: OptionCategoryName.payment,
    );
    return _body(response.data?.data, 'payment options').options.toList();
  }

  /// Khởi tạo thông tin thanh toán qua cổng thanh toán
  Future<Transaction> startPayment(
    String sessionId,
    StartPaymentRequest request,
  ) async {
    final response = await _financeApi.paymentSessionsIdPaymentsPost(
      id: sessionId,
      startPaymentRequest: request,
    );
    return _body(response.data?.data, 'transaction');
  }

  /// Lấy báo giá phí vận chuyển từ server
  Future<ShippingQuotes> getShippingQuotes(
    ShippingQuotesRequest request,
  ) async {
    final response = await _orderApi.shippingQuotesPost(
      shippingQuotesRequest: request,
    );
    return _body(response.data?.data, 'shipping quotes');
  }

  /// Polling reads the payment session itself. There is no summary route: the
  /// session carries its own status, and the lines are already in hand from the
  /// checkout that opened it.
  Future<PaymentSession> paymentSession(String id) async {
    final response = await _financeApi.paymentSessionsIdGet(id: id);
    return _body(response.data?.data, 'payment session');
  }

  T _body<T>(T? data, String what) {
    if (data == null) throw StateError('empty $what');
    return data;
  }
}

@riverpod
CheckoutRepository checkoutRepository(Ref ref) => CheckoutRepository(
  ref.watch(orderApiProvider),
  ref.watch(financeApiProvider),
  ref.watch(catalogApiProvider),
  ref.watch(commonApiProvider),
);
