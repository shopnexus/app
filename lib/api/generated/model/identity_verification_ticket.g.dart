// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_verification_ticket.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityVerificationTicket _$IdentityVerificationTicketFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'IdentityVerificationTicket',
  json,
  ($checkedConvert) {
    $checkKeys(
      json,
      requiredKeys: const [
        'document',
        'vendor_session_expires_at',
        'vendor_session_url',
      ],
    );
    final val = IdentityVerificationTicket(
      document: $checkedConvert(
        'document',
        (v) => IdentityDocument.fromJson(v as Map<String, dynamic>),
      ),
      vendorSessionExpiresAt: $checkedConvert(
        'vendor_session_expires_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      vendorSessionUrl: $checkedConvert(
        'vendor_session_url',
        (v) => v as String?,
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'vendorSessionExpiresAt': 'vendor_session_expires_at',
    'vendorSessionUrl': 'vendor_session_url',
  },
);

Map<String, dynamic> _$IdentityVerificationTicketToJson(
  IdentityVerificationTicket instance,
) => <String, dynamic>{
  'document': instance.document.toJson(),
  'vendor_session_expires_at': instance.vendorSessionExpiresAt
      ?.toIso8601String(),
  'vendor_session_url': instance.vendorSessionUrl,
};
