// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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

_CheckoutRequest _$CheckoutRequestFromJson(Map<String, dynamic> json) =>
    _CheckoutRequest(
      buyNow: json['buy_now'] as bool,
      address: json['address'] as String,
      paymentOption: json['payment_option'] as String,
      useWallet: json['use_wallet'] as bool,
      promotionCodes: (json['promotion_codes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      items: (json['items'] as List<dynamic>)
          .map((e) => CheckoutItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckoutRequestToJson(_CheckoutRequest instance) =>
    <String, dynamic>{
      'buy_now': instance.buyNow,
      'address': instance.address,
      'payment_option': instance.paymentOption,
      'use_wallet': instance.useWallet,
      'promotion_codes': instance.promotionCodes,
      'items': instance.items,
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
