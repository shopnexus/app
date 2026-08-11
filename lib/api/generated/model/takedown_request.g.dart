// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'takedown_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TakedownRequest _$TakedownRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('TakedownRequest', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['reason']);
      final val = TakedownRequest(
        notifySeller: $checkedConvert(
          'notify_seller',
          (v) => v as bool? ?? true,
        ),
        reason: $checkedConvert('reason', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'notifySeller': 'notify_seller'});

Map<String, dynamic> _$TakedownRequestToJson(TakedownRequest instance) =>
    <String, dynamic>{
      'notify_seller': ?instance.notifySeller,
      'reason': instance.reason,
    };
