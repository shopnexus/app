//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/message_quote.dart';
import 'package:shopnexus_flutter_app/api/generated/model/message_type.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Message {
  /// Returns a new [Message] instance.
  Message({
    required this.attachments,

    required this.body,

    required this.card,

    required this.conversationId,

    required this.createdAt,

    required this.deletedAt,

    required this.editedAt,

    required this.fromSupport,

    required this.id,

    required this.refs,

    required this.replyTo,

    required this.senderId,

    required this.type,
  });

  /// Empty on a redacted message.
  @JsonKey(name: r'attachments', required: true, includeIfNull: false)
  final List<Resource> attachments;

  /// Empty on a redacted message.
  @JsonKey(name: r'body', required: true, includeIfNull: false)
  final String body;

  /// Empty on an ordinary message, so a client reads \"no card\" as an empty object rather than a missing key. What a system message renders, and for a price negotiation that is `{\"offer_id\": \"ofr_…\"}` and nothing else — the terms are read from the offer, so a counter-offer cannot leave an old price on screen. Written only by the backend and rejected on a `user` message, otherwise anyone could send a card that looks like an offer the seller accepted.
  @JsonKey(name: r'card', required: true, includeIfNull: false)
  final Map<String, Object> card;

  @JsonKey(name: r'conversation_id', required: true, includeIfNull: false)
  final String conversationId;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// Set on a redacted message. The row stays so a thread has no unexplained gaps.
  @JsonKey(name: r'deleted_at', required: true, includeIfNull: true)
  final DateTime? deletedAt;

  @JsonKey(name: r'edited_at', required: true, includeIfNull: true)
  final DateTime? editedAt;

  /// True on a reply the support desk wrote, in the requester's own view of their ticket thread. Support answers as the platform, so the requester is told that much and no more; staff reading the same thread see the real sender and never this flag, because a colleague's name is what makes a thread reviewable.
  @JsonKey(name: r'from_support', required: true, includeIfNull: false)
  final bool fromSupport;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// What the sender pointed at — a listing, a variant, an order. Client-supplied and validated against the caller's own access to each id, so it can carry a reference but never assert anything about it.
  @JsonKey(name: r'refs', required: true, includeIfNull: false)
  final Map<String, Object> refs;

  /// The message this one answers, resolved. Null on an ordinary message.
  @JsonKey(name: r'reply_to', required: true, includeIfNull: true)
  final MessageQuote? replyTo;

  /// Null on a system message, and null on a support reply seen by the requester — see `from_support`, which is how the two are told apart.
  @JsonKey(name: r'sender_id', required: true, includeIfNull: true)
  final String? senderId;

  @JsonKey(name: r'type', required: true, includeIfNull: false)
  final MessageType type;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Message &&
          other.attachments == attachments &&
          other.body == body &&
          other.card == card &&
          other.conversationId == conversationId &&
          other.createdAt == createdAt &&
          other.deletedAt == deletedAt &&
          other.editedAt == editedAt &&
          other.fromSupport == fromSupport &&
          other.id == id &&
          other.refs == refs &&
          other.replyTo == replyTo &&
          other.senderId == senderId &&
          other.type == type;

  @override
  int get hashCode =>
      attachments.hashCode +
      body.hashCode +
      card.hashCode +
      conversationId.hashCode +
      createdAt.hashCode +
      (deletedAt == null ? 0 : deletedAt.hashCode) +
      (editedAt == null ? 0 : editedAt.hashCode) +
      fromSupport.hashCode +
      id.hashCode +
      refs.hashCode +
      (replyTo == null ? 0 : replyTo.hashCode) +
      (senderId == null ? 0 : senderId.hashCode) +
      type.hashCode;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
