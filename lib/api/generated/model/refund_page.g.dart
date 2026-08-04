// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefundPage _$RefundPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RefundPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = RefundPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Refund.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => CursorMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$RefundPageToJson(RefundPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
