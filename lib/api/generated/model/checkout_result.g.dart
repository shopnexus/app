// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutResult _$CheckoutResultFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CheckoutResult',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'currency',
            'goods_total',
            'items',
            'payment_session_id',
            'shipping_fee',
            'total',
          ],
        );
        final val = CheckoutResult(
          currency: $checkedConvert('currency', (v) => v as String),
          goodsTotal: $checkedConvert('goods_total', (v) => (v as num).toInt()),
          items: $checkedConvert(
            'items',
            (v) => (v as List<dynamic>)
                .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          paymentSessionId: $checkedConvert(
            'payment_session_id',
            (v) => v as String,
          ),
          shippingFee: $checkedConvert(
            'shipping_fee',
            (v) => (v as num).toInt(),
          ),
          total: $checkedConvert('total', (v) => (v as num).toInt()),
        );
        return val;
      },
      fieldKeyMap: const {
        'goodsTotal': 'goods_total',
        'paymentSessionId': 'payment_session_id',
        'shippingFee': 'shipping_fee',
      },
    );

Map<String, dynamic> _$CheckoutResultToJson(CheckoutResult instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'goods_total': instance.goodsTotal,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'payment_session_id': instance.paymentSessionId,
      'shipping_fee': instance.shippingFee,
      'total': instance.total,
    };
