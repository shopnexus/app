// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderPage _$OrderPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OrderPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = OrderPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Order.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => CursorMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OrderPageToJson(OrderPage instance) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'meta': instance.meta.toJson(),
};
