import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_model.freezed.dart';
part 'kyc_model.g.dart';

enum KycStatus {
  @JsonValue('unverified')
  unverified,

  @JsonValue('pending')
  pending,

  @JsonValue('verified')
  verified,

  @JsonValue('rejected')
  rejected,
}

@freezed
abstract class KycModel with _$KycModel {
  const factory KycModel({
    required String id,
    @JsonKey(name: 'account_id') required String accountId,
    @JsonKey(name: 'id_number') required String idNumber,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'issue_date') String? issueDate,
    @JsonKey(name: 'issue_place') String? issuePlace,
    @JsonKey(name: 'front_card_url') String? frontCardUrl,
    @JsonKey(name: 'back_card_url') String? backCardUrl,
    @JsonKey(name: 'selfie_url') String? selfieUrl,
    @Default(KycStatus.unverified) KycStatus status,
    @JsonKey(name: 'rejected_reason') String? rejectedReason,
    @JsonKey(name: 'submitted_at') String? submittedAt,
    @JsonKey(name: 'verified_at') String? verifiedAt,
  }) = _KycModel;

  factory KycModel.fromJson(Map<String, dynamic> json) =>
      _$KycModelFromJson(json);
}

@freezed
abstract class SubmitKycRequest with _$SubmitKycRequest {
  const factory SubmitKycRequest({
    @JsonKey(name: 'id_number') required String idNumber,
    @JsonKey(name: 'full_name') required String fullName,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'issue_date') String? issueDate,
    @JsonKey(name: 'issue_place') String? issuePlace,
    @JsonKey(name: 'front_card_rs_id') String? frontCardRsId,
    @JsonKey(name: 'back_card_rs_id') String? backCardRsId,
    @JsonKey(name: 'selfie_rs_id') String? selfieRsId,
  }) = _SubmitKycRequest;

  factory SubmitKycRequest.fromJson(Map<String, dynamic> json) =>
      _$SubmitKycRequestFromJson(json);
}
