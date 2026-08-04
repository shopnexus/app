//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/identity_document.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_identity_documents_id_verdict_post200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminIdentityDocumentsIdVerdictPost200Response {
  /// Returns a new [AdminIdentityDocumentsIdVerdictPost200Response] instance.
  AdminIdentityDocumentsIdVerdictPost200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final IdentityDocument data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminIdentityDocumentsIdVerdictPost200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory AdminIdentityDocumentsIdVerdictPost200Response.fromJson(Map<String, dynamic> json) => _$AdminIdentityDocumentsIdVerdictPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminIdentityDocumentsIdVerdictPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

