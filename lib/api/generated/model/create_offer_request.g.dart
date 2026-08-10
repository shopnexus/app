// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_offer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateOfferRequest _$CreateOfferRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('CreateOfferRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['quantity', 'total', 'variant_id']);
      final val = CreateOfferRequest(
        quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
        reason: $checkedConvert('reason', (v) => v as String?),
        total: $checkedConvert('total', (v) => (v as num).toInt()),
        variantId: $checkedConvert('variant_id', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'variantId': 'variant_id'});

Map<String, dynamic> _$CreateOfferRequestToJson(CreateOfferRequest instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      if (instance.reason case final value?) 'reason': value,
      'total': instance.total,
      'variant_id': instance.variantId,
    };
