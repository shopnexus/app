//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'moderation_note_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ModerationNoteRequest {
  /// Returns a new [ModerationNoteRequest] instance.
  ModerationNoteRequest({this.note});

  @JsonKey(name: r'note', required: false, includeIfNull: false)
  final String? note;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModerationNoteRequest && other.note == note;

  @override
  int get hashCode => note.hashCode;

  factory ModerationNoteRequest.fromJson(Map<String, dynamic> json) =>
      _$ModerationNoteRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ModerationNoteRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
