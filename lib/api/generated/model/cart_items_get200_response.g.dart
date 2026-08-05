// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemsGet200Response _$CartItemsGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CartItemsGet200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = CartItemsGet200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>)
          .map((e) => CartItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$CartItemsGet200ResponseToJson(
  CartItemsGet200Response instance,
) => <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
