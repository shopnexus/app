// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_sessions_id_payments_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentSessionsIdPaymentsPost201Response
_$PaymentSessionsIdPaymentsPost201ResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PaymentSessionsIdPaymentsPost201Response', json, (
      $checkedConvert,
    ) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = PaymentSessionsIdPaymentsPost201Response(
        data: $checkedConvert(
          'data',
          (v) => Transaction.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$PaymentSessionsIdPaymentsPost201ResponseToJson(
  PaymentSessionsIdPaymentsPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
