// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unread_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UnreadCount _$UnreadCountFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UnreadCount', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['by_category', 'unread']);
      final val = UnreadCount(
        byCategory: $checkedConvert(
          'by_category',
          (v) => Map<String, int>.from(v as Map),
        ),
        unread: $checkedConvert('unread', (v) => (v as num).toInt()),
      );
      return val;
    }, fieldKeyMap: const {'byCategory': 'by_category'});

Map<String, dynamic> _$UnreadCountToJson(UnreadCount instance) =>
    <String, dynamic>{
      'by_category': instance.byCategory,
      'unread': instance.unread,
    };
