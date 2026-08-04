// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_document_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityDocumentList _$IdentityDocumentListFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('IdentityDocumentList', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = IdentityDocumentList(
    data: $checkedConvert(
      'data',
      (v) => (v as List<dynamic>)
          .map((e) => IdentityDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  );
  return val;
});

Map<String, dynamic> _$IdentityDocumentListToJson(
  IdentityDocumentList instance,
) => <String, dynamic>{'data': instance.data.map((e) => e.toJson()).toList()};
