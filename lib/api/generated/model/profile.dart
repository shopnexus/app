//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/profile_gender.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Profile {
  /// Returns a new [Profile] instance.
  Profile({
    required this.avatar,

    required this.country,

    required this.createdAt,

    required this.dateOfBirth,

    required this.description,

    required this.gender,

    required this.locale,

    required this.name,

    required this.timezone,
  });

  @JsonKey(name: r'avatar', required: true, includeIfNull: true)
  final Resource? avatar;

  @JsonKey(name: r'country', required: true, includeIfNull: false)
  final String country;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  @JsonKey(name: r'date_of_birth', required: true, includeIfNull: true)
  final String? dateOfBirth;

  @JsonKey(name: r'description', required: true, includeIfNull: true)
  final String? description;

  @JsonKey(name: r'gender', required: true, includeIfNull: true)
  final ProfileGender? gender;

  @JsonKey(name: r'locale', required: true, includeIfNull: false)
  final String locale;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @JsonKey(name: r'timezone', required: true, includeIfNull: false)
  final String timezone;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Profile &&
          other.avatar == avatar &&
          other.country == country &&
          other.createdAt == createdAt &&
          other.dateOfBirth == dateOfBirth &&
          other.description == description &&
          other.gender == gender &&
          other.locale == locale &&
          other.name == name &&
          other.timezone == timezone;

  @override
  int get hashCode =>
      (avatar == null ? 0 : avatar.hashCode) +
      country.hashCode +
      createdAt.hashCode +
      (dateOfBirth == null ? 0 : dateOfBirth.hashCode) +
      (description == null ? 0 : description.hashCode) +
      (gender == null ? 0 : gender.hashCode) +
      locale.hashCode +
      name.hashCode +
      timezone.hashCode;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
