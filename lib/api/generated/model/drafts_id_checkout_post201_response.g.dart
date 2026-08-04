// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drafts_id_checkout_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DraftsIdCheckoutPost201Response _$DraftsIdCheckoutPost201ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('DraftsIdCheckoutPost201Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = DraftsIdCheckoutPost201Response(
    data: $checkedConvert(
      'data',
      (v) => CheckoutResult.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$DraftsIdCheckoutPost201ResponseToJson(
  DraftsIdCheckoutPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
