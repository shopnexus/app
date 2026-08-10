// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_offer_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateOfferRequest _$UpdateOfferRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('UpdateOfferRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['quantity', 'total']);
      final val = UpdateOfferRequest(
        quantity: $checkedConvert('quantity', (v) => (v as num).toInt()),
        reason: $checkedConvert('reason', (v) => v as String?),
        total: $checkedConvert('total', (v) => (v as num).toInt()),
      );
      return val;
    });

Map<String, dynamic> _$UpdateOfferRequestToJson(UpdateOfferRequest instance) =>
    <String, dynamic>{
      'quantity': instance.quantity,
      if (instance.reason case final value?) 'reason': value,
      'total': instance.total,
    };
