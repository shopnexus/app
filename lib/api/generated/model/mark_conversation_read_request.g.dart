// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_conversation_read_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkConversationReadRequest _$MarkConversationReadRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MarkConversationReadRequest', json, ($checkedConvert) {
  final val = MarkConversationReadRequest(
    before: $checkedConvert(
      'before',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
  );
  return val;
});

Map<String, dynamic> _$MarkConversationReadRequestToJson(
  MarkConversationReadRequest instance,
) => <String, dynamic>{'before': ?instance.before?.toIso8601String()};
