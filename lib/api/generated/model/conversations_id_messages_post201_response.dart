//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/message.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversations_id_messages_post201_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConversationsIdMessagesPost201Response {
  /// Returns a new [ConversationsIdMessagesPost201Response] instance.
  ConversationsIdMessagesPost201Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final Message data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationsIdMessagesPost201Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory ConversationsIdMessagesPost201Response.fromJson(
    Map<String, dynamic> json,
  ) => _$ConversationsIdMessagesPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConversationsIdMessagesPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
