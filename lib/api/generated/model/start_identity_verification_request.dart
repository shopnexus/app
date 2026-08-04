//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/identity_document_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'start_identity_verification_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class StartIdentityVerificationRequest {
  /// Returns a new [StartIdentityVerificationRequest] instance.
  StartIdentityVerificationRequest({

     this.backResourceId,

    required  this.docType,

    required  this.frontResourceId,

    required  this.selfieResourceId,
  });

      /// The reverse, for a document that has one. Omit for a passport.
  @JsonKey(
    
    name: r'back_resource_id',
    required: false,
    includeIfNull: false,
  )


  final String? backResourceId;



  @JsonKey(
    
    name: r'doc_type',
    required: true,
    includeIfNull: false,
  )


  final IdentityDocumentType docType;



      /// The data page, or the front of the card.
  @JsonKey(
    
    name: r'front_resource_id',
    required: true,
    includeIfNull: false,
  )


  final String frontResourceId;



      /// A live photo, matched against the portrait on the document. Required: without it the document is verified but nothing ties it to the person holding the account. 
  @JsonKey(
    
    name: r'selfie_resource_id',
    required: true,
    includeIfNull: false,
  )


  final String selfieResourceId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is StartIdentityVerificationRequest &&
      other.backResourceId == backResourceId &&
      other.docType == docType &&
      other.frontResourceId == frontResourceId &&
      other.selfieResourceId == selfieResourceId;

    @override
    int get hashCode =>
        backResourceId.hashCode +
        docType.hashCode +
        frontResourceId.hashCode +
        selfieResourceId.hashCode;

  factory StartIdentityVerificationRequest.fromJson(Map<String, dynamic> json) => _$StartIdentityVerificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$StartIdentityVerificationRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

