// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_items_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemsPost201Response _$CartItemsPost201ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('CartItemsPost201Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = CartItemsPost201Response(
    data: $checkedConvert(
      'data',
      (v) => CartItem.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$CartItemsPost201ResponseToJson(
  CartItemsPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
