//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/message.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Conversation {
  /// Returns a new [Conversation] instance.
  Conversation({
    required this.counterparty,

    required this.counterpartyReadAt,

    required this.createdAt,

    required this.id,

    required this.lastMessage,

    required this.lastMessageAt,

    required this.readAt,

    required this.ticketId,

    required this.unread,
  });

  /// The other side. On a ticket thread that is the support desk for the requester and the requester for staff — a moderator answering a ticket is not a side of the row, so every viewer-relative field here is computed as the desk for them.
  @JsonKey(name: r'counterparty', required: true, includeIfNull: false)
  final AccountSummary counterparty;

  /// How far the other side has read. This is the read receipt: a message the caller sent is seen when this is at or past its `created_at`, which is why no message carries a delivery status of its own.
  @JsonKey(name: r'counterparty_read_at', required: true, includeIfNull: true)
  final DateTime? counterpartyReadAt;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'last_message', required: true, includeIfNull: true)
  final Message? lastMessage;

  /// Starts at the creation time so an empty thread still sorts predictably in the inbox.
  @JsonKey(name: r'last_message_at', required: true, includeIfNull: false)
  final DateTime lastMessageAt;

  /// The caller's own read mark. Null while they have read nothing.
  @JsonKey(name: r'read_at', required: true, includeIfNull: true)
  final DateTime? readAt;

  /// Set when this thread is a support ticket's, null on an ordinary one. A ticket is read in the support screen rather than the inbox, so a client tells them apart from the row.
  @JsonKey(name: r'ticket_id', required: true, includeIfNull: true)
  final String? ticketId;

  /// The counterparty's messages after the caller's read mark.
  // minimum: 0
  @JsonKey(name: r'unread', required: true, includeIfNull: false)
  final int unread;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Conversation &&
          other.counterparty == counterparty &&
          other.counterpartyReadAt == counterpartyReadAt &&
          other.createdAt == createdAt &&
          other.id == id &&
          other.lastMessage == lastMessage &&
          other.lastMessageAt == lastMessageAt &&
          other.readAt == readAt &&
          other.ticketId == ticketId &&
          other.unread == unread;

  @override
  int get hashCode =>
      counterparty.hashCode +
      (counterpartyReadAt == null ? 0 : counterpartyReadAt.hashCode) +
      createdAt.hashCode +
      id.hashCode +
      (lastMessage == null ? 0 : lastMessage.hashCode) +
      lastMessageAt.hashCode +
      (readAt == null ? 0 : readAt.hashCode) +
      (ticketId == null ? 0 : ticketId.hashCode) +
      unread.hashCode;

  factory Conversation.fromJson(Map<String, dynamic> json) =>
      _$ConversationFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
