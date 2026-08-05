// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_item_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemPage _$OrderItemPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OrderItemPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = OrderItemPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => CursorMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OrderItemPageToJson(OrderItemPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
