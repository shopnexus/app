//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/notification_preference.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_preference_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class NotificationPreferenceList {
  /// Returns a new [NotificationPreferenceList] instance.
  NotificationPreferenceList({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<NotificationPreference> data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is NotificationPreferenceList &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory NotificationPreferenceList.fromJson(Map<String, dynamic> json) => _$NotificationPreferenceListFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationPreferenceListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

