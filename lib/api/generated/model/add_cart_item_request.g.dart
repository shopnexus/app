// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_cart_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddCartItemRequest _$AddCartItemRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AddCartItemRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['quantity', 'variant_id']);
      final val = AddCartItemRequest(
        quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
        variantId: $checkedConvert('variant_id', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'variantId': 'variant_id'});

Map<String, dynamic> _$AddCartItemRequestToJson(AddCartItemRequest instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      'variant_id': instance.variantId,
    };
