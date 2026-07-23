import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../catalog/data/models/catalog_model.dart';

part 'seller_model.freezed.dart';

part 'seller_model.g.dart';

@freezed
abstract class SalesChartPoint with _$SalesChartPoint {
  const factory SalesChartPoint({
    required String label,
    required double value,
    @JsonKey(name: 'orders_count') int? ordersCount,
  }) = _SalesChartPoint;

  factory SalesChartPoint.fromJson(Map<String, dynamic> json) =>
      _$SalesChartPointFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class SellerStats with _$SellerStats {
  const SellerStats._();

  const factory SellerStats({
    @JsonKey(name: 'total_revenue') @Default(0) int totalRevenue,
    @JsonKey(name: 'total_orders') @Default(0) int totalOrders,
    @JsonKey(name: 'items_sold') @Default(0) int itemsSold,
    @JsonKey(name: 'rating_score') @Default(0.0) double ratingScore,
    @JsonKey(name: 'pending_orders') @Default(0) int pendingOrders,
    @JsonKey(name: 'shipping_orders') @Default(0) int shippingOrders,
    @JsonKey(name: 'completed_orders') @Default(0) int completedOrders,
    @JsonKey(name: 'disputing_orders') @Default(0) int disputingOrders,
    @JsonKey(name: 'active_products') @Default(0) int activeProducts,
    @JsonKey(name: 'inactive_products') @Default(0) int inactiveProducts,
    @JsonKey(name: 'violated_products') @Default(0) int violatedProducts,
    @JsonKey(name: 'chart_data') List<SalesChartPoint>? chartData,
  }) = _SellerStats;

  factory SellerStats.fromJson(Map<String, dynamic> json) =>
      _$SellerStatsFromJson(json);

  @override
  Map<String, dynamic> toJson();

  /// Generates mock chart points for sales performance (Last 3 Months)
  List<SalesChartPoint> get effectiveChartData {
    if (chartData != null && chartData!.isNotEmpty) {
      return chartData!;
    }
    return const [
      SalesChartPoint(label: 'Oct', value: 42.0, ordersCount: 42),
      SalesChartPoint(label: 'Nov', value: 48.0, ordersCount: 48),
      SalesChartPoint(label: 'Dec', value: 52.0, ordersCount: 52),
    ];
  }
}

@freezed
abstract class ProductSpuRequest with _$ProductSpuRequest {
  const factory ProductSpuRequest({
    required String name,
    String? slug,
    String? description,
    @JsonKey(name: 'category_id') String? categoryId,
    List<String>? tags,
    List<ProductSpecification>? specifications,
    @JsonKey(name: 'resource_ids') List<String>? resourceIds,
    String? status,
  }) = _ProductSpuRequest;

  factory ProductSpuRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductSpuRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class ProductSkuRequest with _$ProductSkuRequest {
  const ProductSkuRequest._();

  const factory ProductSkuRequest({
    @JsonKey(name: 'spu_id') String? spuId,
    String? name,
    required int price,
    @JsonKey(name: 'original_price') int? originalPrice,
    required int stock,
    double? weight,
    List<SkuAttribute>? attributes,
    @JsonKey(name: 'resource_ids') List<String>? resourceIds,
    String? status,
  }) = _ProductSkuRequest;

  factory ProductSkuRequest.fromJson(Map<String, dynamic> json) =>
      _$ProductSkuRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();

  /// Mock weight getter when weight is not specified (e.g. 500g mock weight)
  double get effectiveWeight => weight ?? 500.0;
}

@freezed
abstract class SellerPendingItem with _$SellerPendingItem {
  const factory SellerPendingItem({
    required String id,
    @JsonKey(name: 'order_id') String? orderId,
    @JsonKey(name: 'buyer_id') String? buyerId,
    @JsonKey(name: 'buyer_name') String? buyerName,
    @JsonKey(name: 'spu_id') String? spuId,
    @JsonKey(name: 'sku_id') String? skuId,
    @JsonKey(name: 'product_name') String? productName,
    @JsonKey(name: 'sku_name') String? skuName,
    String? thumbnail,
    @Default(1) int quantity,
    @Default(0) int price,
    @JsonKey(name: 'created_at') String? createdAt,
    String? status,
  }) = _SellerPendingItem;

