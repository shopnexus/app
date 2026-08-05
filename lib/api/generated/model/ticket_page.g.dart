// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TicketPage _$TicketPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TicketPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = TicketPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Ticket.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => CursorMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$TicketPageToJson(TicketPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
