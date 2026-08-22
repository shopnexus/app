//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_quote.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MessageQuote {
  /// Returns a new [MessageQuote] instance.
  MessageQuote({
    required this.attachments,

    required this.createdAt,

    required this.fromSupport,

    required this.id,

    required this.preview,

    required this.redacted,

    required this.senderId,
  });

  /// How many files it carried, so a quote of four photos says four instead of looking like an empty message.
  // minimum: 0
  // maximum: 10
  @JsonKey(name: r'attachments', required: true, includeIfNull: false)
  final int attachments;

  /// The quoted message's own instant — what a client needs to jump to it.
  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// True when the quoted message is a reply the support desk wrote.
  @JsonKey(name: r'from_support', required: true, includeIfNull: false)
  final bool fromSupport;

  /// Opaque id of the quoted message.
  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// The opening of what it said, cut to 120 characters on a rune boundary. Empty on a redacted one and on one that carried only files.
  @JsonKey(name: r'preview', required: true, includeIfNull: false)
  final String preview;

  /// Set when the quoted message has since been unsent.
  @JsonKey(name: r'redacted', required: true, includeIfNull: false)
  final bool redacted;

  /// Null on a system message and on a support reply seen by the requester — the same masking the quoted message itself gets, because a quote is a projection of it.
  @JsonKey(name: r'sender_id', required: true, includeIfNull: true)
  final String? senderId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageQuote &&
          other.attachments == attachments &&
          other.createdAt == createdAt &&
          other.fromSupport == fromSupport &&
          other.id == id &&
          other.preview == preview &&
          other.redacted == redacted &&
          other.senderId == senderId;

  @override
  int get hashCode =>
      attachments.hashCode +
      createdAt.hashCode +
      fromSupport.hashCode +
      id.hashCode +
      preview.hashCode +
      redacted.hashCode +
      (senderId == null ? 0 : senderId.hashCode);

  factory MessageQuote.fromJson(Map<String, dynamic> json) =>
      _$MessageQuoteFromJson(json);

  Map<String, dynamic> toJson() => _$MessageQuoteToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
