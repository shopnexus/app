// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_accounts_id_suspension_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminAccountsIdSuspensionPost200Response
_$AdminAccountsIdSuspensionPost200ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminAccountsIdSuspensionPost200Response', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = AdminAccountsIdSuspensionPost200Response(
        data: $checkedConvert(
          'data',
          (v) => AdminAccount.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdminAccountsIdSuspensionPost200ResponseToJson(
  AdminAccountsIdSuspensionPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
