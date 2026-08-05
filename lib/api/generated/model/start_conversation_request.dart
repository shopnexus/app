//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'start_conversation_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StartConversationRequest {
  /// Returns a new [StartConversationRequest] instance.
  StartConversationRequest({required this.accountId});

  @JsonKey(name: r'account_id', required: true, includeIfNull: false)
  final String accountId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StartConversationRequest && other.accountId == accountId;

  @override
  int get hashCode => accountId.hashCode;

  factory StartConversationRequest.fromJson(Map<String, dynamic> json) =>
      _$StartConversationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StartConversationRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
