// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'decline_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeclineOrderRequest _$DeclineOrderRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('DeclineOrderRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['reason']);
      final val = DeclineOrderRequest(
        reason: $checkedConvert('reason', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$DeclineOrderRequestToJson(
  DeclineOrderRequest instance,
) => <String, dynamic>{'reason': instance.reason};
