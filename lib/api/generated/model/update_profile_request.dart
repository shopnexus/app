//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/profile_gender.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateProfileRequest {
  /// Returns a new [UpdateProfileRequest] instance.
  UpdateProfileRequest({
    this.avatarResourceId,

    this.clearAvatarResourceId,

    this.clearDateOfBirth,

    this.clearDescription,

    this.clearGender,

    this.country,

    this.dateOfBirth,

    this.description,

    this.gender,

    this.locale,

    this.name,

    this.timezone,
  });

  @JsonKey(name: r'avatar_resource_id', required: false, includeIfNull: false)
  final String? avatarResourceId;

  @JsonKey(
    name: r'clear_avatar_resource_id',
    required: false,
    includeIfNull: false,
  )
  final bool? clearAvatarResourceId;

  @JsonKey(name: r'clear_date_of_birth', required: false, includeIfNull: false)
  final bool? clearDateOfBirth;

  @JsonKey(name: r'clear_description', required: false, includeIfNull: false)
  final bool? clearDescription;

  @JsonKey(name: r'clear_gender', required: false, includeIfNull: false)
  final bool? clearGender;

  @JsonKey(name: r'country', required: false, includeIfNull: false)
  final String? country;

  @JsonKey(name: r'date_of_birth', required: false, includeIfNull: false)
  final String? dateOfBirth;

  @JsonKey(name: r'description', required: false, includeIfNull: false)
  final String? description;

  @JsonKey(name: r'gender', required: false, includeIfNull: false)
  final ProfileGender? gender;

  @JsonKey(name: r'locale', required: false, includeIfNull: false)
  final String? locale;

  @JsonKey(name: r'name', required: false, includeIfNull: false)
  final String? name;

  @JsonKey(name: r'timezone', required: false, includeIfNull: false)
  final String? timezone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpdateProfileRequest &&
          other.avatarResourceId == avatarResourceId &&
          other.clearAvatarResourceId == clearAvatarResourceId &&
          other.clearDateOfBirth == clearDateOfBirth &&
          other.clearDescription == clearDescription &&
          other.clearGender == clearGender &&
          other.country == country &&
          other.dateOfBirth == dateOfBirth &&
          other.description == description &&
          other.gender == gender &&
          other.locale == locale &&
          other.name == name &&
          other.timezone == timezone;

  @override
  int get hashCode =>
      avatarResourceId.hashCode +
      clearAvatarResourceId.hashCode +
      clearDateOfBirth.hashCode +
      clearDescription.hashCode +
      clearGender.hashCode +
      country.hashCode +
      dateOfBirth.hashCode +
      description.hashCode +
      gender.hashCode +
      locale.hashCode +
      name.hashCode +
      timezone.hashCode;

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
