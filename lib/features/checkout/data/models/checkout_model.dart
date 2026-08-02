import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_model.freezed.dart';
part 'checkout_model.g.dart';

@freezed
abstract class CheckoutLine with _$CheckoutLine {
  const factory CheckoutLine({
    @JsonKey(name: 'variant_id') required String variantId,
    required int quantity,
  }) = _CheckoutLine;

  factory CheckoutLine.fromJson(Map<String, dynamic> json) =>
      _$CheckoutLineFromJson(json);
}

@freezed
abstract class CheckoutRequest with _$CheckoutRequest {
  const factory CheckoutRequest({
    @JsonKey(name: 'contact_id') required String contactId,
    required String currency,
    required List<CheckoutLine> lines,
    String? note,
    @JsonKey(name: 'transport_option') required String transportOption,
  }) = _CheckoutRequest;

  factory CheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckoutRequestFromJson(json);
}

@freezed
abstract class CheckoutOfferRequest with _$CheckoutOfferRequest {
  const factory CheckoutOfferRequest({
    @JsonKey(name: 'contact_id') required String contactId,
    String? note,
    @JsonKey(name: 'transport_option') required String transportOption,
  }) = _CheckoutOfferRequest;

  factory CheckoutOfferRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckoutOfferRequestFromJson(json);
}

@freezed
abstract class OrderItem with _$OrderItem {
  const factory OrderItem({
    required String id,
    @JsonKey(name: 'order_id') String? orderId,
    @JsonKey(name: 'seller_id') required String sellerId,
    @JsonKey(name: 'listing_id') String? listingId,
    @JsonKey(name: 'variant_id') required String variantId,
    required int quantity,
    @JsonKey(name: 'total_amount') required int totalAmount,
    required String currency,
    @JsonKey(name: 'transport_option') required String transportOption,
    @JsonKey(name: 'payment_session_id') String? paymentSessionId,
    String? note,
    @JsonKey(name: 'cancelled_at') String? cancelledAt,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _OrderItem;

  factory OrderItem.fromJson(Map<String, dynamic> json) =>
      _$OrderItemFromJson(json);
}

@freezed
abstract class CheckoutResult with _$CheckoutResult {
  const factory CheckoutResult({
    required String currency,
    @JsonKey(name: 'goods_total') required int goodsTotal,
    required List<OrderItem> items,
    @JsonKey(name: 'payment_session_id') required String paymentSessionId,
    @JsonKey(name: 'shipping_fee') required int shippingFee,
    required int total,
  }) = _CheckoutResult;

  factory CheckoutResult.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResultFromJson(json);
}

@freezed
abstract class CreateDraftRequest with _$CreateDraftRequest {
  const factory CreateDraftRequest({
    @JsonKey(name: 'listing_id') required String listingId,
  }) = _CreateDraftRequest;

  factory CreateDraftRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateDraftRequestFromJson(json);
}

@freezed
abstract class DraftOrderVariant with _$DraftOrderVariant {
  const factory DraftOrderVariant({
    @JsonKey(name: 'variant_id') required String variantId,
    required int price,
    Map<String, dynamic>? attributes,
  }) = _DraftOrderVariant;

  factory DraftOrderVariant.fromJson(Map<String, dynamic> json) =>
      _$DraftOrderVariantFromJson(json);
}

@freezed
abstract class DraftOrder with _$DraftOrder {
  const factory DraftOrder({
    required String id,
    @JsonKey(name: 'listing_id') required String listingId,
    @JsonKey(name: 'seller_id') required String sellerId,
    required String name,
    required String currency,
    @JsonKey(name: 'price_mode') required String priceMode,
    @JsonKey(name: 'valid_until') required String validUntil,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'cancelled_at') String? cancelledAt,
    required List<DraftOrderVariant> variants,
  }) = _DraftOrder;

  factory DraftOrder.fromJson(Map<String, dynamic> json) =>
      _$DraftOrderFromJson(json);
}

@freezed
abstract class StartPaymentRequest with _$StartPaymentRequest {
  const factory StartPaymentRequest({
    @JsonKey(name: 'payment_option') required String paymentOption,
    int? amount,
    @JsonKey(name: 'return_url') String? returnUrl,
  }) = _StartPaymentRequest;

  factory StartPaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$StartPaymentRequestFromJson(json);
}

@freezed
abstract class Transaction with _$Transaction {
  const factory Transaction({
    required String id,
    @JsonKey(name: 'session_id') required String sessionId,
    @JsonKey(name: 'payment_option') required String paymentOption,
    required int amount,
    @JsonKey(name: 'checkout_url') String? checkoutUrl,
    required String status,
    String? error,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'expired_at') String? expiredAt,
    @JsonKey(name: 'settled_at') String? settledAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);
}

@freezed
abstract class ShippingOption with _$ShippingOption {
  const factory ShippingOption({
    @JsonKey(name: 'option') required String option,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'fee') required int fee,
  }) = _ShippingOption;

  factory ShippingOption.fromJson(Map<String, dynamic> json) =>
      _$ShippingOptionFromJson(json);
}

