//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'identity_verdict_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class IdentityVerdictRequest {
  /// Returns a new [IdentityVerdictRequest] instance.
  IdentityVerdictRequest({

     this.expiresAt,

     this.rejectionReason,

    required  this.status,
  });

      /// When the document runs out.
  @JsonKey(
    
    name: r'expires_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? expiresAt;



      /// Required when rejecting.
  @JsonKey(
    
    name: r'rejection_reason',
    required: false,
    includeIfNull: false,
  )


  final String? rejectionReason;



      /// A verdict so pending is not a choice.
  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final IdentityVerdictRequestStatusEnum status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is IdentityVerdictRequest &&
      other.expiresAt == expiresAt &&
      other.rejectionReason == rejectionReason &&
      other.status == status;

    @override
    int get hashCode =>
        expiresAt.hashCode +
        rejectionReason.hashCode +
        status.hashCode;

  factory IdentityVerdictRequest.fromJson(Map<String, dynamic> json) => _$IdentityVerdictRequestFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityVerdictRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// A verdict so pending is not a choice.
enum IdentityVerdictRequestStatusEnum {
    /// A verdict so pending is not a choice.
@JsonValue(r'verified')
verified(r'verified'),
    /// A verdict so pending is not a choice.
@JsonValue(r'rejected')
rejected(r'rejected');

const IdentityVerdictRequestStatusEnum(this.value);

final String value;

@override
String toString() => value;
}


