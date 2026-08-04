// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_wallets_account_id_adjustments_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminWalletsAccountIDAdjustmentsPost200Response
_$AdminWalletsAccountIDAdjustmentsPost200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminWalletsAccountIDAdjustmentsPost200Response', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AdminWalletsAccountIDAdjustmentsPost200Response(
    data: $checkedConvert(
      'data',
      (v) => Wallet.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminWalletsAccountIDAdjustmentsPost200ResponseToJson(
  AdminWalletsAccountIDAdjustmentsPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
