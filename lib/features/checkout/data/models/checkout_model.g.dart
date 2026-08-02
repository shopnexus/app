// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckoutLine _$CheckoutLineFromJson(Map<String, dynamic> json) =>
    _CheckoutLine(
      variantId: json['variant_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$CheckoutLineToJson(_CheckoutLine instance) =>
    <String, dynamic>{
      'variant_id': instance.variantId,
      'quantity': instance.quantity,
    };

_CheckoutRequest _$CheckoutRequestFromJson(Map<String, dynamic> json) =>
    _CheckoutRequest(
      contactId: json['contact_id'] as String,
      currency: json['currency'] as String,
      lines: (json['lines'] as List<dynamic>)
          .map((e) => CheckoutLine.fromJson(e as Map<String, dynamic>))
          .toList(),
      note: json['note'] as String?,
      transportOption: json['transport_option'] as String,
    );

Map<String, dynamic> _$CheckoutRequestToJson(_CheckoutRequest instance) =>
    <String, dynamic>{
      'contact_id': instance.contactId,
      'currency': instance.currency,
      'lines': instance.lines,
      'note': instance.note,
      'transport_option': instance.transportOption,
    };

_CheckoutOfferRequest _$CheckoutOfferRequestFromJson(
  Map<String, dynamic> json,
) => _CheckoutOfferRequest(
  contactId: json['contact_id'] as String,
  note: json['note'] as String?,
  transportOption: json['transport_option'] as String,
);

Map<String, dynamic> _$CheckoutOfferRequestToJson(
  _CheckoutOfferRequest instance,
) => <String, dynamic>{
  'contact_id': instance.contactId,
  'note': instance.note,
  'transport_option': instance.transportOption,
};

_OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => _OrderItem(
  id: json['id'] as String,
  orderId: json['order_id'] as String?,
  sellerId: json['seller_id'] as String,
  listingId: json['listing_id'] as String?,
  variantId: json['variant_id'] as String,
  quantity: (json['quantity'] as num).toInt(),
  totalAmount: (json['total_amount'] as num).toInt(),
  currency: json['currency'] as String,
  transportOption: json['transport_option'] as String,
  paymentSessionId: json['payment_session_id'] as String?,
  note: json['note'] as String?,
  cancelledAt: json['cancelled_at'] as String?,
  createdAt: json['created_at'] as String,
);

Map<String, dynamic> _$OrderItemToJson(_OrderItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'order_id': instance.orderId,
      'seller_id': instance.sellerId,
      'listing_id': instance.listingId,
      'variant_id': instance.variantId,
      'quantity': instance.quantity,
      'total_amount': instance.totalAmount,
      'currency': instance.currency,
      'transport_option': instance.transportOption,
      'payment_session_id': instance.paymentSessionId,
      'note': instance.note,
      'cancelled_at': instance.cancelledAt,
      'created_at': instance.createdAt,
    };

_CheckoutResult _$CheckoutResultFromJson(Map<String, dynamic> json) =>
    _CheckoutResult(
      currency: json['currency'] as String,
      goodsTotal: (json['goods_total'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      paymentSessionId: json['payment_session_id'] as String,
      shippingFee: (json['shipping_fee'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$CheckoutResultToJson(_CheckoutResult instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'goods_total': instance.goodsTotal,
      'items': instance.items,
      'payment_session_id': instance.paymentSessionId,
      'shipping_fee': instance.shippingFee,
      'total': instance.total,
    };

_CreateDraftRequest _$CreateDraftRequestFromJson(Map<String, dynamic> json) =>
    _CreateDraftRequest(listingId: json['listing_id'] as String);

Map<String, dynamic> _$CreateDraftRequestToJson(_CreateDraftRequest instance) =>
    <String, dynamic>{'listing_id': instance.listingId};

_DraftOrderVariant _$DraftOrderVariantFromJson(Map<String, dynamic> json) =>
    _DraftOrderVariant(
      variantId: json['variant_id'] as String,
      price: (json['price'] as num).toInt(),
      attributes: json['attributes'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$DraftOrderVariantToJson(_DraftOrderVariant instance) =>
    <String, dynamic>{
      'variant_id': instance.variantId,
      'price': instance.price,
      'attributes': instance.attributes,
    };

_DraftOrder _$DraftOrderFromJson(Map<String, dynamic> json) => _DraftOrder(
  id: json['id'] as String,
  listingId: json['listing_id'] as String,
  sellerId: json['seller_id'] as String,
  name: json['name'] as String,
  currency: json['currency'] as String,
  priceMode: json['price_mode'] as String,
  validUntil: json['valid_until'] as String,
  createdAt: json['created_at'] as String,
  cancelledAt: json['cancelled_at'] as String?,
  variants: (json['variants'] as List<dynamic>)
      .map((e) => DraftOrderVariant.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DraftOrderToJson(_DraftOrder instance) =>
    <String, dynamic>{
      'id': instance.id,
      'listing_id': instance.listingId,
      'seller_id': instance.sellerId,
      'name': instance.name,
      'currency': instance.currency,
      'price_mode': instance.priceMode,
      'valid_until': instance.validUntil,
      'created_at': instance.createdAt,
      'cancelled_at': instance.cancelledAt,
      'variants': instance.variants,
    };

_StartPaymentRequest _$StartPaymentRequestFromJson(Map<String, dynamic> json) =>
    _StartPaymentRequest(
      paymentOption: json['payment_option'] as String,
      amount: (json['amount'] as num?)?.toInt(),
      returnUrl: json['return_url'] as String?,
    );

Map<String, dynamic> _$StartPaymentRequestToJson(
  _StartPaymentRequest instance,
) => <String, dynamic>{
  'payment_option': instance.paymentOption,
  'amount': instance.amount,
  'return_url': instance.returnUrl,
};

_Transaction _$TransactionFromJson(Map<String, dynamic> json) => _Transaction(
  id: json['id'] as String,
  sessionId: json['session_id'] as String,
  paymentOption: json['payment_option'] as String,
  amount: (json['amount'] as num).toInt(),
  checkoutUrl: json['checkout_url'] as String?,
  status: json['status'] as String,
  error: json['error'] as String?,
  createdAt: json['created_at'] as String,
  expiredAt: json['expired_at'] as String?,
  settledAt: json['settled_at'] as String?,
);

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'session_id': instance.sessionId,
      'payment_option': instance.paymentOption,
      'amount': instance.amount,
      'checkout_url': instance.checkoutUrl,
      'status': instance.status,
      'error': instance.error,
      'created_at': instance.createdAt,
      'expired_at': instance.expiredAt,
      'settled_at': instance.settledAt,
    };

_QuoteTransportItem _$QuoteTransportItemFromJson(Map<String, dynamic> json) =>
    _QuoteTransportItem(
      skuId: json['sku_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      transportOption: json['transport_option'] as String,
    );

Map<String, dynamic> _$QuoteTransportItemToJson(_QuoteTransportItem instance) =>
    <String, dynamic>{
      'sku_id': instance.skuId,
      'quantity': instance.quantity,
      'transport_option': instance.transportOption,
    };

_QuoteTransportRequest _$QuoteTransportRequestFromJson(
  Map<String, dynamic> json,
) => _QuoteTransportRequest(
  address: json['address'] as String,
  items: (json['items'] as List<dynamic>)
      .map((e) => QuoteTransportItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuoteTransportRequestToJson(
  _QuoteTransportRequest instance,
) => <String, dynamic>{'address': instance.address, 'items': instance.items};

_QuoteTransportResult _$QuoteTransportResultFromJson(
  Map<String, dynamic> json,
) => _QuoteTransportResult(
  skuId: json['sku_id'] as String,
  transportOption: json['transport_option'] as String,
  cost: (json['cost'] as num).toInt(),
  currency: json['currency'] as String,
);

Map<String, dynamic> _$QuoteTransportResultToJson(
  _QuoteTransportResult instance,
) => <String, dynamic>{
  'sku_id': instance.skuId,
  'transport_option': instance.transportOption,
  'cost': instance.cost,
  'currency': instance.currency,
};

_QuoteTransportResponse _$QuoteTransportResponseFromJson(
  Map<String, dynamic> json,
) => _QuoteTransportResponse(
  items: (json['items'] as List<dynamic>)
      .map((e) => QuoteTransportResult.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$QuoteTransportResponseToJson(
  _QuoteTransportResponse instance,
) => <String, dynamic>{'items': instance.items};

_CheckoutItem _$CheckoutItemFromJson(Map<String, dynamic> json) =>
    _CheckoutItem(
      skuId: json['sku_id'] as String,
      quantity: (json['quantity'] as num).toInt(),
      transportOption: json['transport_option'] as String,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$CheckoutItemToJson(_CheckoutItem instance) =>
    <String, dynamic>{
      'sku_id': instance.skuId,
      'quantity': instance.quantity,
      'transport_option': instance.transportOption,
      'note': instance.note,
    };

_CheckoutResponse _$CheckoutResponseFromJson(Map<String, dynamic> json) =>
    _CheckoutResponse(
      checkoutSessionId: json['checkout_session_id'] as String,
      paymentUrl: json['payment_url'] as String?,
    );

Map<String, dynamic> _$CheckoutResponseToJson(_CheckoutResponse instance) =>
    <String, dynamic>{
      'checkout_session_id': instance.checkoutSessionId,
      'payment_url': instance.paymentUrl,
    };

_PaymentUrlResponse _$PaymentUrlResponseFromJson(Map<String, dynamic> json) =>
    _PaymentUrlResponse(paymentUrl: json['payment_url'] as String);

Map<String, dynamic> _$PaymentUrlResponseToJson(_PaymentUrlResponse instance) =>
    <String, dynamic>{'payment_url': instance.paymentUrl};

_CheckoutSession _$CheckoutSessionFromJson(Map<String, dynamic> json) =>
    _CheckoutSession(
      id: (json['id'] as num).toInt(),
      kind: json['kind'] as String,
      status: json['status'] as String,
      note: json['note'] as String?,
      currency: json['currency'] as String,
      totalAmount: (json['total_amount'] as num).toInt(),
      dateCreated: json['date_created'] as String,
      datePaid: json['date_paid'] as String?,
    );

Map<String, dynamic> _$CheckoutSessionToJson(_CheckoutSession instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': instance.kind,
      'status': instance.status,
      'note': instance.note,
      'currency': instance.currency,
      'total_amount': instance.totalAmount,
      'date_created': instance.dateCreated,
      'date_paid': instance.datePaid,
    };

_CheckoutSummaryItem _$CheckoutSummaryItemFromJson(Map<String, dynamic> json) =>
    _CheckoutSummaryItem(
      id: (json['id'] as num).toInt(),
      skuId: json['sku_id'] as String,
      spuId: json['spu_id'] as String,
      slug: json['slug'] as String,
      skuName: json['sku_name'] as String,
      quantity: (json['quantity'] as num).toInt(),
      totalAmount: (json['total_amount'] as num).toInt(),
      currency: json['currency'] as String,
      imageUrl: json['image_url'] as String?,
    );

Map<String, dynamic> _$CheckoutSummaryItemToJson(
  _CheckoutSummaryItem instance,
) => <String, dynamic>{
  'id': instance.id,
  'sku_id': instance.skuId,
  'spu_id': instance.spuId,
  'slug': instance.slug,
  'sku_name': instance.skuName,
  'quantity': instance.quantity,
  'total_amount': instance.totalAmount,
  'currency': instance.currency,
  'image_url': instance.imageUrl,
};

_CheckoutSummary _$CheckoutSummaryFromJson(Map<String, dynamic> json) =>
    _CheckoutSummary(
      session: CheckoutSession.fromJson(
        json['session'] as Map<String, dynamic>,
      ),
      items: (json['items'] as List<dynamic>)
          .map((e) => CheckoutSummaryItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckoutSummaryToJson(_CheckoutSummary instance) =>
    <String, dynamic>{'session': instance.session, 'items': instance.items};
