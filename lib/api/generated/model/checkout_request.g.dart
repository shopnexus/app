// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutRequest _$CheckoutRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'CheckoutRequest',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          requiredKeys: const [
            'contact_id',
            'currency',
            'lines',
            'transport_option',
          ],
        );
        final val = CheckoutRequest(
          contactId: $checkedConvert('contact_id', (v) => v as String),
          currency: $checkedConvert('currency', (v) => v as String),
          lines: $checkedConvert(
            'lines',
            (v) => (v as List<dynamic>)
                .map((e) => CheckoutLine.fromJson(e as Map<String, dynamic>))
                .toList(),
          ),
          note: $checkedConvert('note', (v) => v as String?),
          transportOption: $checkedConvert(
            'transport_option',
            (v) => v as String,
          ),
        );
        return val;
      },
      fieldKeyMap: const {
        'contactId': 'contact_id',
        'transportOption': 'transport_option',
      },
    );

Map<String, dynamic> _$CheckoutRequestToJson(CheckoutRequest instance) =>
    <String, dynamic>{
      'contact_id': instance.contactId,
      'currency': instance.currency,
      'lines': instance.lines.map((e) => e.toJson()).toList(),
      if (instance.note case final value?) 'note': value,
      'transport_option': instance.transportOption,
    };
