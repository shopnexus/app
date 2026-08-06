//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/identity_document.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'identity_verification_ticket.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class IdentityVerificationTicket {
  /// Returns a new [IdentityVerificationTicket] instance.
  IdentityVerificationTicket({
    required this.document,

    required this.vendorSessionExpiresAt,

    required this.vendorSessionUrl,
  });

  @JsonKey(name: r'document', required: true, includeIfNull: false)
  final IdentityDocument document;

  @JsonKey(
    name: r'vendor_session_expires_at',
    required: true,
    includeIfNull: true,
  )
  final DateTime? vendorSessionExpiresAt;

  /// Where the caller finishes the check with the vendor.
  @JsonKey(name: r'vendor_session_url', required: true, includeIfNull: true)
  final String? vendorSessionUrl;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdentityVerificationTicket &&
          other.document == document &&
          other.vendorSessionExpiresAt == vendorSessionExpiresAt &&
          other.vendorSessionUrl == vendorSessionUrl;

  @override
  int get hashCode =>
      document.hashCode +
      (vendorSessionExpiresAt == null ? 0 : vendorSessionExpiresAt.hashCode) +
      (vendorSessionUrl == null ? 0 : vendorSessionUrl.hashCode);

  factory IdentityVerificationTicket.fromJson(Map<String, dynamic> json) =>
      _$IdentityVerificationTicketFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityVerificationTicketToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
