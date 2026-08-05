// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'withdrawal_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WithdrawalPage _$WithdrawalPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('WithdrawalPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = WithdrawalPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => Withdrawal.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => PageMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$WithdrawalPageToJson(WithdrawalPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
