//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_create_upload_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AccountCreateUploadRequest {
  /// Returns a new [AccountCreateUploadRequest] instance.
  AccountCreateUploadRequest({
    required this.filename,

    required this.kind,

    required this.mime,

    required this.size,
  });

  /// Kept only for its extension. The stored key is generated — a path a client chose is a directory traversal waiting for a backend that resolves one.
  @JsonKey(name: r'filename', required: true, includeIfNull: false)
  final String filename;

  @JsonKey(name: r'kind', required: true, includeIfNull: false)
  final AccountCreateUploadRequestKindEnum kind;

  /// One of the types this platform stores: `image/jpeg`, `image/png`, `image/webp`, `application/pdf`, `video/mp4`, `video/quicktime` (an iPhone's `.mov`), `video/webm`. Anything else is 422 whatever its size. The allowlist is the store's, so every upload route accepts the same set — which of them a client offers is its own choice.
  @JsonKey(name: r'mime', required: true, includeIfNull: false)
  final String mime;

  /// Declared up front and refused before a byte moves. The bound here is the video one: a `video/_*` upload may reach 100 MB, everything else is held to 10 MB, and a limit that depends on the type cannot be written as one number. The confirmed row records the size the *store* measured, not this.
  // minimum: 1
  // maximum: 104857600
  @JsonKey(name: r'size', required: true, includeIfNull: false)
  final int size;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountCreateUploadRequest &&
          other.filename == filename &&
          other.kind == kind &&
          other.mime == mime &&
          other.size == size;

  @override
  int get hashCode =>
      filename.hashCode + kind.hashCode + mime.hashCode + size.hashCode;

  factory AccountCreateUploadRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountCreateUploadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AccountCreateUploadRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

enum AccountCreateUploadRequestKindEnum {
  @JsonValue(r'avatar')
  avatar(r'avatar'),
  @JsonValue(r'identity')
  identity(r'identity');

  const AccountCreateUploadRequestKindEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
