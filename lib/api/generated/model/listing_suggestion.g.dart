// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_suggestion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingSuggestion _$ListingSuggestionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ListingSuggestion', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'category_id',
          'condition',
          'description',
          'name',
          'price',
          'specifications',
          'tags',
          'transcript',
          'weight_g',
        ],
      );
      final val = ListingSuggestion(
        categoryId: $checkedConvert('category_id', (v) => v as String?),
        condition: $checkedConvert(
          'condition',
          (v) => $enumDecode(_$ListingSuggestionConditionEnumEnumMap, v),
        ),
        description: $checkedConvert('description', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
        price: $checkedConvert('price', (v) => (v as num?)?.toInt()),
        specifications: $checkedConvert(
          'specifications',
          (v) => (v as Map<String, dynamic>).map(
            (k, e) => MapEntry(k, e as Object),
          ),
        ),
        tags: $checkedConvert(
          'tags',
          (v) => (v as List<dynamic>).map((e) => e as String).toList(),
        ),
        transcript: $checkedConvert('transcript', (v) => v as String),
        weightG: $checkedConvert('weight_g', (v) => (v as num?)?.toInt()),
      );
      return val;
    }, fieldKeyMap: const {'categoryId': 'category_id', 'weightG': 'weight_g'});

Map<String, dynamic> _$ListingSuggestionToJson(ListingSuggestion instance) =>
    <String, dynamic>{
      'category_id': instance.categoryId,
      'condition': _$ListingSuggestionConditionEnumEnumMap[instance.condition]!,
      'description': instance.description,
      'name': instance.name,
      'price': instance.price,
      'specifications': instance.specifications,
      'tags': instance.tags,
      'transcript': instance.transcript,
      'weight_g': instance.weightG,
    };

const _$ListingSuggestionConditionEnumEnumMap = {
  ListingSuggestionConditionEnum.new_: 'new',
  ListingSuggestionConditionEnum.used: 'used',
  ListingSuggestionConditionEnum.damaged: 'damaged',
  ListingSuggestionConditionEnum.empty: '',
};
