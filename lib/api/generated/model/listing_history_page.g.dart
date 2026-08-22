// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_history_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingHistoryPage _$ListingHistoryPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListingHistoryPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = ListingHistoryPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map(
                (e) => ListingHistoryEntry.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => PageMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListingHistoryPageToJson(ListingHistoryPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
