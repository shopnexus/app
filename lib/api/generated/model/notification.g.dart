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
          requiredKeys: const [
            'body',
            'category',
            'created_at',
            'href',
            'id',
            'kind',
            'read_at',
            'title',
          ],
        );
        final val = Notification(
          body: $checkedConvert('body', (v) => v as String),
          category: $checkedConvert(
            'category',
            (v) => $enumDecode(_$NotificationCategoryEnumMap, v),
          ),
          createdAt: $checkedConvert(
            'created_at',
            (v) => DateTime.parse(v as String),
          ),
          href: $checkedConvert('href', (v) => v as String),
          id: $checkedConvert('id', (v) => v as String),
          kind: $checkedConvert('kind', (v) => v as String),
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
      'body': instance.body,
      'category': _$NotificationCategoryEnumMap[instance.category]!,
      'created_at': instance.createdAt.toIso8601String(),
      'href': instance.href,
      'id': instance.id,
      'kind': instance.kind,
      'read_at': instance.readAt?.toIso8601String(),
      'title': instance.title,
    };

const _$NotificationCategoryEnumMap = {
  NotificationCategory.order: 'order',
  NotificationCategory.promotion: 'promotion',
  NotificationCategory.system: 'system',
  NotificationCategory.chat: 'chat',
  NotificationCategory.social: 'social',
};
