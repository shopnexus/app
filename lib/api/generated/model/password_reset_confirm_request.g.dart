// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_reset_confirm_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordResetConfirmRequest _$PasswordResetConfirmRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PasswordResetConfirmRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['new_password', 'token']);
  final val = PasswordResetConfirmRequest(
    newPassword: $checkedConvert('new_password', (v) => v as String),
    token: $checkedConvert('token', (v) => v as String),
  );
  return val;
}, fieldKeyMap: const {'newPassword': 'new_password'});

Map<String, dynamic> _$PasswordResetConfirmRequestToJson(
  PasswordResetConfirmRequest instance,
) => <String, dynamic>{
  'new_password': instance.newPassword,
  'token': instance.token,
};
