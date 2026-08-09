//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'identity_scans.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class IdentityScans {
  /// Returns a new [IdentityScans] instance.
  IdentityScans({
    required this.back,

    required this.front,

    required this.selfie,
  });

  /// Null where the document has no back, such as a passport.
  @JsonKey(name: r'back', required: true, includeIfNull: true)
  final Resource? back;

  @JsonKey(name: r'front', required: true, includeIfNull: true)
  final Resource? front;

  @JsonKey(name: r'selfie', required: true, includeIfNull: true)
  final Resource? selfie;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdentityScans &&
          other.back == back &&
          other.front == front &&
          other.selfie == selfie;

  @override
  int get hashCode =>
      (back == null ? 0 : back.hashCode) +
      (front == null ? 0 : front.hashCode) +
      (selfie == null ? 0 : selfie.hashCode);

  factory IdentityScans.fromJson(Map<String, dynamic> json) =>
      _$IdentityScansFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityScansToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
