//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/withdrawal.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_withdrawals_id_approval_post200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminWithdrawalsIdApprovalPost200Response {
  /// Returns a new [AdminWithdrawalsIdApprovalPost200Response] instance.
  AdminWithdrawalsIdApprovalPost200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Withdrawal data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminWithdrawalsIdApprovalPost200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory AdminWithdrawalsIdApprovalPost200Response.fromJson(Map<String, dynamic> json) => _$AdminWithdrawalsIdApprovalPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminWithdrawalsIdApprovalPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

