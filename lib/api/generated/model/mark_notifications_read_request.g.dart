// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mark_notifications_read_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarkNotificationsReadRequest _$MarkNotificationsReadRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('MarkNotificationsReadRequest', json, ($checkedConvert) {
  final val = MarkNotificationsReadRequest(
    before: $checkedConvert(
      'before',
      (v) => v == null ? null : DateTime.parse(v as String),
    ),
  );
  return val;
});

Map<String, dynamic> _$MarkNotificationsReadRequestToJson(
  MarkNotificationsReadRequest instance,
) => <String, dynamic>{'before': ?instance.before?.toIso8601String()};
