// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Notification _$NotificationFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'Notification',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const ['category', 'created_at', 'payload', 'title'],
        );
        final val = Notification(
          category: $checkedConvert(
            'category',
            (v) => $enumDecode(_$NotificationCategoryEnumMap, v),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          payload: $checkedConvert(
            'payload',
            (v) => (v as Map<String, dynamic>).map(
              (k, e) => MapEntry(k, e as Object),
            ),
          ),
          readAt: $checkedConvert(
            'read_at',
            (v) => v == null ? null : DateTime.parse(v as String),
          ),
          title: $checkedConvert('title', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'createdAt': 'created_at', 'readAt': 'read_at'},
    );

Map<String, dynamic> _$NotificationToJson(Notification instance) =>
    <String, dynamic>{
      'category': _$NotificationCategoryEnumMap[instance.category]!,
      'created_at': instance.createdAt.toIso8601String(),
      'payload': instance.payload,
      'read_at': ?instance.readAt?.toIso8601String(),
      'title': instance.title,
    };

const _$NotificationCategoryEnumMap = {
  NotificationCategory.order: 'order',
  NotificationCategory.promotion: 'promotion',
  NotificationCategory.system: 'system',
  NotificationCategory.chat: 'chat',
  NotificationCategory.social: 'social',
};
