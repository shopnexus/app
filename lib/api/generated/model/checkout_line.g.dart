// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutLine _$CheckoutLineFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CheckoutLine', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['quantity', 'variant_id']);
      final val = CheckoutLine(
        quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
        variantId: $checkedConvert('variant_id', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'variantId': 'variant_id'});

Map<String, dynamic> _$CheckoutLineToJson(CheckoutLine instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'variant_id': instance.variantId,
    };
