// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_approval_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalApprovalRequest _$WithdrawalApprovalRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WithdrawalApprovalRequest', json, ($checkedConvert) {
  final val = WithdrawalApprovalRequest(
    providerRef: $checkedConvert('provider_ref', (v) => v as String?),
    reason: $checkedConvert('reason', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'providerRef': 'provider_ref'});

Map<String, dynamic> _$WithdrawalApprovalRequestToJson(
  WithdrawalApprovalRequest instance,
) => <String, dynamic>{
  'provider_ref': ?instance.providerRef,
  'reason': ?instance.reason,
};
