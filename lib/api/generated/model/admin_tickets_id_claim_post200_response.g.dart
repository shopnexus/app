// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_tickets_id_claim_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminTicketsIdClaimPost200Response _$AdminTicketsIdClaimPost200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminTicketsIdClaimPost200Response', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AdminTicketsIdClaimPost200Response(
    data: $checkedConvert(
      'data',
      (v) => Ticket.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminTicketsIdClaimPost200ResponseToJson(
  AdminTicketsIdClaimPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
