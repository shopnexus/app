// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_attachments_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddAttachmentsRequest _$AddAttachmentsRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AddAttachmentsRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['attachments']);
  final val = AddAttachmentsRequest(
    attachments: $checkedConvert(
      'attachments',
      (v) => (v as List<dynamic>).map((e) => e as String).toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$AddAttachmentsRequestToJson(
  AddAttachmentsRequest instance,
) => <String, dynamic>{'attachments': instance.attachments};
