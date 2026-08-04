//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'withdrawal_rejection_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WithdrawalRejectionRequest {
  /// Returns a new [WithdrawalRejectionRequest] instance.
  WithdrawalRejectionRequest({

    required  this.reason,
  });

  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final String reason;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WithdrawalRejectionRequest &&
      other.reason == reason;

    @override
    int get hashCode =>
        reason.hashCode;

  factory WithdrawalRejectionRequest.fromJson(Map<String, dynamic> json) => _$WithdrawalRejectionRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WithdrawalRejectionRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

