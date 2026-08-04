//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/update_notification_preferences_request_items_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_notification_preferences_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateNotificationPreferencesRequest {
  /// Returns a new [UpdateNotificationPreferencesRequest] instance.
  UpdateNotificationPreferencesRequest({

    required  this.items,
  });

  @JsonKey(
    
    name: r'items',
    required: true,
    includeIfNull: false,
  )


  final List<UpdateNotificationPreferencesRequestItemsInner> items;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateNotificationPreferencesRequest &&
      other.items == items;

    @override
    int get hashCode =>
        items.hashCode;

  factory UpdateNotificationPreferencesRequest.fromJson(Map<String, dynamic> json) => _$UpdateNotificationPreferencesRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateNotificationPreferencesRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

