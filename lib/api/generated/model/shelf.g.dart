// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shelf.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shelf _$ShelfFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Shelf',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['browse', 'key', 'listings', 'reason', 'subject'],
    );
    final val = Shelf(
      browse: $checkedConvert(
        'browse',
        (v) => ShelfBrowse.fromJson(v as Map<String, dynamic>),
      ),
      key: $checkedConvert('key', (v) => v as String),
      listings: $checkedConvert(
        'listings',
        (v) => (v as List<dynamic>)
            .map((e) => Listing.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      reason: $checkedConvert(
        'reason',
        (v) => $enumDecode(_$ShelfReasonEnumMap, v),
      ),
      subject: $checkedConvert(
        'subject',
        (v) =>
            v == null ? null : ShelfSubject.fromJson(v as Map<String, dynamic>),
      ),
    );
    return val;
  },
);

Map<String, dynamic> _$ShelfToJson(Shelf instance) => <String, dynamic>{
  'browse': instance.browse.toJson(),
  'key': instance.key,
  'listings': instance.listings.map((e) => e.toJson()).toList(),
  'reason': _$ShelfReasonEnumMap[instance.reason]!,
  'subject': instance.subject?.toJson(),
};

const _$ShelfReasonEnumMap = {
  ShelfReason.interest: 'interest',
  ShelfReason.becauseYouViewed: 'because-you-viewed',
  ShelfReason.trending: 'trending',
  ShelfReason.bestSelling: 'best-selling',
  ShelfReason.topRated: 'top-rated',
  ShelfReason.newest: 'newest',
};
