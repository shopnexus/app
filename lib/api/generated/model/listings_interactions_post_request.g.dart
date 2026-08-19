// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_interactions_post_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsInteractionsPostRequest _$ListingsInteractionsPostRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListingsInteractionsPostRequest', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['interactions']);
  final val = ListingsInteractionsPostRequest(
    interactions: $checkedConvert(
      'interactions',
      (v) => (v as List<dynamic>)
          .map(
            (e) => ListingsInteractionsPostRequestInteractionsInner.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListingsInteractionsPostRequestToJson(
  ListingsInteractionsPostRequest instance,
) => <String, dynamic>{
  'interactions': instance.interactions.map((e) => e.toJson()).toList(),
};
