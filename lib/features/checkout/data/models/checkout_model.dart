import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_model.freezed.dart';

part 'checkout_model.g.dart';

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
abstract class CheckoutRequest with _$CheckoutRequest {
  const factory CheckoutRequest({
    @JsonKey(name: 'buy_now') required bool buyNow,
    required String address,
    @JsonKey(name: 'payment_option') required String paymentOption,
    @JsonKey(name: 'use_wallet') required bool useWallet,
    @JsonKey(name: 'promotion_codes') List<String>? promotionCodes,
    required List<CheckoutItem> items,
  }) = _CheckoutRequest;

  factory CheckoutRequest.fromJson(Map<String, dynamic> json) =>
      _$CheckoutRequestFromJson(json);
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
