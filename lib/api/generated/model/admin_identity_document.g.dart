// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_identity_document.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminIdentityDocument _$AdminIdentityDocumentFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminIdentityDocument', json, ($checkedConvert) {
  $checkKeys(json, requiredKeys: const ['account', 'document', 'scans']);
  final val = AdminIdentityDocument(
    account: $checkedConvert(
      'account',
      (v) => AccountSummary.fromJson(v as Map<String, dynamic>),
    ),
    document: $checkedConvert(
      'document',
      (v) => IdentityDocument.fromJson(v as Map<String, dynamic>),
    ),
    scans: $checkedConvert(
      'scans',
      (v) => IdentityScans.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminIdentityDocumentToJson(
  AdminIdentityDocument instance,
) => <String, dynamic>{
  'account': instance.account.toJson(),
  'document': instance.document.toJson(),
};
