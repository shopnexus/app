// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_sessions_id_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentSessionsIdGet200Response _$PaymentSessionsIdGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('PaymentSessionsIdGet200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = PaymentSessionsIdGet200Response(
    data: $checkedConvert(
      'data',
      (v) => PaymentSession.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$PaymentSessionsIdGet200ResponseToJson(
  PaymentSessionsIdGet200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
