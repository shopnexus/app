// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'draft_order_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DraftOrderPage _$DraftOrderPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DraftOrderPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = DraftOrderPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => DraftOrder.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => CursorMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$DraftOrderPageToJson(DraftOrderPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
