//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/unread_count.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notifications_read_post200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NotificationsReadPost200Response {
  /// Returns a new [NotificationsReadPost200Response] instance.
  NotificationsReadPost200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final UnreadCount data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NotificationsReadPost200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory NotificationsReadPost200Response.fromJson(
    Map<String, dynamic> json,
  ) => _$NotificationsReadPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$NotificationsReadPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
