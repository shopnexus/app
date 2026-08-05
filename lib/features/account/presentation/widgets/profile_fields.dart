import 'package:shopnexus_flutter_app/api/generated/model/profile_gender.dart';

/// The contract stores `male|female|other`; the two edit sheets and the account
/// centre's info list all have to draw the same three Vietnamese labels, and a
/// label sent as a value is what made every save a 422.
String genderLabel(ProfileGender gender) => switch (gender) {
  ProfileGender.male => 'Nam',
  ProfileGender.female => 'Nữ',
  ProfileGender.other => 'Khác',
};

/// The stored value, or null when the account has never set one.
ProfileGender? genderOf(String? stored) {
  for (final gender in ProfileGender.values) {
    if (gender.value == stored?.toLowerCase()) return gender;
  }
  return null;
}
