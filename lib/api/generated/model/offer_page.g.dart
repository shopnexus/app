// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferPage _$OfferPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OfferPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = OfferPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Offer.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => CursorMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OfferPageToJson(OfferPage instance) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'meta': instance.meta.toJson(),
};
