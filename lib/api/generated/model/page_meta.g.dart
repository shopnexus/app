// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_meta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PageMeta _$PageMetaFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PageMeta', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['limit', 'page', 'total_count']);
      final val = PageMeta(
        limit: $checkedConvert('limit', (v) => (v as num).toInt()),
        page: $checkedConvert('page', (v) => (v as num).toInt()),
        totalCount: $checkedConvert('total_count', (v) => (v as num?)?.toInt()),
      );
      return val;
    }, fieldKeyMap: const {'totalCount': 'total_count'});

Map<String, dynamic> _$PageMetaToJson(PageMeta instance) => <String, dynamic>{
  'limit': instance.limit,
  'page': instance.page,
  'total_count': instance.totalCount,
};
