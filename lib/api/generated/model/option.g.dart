// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Option _$OptionFromJson(Map<String, dynamic> json) =>
    $checkedCreate('Option', json, ($checkedConvert) {
      $checkKeys(
        json,
        requiredKeys: const [
          'description',
          'id',
          'is_enabled',
          'name',
          'priority',
          'provider',
        ],
      );
      final val = Option(
        description: $checkedConvert('description', (v) => v as String),
        id: $checkedConvert('id', (v) => v as String),
        isEnabled: $checkedConvert('is_enabled', (v) => v as bool?),
        name: $checkedConvert('name', (v) => v as String),
        priority: $checkedConvert('priority', (v) => (v as num?)?.toInt()),
        provider: $checkedConvert('provider', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'isEnabled': 'is_enabled'});

Map<String, dynamic> _$OptionToJson(Option instance) => <String, dynamic>{
  'description': instance.description,
  'id': instance.id,
  'is_enabled': instance.isEnabled,
  'name': instance.name,
  'priority': instance.priority,
  'provider': instance.provider,
};
