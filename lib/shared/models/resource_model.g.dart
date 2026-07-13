// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResourceModel _$ResourceModelFromJson(Map<String, dynamic> json) =>
    _ResourceModel(
      id: json['id'] as String,
      url: json['url'] as String,
      type: json['type'] as String? ?? 'Image',
      description: json['description'] as String?,
    );

Map<String, dynamic> _$ResourceModelToJson(_ResourceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'type': instance.type,
      'description': instance.description,
    };
