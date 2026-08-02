// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kyc_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KycModel _$KycModelFromJson(Map<String, dynamic> json) => _KycModel(
  id: json['id'] as String,
  accountId: json['account_id'] as String,
  idNumber: json['id_number'] as String,
  fullName: json['full_name'] as String,
  dateOfBirth: json['date_of_birth'] as String?,
  issueDate: json['issue_date'] as String?,
  issuePlace: json['issue_place'] as String?,
  frontCardUrl: json['front_card_url'] as String?,
  backCardUrl: json['back_card_url'] as String?,
  selfieUrl: json['selfie_url'] as String?,
  status:
      $enumDecodeNullable(_$KycStatusEnumMap, json['status']) ??
      KycStatus.unverified,
  rejectedReason: json['rejected_reason'] as String?,
  submittedAt: json['submitted_at'] as String?,
  verifiedAt: json['verified_at'] as String?,
);

Map<String, dynamic> _$KycModelToJson(_KycModel instance) => <String, dynamic>{
  'id': instance.id,
  'account_id': instance.accountId,
  'id_number': instance.idNumber,
  'full_name': instance.fullName,
  'date_of_birth': instance.dateOfBirth,
  'issue_date': instance.issueDate,
  'issue_place': instance.issuePlace,
  'front_card_url': instance.frontCardUrl,
  'back_card_url': instance.backCardUrl,
  'selfie_url': instance.selfieUrl,
  'status': _$KycStatusEnumMap[instance.status]!,
  'rejected_reason': instance.rejectedReason,
  'submitted_at': instance.submittedAt,
  'verified_at': instance.verifiedAt,
};

const _$KycStatusEnumMap = {
  KycStatus.unverified: 'unverified',
  KycStatus.pending: 'pending',
  KycStatus.verified: 'verified',
  KycStatus.rejected: 'rejected',
};

_SubmitKycRequest _$SubmitKycRequestFromJson(Map<String, dynamic> json) =>
    _SubmitKycRequest(
      idNumber: json['id_number'] as String,
      fullName: json['full_name'] as String,
      dateOfBirth: json['date_of_birth'] as String?,
      issueDate: json['issue_date'] as String?,
      issuePlace: json['issue_place'] as String?,
      frontCardRsId: json['front_card_rs_id'] as String?,
      backCardRsId: json['back_card_rs_id'] as String?,
      selfieRsId: json['selfie_rs_id'] as String?,
    );

Map<String, dynamic> _$SubmitKycRequestToJson(_SubmitKycRequest instance) =>
    <String, dynamic>{
      'id_number': instance.idNumber,
      'full_name': instance.fullName,
      'date_of_birth': instance.dateOfBirth,
      'issue_date': instance.issueDate,
      'issue_place': instance.issuePlace,
      'front_card_rs_id': instance.frontCardRsId,
      'back_card_rs_id': instance.backCardRsId,
      'selfie_rs_id': instance.selfieRsId,
    };
