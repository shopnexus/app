// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_identity_documents_id_verdict_post200_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminIdentityDocumentsIdVerdictPost200Response
_$AdminIdentityDocumentsIdVerdictPost200ResponseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('AdminIdentityDocumentsIdVerdictPost200Response', json, (
  $checkedConvert,
) {
  $checkKeys(json, requiredKeys: const ['data']);
  final val = AdminIdentityDocumentsIdVerdictPost200Response(
    data: $checkedConvert(
      'data',
      (v) => IdentityDocument.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$AdminIdentityDocumentsIdVerdictPost200ResponseToJson(
  AdminIdentityDocumentsIdVerdictPost200Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
