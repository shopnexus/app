//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/conversation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/cursor_meta.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation_page.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConversationPage {
  /// Returns a new [ConversationPage] instance.
  ConversationPage({required this.data, required this.meta});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final List<Conversation> data;

  @JsonKey(name: r'meta', required: true, includeIfNull: false)
  final CursorMeta meta;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationPage && other.data == data && other.meta == meta;

  @override
  int get hashCode => data.hashCode + meta.hashCode;

  factory ConversationPage.fromJson(Map<String, dynamic> json) =>
      _$ConversationPageFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationPageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
