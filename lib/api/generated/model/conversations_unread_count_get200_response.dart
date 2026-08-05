//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/chat_unread_count.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversations_unread_count_get200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConversationsUnreadCountGet200Response {
  /// Returns a new [ConversationsUnreadCountGet200Response] instance.
  ConversationsUnreadCountGet200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final ChatUnreadCount data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationsUnreadCountGet200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory ConversationsUnreadCountGet200Response.fromJson(
    Map<String, dynamic> json,
  ) => _$ConversationsUnreadCountGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConversationsUnreadCountGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
