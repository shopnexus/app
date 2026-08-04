//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/tax_verification_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tax_code_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tax_info.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TaxInfo {
  /// Returns a new [TaxInfo] instance.
  TaxInfo({

    required  this.createdAt,

    required  this.legalName,

    required  this.taxCode,

    required  this.taxCodeType,

    required  this.updatedAt,

    required  this.verificationStatus,

     this.verifiedAt,
  });

  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'legal_name',
    required: true,
    includeIfNull: false,
  )


  final String legalName;



  @JsonKey(
    
    name: r'tax_code',
    required: true,
    includeIfNull: false,
  )


  final String taxCode;



  @JsonKey(
    
    name: r'tax_code_type',
    required: true,
    includeIfNull: false,
  )


  final TaxCodeType taxCodeType;



      /// When the registration was last replaced, which also resets the verdict.
  @JsonKey(
    
    name: r'updated_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime updatedAt;



  @JsonKey(
    
    name: r'verification_status',
    required: true,
    includeIfNull: false,
  )


  final TaxVerificationStatus verificationStatus;



  @JsonKey(
    
    name: r'verified_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? verifiedAt;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TaxInfo &&
      other.createdAt == createdAt &&
      other.legalName == legalName &&
      other.taxCode == taxCode &&
      other.taxCodeType == taxCodeType &&
      other.updatedAt == updatedAt &&
      other.verificationStatus == verificationStatus &&
      other.verifiedAt == verifiedAt;

    @override
    int get hashCode =>
        createdAt.hashCode +
        legalName.hashCode +
        taxCode.hashCode +
        taxCodeType.hashCode +
        updatedAt.hashCode +
        verificationStatus.hashCode +
        (verifiedAt == null ? 0 : verifiedAt.hashCode);

  factory TaxInfo.fromJson(Map<String, dynamic> json) => _$TaxInfoFromJson(json);

  Map<String, dynamic> toJson() => _$TaxInfoToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

