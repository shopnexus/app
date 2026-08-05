// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_preference_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationPreferenceList _$NotificationPreferenceListFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('NotificationPreferenceList', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = NotificationPreferenceList(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>)
          .map(
            (e) => NotificationPreference.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$NotificationPreferenceListToJson(
  NotificationPreferenceList instance,
) => <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
