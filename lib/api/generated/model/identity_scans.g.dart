// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_scans.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityScans _$IdentityScansFromJson(Map<String, dynamic> json) =>
    $checkedCreate('IdentityScans', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['back', 'front', 'selfie']);
      final val = IdentityScans(
        back: $checkedConvert(
          'back',
          (v) =>
              v == null ? null : Resource.fromJson(v as Map<String, dynamic>),
        ),
        front: $checkedConvert(
          'front',
          (v) =>
              v == null ? null : Resource.fromJson(v as Map<String, dynamic>),
        ),
        selfie: $checkedConvert(
          'selfie',
          (v) =>
              v == null ? null : Resource.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$IdentityScansToJson(IdentityScans instance) =>
    <String, dynamic>{
      'back': instance.back?.toJson(),
      'front': instance.front?.toJson(),
      'selfie': instance.selfie?.toJson(),
    };
