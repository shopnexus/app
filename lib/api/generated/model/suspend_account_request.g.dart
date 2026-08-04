// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'suspend_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuspendAccountRequest _$SuspendAccountRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('SuspendAccountRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['reason']);
  final val = SuspendAccountRequest(
    reason: $checkedConvert('reason', (v) => v as String),
    until: $checkedConvert(
      'until',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
  );
  return val;
});

Map<String, dynamic> _$SuspendAccountRequestToJson(
  SuspendAccountRequest instance,
) => <String, dynamic>{
  'reason': instance.reason,
  'until': ?instance.until?.toIso8601String(),
};
