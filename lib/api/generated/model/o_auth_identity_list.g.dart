// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'o_auth_identity_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OAuthIdentityList _$OAuthIdentityListFromJson(Map<String, dynamic> json) =>
    $checkedCreate('OAuthIdentityList', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = OAuthIdentityList(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => OAuthIdentity.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$OAuthIdentityListToJson(OAuthIdentityList instance) =>
    <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