@freezed
abstract class ShippingQuotes with _$ShippingQuotes {
  const factory ShippingQuotes({
    required String currency,
    required List<ShippingOption> options,
  }) = _ShippingQuotes;

  factory ShippingQuotes.fromJson(Map<String, dynamic> json) =>
      _$ShippingQuotesFromJson(json);
}

@freezed
abstract class ShippingQuotesRequest with _$ShippingQuotesRequest {
  const factory ShippingQuotesRequest({
    @JsonKey(name: 'contact_id') required String contactId,
    @JsonKey(name: 'draft_id') String? draftId,
    @JsonKey(name: 'offer_id') String? offerId,
    List<CheckoutLine>? lines,
  }) = _ShippingQuotesRequest;

  factory ShippingQuotesRequest.fromJson(Map<String, dynamic> json) =>
      _$ShippingQuotesRequestFromJson(json);
}

// --- Legacy & UI Helper Models ---

@freezed
abstract class QuoteTransportItem with _$QuoteTransportItem {
  const factory QuoteTransportItem({
    @JsonKey(name: 'sku_id') required String skuId,
    required int quantity,
    @JsonKey(name: 'transport_option') required String transportOption,
  }) = _QuoteTransportItem;

  factory QuoteTransportItem.fromJson(Map<String, dynamic> json) =>
      _$QuoteTransportItemFromJson(json);
}

@freezed
abstract class QuoteTransportRequest with _$QuoteTransportRequest {
  const factory QuoteTransportRequest({
    required String address,
    required List<QuoteTransportItem> items,
  }) = _QuoteTransportRequest;

  factory QuoteTransportRequest.fromJson(Map<String, dynamic> json) =>
      _$QuoteTransportRequestFromJson(json);
}

@freezed
abstract class QuoteTransportResult with _$QuoteTransportResult {
  const factory QuoteTransportResult({
    @JsonKey(name: 'sku_id') required String skuId,
    @JsonKey(name: 'transport_option') required String transportOption,
    required int cost,
    required String currency,
  }) = _QuoteTransportResult;

  factory QuoteTransportResult.fromJson(Map<String, dynamic> json) =>
      _$QuoteTransportResultFromJson(json);
}

@freezed
abstract class QuoteTransportResponse with _$QuoteTransportResponse {
  const factory QuoteTransportResponse({
    required List<QuoteTransportResult> items,
  }) = _QuoteTransportResponse;

  factory QuoteTransportResponse.fromJson(Map<String, dynamic> json) =>
      _$QuoteTransportResponseFromJson(json);
}

@freezed
abstract class CheckoutItem with _$CheckoutItem {
  const factory CheckoutItem({
    @JsonKey(name: 'sku_id') required String skuId,
    required int quantity,
    @JsonKey(name: 'transport_option') required String transportOption,
    String? note,
  }) = _CheckoutItem;

  factory CheckoutItem.fromJson(Map<String, dynamic> json) =>
      _$CheckoutItemFromJson(json);
}

@freezed
abstract class CheckoutResponse with _$CheckoutResponse {
  const factory CheckoutResponse({
    @JsonKey(name: 'checkout_session_id') required String checkoutSessionId,
    @JsonKey(name: 'payment_url') String? paymentUrl,
  }) = _CheckoutResponse;

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseFromJson(json);
}

@freezed
abstract class PaymentUrlResponse with _$PaymentUrlResponse {
  const factory PaymentUrlResponse({
    @JsonKey(name: 'payment_url') required String paymentUrl,
  }) = _PaymentUrlResponse;

  factory PaymentUrlResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentUrlResponseFromJson(json);
}

@freezed
abstract class CheckoutSession with _$CheckoutSession {
  const factory CheckoutSession({
    required int id,
    required String kind,
    required String status,
    String? note,
    required String currency,
    @JsonKey(name: 'total_amount') required int totalAmount,
    @JsonKey(name: 'date_created') required String dateCreated,
    @JsonKey(name: 'date_paid') String? datePaid,
  }) = _CheckoutSession;

  factory CheckoutSession.fromJson(Map<String, dynamic> json) =>
      _$CheckoutSessionFromJson(json);
}

@freezed
abstract class CheckoutSummaryItem with _$CheckoutSummaryItem {
  const factory CheckoutSummaryItem({
    required int id,
    @JsonKey(name: 'sku_id') required String skuId,
    @JsonKey(name: 'spu_id') required String spuId,
    required String slug,
    @JsonKey(name: 'sku_name') required String skuName,
    required int quantity,
    @JsonKey(name: 'total_amount') required int totalAmount,
    required String currency,
    @JsonKey(name: 'image_url') String? imageUrl,
  }) = _CheckoutSummaryItem;

  factory CheckoutSummaryItem.fromJson(Map<String, dynamic> json) =>
      _$CheckoutSummaryItemFromJson(json);
}

@freezed
abstract class CheckoutSummary with _$CheckoutSummary {
  const factory CheckoutSummary({
    required CheckoutSession session,
    required List<CheckoutSummaryItem> items,
  }) = _CheckoutSummary;

  factory CheckoutSummary.fromJson(Map<String, dynamic> json) =>
      _$CheckoutSummaryFromJson(json);
}
