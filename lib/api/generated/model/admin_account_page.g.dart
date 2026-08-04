// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_account_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminAccountPage _$AdminAccountPageFromJson(Map<String, dynamic> json) =>
    $checkedCreate('AdminAccountPage', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data', 'meta']);
      final val = AdminAccountPage(
        data: $checkedConvert(
          'data',
          (v) => (v as List<dynamic>)
              .map((e) => AdminAccount.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
        meta: $checkedConvert(
          'meta',
          (v) => PageMeta.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$AdminAccountPageToJson(AdminAccountPage instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'meta': instance.meta.toJson(),
    };
