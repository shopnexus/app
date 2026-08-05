/// Identity verification uses the generated shapes; this file only re-exports
/// them so the feature keeps one import.
///
/// The contract's `IdentityStatus` has three values — `pending`, `verified`,
/// `rejected`. There is no `unverified`: an account with nothing on file has no
/// document, which the repository answers as null. A fourth enum value for "no
/// row" made every reader handle absence twice.
export '../../../../api/generated/model/account_create_upload_request.dart';
export '../../../../api/generated/model/identity_document.dart';
export '../../../../api/generated/model/identity_document_type.dart';
export '../../../../api/generated/model/identity_status.dart';
export '../../../../api/generated/model/identity_verification_ticket.dart';
export '../../../../api/generated/model/start_identity_verification_request.dart';
export '../../../../api/generated/model/upload_slot.dart';
