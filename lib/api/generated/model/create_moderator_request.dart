//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_moderator_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateModeratorRequest {
  /// Returns a new [CreateModeratorRequest] instance.
  CreateModeratorRequest({

    required  this.country,

    required  this.email,

    required  this.locale,

    required  this.name,

    required  this.password,

    required  this.timezone,
  });

  @JsonKey(
    
    name: r'country',
    required: true,
    includeIfNull: false,
  )


  final String country;



  @JsonKey(
    
    name: r'email',
    required: true,
    includeIfNull: false,
  )


  final String email;



  @JsonKey(
    
    name: r'locale',
    required: true,
    includeIfNull: false,
  )


  final String locale;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'password',
    required: true,
    includeIfNull: false,
  )


  final String password;



  @JsonKey(
    
    name: r'timezone',
    required: true,
    includeIfNull: false,
  )


  final String timezone;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateModeratorRequest &&
      other.country == country &&
      other.email == email &&
      other.locale == locale &&
      other.name == name &&
      other.password == password &&
      other.timezone == timezone;

    @override
    int get hashCode =>
        country.hashCode +
        email.hashCode +
        locale.hashCode +
        name.hashCode +
        password.hashCode +
        timezone.hashCode;

  factory CreateModeratorRequest.fromJson(Map<String, dynamic> json) => _$CreateModeratorRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateModeratorRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

