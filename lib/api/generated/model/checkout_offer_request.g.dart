// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_offer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutOfferRequest _$CheckoutOfferRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'CheckoutOfferRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['contact_id', 'transport_option']);
    final val = CheckoutOfferRequest(
      contactId: $checkedConvert('contact_id', (v) => v as String),
      note: $checkedConvert('note', (v) => v as String?),
      transportOption: $checkedConvert('transport_option', (v) => v as String),
    );
    return val;
  },
  fieldKeyMap: const {
    'contactId': 'contact_id',
    'transportOption': 'transport_option',
  },
);

Map<String, dynamic> _$CheckoutOfferRequestToJson(
  CheckoutOfferRequest instance,
) => <String, dynamic>{
  'contact_id': instance.contactId,
  if (instance.note case final value?) 'note': value,
  'transport_option': instance.transportOption,
};
