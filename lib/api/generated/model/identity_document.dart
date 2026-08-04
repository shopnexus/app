//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/identity_document_type.dart';
import 'package:shopnexus_flutter_app/api/generated/model/identity_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'identity_document.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class IdentityDocument {
  /// Returns a new [IdentityDocument] instance.
  IdentityDocument({

    required  this.createdAt,

    required  this.docType,

     this.expiresAt,

    required  this.id,

    required  this.provider,

     this.rejectionReason,

    required  this.status,

     this.verifiedAt,
  });

  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'doc_type',
    required: true,
    includeIfNull: false,
  )


  final IdentityDocumentType docType;



      /// When the document itself runs out. A payout gate reads this as well as the status. 
  @JsonKey(
    
    name: r'expires_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? expiresAt;



  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



      /// KYC vendor, kebab-case.
  @JsonKey(
    
    name: r'provider',
    required: true,
    includeIfNull: false,
  )


  final String provider;



  @JsonKey(
    
    name: r'rejection_reason',
    required: false,
    includeIfNull: false,
  )


  final String? rejectionReason;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final IdentityStatus status;



  @JsonKey(
    
    name: r'verified_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? verifiedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is IdentityDocument &&
      other.createdAt == createdAt &&
      other.docType == docType &&
      other.expiresAt == expiresAt &&
      other.id == id &&
      other.provider == provider &&
      other.rejectionReason == rejectionReason &&
      other.status == status &&
      other.verifiedAt == verifiedAt;

    @override
    int get hashCode =>
        createdAt.hashCode +
        docType.hashCode +
        (expiresAt == null ? 0 : expiresAt.hashCode) +
        id.hashCode +
        provider.hashCode +
        (rejectionReason == null ? 0 : rejectionReason.hashCode) +
        status.hashCode +
        (verifiedAt == null ? 0 : verifiedAt.hashCode);

  factory IdentityDocument.fromJson(Map<String, dynamic> json) => _$IdentityDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityDocumentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

