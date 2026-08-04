// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequest _$UpdateProfileRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UpdateProfileRequest',
  json,
  ($checkedConvert) {
    final val = UpdateProfileRequest(
      avatarResourceId: $checkedConvert(
        'avatar_resource_id',
        (v) => v as String?,
      ),
      clearAvatarResourceId: $checkedConvert(
        'clear_avatar_resource_id',
        (v) => v as bool?,
      ),
      clearDateOfBirth: $checkedConvert(
        'clear_date_of_birth',
        (v) => v as bool?,
      ),
      clearDescription: $checkedConvert('clear_description', (v) => v as bool?),
      clearGender: $checkedConvert('clear_gender', (v) => v as bool?),
      country: $checkedConvert('country', (v) => v as String?),
      dateOfBirth: $checkedConvert(
        'date_of_birth',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      description: $checkedConvert('description', (v) => v as String?),
      gender: $checkedConvert(
        'gender',
        (v) => $enumDecodeNullable(_$ProfileGenderEnumMap, v),
      ),
      locale: $checkedConvert('locale', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      timezone: $checkedConvert('timezone', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'avatarResourceId': 'avatar_resource_id',
    'clearAvatarResourceId': 'clear_avatar_resource_id',
    'clearDateOfBirth': 'clear_date_of_birth',
    'clearDescription': 'clear_description',
    'clearGender': 'clear_gender',
    'dateOfBirth': 'date_of_birth',
  },
);

Map<String, dynamic> _$UpdateProfileRequestToJson(
  UpdateProfileRequest instance,
) => <String, dynamic>{
  'avatar_resource_id': ?instance.avatarResourceId,
  'clear_avatar_resource_id': ?instance.clearAvatarResourceId,
  'clear_date_of_birth': ?instance.clearDateOfBirth,
  'clear_description': ?instance.clearDescription,
  'clear_gender': ?instance.clearGender,
  'country': ?instance.country,
  'date_of_birth': ?instance.dateOfBirth?.toIso8601String(),
  'description': ?instance.description,
  'gender': ?_$ProfileGenderEnumMap[instance.gender],
  'locale': ?instance.locale,
  'name': ?instance.name,
  'timezone': ?instance.timezone,
};

const _$ProfileGenderEnumMap = {
  ProfileGender.male: 'male',
  ProfileGender.female: 'female',
  ProfileGender.other: 'other',
};
