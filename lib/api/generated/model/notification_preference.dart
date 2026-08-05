//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/notification_category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification_channel.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_preference.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NotificationPreference {
  /// Returns a new [NotificationPreference] instance.
  NotificationPreference({
    required this.category,

    required this.channel,

    required this.isDefault,

    required this.isEnabled,
  });

  @JsonKey(name: r'category', required: true, includeIfNull: false)
  final NotificationCategory category;

  @JsonKey(name: r'channel', required: true, includeIfNull: false)
  final NotificationChannel channel;

  /// True when no stored row exists and this is the domain default. Shown so a client can tell an explicit choice from an inherited one.
  @JsonKey(name: r'is_default', required: true, includeIfNull: false)
  final bool isDefault;

  @JsonKey(name: r'is_enabled', required: true, includeIfNull: false)
  final bool isEnabled;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationPreference &&
          other.category == category &&
          other.channel == channel &&
          other.isDefault == isDefault &&
          other.isEnabled == isEnabled;

  @override
  int get hashCode =>
      category.hashCode +
      channel.hashCode +
      isDefault.hashCode +
      isEnabled.hashCode;

  factory NotificationPreference.fromJson(Map<String, dynamic> json) =>
      _$NotificationPreferenceFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationPreferenceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
