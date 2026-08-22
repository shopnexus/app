//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_reply_ref.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MessageReplyRef {
  /// Returns a new [MessageReplyRef] instance.
  MessageReplyRef({required this.createdAt, required this.id});

  /// That message's own instant, passed back unchanged.
  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// Opaque id of the message being answered.
  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageReplyRef &&
          other.createdAt == createdAt &&
          other.id == id;

  @override
  int get hashCode => createdAt.hashCode + id.hashCode;

  factory MessageReplyRef.fromJson(Map<String, dynamic> json) =>
      _$MessageReplyRefFromJson(json);

  Map<String, dynamic> toJson() => _$MessageReplyRefToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
