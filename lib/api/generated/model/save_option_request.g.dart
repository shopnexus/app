// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_option_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaveOptionRequest _$SaveOptionRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('SaveOptionRequest', json, ($checkedConvert) {
      final val = SaveOptionRequest(
        description: $checkedConvert('description', (v) => v as String?),
        isEnabled: $checkedConvert('is_enabled', (v) => v as bool?),
        name: $checkedConvert('name', (v) => v as String?),
        priority: $checkedConvert('priority', (v) => (v as num?)?.toInt()),
        provider: $checkedConvert('provider', (v) => v as String?),
      );
      return val;
    }, fieldKeyMap: const {'isEnabled': 'is_enabled'});

Map<String, dynamic> _$SaveOptionRequestToJson(SaveOptionRequest instance) =>
    <String, dynamic>{
      'description': ?instance.description,
      'is_enabled': ?instance.isEnabled,
      'name': ?instance.name,
      'priority': ?instance.priority,
      'provider': ?instance.provider,
    };
