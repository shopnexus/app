// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminAccount _$AdminAccountFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'AdminAccount',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'created_at',
            'email_verified',
            'id',
            'identity_verified',
            'name',
            'role',
            'status',
          ],
        );
        final val = AdminAccount(
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          email: $checkedConvert('email', (v) => v as String?),
          emailVerified: $checkedConvert('email_verified', (v) => v as bool),
          id: $checkedConvert('id', (v) => v as String),
          identityVerified: $checkedConvert(
            'identity_verified',
            (v) => v as bool,
          ),
          name: $checkedConvert('name', (v) => v as String),
          phone: $checkedConvert('phone', (v) => v as String?),
          role: $checkedConvert(
            'role',
            (v) => $enumDecode(_$AccountRoleEnumMap, v),
          ),
          status: $checkedConvert(
            'status',
            (v) => $enumDecode(_$AccountStatusEnumMap, v),
          ),
          suspendedUntil: $checkedConvert(
            'suspended_until',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          suspensionReason: $checkedConvert(
            'suspension_reason',
            (v) => v as String?,
          ),
          username: $checkedConvert('username', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdAt': 'created_at',
        'emailVerified': 'email_verified',
        'identityVerified': 'identity_verified',
        'suspendedUntil': 'suspended_until',
        'suspensionReason': 'suspension_reason',
      },
    );

Map<String, dynamic> _$AdminAccountToJson(AdminAccount instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'email': ?instance.email,
      'email_verified': instance.emailVerified,
      'id': instance.id,
      'identity_verified': instance.identityVerified,
      'name': instance.name,
      'phone': ?instance.phone,
      'role': _$AccountRoleEnumMap[instance.role]!,
      'status': _$AccountStatusEnumMap[instance.status]!,
      'suspended_until': ?instance.suspendedUntil?.toIso8601String(),
      'suspension_reason': ?instance.suspensionReason,
      'username': ?instance.username,
    };

const _$AccountRoleEnumMap = {
  AccountRole.user: 'user',
  AccountRole.moderator: 'moderator',
  AccountRole.admin: 'admin',
};

const _$AccountStatusEnumMap = {
  AccountStatus.active: 'active',
  AccountStatus.suspended: 'suspended',
};
