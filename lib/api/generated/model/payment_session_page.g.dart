// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_session_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentSessionPage _$PaymentSessionPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PaymentSessionPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = PaymentSessionPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => PaymentSession.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => PageMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PaymentSessionPageToJson(PaymentSessionPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
