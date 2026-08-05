// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_rejection_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalRejectionRequest _$WithdrawalRejectionRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('WithdrawalRejectionRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['reason']);
  final val = WithdrawalRejectionRequest(
    reason: $checkedConvert('reason', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$WithdrawalRejectionRequestToJson(
  WithdrawalRejectionRequest instance,
) => <String, dynamic>{'reason': instance.reason};
