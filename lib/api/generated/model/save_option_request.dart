//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'save_option_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SaveOptionRequest {
  /// Returns a new [SaveOptionRequest] instance.
  SaveOptionRequest({
    this.description,

    this.isEnabled,

    this.name,

    this.priority,

    this.provider,
  });

  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  /// Take it out of the chooser's list without deleting the row.
  @JsonKey(name: r'is_enabled', required: false, includeIfNull: false)
  final bool? isEnabled;

  @JsonKey(name: r'name', required: false, includeIfNull: false)
  final String? name;

  // minimum: 0
  // maximum: 1000
  @JsonKey(name: r'priority', required: false, includeIfNull: false)
  final int? priority;

  /// One of `providers` from `/admin/options`. Unknown here is 422.
  @JsonKey(name: r'provider', required: false, includeIfNull: false)
  final String? provider;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaveOptionRequest &&
          other.description == description &&
          other.isEnabled == isEnabled &&
          other.name == name &&
          other.priority == priority &&
          other.provider == provider;

  @override
  int get hashCode =>
      description.hashCode +
      isEnabled.hashCode +
      name.hashCode +
      priority.hashCode +
      provider.hashCode;

  factory SaveOptionRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveOptionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SaveOptionRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
