// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_contact_phone_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyContactPhoneRequest _$VerifyContactPhoneRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('VerifyContactPhoneRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['code']);
  final val = VerifyContactPhoneRequest(
    code: $checkedConvert('code', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$VerifyContactPhoneRequestToJson(
  VerifyContactPhoneRequest instance,
) => <String, dynamic>{'code': instance.code};
