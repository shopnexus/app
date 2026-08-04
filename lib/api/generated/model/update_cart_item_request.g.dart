// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_cart_item_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateCartItemRequest _$UpdateCartItemRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateCartItemRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['quantity']);
  final val = UpdateCartItemRequest(
    quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
  );
  return val;
});

Map<String, dynamic> _$UpdateCartItemRequestToJson(
  UpdateCartItemRequest instance,
) => <String, dynamic>{'quantity': instance.quantity};
