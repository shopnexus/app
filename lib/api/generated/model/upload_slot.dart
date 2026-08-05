//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_slot.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UploadSlot {
  /// Returns a new [UploadSlot] instance.
  UploadSlot({
    required this.expiresAt,

    this.headers,

    required this.resourceId,

    required this.url,
  });

  @JsonKey(name: r'expires_at', required: true, includeIfNull: false)
  final DateTime expiresAt;

  /// Send these with the PUT verbatim, when the signature covers any.
  @JsonKey(name: r'headers', required: false, includeIfNull: false)
  final Map<String, String>? headers;

  @JsonKey(name: r'resource_id', required: true, includeIfNull: false)
  final String resourceId;

  /// PUT the bytes here. Short-lived, and signed for this key and method only.
  @JsonKey(name: r'url', required: true, includeIfNull: false)
  final String url;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UploadSlot &&
          other.expiresAt == expiresAt &&
          other.headers == headers &&
          other.resourceId == resourceId &&
          other.url == url;

  @override
  int get hashCode =>
      expiresAt.hashCode +
      headers.hashCode +
      resourceId.hashCode +
      url.hashCode;

  factory UploadSlot.fromJson(Map<String, dynamic> json) =>
      _$UploadSlotFromJson(json);

  Map<String, dynamic> toJson() => _$UploadSlotToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
