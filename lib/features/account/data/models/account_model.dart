import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';

part 'account_model.freezed.dart';

part 'account_model.g.dart';

/// Profile model chứa thông tin công khai của User/Seller
@freezed
abstract class Profile with _$Profile {
  const factory Profile({
    required String name,
    required String country,
    required String locale,
    required String timezone,
    @JsonKey(name: 'created_at') required String createdAt,
    Resource? avatar,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? description,
    String? gender,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}

/// Model Me đại diện cho tài khoản hiện tại (GET /me)
@freezed
abstract class Me with _$Me {
  const Me._();

  const factory Me({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    String? email,
    @JsonKey(name: 'email_verified') required bool emailVerified,
    @JsonKey(name: 'has_password') required bool hasPassword,
    @JsonKey(name: 'identity_verified') required bool identityVerified,
    String? phone,
    Profile? profile,
    required String role,
    required String status,
    String? username,
  }) = _Me;

  factory Me.fromJson(Map<String, dynamic> json) => _$MeFromJson(json);

  // Derived from what the route actually sends.
  String get name => profile?.name ?? username ?? email ?? 'Người dùng';

  String? get avatarUrl => profile?.avatar?.url;

  String? get dateOfBirth => profile?.dateOfBirth;

  String? get description => profile?.description;

  String? get gender => profile?.gender;

  String get country => profile?.country ?? 'VN';

  /// An IANA zone, which is what a day-bucketed report has to be cut on. Dart
  /// itself exposes only an abbreviation, so this is the app's only source for it.
  String get timezone => profile?.timezone ?? 'Asia/Ho_Chi_Minh';
}

/// PublicAccount dùng khi xem thông tin tài khoản public của người khác
@freezed
abstract class PublicAccount with _$PublicAccount {
  const PublicAccount._();

  const factory PublicAccount({
    required String id,
    required String name,
    @JsonKey(name: 'follower_count') required int followerCount,
    @JsonKey(name: 'identity_verified') required bool identityVerified,
    @JsonKey(name: 'created_at') required String createdAt,
    String? description,
    Resource? avatar,
  }) = _PublicAccount;

  factory PublicAccount.fromJson(Map<String, dynamic> json) =>
      _$PublicAccountFromJson(json);

  String? get avatarUrl => avatar?.url;
}
