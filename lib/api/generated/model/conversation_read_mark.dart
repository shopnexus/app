//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation_read_mark.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConversationReadMark {
  /// Returns a new [ConversationReadMark] instance.
  ConversationReadMark({
    required this.conversationId,

    required this.readAt,

    required this.readerId,
  });

  @JsonKey(name: r'conversation_id', required: true, includeIfNull: false)
  final String conversationId;

  @JsonKey(name: r'read_at', required: true, includeIfNull: false)
  final DateTime readAt;

  /// Who read it — always the other participant, never the recipient.
  @JsonKey(name: r'reader_id', required: true, includeIfNull: false)
  final String readerId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationReadMark &&
          other.conversationId == conversationId &&
          other.readAt == readAt &&
          other.readerId == readerId;

  @override
  int get hashCode =>
      conversationId.hashCode + readAt.hashCode + readerId.hashCode;

  factory ConversationReadMark.fromJson(Map<String, dynamic> json) =>
      _$ConversationReadMarkFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationReadMarkToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
