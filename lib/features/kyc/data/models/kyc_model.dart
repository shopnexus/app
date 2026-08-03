import 'package:freezed_annotation/freezed_annotation.dart';

part 'kyc_model.freezed.dart';
part 'kyc_model.g.dart';

enum IdentityDocType {
  @JsonValue('national-id')
  nationalId,
  @JsonValue('passport')
  passport,
  @JsonValue('driver-license')
  driverLicense,
}

enum IdentityStatus {
  @JsonValue('unverified')
  unverified,
  @JsonValue('pending')
  pending,
  @JsonValue('verified')
  verified,
  @JsonValue('rejected')
  rejected,
}

typedef KycStatus = IdentityStatus;

@freezed
abstract class IdentityDocument with _$IdentityDocument {
  const factory IdentityDocument({
    required String id,
    String? provider,
    @JsonKey(name: 'doc_type') @Default(IdentityDocType.nationalId) IdentityDocType docType,
    @Default(IdentityStatus.unverified) IdentityStatus status,
    @JsonKey(name: 'rejection_reason') String? rejectionReason,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'expires_at') String? expiresAt,
    @JsonKey(name: 'verified_at') String? verifiedAt,
  }) = _IdentityDocument;

  factory IdentityDocument.fromJson(Map<String, dynamic> json) =>
      _$IdentityDocumentFromJson(json);
}

typedef KycModel = IdentityDocument;

@freezed
abstract class StartIdentityVerificationRequest
    with _$StartIdentityVerificationRequest {
  const factory StartIdentityVerificationRequest({
    @JsonKey(name: 'doc_type') required IdentityDocType docType,
    @JsonKey(name: 'front_resource_id') required String frontResourceId,
    @JsonKey(name: 'back_resource_id') String? backResourceId,
    @JsonKey(name: 'selfie_resource_id') required String selfieResourceId,
  }) = _StartIdentityVerificationRequest;

  factory StartIdentityVerificationRequest.fromJson(
    Map<String, dynamic> json,
  ) => _$StartIdentityVerificationRequestFromJson(json);
}

@freezed
abstract class IdentityVerificationTicket with _$IdentityVerificationTicket {
  const factory IdentityVerificationTicket({
    required IdentityDocument document,
    @JsonKey(name: 'vendor_session_expires_at') String? vendorSessionExpiresAt,
    @JsonKey(name: 'vendor_session_url') String? vendorSessionUrl,
  }) = _IdentityVerificationTicket;

  factory IdentityVerificationTicket.fromJson(Map<String, dynamic> json) =>
      _$IdentityVerificationTicketFromJson(json);
}

@freezed
abstract class AccountCreateUploadRequest with _$AccountCreateUploadRequest {
  const factory AccountCreateUploadRequest({
    required String filename,
    @Default('identity') String kind,
    required String mime,
    required int size,
  }) = _AccountCreateUploadRequest;

  factory AccountCreateUploadRequest.fromJson(Map<String, dynamic> json) =>
      _$AccountCreateUploadRequestFromJson(json);
}

@freezed
abstract class UploadSlot with _$UploadSlot {
  const factory UploadSlot({
    @JsonKey(name: 'resource_id') required String resourceId,
    required String url,
    Map<String, dynamic>? headers,
    @JsonKey(name: 'expires_at') String? expiresAt,
  }) = _UploadSlot;

  factory UploadSlot.fromJson(Map<String, dynamic> json) =>
      _$UploadSlotFromJson(json);
}
