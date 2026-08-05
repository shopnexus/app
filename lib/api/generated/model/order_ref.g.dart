// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_ref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderRef _$OrderRefFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OrderRef', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id']);
      final val = OrderRef(id: $checkedConvert('id', (v) => v as String));
      return val;
    });

Map<String, dynamic> _$OrderRefToJson(OrderRef instance) => <String, dynamic>{
  'id': instance.id,
};
