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
  if (instance.contactId case final value?) 'contact_id': value,
  if (instance.draftId case final value?) 'draft_id': value,
  if (instance.lines?.map((e) => e.toJson()).toList() case final value?)
    'lines': value,
  if (instance.offerId case final value?) 'offer_id': value,
  if (instance.quantity case final value?) 'quantity': value,
  if (instance.variantId case final value?) 'variant_id': value,
};
