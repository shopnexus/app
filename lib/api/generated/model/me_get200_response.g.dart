// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeGet200Response _$MeGet200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('MeGet200Response', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = MeGet200Response(
        data: $checkedConvert(
          'data',
          (v) => Me.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$MeGet200ResponseToJson(MeGet200Response instance) =>
    <String, dynamic>{'data': instance.data.toJson()};
