// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateAccountRequest _$UpdateAccountRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'UpdateAccountRequest',
  json,
  ($checkedConvert) {
    final val = UpdateAccountRequest(
      clearEmail: $checkedConvert('clear_email', (v) => v as bool?),
      clearPhone: $checkedConvert('clear_phone', (v) => v as bool?),
      clearUsername: $checkedConvert('clear_username', (v) => v as bool?),
      email: $checkedConvert('email', (v) => v as String?),
      phone: $checkedConvert('phone', (v) => v as String?),
      username: $checkedConvert('username', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'clearEmail': 'clear_email',
    'clearPhone': 'clear_phone',
    'clearUsername': 'clear_username',
  },
);

Map<String, dynamic> _$UpdateAccountRequestToJson(
  UpdateAccountRequest instance,
) => <String, dynamic>{
  'clear_email': ?instance.clearEmail,
  'clear_phone': ?instance.clearPhone,
  'clear_username': ?instance.clearUsername,
  'email': ?instance.email,
  'phone': ?instance.phone,
  'username': ?instance.username,
};
