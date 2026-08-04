// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_summary_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSummaryPage _$AccountSummaryPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AccountSummaryPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = AccountSummaryPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => AccountSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => PageMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AccountSummaryPageToJson(AccountSummaryPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
