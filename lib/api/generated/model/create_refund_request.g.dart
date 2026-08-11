// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_refund_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateRefundRequest _$CreateRefundRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateRefundRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['reason']);
      final val = CreateRefundRequest(
        attachments: $checkedConvert(
          'attachments',
          (v) => (v as List<dynamic>?)?.map((e) => e as String).toList(),
        ),
        reason: $checkedConvert('reason', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$CreateRefundRequestToJson(
  CreateRefundRequest instance,
) => <String, dynamic>{
  'attachments': ?instance.attachments,
  'reason': instance.reason,
};
