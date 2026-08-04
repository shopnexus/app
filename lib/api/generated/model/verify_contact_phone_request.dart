//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_contact_phone_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class VerifyContactPhoneRequest {
  /// Returns a new [VerifyContactPhoneRequest] instance.
  VerifyContactPhoneRequest({

    required  this.code,
  });

  @JsonKey(
    
    name: r'code',
    required: true,
    includeIfNull: false,
  )


  final String code;





    @override
    bool operator ==(Object other) => identical(this, other) || other is VerifyContactPhoneRequest &&
      other.code == code;

    @override
    int get hashCode =>
        code.hashCode;

  factory VerifyContactPhoneRequest.fromJson(Map<String, dynamic> json) => _$VerifyContactPhoneRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyContactPhoneRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

