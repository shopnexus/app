// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'accounts_id_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountsIdGet200Response _$AccountsIdGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AccountsIdGet200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AccountsIdGet200Response(
    data: $checkedConvert(
      'data',
      (v) => PublicAccount.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AccountsIdGet200ResponseToJson(
  AccountsIdGet200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
