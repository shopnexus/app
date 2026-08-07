// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_notification_preferences_request_items_inner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateNotificationPreferencesRequestItemsInner
_$UpdateNotificationPreferencesRequestItemsInnerFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('UpdateNotificationPreferencesRequestItemsInner', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['category', 'channel', 'is_enabled']);
  final val = UpdateNotificationPreferencesRequestItemsInner(
    category: $checkedConvert(
      'category',
      (v) => $enumDecode(_$NotificationCategoryEnumMap, v),
    ),
    channel: $checkedConvert(
      'channel',
      (v) => $enumDecode(_$NotificationChannelEnumMap, v),
    ),
    isEnabled: $checkedConvert('is_enabled', (v) => v as bool),
  );
  return val;
}, fieldKeyMap: const {'isEnabled': 'is_enabled'});

Map<String, dynamic> _$UpdateNotificationPreferencesRequestItemsInnerToJson(
  UpdateNotificationPreferencesRequestItemsInner instance,
) => <String, dynamic>{
  'category': _$NotificationCategoryEnumMap[instance.category]!,
  'channel': _$NotificationChannelEnumMap[instance.channel]!,
  'is_enabled': instance.isEnabled,
};

const _$NotificationCategoryEnumMap = {
  NotificationCategory.order: 'order',
  NotificationCategory.promotion: 'promotion',
  NotificationCategory.system: 'system',
  NotificationCategory.chat: 'chat',
  NotificationCategory.social: 'social',
};

const _$NotificationChannelEnumMap = {
  NotificationChannel.inApp: 'in-app',
  NotificationChannel.push: 'push',
  NotificationChannel.email: 'email',
  NotificationChannel.sms: 'sms',
};
