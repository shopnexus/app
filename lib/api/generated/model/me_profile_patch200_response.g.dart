// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_profile_patch200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MeProfilePatch200Response _$MeProfilePatch200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MeProfilePatch200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = MeProfilePatch200Response(
    data: $checkedConvert(
      'data',
      (v) => Profile.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$MeProfilePatch200ResponseToJson(
  MeProfilePatch200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
