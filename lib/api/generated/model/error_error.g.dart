// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ErrorError _$ErrorErrorFromJson(Map<String, dynamic> json) =>
    $checkedCreate('ErrorError', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['code', 'message', 'request_id']);
      final val = ErrorError(
        code: $checkedConvert('code', (v) => v as String),
        fields: $checkedConvert(
          'fields',
          (v) => (v as List<dynamic>?)
              ?.map((e) => ErrorField.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        message: $checkedConvert('message', (v) => v as String),
        requestId: $checkedConvert('request_id', (v) => v as String),
      );
      return val;
    }, fieldKeyMap: const {'requestId': 'request_id'});

Map<String, dynamic> _$ErrorErrorToJson(ErrorError instance) =>
    <String, dynamic>{
      'code': instance.code,
      'fields': ?instance.fields?.map((e) => e.toJson()).toList(),
      'message': instance.message,
      'request_id': instance.requestId,
    };
