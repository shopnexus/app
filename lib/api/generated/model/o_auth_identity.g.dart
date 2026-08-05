// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'o_auth_identity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthIdentity _$OAuthIdentityFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OAuthIdentity', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['created_at', 'provider']);
      final val = OAuthIdentity(
        createdAt: $checkedConvert(
          'created_at',
          (v) => DateTime.parse(v as String),
        ),
        provider: $checkedConvert('provider', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'createdAt': 'created_at'});

Map<String, dynamic> _$OAuthIdentityToJson(OAuthIdentity instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt.toIso8601String(),
      'provider': instance.provider,
    };