  factory SellerPendingItem.fromJson(Map<String, dynamic> json) =>
      _$SellerPendingItemFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class ConfirmSellerPendingRequest with _$ConfirmSellerPendingRequest {
  const factory ConfirmSellerPendingRequest({
    @JsonKey(name: 'item_ids') required List<String> itemIds,
  }) = _ConfirmSellerPendingRequest;

  factory ConfirmSellerPendingRequest.fromJson(Map<String, dynamic> json) =>
      _$ConfirmSellerPendingRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class SellerConfirmResponse with _$SellerConfirmResponse {
  const factory SellerConfirmResponse({
    @JsonKey(name: 'session_id') String? sessionId,
    @JsonKey(name: 'payment_url') String? paymentUrl,
    int? amount,
    String? message,
  }) = _SellerConfirmResponse;

  factory SellerConfirmResponse.fromJson(Map<String, dynamic> json) =>
      _$SellerConfirmResponseFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class RejectSellerPendingRequest with _$RejectSellerPendingRequest {
  const factory RejectSellerPendingRequest({
    @JsonKey(name: 'item_id') required String itemId,
    String? reason,
  }) = _RejectSellerPendingRequest;

  factory RejectSellerPendingRequest.fromJson(Map<String, dynamic> json) =>
      _$RejectSellerPendingRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class VideoToProductResponse with _$VideoToProductResponse {
  const factory VideoToProductResponse({
    @JsonKey(name: 'suggested_title') String? suggestedTitle,
    @JsonKey(name: 'suggested_description') String? suggestedDescription,
    @JsonKey(name: 'category_id') String? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
    double? confidence,
    List<String>? tags,
    List<ProductSpecification>? specifications,
    @JsonKey(name: 'suggested_skus') List<ProductSkuRequest>? suggestedSkus,
    @JsonKey(name: 'extracted_frames') List<String>? extractedFrames,
  }) = _VideoToProductResponse;

  factory VideoToProductResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoToProductResponseFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class AudioToDescriptionResponse with _$AudioToDescriptionResponse {
  const factory AudioToDescriptionResponse({
    @JsonKey(name: 'raw_text') String? rawText,
    @JsonKey(name: 'refined_description') String? refinedDescription,
    double? confidence,
  }) = _AudioToDescriptionResponse;

  factory AudioToDescriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$AudioToDescriptionResponseFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class RefineDescriptionRequest with _$RefineDescriptionRequest {
  const factory RefineDescriptionRequest({
    @JsonKey(name: 'raw_text') required String rawText,
    String? tone,
    String? prompt,
  }) = _RefineDescriptionRequest;

  factory RefineDescriptionRequest.fromJson(Map<String, dynamic> json) =>
      _$RefineDescriptionRequestFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class RefineDescriptionResponse with _$RefineDescriptionResponse {
  const factory RefineDescriptionResponse({
    @JsonKey(name: 'refined_description') String? refinedDescription,
    @JsonKey(name: 'raw_text') String? rawText,
  }) = _RefineDescriptionResponse;

  factory RefineDescriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$RefineDescriptionResponseFromJson(json);

  @override
  Map<String, dynamic> toJson();
}

@freezed
abstract class SellerOrder with _$SellerOrder {
  const factory SellerOrder({
    required String id,
    @JsonKey(name: 'tx_id') String? txId,
    @JsonKey(name: 'buyer_id') String? buyerId,
    @JsonKey(name: 'buyer_name') String? buyerName,
    @JsonKey(name: 'total_amount') @Default(0) int totalAmount,
    String? status,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'shipping_address') String? shippingAddress,
    List<SellerPendingItem>? items,
  }) = _SellerOrder;

  factory SellerOrder.fromJson(Map<String, dynamic> json) =>
      _$SellerOrderFromJson(json);

  @override
  Map<String, dynamic> toJson();
}
