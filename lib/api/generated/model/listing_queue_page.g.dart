// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_queue_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingQueuePage _$ListingQueuePageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListingQueuePage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = ListingQueuePage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Listing.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => PageMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$ListingQueuePageToJson(ListingQueuePage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
