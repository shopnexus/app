// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'web_socket_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebSocketTicket _$WebSocketTicketFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WebSocketTicket', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['expires_in', 'ticket']);
      final val = WebSocketTicket(
        expiresIn: $checkedConvert('expires_in', (v) => (v as num).toInt()),
        ticket: $checkedConvert('ticket', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'expiresIn': 'expires_in'});

Map<String, dynamic> _$WebSocketTicketToJson(WebSocketTicket instance) =>
    <String, dynamic>{
      'expires_in': instance.expiresIn,
      'ticket': instance.ticket,
    };
