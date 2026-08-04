// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_tickets_id_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminTicketsIdGet200Response _$AdminTicketsIdGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminTicketsIdGet200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AdminTicketsIdGet200Response(
    data: $checkedConvert(
      'data',
      (v) => AdminTicket.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminTicketsIdGet200ResponseToJson(
  AdminTicketsIdGet200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
