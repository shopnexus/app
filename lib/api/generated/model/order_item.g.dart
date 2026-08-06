// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => $checkedCreate(
  'OrderItem',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'cancelled_at',
        'created_at',
        'currency',
        'id',
        'listing_id',
        'note',
        'order_id',
        'payment_session_id',
        'quantity',
        'seller_id',
        'total_amount',
        'transport_option',
        'variant_id',
      ],
    );
    final val = OrderItem(
      cancelledAt: $checkedConvert(
        'cancelled_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      currency: $checkedConvert('currency', (v) => v as String),
      id: $checkedConvert('id', (v) => v as String),
      listingId: $checkedConvert('listing_id', (v) => v as String),
      note: $checkedConvert('note', (v) => v as String),
      orderId: $checkedConvert('order_id', (v) => v as String?),
      paymentSessionId: $checkedConvert(
        'payment_session_id',
        (v) => v as String,
      ),
      quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
      sellerId: $checkedConvert('seller_id', (v) => v as String),
      totalAmount: $checkedConvert('total_amount', (v) => (v as num).toInt()),
      transportOption: $checkedConvert('transport_option', (v) => v as String),
      variantId: $checkedConvert('variant_id', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'cancelledAt': 'cancelled_at',
    'createdAt': 'created_at',
    'listingId': 'listing_id',
    'orderId': 'order_id',
    'paymentSessionId': 'payment_session_id',
    'sellerId': 'seller_id',
    'totalAmount': 'total_amount',
    'transportOption': 'transport_option',
    'variantId': 'variant_id',
  },
);

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
  'cancelled_at': instance.cancelledAt?.toIso8601String(),
  'created_at': instance.createdAt.toIso8601String(),
  'currency': instance.currency,
  'id': instance.id,
  'listing_id': instance.listingId,
  'note': instance.note,
  'order_id': instance.orderId,
  'payment_session_id': instance.paymentSessionId,
  'quantity': instance.quantity,
  'seller_id': instance.sellerId,
  'total_amount': instance.totalAmount,
  'transport_option': instance.transportOption,
  'variant_id': instance.variantId,
};
