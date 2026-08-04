// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_document_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityDocumentPage _$IdentityDocumentPageFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('IdentityDocumentPage', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data', 'meta']);
  final val = IdentityDocumentPage(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>)
          .map((e) => AdminIdentityDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
    meta: $checkedConvert(
      'meta',
      (v) => PageMeta.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$IdentityDocumentPageToJson(
  IdentityDocumentPage instance,
) => <String, dynamic>{
  'data': instance.data.map((e) => e.toJson()).toList(),
  'meta': instance.meta.toJson(),
};
