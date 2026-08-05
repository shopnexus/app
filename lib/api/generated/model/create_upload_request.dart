//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_upload_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateUploadRequest {
  /// Returns a new [CreateUploadRequest] instance.
  CreateUploadRequest({
    required this.filename,

    required this.mime,

    required this.size,
  });

  /// Kept only for its extension. The stored key is generated — a path a client chose is a directory traversal waiting for a backend that resolves one.
  @JsonKey(name: r'filename', required: true, includeIfNull: false)
  final String filename;

  @JsonKey(name: r'mime', required: true, includeIfNull: false)
  final String mime;

  // minimum: 1
  // maximum: 10485760
  @JsonKey(name: r'size', required: true, includeIfNull: false)
  final int size;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CreateUploadRequest &&
          other.filename == filename &&
          other.mime == mime &&
          other.size == size;

  @override
  int get hashCode => filename.hashCode + mime.hashCode + size.hashCode;

  factory CreateUploadRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateUploadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUploadRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
