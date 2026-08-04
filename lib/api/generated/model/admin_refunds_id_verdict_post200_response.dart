//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/refund.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_refunds_id_verdict_post200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminRefundsIdVerdictPost200Response {
  /// Returns a new [AdminRefundsIdVerdictPost200Response] instance.
  AdminRefundsIdVerdictPost200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Refund data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminRefundsIdVerdictPost200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory AdminRefundsIdVerdictPost200Response.fromJson(Map<String, dynamic> json) => _$AdminRefundsIdVerdictPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminRefundsIdVerdictPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

