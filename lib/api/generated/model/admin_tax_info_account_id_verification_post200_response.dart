//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/tax_info.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_tax_info_account_id_verification_post200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminTaxInfoAccountIDVerificationPost200Response {
  /// Returns a new [AdminTaxInfoAccountIDVerificationPost200Response] instance.
  AdminTaxInfoAccountIDVerificationPost200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final TaxInfo data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminTaxInfoAccountIDVerificationPost200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory AdminTaxInfoAccountIDVerificationPost200Response.fromJson(Map<String, dynamic> json) => _$AdminTaxInfoAccountIDVerificationPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminTaxInfoAccountIDVerificationPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

