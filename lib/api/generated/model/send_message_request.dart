//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/message_reply_ref.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_message_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SendMessageRequest {
  /// Returns a new [SendMessageRequest] instance.
  SendMessageRequest({this.attachments, this.body, this.refs, this.replyTo});

  @JsonKey(name: r'attachments', required: false, includeIfNull: false)
  final List<String>? attachments;

  @JsonKey(name: r'body', required: false, includeIfNull: false)
  final String? body;

  /// References to point at, each checked against the caller's access to it. There is no way to set `card` from here: a system payload is the backend's to write.
  @JsonKey(name: r'refs', required: false, includeIfNull: false)
  final Map<String, Object>? refs;

  /// The message being answered, and absent on an ordinary one. It has to be in this same conversation: the quote carries a preview of what was said, so answering a message from elsewhere would read another thread out through this one. `422 reply_outside_thread` when it is not, `404` when it names nothing.
  @JsonKey(name: r'reply_to', required: false, includeIfNull: false)
  final MessageReplyRef? replyTo;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SendMessageRequest &&
          other.attachments == attachments &&
          other.body == body &&
          other.refs == refs &&
          other.replyTo == replyTo;

  @override
  int get hashCode =>
      attachments.hashCode +
      body.hashCode +
      refs.hashCode +
      (replyTo == null ? 0 : replyTo.hashCode);

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$SendMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
