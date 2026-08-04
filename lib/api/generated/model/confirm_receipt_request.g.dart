// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_receipt_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmReceiptRequest _$ConfirmReceiptRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ConfirmReceiptRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['attachments']);
  final val = ConfirmReceiptRequest(
    attachments: $checkedConvert(
      'attachments',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ConfirmReceiptRequestToJson(
  ConfirmReceiptRequest instance,
) => <String, dynamic>{'attachments': instance.attachments};
