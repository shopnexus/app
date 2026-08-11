// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'refund_verdict_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefundVerdictRequest _$RefundVerdictRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('RefundVerdictRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['buyer_wins']);
  final val = RefundVerdictRequest(
    buyerWins: $checkedConvert('buyer_wins', (v) => v as bool),
    note: $checkedConvert('note', (v) => v as String?),
  );
  return val;
}, fieldKeyMap: const {'buyerWins': 'buyer_wins'});

Map<String, dynamic> _$RefundVerdictRequestToJson(
  RefundVerdictRequest instance,
) => <String, dynamic>{
  'buyer_wins': instance.buyerWins,
  'note': ?instance.note,
};
