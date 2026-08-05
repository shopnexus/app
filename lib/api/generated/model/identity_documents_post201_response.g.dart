// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_documents_post201_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityDocumentsPost201Response _$IdentityDocumentsPost201ResponseFromJson(
  Map<String, dynamic> json,
) =>
    $checkedCreate('IdentityDocumentsPost201Response', json, ($checkedConvert) {
      $checkKeys(json, requiredKeys: const ['data']);
      final val = IdentityDocumentsPost201Response(
        data: $checkedConvert(
          'data',
          (v) => IdentityVerificationTicket.fromJson(v as Map<String, dynamic>),
        ),
      );
      return val;
    });

Map<String, dynamic> _$IdentityDocumentsPost201ResponseToJson(
  IdentityDocumentsPost201Response instance,
) => <String, dynamic>{'data': instance.data.toJson()};
