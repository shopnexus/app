// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_edit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PendingEdit _$PendingEditFromJson(Map<String, dynamic> json) => $checkedCreate(
  'PendingEdit',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'attachments',
        'category_id',
        'condition',
        'description',
        'name',
        'price_mode',
        'specifications',
        'tags',
      ],
    );
    final val = PendingEdit(
      attachments: $checkedConvert(
        'attachments',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
      categoryId: $checkedConvert('category_id', (v) => v as String?),
      condition: $checkedConvert(
        'condition',
        (v) => $enumDecodeNullable(_$ListingConditionEnumMap, v),
      ),
      description: $checkedConvert('description', (v) => v as String?),
      name: $checkedConvert('name', (v) => v as String?),
      priceMode: $checkedConvert(
        'price_mode',
        (v) => $enumDecodeNullable(_$PriceModeEnumMap, v),
      ),
      specifications: $checkedConvert(
        'specifications',
        (v) =>
            (v as Map<String, dynamic>).map((k, e) => MapEntry(k, e as Object)),
      ),
      tags: $checkedConvert(
        'tags',
        (v) => (v as List<dynamic>).map((e) => e as String).toList(),
      ),
    );
    return val;
  },
  fieldKeyMap: const {'categoryId': 'category_id', 'priceMode': 'price_mode'},
);

Map<String, dynamic> _$PendingEditToJson(PendingEdit instance) =>
    <String, dynamic>{
      'attachments': instance.attachments,
      'category_id': instance.categoryId,
      'condition': _$ListingConditionEnumMap[instance.condition],
      'description': instance.description,
      'name': instance.name,
      'price_mode': _$PriceModeEnumMap[instance.priceMode],
      'specifications': instance.specifications,
      'tags': instance.tags,
    };

const _$ListingConditionEnumMap = {
  ListingCondition.new_: 'new',
  ListingCondition.used: 'used',
  ListingCondition.damaged: 'damaged',
};

const _$PriceModeEnumMap = {
  PriceMode.fixed: 'fixed',
  PriceMode.negotiable: 'negotiable',
};
