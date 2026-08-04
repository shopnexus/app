// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordResetRequest _$PasswordResetRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PasswordResetRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['identifier']);
  final val = PasswordResetRequest(
    identifier: $checkedConvert('identifier', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$PasswordResetRequestToJson(
  PasswordResetRequest instance,
) => <String, dynamic>{'identifier': instance.identifier};
