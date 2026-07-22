// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SalesChartPoint _$SalesChartPointFromJson(Map<String, dynamic> json) =>
    _SalesChartPoint(
      label: json['label'] as String,
      value: (json['value'] as num).toDouble(),
      ordersCount: (json['orders_count'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SalesChartPointToJson(_SalesChartPoint instance) =>
    <String, dynamic>{
      'label': instance.label,
      'value': instance.value,
      'orders_count': instance.ordersCount,
    };

_SellerStats _$SellerStatsFromJson(Map<String, dynamic> json) => _SellerStats(
  totalRevenue: (json['total_revenue'] as num?)?.toInt() ?? 0,
  totalOrders: (json['total_orders'] as num?)?.toInt() ?? 0,
  itemsSold: (json['items_sold'] as num?)?.toInt() ?? 0,
  ratingScore: (json['rating_score'] as num?)?.toDouble() ?? 0.0,
  pendingOrders: (json['pending_orders'] as num?)?.toInt() ?? 0,
  shippingOrders: (json['shipping_orders'] as num?)?.toInt() ?? 0,
  completedOrders: (json['completed_orders'] as num?)?.toInt() ?? 0,
  disputingOrders: (json['disputing_orders'] as num?)?.toInt() ?? 0,
  activeProducts: (json['active_products'] as num?)?.toInt() ?? 0,
  inactiveProducts: (json['inactive_products'] as num?)?.toInt() ?? 0,
  violatedProducts: (json['violated_products'] as num?)?.toInt() ?? 0,
  chartData: (json['chart_data'] as List<dynamic>?)
      ?.map((e) => SalesChartPoint.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SellerStatsToJson(_SellerStats instance) =>
    <String, dynamic>{
      'total_revenue': instance.totalRevenue,
      'total_orders': instance.totalOrders,
      'items_sold': instance.itemsSold,
      'rating_score': instance.ratingScore,
      'pending_orders': instance.pendingOrders,
      'shipping_orders': instance.shippingOrders,
      'completed_orders': instance.completedOrders,
      'disputing_orders': instance.disputingOrders,
      'active_products': instance.activeProducts,
      'inactive_products': instance.inactiveProducts,
      'violated_products': instance.violatedProducts,
      'chart_data': instance.chartData,
    };

_ProductSpuRequest _$ProductSpuRequestFromJson(Map<String, dynamic> json) =>
    _ProductSpuRequest(
      name: json['name'] as String,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      categoryId: json['category_id'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      specifications: (json['specifications'] as List<dynamic>?)
          ?.map((e) => ProductSpecification.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceIds: (json['resource_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ProductSpuRequestToJson(_ProductSpuRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'slug': instance.slug,
      'description': instance.description,
      'category_id': instance.categoryId,
      'tags': instance.tags,
      'specifications': instance.specifications,
      'resource_ids': instance.resourceIds,
      'status': instance.status,
    };

_ProductSkuRequest _$ProductSkuRequestFromJson(Map<String, dynamic> json) =>
    _ProductSkuRequest(
      spuId: json['spu_id'] as String?,
      name: json['name'] as String?,
      price: (json['price'] as num).toInt(),
      originalPrice: (json['original_price'] as num?)?.toInt(),
      stock: (json['stock'] as num).toInt(),
      weight: (json['weight'] as num?)?.toDouble(),
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((e) => SkuAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceIds: (json['resource_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ProductSkuRequestToJson(_ProductSkuRequest instance) =>
    <String, dynamic>{
      'spu_id': instance.spuId,
      'name': instance.name,
      'price': instance.price,
      'original_price': instance.originalPrice,
      'stock': instance.stock,
      'weight': instance.weight,
      'attributes': instance.attributes,
      'resource_ids': instance.resourceIds,
      'status': instance.status,
    };

_SellerPendingItem _$SellerPendingItemFromJson(Map<String, dynamic> json) =>
    _SellerPendingItem(
      id: json['id'] as String,
      orderId: json['order_id'] as String?,
      buyerId: json['buyer_id'] as String?,
      buyerName: json['buyer_name'] as String?,
      spuId: json['spu_id'] as String?,
      skuId: json['sku_id'] as String?,
      productName: json['product_name'] as String?,
      skuName: json['sku_name'] as String?,
      thumbnail: json['thumbnail'] as String?,
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
      price: (json['price'] as num?)?.toInt() ?? 0,
      createdAt: json['created_at'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SellerPendingItemToJson(_SellerPendingItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'buyer_id': instance.buyerId,
      'buyer_name': instance.buyerName,
      'spu_id': instance.spuId,
      'sku_id': instance.skuId,
      'product_name': instance.productName,
      'sku_name': instance.skuName,
      'thumbnail': instance.thumbnail,
      'quantity': instance.quantity,
      'price': instance.price,
      'created_at': instance.createdAt,
      'status': instance.status,
    };

_ConfirmSellerPendingRequest _$ConfirmSellerPendingRequestFromJson(
  Map<String, dynamic> json,
) => _ConfirmSellerPendingRequest(
  itemIds: (json['item_ids'] as List<dynamic>).map((e) => e as String).toList(),
);

Map<String, dynamic> _$ConfirmSellerPendingRequestToJson(
  _ConfirmSellerPendingRequest instance,
) => <String, dynamic>{'item_ids': instance.itemIds};

_SellerConfirmResponse _$SellerConfirmResponseFromJson(
  Map<String, dynamic> json,
) => _SellerConfirmResponse(
  sessionId: json['session_id'] as String?,
  paymentUrl: json['payment_url'] as String?,
  amount: (json['amount'] as num?)?.toInt(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$SellerConfirmResponseToJson(
  _SellerConfirmResponse instance,
) => <String, dynamic>{
  'session_id': instance.sessionId,
  'payment_url': instance.paymentUrl,
  'amount': instance.amount,
  'message': instance.message,
};

_RejectSellerPendingRequest _$RejectSellerPendingRequestFromJson(
  Map<String, dynamic> json,
) => _RejectSellerPendingRequest(
  itemId: json['item_id'] as String,
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$RejectSellerPendingRequestToJson(
  _RejectSellerPendingRequest instance,
) => <String, dynamic>{'item_id': instance.itemId, 'reason': instance.reason};

_VideoToProductResponse _$VideoToProductResponseFromJson(
  Map<String, dynamic> json,
) => _VideoToProductResponse(
  suggestedTitle: json['suggested_title'] as String?,
  suggestedDescription: json['suggested_description'] as String?,
  categoryId: json['category_id'] as String?,
  categoryName: json['category_name'] as String?,
  confidence: (json['confidence'] as num?)?.toDouble(),
  tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
  specifications: (json['specifications'] as List<dynamic>?)
      ?.map((e) => ProductSpecification.fromJson(e as Map<String, dynamic>))
      .toList(),
  suggestedSkus: (json['suggested_skus'] as List<dynamic>?)
      ?.map((e) => ProductSkuRequest.fromJson(e as Map<String, dynamic>))
      .toList(),
  extractedFrames: (json['extracted_frames'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$VideoToProductResponseToJson(
  _VideoToProductResponse instance,
) => <String, dynamic>{
  'suggested_title': instance.suggestedTitle,
  'suggested_description': instance.suggestedDescription,
  'category_id': instance.categoryId,
  'category_name': instance.categoryName,
  'confidence': instance.confidence,
  'tags': instance.tags,
  'specifications': instance.specifications,
  'suggested_skus': instance.suggestedSkus,
  'extracted_frames': instance.extractedFrames,
};

_AudioToDescriptionResponse _$AudioToDescriptionResponseFromJson(
  Map<String, dynamic> json,
) => _AudioToDescriptionResponse(
  rawText: json['raw_text'] as String?,
  refinedDescription: json['refined_description'] as String?,
  confidence: (json['confidence'] as num?)?.toDouble(),
);

Map<String, dynamic> _$AudioToDescriptionResponseToJson(
  _AudioToDescriptionResponse instance,
) => <String, dynamic>{
  'raw_text': instance.rawText,
  'refined_description': instance.refinedDescription,
  'confidence': instance.confidence,
};

_RefineDescriptionRequest _$RefineDescriptionRequestFromJson(
  Map<String, dynamic> json,
) => _RefineDescriptionRequest(
  rawText: json['raw_text'] as String,
  tone: json['tone'] as String?,
  prompt: json['prompt'] as String?,
);

Map<String, dynamic> _$RefineDescriptionRequestToJson(
  _RefineDescriptionRequest instance,
) => <String, dynamic>{
  'raw_text': instance.rawText,
  'tone': instance.tone,
  'prompt': instance.prompt,
};

_RefineDescriptionResponse _$RefineDescriptionResponseFromJson(
  Map<String, dynamic> json,
) => _RefineDescriptionResponse(
  refinedDescription: json['refined_description'] as String?,
  rawText: json['raw_text'] as String?,
);

Map<String, dynamic> _$RefineDescriptionResponseToJson(
  _RefineDescriptionResponse instance,
) => <String, dynamic>{
  'refined_description': instance.refinedDescription,
  'raw_text': instance.rawText,
};

_SellerOrder _$SellerOrderFromJson(Map<String, dynamic> json) => _SellerOrder(
  id: json['id'] as String,
  txId: json['tx_id'] as String?,
  buyerId: json['buyer_id'] as String?,
  buyerName: json['buyer_name'] as String?,
  totalAmount: (json['total_amount'] as num?)?.toInt() ?? 0,
  status: json['status'] as String?,
  createdAt: json['created_at'] as String?,
  shippingAddress: json['shipping_address'] as String?,
  items: (json['items'] as List<dynamic>?)
      ?.map((e) => SellerPendingItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SellerOrderToJson(_SellerOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tx_id': instance.txId,
      'buyer_id': instance.buyerId,
      'buyer_name': instance.buyerName,
      'total_amount': instance.totalAmount,
      'status': instance.status,
      'created_at': instance.createdAt,
      'shipping_address': instance.shippingAddress,
      'items': instance.items,
    };
