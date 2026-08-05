//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'deleted_message_ref.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeletedMessageRef {
  /// Returns a new [DeletedMessageRef] instance.
  DeletedMessageRef({
    required this.conversationId,

    required this.createdAt,

    required this.id,
  });

  @JsonKey(name: r'conversation_id', required: true, includeIfNull: false)
  final String conversationId;

  /// The message's own instant — the hypertable needs it to locate the row.
  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// Opaque message id.
  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DeletedMessageRef &&
          other.conversationId == conversationId &&
          other.createdAt == createdAt &&
          other.id == id;

  @override
  int get hashCode =>
      conversationId.hashCode + createdAt.hashCode + id.hashCode;

  factory DeletedMessageRef.fromJson(Map<String, dynamic> json) =>
      _$DeletedMessageRefFromJson(json);

  Map<String, dynamic> toJson() => _$DeletedMessageRefToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
