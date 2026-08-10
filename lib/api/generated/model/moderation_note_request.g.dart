// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moderation_note_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModerationNoteRequest _$ModerationNoteRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ModerationNoteRequest', json, ($checkedConvert) {
  final val = ModerationNoteRequest(
    note: $checkedConvert('note', (v) => v as String?),
  );
  return val;
});

Map<String, dynamic> _$ModerationNoteRequestToJson(
  ModerationNoteRequest instance,
) => <String, dynamic>{if (instance.note case final value?) 'note': value};
