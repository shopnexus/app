// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'put_tag_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PutTagRequest _$PutTagRequestFromJson(Map<String, dynamic> json) =>
    $checkedCreate('PutTagRequest', json, ($checkedConvert) {
      final val = PutTagRequest(
        description: $checkedConvert('description', (v) => v as String?),
      );
      return val;
    });

Map<String, dynamic> _$PutTagRequestToJson(PutTagRequest instance) =>
    <String, dynamic>{
      if (instance.description case final value?) 'description': value,
    };
