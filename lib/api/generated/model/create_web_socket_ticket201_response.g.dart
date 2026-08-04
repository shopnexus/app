// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_web_socket_ticket201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateWebSocketTicket201Response _$CreateWebSocketTicket201ResponseFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('CreateWebSocketTicket201Response', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = CreateWebSocketTicket201Response(
        data: $checkedConvert(
          'data',
          (v) => WebSocketTicket.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$CreateWebSocketTicket201ResponseToJson(
  CreateWebSocketTicket201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
