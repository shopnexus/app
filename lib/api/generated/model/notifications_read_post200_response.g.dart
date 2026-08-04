// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications_read_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationsReadPost200Response _$NotificationsReadPost200ResponseFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('NotificationsReadPost200Response', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = NotificationsReadPost200Response(
        data: $checkedConvert(
          'data',
          (v) => UnreadCount.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$NotificationsReadPost200ResponseToJson(
  NotificationsReadPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
