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
      dateOfBirth: $checkedConvert('date_of_birth', (v) => v as String?),
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
  if (instance.avatarResourceId case final value?) 'avatar_resource_id': value,
  if (instance.clearAvatarResourceId case final value?)
    'clear_avatar_resource_id': value,
  if (instance.clearDateOfBirth case final value?) 'clear_date_of_birth': value,
  if (instance.clearDescription case final value?) 'clear_description': value,
  if (instance.clearGender case final value?) 'clear_gender': value,
  if (instance.country case final value?) 'country': value,
  if (instance.dateOfBirth case final value?) 'date_of_birth': value,
  if (instance.description case final value?) 'description': value,
  if (_$ProfileGenderEnumMap[instance.gender] case final value?)
    'gender': value,
  if (instance.locale case final value?) 'locale': value,
  if (instance.name case final value?) 'name': value,
  if (instance.timezone case final value?) 'timezone': value,
};

const _$ProfileGenderEnumMap = {
  ProfileGender.male: 'male',
  ProfileGender.female: 'female',
  ProfileGender.other: 'other',
};
