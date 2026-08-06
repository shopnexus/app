//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'option.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Option {
  /// Returns a new [Option] instance.
  Option({
    required this.description,

    required this.id,

    required this.isEnabled,

    required this.name,

    required this.priority,

    required this.provider,
  });

  /// A line of explanation. May be empty.
  @JsonKey(name: r'description', required: true, includeIfNull: false)
  final String description;

  /// What to send as `payment_option` or `transport_option`. Permanent — a settled payment and a shipped parcel hold it.
  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// Staff only. A row switched off is not offered, but stays resolvable for the records naming it.
  @JsonKey(name: r'is_enabled', required: true, includeIfNull: true)
  final bool? isEnabled;

  /// What to show the chooser.
  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  /// Staff only. Display order, highest first.
  // minimum: 0
  // maximum: 1000
  @JsonKey(name: r'priority', required: true, includeIfNull: true)
  final int? priority;

  /// Staff only. The implementation serving this row — what an admin changes to move it to another vendor.
  @JsonKey(name: r'provider', required: true, includeIfNull: false)
  final String provider;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Option &&
          other.description == description &&
          other.id == id &&
          other.isEnabled == isEnabled &&
          other.name == name &&
          other.priority == priority &&
          other.provider == provider;

  @override
  int get hashCode =>
      description.hashCode +
      id.hashCode +
      (isEnabled == null ? 0 : isEnabled.hashCode) +
      name.hashCode +
      (priority == null ? 0 : priority.hashCode) +
      provider.hashCode;

  factory Option.fromJson(Map<String, dynamic> json) => _$OptionFromJson(json);

  Map<String, dynamic> toJson() => _$OptionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
