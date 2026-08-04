// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_suggestions_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsSuggestionsPost200Response _$ListingsSuggestionsPost200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListingsSuggestionsPost200Response', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = ListingsSuggestionsPost200Response(
    data: $checkedConvert(
      'data',
      (v) => ListingSuggestion.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListingsSuggestionsPost200ResponseToJson(
  ListingsSuggestionsPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
