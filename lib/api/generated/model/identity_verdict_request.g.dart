// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identity_verdict_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentityVerdictRequest _$IdentityVerdictRequestFromJson(
  Map<String, dynamic> json,
) => $checkedCreate(
  'IdentityVerdictRequest',
  json,
  ($checkedConvert) {
    $checkKeys(json, requiredKeys: const ['status']);
    final val = IdentityVerdictRequest(
      expiresAt: $checkedConvert(
        'expires_at',
        (v) => v == null ? null : DateTime.parse(v as String),
      ),
      rejectionReason: $checkedConvert('rejection_reason', (v) => v as String?),
      status: $checkedConvert(
        'status',
        (v) => $enumDecode(_$IdentityVerdictRequestStatusEnumEnumMap, v),
      ),
    );
    return val;
  },
  fieldKeyMap: const {
    'expiresAt': 'expires_at',
    'rejectionReason': 'rejection_reason',
  },
);

Map<String, dynamic> _$IdentityVerdictRequestToJson(
  IdentityVerdictRequest instance,
) => <String, dynamic>{
  'expires_at': ?instance.expiresAt?.toIso8601String(),
  'rejection_reason': ?instance.rejectionReason,
  'status': _$IdentityVerdictRequestStatusEnumEnumMap[instance.status]!,
};

const _$IdentityVerdictRequestStatusEnumEnumMap = {
  IdentityVerdictRequestStatusEnum.verified: 'verified',
  IdentityVerdictRequestStatusEnum.rejected: 'rejected',
};
