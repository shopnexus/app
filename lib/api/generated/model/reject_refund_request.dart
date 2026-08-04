//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reject_refund_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RejectRefundRequest {
  /// Returns a new [RejectRefundRequest] instance.
  RejectRefundRequest({

    required  this.reason,
  });

  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final String reason;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RejectRefundRequest &&
      other.reason == reason;

    @override
    int get hashCode =>
        reason.hashCode;

  factory RejectRefundRequest.fromJson(Map<String, dynamic> json) => _$RejectRefundRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RejectRefundRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

