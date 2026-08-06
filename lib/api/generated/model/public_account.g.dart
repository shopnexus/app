// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'public_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PublicAccount _$PublicAccountFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'PublicAccount',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'avatar',
            'created_at',
            'description',
            'follower_count',
            'id',
            'identity_verified',
            'name',
          ],
        );
        final val = PublicAccount(
          avatar: $checkedConvert(
            'avatar',
            (v) =>
                v == null ? null : Resource.fromJson(v as Map<String, dynamic>),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          description: $checkedConvert('description', (v) => v as String?),
          followerCount: $checkedConvert(
            'follower_count',
            (v) => (v as num).toInt(),
          ),
          id: $checkedConvert('id', (v) => v as String),
          identityVerified: $checkedConvert(
            'identity_verified',
            (v) => v as bool,
          ),
          name: $checkedConvert('name', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdAt': 'created_at',
        'followerCount': 'follower_count',
        'identityVerified': 'identity_verified',
      },
    );

Map<String, dynamic> _$PublicAccountToJson(PublicAccount instance) =>
    <String, dynamic>{
      'avatar': instance.avatar?.toJson(),
      'created_at': instance.createdAt.toIso8601String(),
      'description': instance.description,
      'follower_count': instance.followerCount,
      'id': instance.id,
      'identity_verified': instance.identityVerified,
      'name': instance.name,
    };
