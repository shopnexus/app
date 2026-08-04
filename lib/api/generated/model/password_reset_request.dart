//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'password_reset_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PasswordResetRequest {
  /// Returns a new [PasswordResetRequest] instance.
  PasswordResetRequest({

    required  this.identifier,
  });

      /// An email or a phone.
  @JsonKey(
    
    name: r'identifier',
    required: true,
    includeIfNull: false,
  )


  final String identifier;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PasswordResetRequest &&
      other.identifier == identifier;

    @override
    int get hashCode =>
        identifier.hashCode;

  factory PasswordResetRequest.fromJson(Map<String, dynamic> json) => _$PasswordResetRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordResetRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

