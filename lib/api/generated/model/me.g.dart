// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Me _$MeFromJson(Map<String, dynamic> json) => $checkedCreate(
  'Me',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'created_at',
        'email_verified',
        'has_password',
        'id',
        'identity_verified',
        'profile',
        'role',
        'status',
      ],
    );
    final val = Me(
      createdAt: $checkedConvert(
        'created_at',
        (v) => DateTime.parse(v as String),
      ),
      email: $checkedConvert('email', (v) => v as String?),
      emailVerified: $checkedConvert('email_verified', (v) => v as bool),
      hasPassword: $checkedConvert('has_password', (v) => v as bool),
      id: $checkedConvert('id', (v) => v as String),
      identityVerified: $checkedConvert('identity_verified', (v) => v as bool),
      phone: $checkedConvert('phone', (v) => v as String?),
      profile: $checkedConvert(
        'profile',
        (v) => Profile.fromJson(v as Map<String, dynamic>),
      ),
      role: $checkedConvert(
        'role',
        (v) => $enumDecode(_$AccountRoleEnumMap, v),
      ),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$AccountStatusEnumMap, v),
      ),
      username: $checkedConvert('username', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'createdAt': 'created_at',
    'emailVerified': 'email_verified',
    'hasPassword': 'has_password',
    'identityVerified': 'identity_verified',
  },
);

Map<String, dynamic> _$MeToJson(Me instance) => <String, dynamic>{
  'created_at': instance.createdAt.toIso8601String(),
  'email': ?instance.email,
  'email_verified': instance.emailVerified,
  'has_password': instance.hasPassword,
  'id': instance.id,
  'identity_verified': instance.identityVerified,
  'phone': ?instance.phone,
  'profile': instance.profile.toJson(),
  'role': _$AccountRoleEnumMap[instance.role]!,
  'status': _$AccountStatusEnumMap[instance.status]!,
  'username': ?instance.username,
};

const _$AccountRoleEnumMap = {
  AccountRole.user: 'user',
  AccountRole.moderator: 'moderator',
  AccountRole.admin: 'admin',
  AccountRole.support: 'support',
};

const _$AccountStatusEnumMap = {
  AccountStatus.active: 'active',
  AccountStatus.suspended: 'suspended',
};
