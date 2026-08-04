//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/tax_code_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upsert_tax_info_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpsertTaxInfoRequest {
  /// Returns a new [UpsertTaxInfoRequest] instance.
  UpsertTaxInfoRequest({

    required  this.legalName,

    required  this.taxCode,

    required  this.taxCodeType,
  });

  @JsonKey(
    
    name: r'legal_name',
    required: true,
    includeIfNull: false,
  )


  final String legalName;



      /// Vietnamese MST — ten digits, or ten plus a three-digit branch.
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





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpsertTaxInfoRequest &&
      other.legalName == legalName &&
      other.taxCode == taxCode &&
      other.taxCodeType == taxCodeType;

    @override
    int get hashCode =>
        legalName.hashCode +
        taxCode.hashCode +
        taxCodeType.hashCode;

  factory UpsertTaxInfoRequest.fromJson(Map<String, dynamic> json) => _$UpsertTaxInfoRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpsertTaxInfoRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

