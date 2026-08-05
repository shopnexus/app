// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_account_id_reputation_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountsAccountIDReputationGet200Response
_$AccountsAccountIDReputationGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AccountsAccountIDReputationGet200Response', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AccountsAccountIDReputationGet200Response(
    data: $checkedConvert(
      'data',
      (v) => Reputation.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AccountsAccountIDReputationGet200ResponseToJson(
  AccountsAccountIDReputationGet200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
