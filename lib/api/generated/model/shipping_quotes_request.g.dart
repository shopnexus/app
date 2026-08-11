// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_quotes_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingQuotesRequest _$ShippingQuotesRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'ShippingQuotesRequest',
  json,
  ($checkedConvert) {
    final val = ShippingQuotesRequest(
      contactId: $checkedConvert('contact_id', (v) => v as String?),
      draftId: $checkedConvert('draft_id', (v) => v as String?),
      lines: $checkedConvert(
        'lines',
        (v) => (v as List<dynamic>?)
            ?.map((e) => CheckoutLine.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
      offerId: $checkedConvert('offer_id', (v) => v as String?),
      quantity: $checkedConvert('quantity', (v) => (v as num?)?.toInt()),
      variantId: $checkedConvert('variant_id', (v) => v as String?),
    );
    return val;
  },
  fieldKeyMap: const {
    'contactId': 'contact_id',
    'draftId': 'draft_id',
    'offerId': 'offer_id',
    'variantId': 'variant_id',
  },
);

Map<String, dynamic> _$ShippingQuotesRequestToJson(
  ShippingQuotesRequest instance,
) => <String, dynamic>{
  'contact_id': ?instance.contactId,
  'draft_id': ?instance.draftId,
  'lines': ?instance.lines?.map((e) => e.toJson()).toList(),
  'offer_id': ?instance.offerId,
  'quantity': ?instance.quantity,
  'variant_id': ?instance.variantId,
};
