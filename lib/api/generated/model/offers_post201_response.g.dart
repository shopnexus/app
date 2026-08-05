// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offers_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OffersPost201Response _$OffersPost201ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('OffersPost201Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = OffersPost201Response(
    data: $checkedConvert(
      'data',
      (v) => Offer.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$OffersPost201ResponseToJson(
  OffersPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
