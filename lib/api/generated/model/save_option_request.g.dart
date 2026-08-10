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
      if (instance.description case final value?) 'description': value,
      if (instance.isEnabled case final value?) 'is_enabled': value,
      if (instance.name case final value?) 'name': value,
      if (instance.priority case final value?) 'priority': value,
      if (instance.provider case final value?) 'provider': value,
    };
