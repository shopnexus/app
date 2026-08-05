//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resource.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Resource {
  /// Returns a new [Resource] instance.
  Resource({
    this.checksum,

    required this.id,

    required this.mime,

    required this.objectKey,

    required this.provider,

    required this.size,

    this.url,

    this.urlExpiresAt,
  });

  /// Content hash, read back from storage at completion.
  @JsonKey(name: r'checksum', required: false, includeIfNull: false)
  final String? checksum;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'mime', required: true, includeIfNull: false)
  final String mime;

  /// Provider-specific path to the bytes.
  @JsonKey(name: r'object_key', required: true, includeIfNull: false)
  final String objectKey;

  /// Storage backend, kebab-case — `s3`, `minio`, `local`.
  @JsonKey(name: r'provider', required: true, includeIfNull: false)
  final String provider;

  /// Bytes, as read back from storage rather than as declared.
  // minimum: 0
  @JsonKey(name: r'size', required: true, includeIfNull: false)
  final int size;

  /// Short-lived URL to fetch the bytes. Absent until a module can presign one, so a consumer that needs the bytes has to treat it as \"not available yet\" rather than as an empty object. Not a stable address: store the id, not this.
  @JsonKey(name: r'url', required: false, includeIfNull: false)
  final String? url;

  @JsonKey(name: r'url_expires_at', required: false, includeIfNull: false)
  final DateTime? urlExpiresAt;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Resource &&
          other.checksum == checksum &&
          other.id == id &&
          other.mime == mime &&
          other.objectKey == objectKey &&
          other.provider == provider &&
          other.size == size &&
          other.url == url &&
          other.urlExpiresAt == urlExpiresAt;

  @override
  int get hashCode =>
      checksum.hashCode +
      id.hashCode +
      mime.hashCode +
      objectKey.hashCode +
      provider.hashCode +
      size.hashCode +
      url.hashCode +
      urlExpiresAt.hashCode;

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
