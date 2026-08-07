// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationPreference _$NotificationPreferenceFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'NotificationPreference',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const ['category', 'channel', 'is_default', 'is_enabled'],
    );
    final val = NotificationPreference(
      category: $checkedConvert(
        'category',
        (v) => $enumDecode(_$NotificationCategoryEnumMap, v),
      ),
      channel: $checkedConvert(
        'channel',
        (v) => $enumDecode(_$NotificationChannelEnumMap, v),
      ),
      isDefault: $checkedConvert('is_default', (v) => v as bool),
      isEnabled: $checkedConvert('is_enabled', (v) => v as bool),
    );
    return val;
  },
  fieldKeyMap: const {'isDefault': 'is_default', 'isEnabled': 'is_enabled'},
);

Map<String, dynamic> _$NotificationPreferenceToJson(
  NotificationPreference instance,
) => <String, dynamic>{
  'category': _$NotificationCategoryEnumMap[instance.category]!,
  'channel': _$NotificationChannelEnumMap[instance.channel]!,
  'is_default': instance.isDefault,
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
