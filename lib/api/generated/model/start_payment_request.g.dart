// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'start_payment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StartPaymentRequest _$StartPaymentRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'StartPaymentRequest',
      json,
      ($checkedConvert) {
        $checkKeys(json, requiredKeys: const ['payment_option']);
        final val = StartPaymentRequest(
          amount: $checkedConvert('amount', (v) => (v as num?)?.toInt()),
          paymentOption: $checkedConvert('payment_option', (v) => v as String),
          returnUrl: $checkedConvert('return_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'paymentOption': 'payment_option',
        'returnUrl': 'return_url',
      },
    );

Map<String, dynamic> _$StartPaymentRequestToJson(
  StartPaymentRequest instance,
) => <String, dynamic>{
  if (instance.amount case final value?) 'amount': value,
  'payment_option': instance.paymentOption,
  if (instance.returnUrl case final value?) 'return_url': value,
};
