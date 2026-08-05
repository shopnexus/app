// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_bank_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBankAccountRequest _$UpdateBankAccountRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateBankAccountRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['is_default']);
  final val = UpdateBankAccountRequest(
    isDefault: $checkedConvert('is_default', (v) => v as bool),
  );
  return val;
}, fieldKeyMap: const {'isDefault': 'is_default'});

Map<String, dynamic> _$UpdateBankAccountRequestToJson(
  UpdateBankAccountRequest instance,
) => <String, dynamic>{'is_default': instance.isDefault};
