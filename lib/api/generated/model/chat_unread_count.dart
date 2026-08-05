//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chat_unread_count.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ChatUnreadCount {
  /// Returns a new [ChatUnreadCount] instance.
  ChatUnreadCount({required this.conversations, required this.unread});

  /// How many threads have anything unread.
  // minimum: 0
  @JsonKey(name: r'conversations', required: true, includeIfNull: false)
  final int conversations;

  // minimum: 0
  @JsonKey(name: r'unread', required: true, includeIfNull: false)
  final int unread;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatUnreadCount &&
          other.conversations == conversations &&
          other.unread == unread;

  @override
  int get hashCode => conversations.hashCode + unread.hashCode;

  factory ChatUnreadCount.fromJson(Map<String, dynamic> json) =>
      _$ChatUnreadCountFromJson(json);

  Map<String, dynamic> toJson() => _$ChatUnreadCountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
