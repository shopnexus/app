// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reject_refund_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RejectRefundRequest _$RejectRefundRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('RejectRefundRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['reason']);
      final val = RejectRefundRequest(
        reason: $checkedConvert('reason', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$RejectRefundRequestToJson(
  RejectRefundRequest instance,
) => <String, dynamic>{'reason': instance.reason};
