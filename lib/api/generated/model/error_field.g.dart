// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorField _$ErrorFieldFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ErrorField', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['field', 'message', 'rule']);
      final val = ErrorField(
        field: $checkedConvert('field', (v) => v as String),
        message: $checkedConvert('message', (v) => v as String),
        rule: $checkedConvert('rule', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$ErrorFieldToJson(ErrorField instance) =>
    <String, dynamic>{
      'field': instance.field,
      'message': instance.message,
      'rule': instance.rule,
    };
