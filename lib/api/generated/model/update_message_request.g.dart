// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateMessageRequest _$UpdateMessageRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateMessageRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['body']);
  final val = UpdateMessageRequest(
    body: $checkedConvert('body', (v) => v as String),
  );
  return val;
});

Map<String, dynamic> _$UpdateMessageRequestToJson(
  UpdateMessageRequest instance,
) => <String, dynamic>{'body': instance.body};
