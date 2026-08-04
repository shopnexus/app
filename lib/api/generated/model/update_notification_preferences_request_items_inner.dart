//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/notification_category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/notification_channel.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_notification_preferences_request_items_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateNotificationPreferencesRequestItemsInner {
  /// Returns a new [UpdateNotificationPreferencesRequestItemsInner] instance.
  UpdateNotificationPreferencesRequestItemsInner({

    required  this.category,

    required  this.channel,

    required  this.isEnabled,
  });

  @JsonKey(
    
    name: r'category',
    required: true,
    includeIfNull: false,
  )


  final NotificationCategory category;



  @JsonKey(
    
    name: r'channel',
    required: true,
    includeIfNull: false,
  )


  final NotificationChannel channel;



  @JsonKey(
    
    name: r'is_enabled',
    required: true,
    includeIfNull: false,
  )


  final bool isEnabled;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateNotificationPreferencesRequestItemsInner &&
      other.category == category &&
      other.channel == channel &&
      other.isEnabled == isEnabled;

    @override
    int get hashCode =>
        category.hashCode +
        channel.hashCode +
        isEnabled.hashCode;

  factory UpdateNotificationPreferencesRequestItemsInner.fromJson(Map<String, dynamic> json) => _$UpdateNotificationPreferencesRequestItemsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateNotificationPreferencesRequestItemsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

