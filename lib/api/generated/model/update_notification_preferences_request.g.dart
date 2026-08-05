// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_notification_preferences_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateNotificationPreferencesRequest
_$UpdateNotificationPreferencesRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateNotificationPreferencesRequest', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['items']);
      final val = UpdateNotificationPreferencesRequest(
        items: $checkedConvert(
          'items',
          (v) => (v as List<dynamic>)
              .map(
                (e) => UpdateNotificationPreferencesRequestItemsInner.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList(),
        ),
      );
      return val;
    });

Map<String, dynamic> _$UpdateNotificationPreferencesRequestToJson(
  UpdateNotificationPreferencesRequest instance,
) => <String, dynamic>{'items': instance.items.map((e) => e.toJson()).toList()};
