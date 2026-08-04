// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_withdrawals_id_approval_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminWithdrawalsIdApprovalPost200Response
_$AdminWithdrawalsIdApprovalPost200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminWithdrawalsIdApprovalPost200Response', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AdminWithdrawalsIdApprovalPost200Response(
    data: $checkedConvert(
      'data',
      (v) => Withdrawal.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminWithdrawalsIdApprovalPost200ResponseToJson(
  AdminWithdrawalsIdApprovalPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
