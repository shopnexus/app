// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'email_verification_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmailVerificationRequest _$EmailVerificationRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('EmailVerificationRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['token']);
  final val = EmailVerificationRequest(
    token: $checkedConvert('token', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$EmailVerificationRequestToJson(
  EmailVerificationRequest instance,
) => <String, dynamic>{'token': instance.token};
