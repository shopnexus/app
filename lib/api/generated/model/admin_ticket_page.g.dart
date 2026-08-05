// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_ticket_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminTicketPage _$AdminTicketPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminTicketPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = AdminTicketPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => AdminTicket.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => CursorMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdminTicketPageToJson(AdminTicketPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
