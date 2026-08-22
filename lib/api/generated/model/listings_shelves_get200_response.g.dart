// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_shelves_get200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsShelvesGet200Response _$ListingsShelvesGet200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('ListingsShelvesGet200Response', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = ListingsShelvesGet200Response(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>)
          .map((e) => Shelf.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$ListingsShelvesGet200ResponseToJson(
  ListingsShelvesGet200Response instance,
) => <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
