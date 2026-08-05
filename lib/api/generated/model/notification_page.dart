//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/cursor_meta.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_page.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NotificationPage {
  /// Returns a new [NotificationPage] instance.
  NotificationPage({required this.data, required this.meta});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final List<Notification> data;

  @JsonKey(name: r'meta', required: true, includeIfNull: false)
  final CursorMeta meta;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationPage && other.data == data && other.meta == meta;

  @override
  int get hashCode => data.hashCode + meta.hashCode;

  factory NotificationPage.fromJson(Map<String, dynamic> json) =>
      _$NotificationPageFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationPageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
