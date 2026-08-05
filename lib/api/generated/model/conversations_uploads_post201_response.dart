//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/upload_slot.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversations_uploads_post201_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConversationsUploadsPost201Response {
  /// Returns a new [ConversationsUploadsPost201Response] instance.
  ConversationsUploadsPost201Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final UploadSlot data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConversationsUploadsPost201Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory ConversationsUploadsPost201Response.fromJson(
    Map<String, dynamic> json,
  ) => _$ConversationsUploadsPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConversationsUploadsPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
