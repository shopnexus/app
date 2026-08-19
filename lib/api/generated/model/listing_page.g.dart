// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingPage _$ListingPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListingPage', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const ['data', 'meta', 'probes', 'understood'],
      );
      final val = ListingPage(
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
        probes: $checkedConvert(
          'probes',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        understood: $checkedConvert('understood', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ListingPageToJson(ListingPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
      'probes': instance.probes,
      'understood': instance.understood,
    };
