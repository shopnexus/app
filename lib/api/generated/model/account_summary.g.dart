// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSummary _$AccountSummaryFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AccountSummary', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['id', 'name']);
      final val = AccountSummary(
        avatar: $checkedConvert(
          'avatar',
          (v) =>
              v == null ? null : Resource.fromJson(v as Map<String, dynamic>),
        ),
        id: $checkedConvert('id', (v) => v as String),
        name: $checkedConvert('name', (v) => v as String),
      );
      return val;
    });

Map<String, dynamic> _$AccountSummaryToJson(AccountSummary instance) =>
    <String, dynamic>{
      'avatar': ?instance.avatar?.toJson(),
      'id': instance.id,
      'name': instance.name,
    };
