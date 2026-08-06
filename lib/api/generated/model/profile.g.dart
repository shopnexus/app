// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Profile',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'avatar',
        'country',
        'created_at',
        'date_of_birth',
        'description',
        'gender',
        'locale',
        'name',
        'timezone',
      ],
    );
    final val = Profile(
      avatar: $checkedConvert(
        'avatar',
        (v) => v == null ? null : Resource.fromJson(v as Map<String, dynamic>),
      ),
      country: $checkedConvert('country', (v) => v as String),
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      dateOfBirth: $checkedConvert('date_of_birth', (v) => v as String?),
      description: $checkedConvert('description', (v) => v as String?),
      gender: $checkedConvert(
        'gender',
        (v) => $enumDecodeNullable(_$ProfileGenderEnumMap, v),
      ),
      locale: $checkedConvert('locale', (v) => v as String),
      name: $checkedConvert('name', (v) => v as String),
      timezone: $checkedConvert('timezone', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'createdAt': 'created_at',
    'dateOfBirth': 'date_of_birth',
  },
);

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
  'avatar': instance.avatar?.toJson(),
  'country': instance.country,
  'created_at': instance.createdAt.toIso8601String(),
  'date_of_birth': instance.dateOfBirth,
  'description': instance.description,
  'gender': _$ProfileGenderEnumMap[instance.gender],
  'locale': instance.locale,
  'name': instance.name,
  'timezone': instance.timezone,
};

const _$ProfileGenderEnumMap = {
  ProfileGender.male: 'male',
  ProfileGender.female: 'female',
  ProfileGender.other: 'other',
};
