// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String get name => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
  String get timezone => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  Resource? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get gender => throw _privateConstructorUsedError;

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call({
    String name,
    String country,
    String locale,
    String timezone,
    @JsonKey(name: 'created_at') String createdAt,
    Resource? avatar,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? description,
    String? gender,
  });
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? country = null,
    Object? locale = null,
    Object? timezone = null,
    Object? createdAt = null,
    Object? avatar = freezed,
    Object? dateOfBirth = freezed,
    Object? description = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _value.copyWith(
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            country: null == country
                ? _value.country
                : country // ignore: cast_nullable_to_non_nullable
                      as String,
            locale: null == locale
                ? _value.locale
                : locale // ignore: cast_nullable_to_non_nullable
                      as String,
            timezone: null == timezone
                ? _value.timezone
                : timezone // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as Resource?,
            dateOfBirth: freezed == dateOfBirth
                ? _value.dateOfBirth
                : dateOfBirth // ignore: cast_nullable_to_non_nullable
                      as String?,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            gender: freezed == gender
                ? _value.gender
                : gender // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
    _$ProfileImpl value,
    $Res Function(_$ProfileImpl) then,
  ) = __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String name,
    String country,
    String locale,
    String timezone,
    @JsonKey(name: 'created_at') String createdAt,
    Resource? avatar,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    String? description,
    String? gender,
  });
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
    _$ProfileImpl _value,
    $Res Function(_$ProfileImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? country = null,
    Object? locale = null,
    Object? timezone = null,
    Object? createdAt = null,
    Object? avatar = freezed,
    Object? dateOfBirth = freezed,
    Object? description = freezed,
    Object? gender = freezed,
  }) {
    return _then(
      _$ProfileImpl(
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        country: null == country
            ? _value.country
            : country // ignore: cast_nullable_to_non_nullable
                  as String,
        locale: null == locale
            ? _value.locale
            : locale // ignore: cast_nullable_to_non_nullable
                  as String,
        timezone: null == timezone
            ? _value.timezone
            : timezone // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as Resource?,
        dateOfBirth: freezed == dateOfBirth
            ? _value.dateOfBirth
            : dateOfBirth // ignore: cast_nullable_to_non_nullable
                  as String?,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        gender: freezed == gender
            ? _value.gender
            : gender // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl({
    required this.name,
    required this.country,
    required this.locale,
    required this.timezone,
    @JsonKey(name: 'created_at') required this.createdAt,
    this.avatar,
    @JsonKey(name: 'date_of_birth') this.dateOfBirth,
    this.description,
    this.gender,
  });

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final String name;
  @override
  final String country;
  @override
  final String locale;
  @override
  final String timezone;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final Resource? avatar;
  @override
  @JsonKey(name: 'date_of_birth')
  final String? dateOfBirth;
  @override
  final String? description;
  @override
  final String? gender;

  @override
  String toString() {
    return 'Profile(name: $name, country: $country, locale: $locale, timezone: $timezone, createdAt: $createdAt, avatar: $avatar, dateOfBirth: $dateOfBirth, description: $description, gender: $gender)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.gender, gender) || other.gender == gender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    name,
    country,
    locale,
    timezone,
    createdAt,
    avatar,
    dateOfBirth,
    description,
    gender,
  );

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(this);
  }
}

abstract class _Profile implements Profile {
  const factory _Profile({
    required final String name,
    required final String country,
    required final String locale,
    required final String timezone,
    @JsonKey(name: 'created_at') required final String createdAt,
    final Resource? avatar,
    @JsonKey(name: 'date_of_birth') final String? dateOfBirth,
    final String? description,
    final String? gender,
  }) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String get name;
  @override
  String get country;
  @override
  String get locale;
  @override
  String get timezone;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  Resource? get avatar;
  @override
  @JsonKey(name: 'date_of_birth')
  String? get dateOfBirth;
  @override
  String? get description;
  @override
  String? get gender;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Me _$MeFromJson(Map<String, dynamic> json) {
  return _Me.fromJson(json);
}

/// @nodoc
mixin _$Me {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'email_verified')
  bool get emailVerified => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_password')
  bool get hasPassword => throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_verified')
  bool get identityVerified => throw _privateConstructorUsedError;
  String? get phone => throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;

  /// Serializes this Me to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Me
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MeCopyWith<Me> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MeCopyWith<$Res> {
  factory $MeCopyWith(Me value, $Res Function(Me) then) =
      _$MeCopyWithImpl<$Res, Me>;
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') String createdAt,
    String? email,
    @JsonKey(name: 'email_verified') bool emailVerified,
    @JsonKey(name: 'has_password') bool hasPassword,
    @JsonKey(name: 'identity_verified') bool identityVerified,
    String? phone,
    Profile? profile,
    String role,
    String status,
    String? username,
  });

  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$MeCopyWithImpl<$Res, $Val extends Me> implements $MeCopyWith<$Res> {
  _$MeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Me
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? email = freezed,
    Object? emailVerified = null,
    Object? hasPassword = null,
    Object? identityVerified = null,
    Object? phone = freezed,
    Object? profile = freezed,
    Object? role = null,
    Object? status = null,
    Object? username = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            email: freezed == email
                ? _value.email
                : email // ignore: cast_nullable_to_non_nullable
                      as String?,
            emailVerified: null == emailVerified
                ? _value.emailVerified
                : emailVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            hasPassword: null == hasPassword
                ? _value.hasPassword
                : hasPassword // ignore: cast_nullable_to_non_nullable
                      as bool,
            identityVerified: null == identityVerified
                ? _value.identityVerified
                : identityVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            phone: freezed == phone
                ? _value.phone
                : phone // ignore: cast_nullable_to_non_nullable
                      as String?,
            profile: freezed == profile
                ? _value.profile
                : profile // ignore: cast_nullable_to_non_nullable
                      as Profile?,
            role: null == role
                ? _value.role
                : role // ignore: cast_nullable_to_non_nullable
                      as String,
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            username: freezed == username
                ? _value.username
                : username // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }

  /// Create a copy of Me
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MeImplCopyWith<$Res> implements $MeCopyWith<$Res> {
  factory _$$MeImplCopyWith(_$MeImpl value, $Res Function(_$MeImpl) then) =
      __$$MeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    @JsonKey(name: 'created_at') String createdAt,
    String? email,
    @JsonKey(name: 'email_verified') bool emailVerified,
    @JsonKey(name: 'has_password') bool hasPassword,
    @JsonKey(name: 'identity_verified') bool identityVerified,
    String? phone,
    Profile? profile,
    String role,
    String status,
    String? username,
  });

  @override
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$$MeImplCopyWithImpl<$Res> extends _$MeCopyWithImpl<$Res, _$MeImpl>
    implements _$$MeImplCopyWith<$Res> {
  __$$MeImplCopyWithImpl(_$MeImpl _value, $Res Function(_$MeImpl) _then)
    : super(_value, _then);

  /// Create a copy of Me
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? createdAt = null,
    Object? email = freezed,
    Object? emailVerified = null,
    Object? hasPassword = null,
    Object? identityVerified = null,
    Object? phone = freezed,
    Object? profile = freezed,
    Object? role = null,
    Object? status = null,
    Object? username = freezed,
  }) {
    return _then(
      _$MeImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        email: freezed == email
            ? _value.email
            : email // ignore: cast_nullable_to_non_nullable
                  as String?,
        emailVerified: null == emailVerified
            ? _value.emailVerified
            : emailVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        hasPassword: null == hasPassword
            ? _value.hasPassword
            : hasPassword // ignore: cast_nullable_to_non_nullable
                  as bool,
        identityVerified: null == identityVerified
            ? _value.identityVerified
            : identityVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        phone: freezed == phone
            ? _value.phone
            : phone // ignore: cast_nullable_to_non_nullable
                  as String?,
        profile: freezed == profile
            ? _value.profile
            : profile // ignore: cast_nullable_to_non_nullable
                  as Profile?,
        role: null == role
            ? _value.role
            : role // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        username: freezed == username
            ? _value.username
            : username // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MeImpl extends _Me {
  const _$MeImpl({
    required this.id,
    @JsonKey(name: 'created_at') required this.createdAt,
    this.email,
    @JsonKey(name: 'email_verified') required this.emailVerified,
    @JsonKey(name: 'has_password') required this.hasPassword,
    @JsonKey(name: 'identity_verified') required this.identityVerified,
    this.phone,
    this.profile,
    required this.role,
    required this.status,
    this.username,
  }) : super._();

  factory _$MeImpl.fromJson(Map<String, dynamic> json) =>
      _$$MeImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final String? email;
  @override
  @JsonKey(name: 'email_verified')
  final bool emailVerified;
  @override
  @JsonKey(name: 'has_password')
  final bool hasPassword;
  @override
  @JsonKey(name: 'identity_verified')
  final bool identityVerified;
  @override
  final String? phone;
  @override
  final Profile? profile;
  @override
  final String role;
  @override
  final String status;
  @override
  final String? username;

  @override
  String toString() {
    return 'Me(id: $id, createdAt: $createdAt, email: $email, emailVerified: $emailVerified, hasPassword: $hasPassword, identityVerified: $identityVerified, phone: $phone, profile: $profile, role: $role, status: $status, username: $username)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.hasPassword, hasPassword) ||
                other.hasPassword == hasPassword) &&
            (identical(other.identityVerified, identityVerified) ||
                other.identityVerified == identityVerified) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    createdAt,
    email,
    emailVerified,
    hasPassword,
    identityVerified,
    phone,
    profile,
    role,
    status,
    username,
  );

  /// Create a copy of Me
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MeImplCopyWith<_$MeImpl> get copyWith =>
      __$$MeImplCopyWithImpl<_$MeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MeImplToJson(this);
  }
}

abstract class _Me extends Me {
  const factory _Me({
    required final String id,
    @JsonKey(name: 'created_at') required final String createdAt,
    final String? email,
    @JsonKey(name: 'email_verified') required final bool emailVerified,
    @JsonKey(name: 'has_password') required final bool hasPassword,
    @JsonKey(name: 'identity_verified') required final bool identityVerified,
    final String? phone,
    final Profile? profile,
    required final String role,
    required final String status,
    final String? username,
  }) = _$MeImpl;
  const _Me._() : super._();

  factory _Me.fromJson(Map<String, dynamic> json) = _$MeImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  String? get email;
  @override
  @JsonKey(name: 'email_verified')
  bool get emailVerified;
  @override
  @JsonKey(name: 'has_password')
  bool get hasPassword;
  @override
  @JsonKey(name: 'identity_verified')
  bool get identityVerified;
  @override
  String? get phone;
  @override
  Profile? get profile;
  @override
  String get role;
  @override
  String get status;
  @override
  String? get username;

  /// Create a copy of Me
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MeImplCopyWith<_$MeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PublicAccount _$PublicAccountFromJson(Map<String, dynamic> json) {
  return _PublicAccount.fromJson(json);
}

/// @nodoc
mixin _$PublicAccount {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'follower_count')
  int get followerCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'identity_verified')
  bool get identityVerified => throw _privateConstructorUsedError;

  /// Quan hệ của *người đọc* với account này — false khi đọc ẩn danh và trên
  /// trang của chính mình. Nút theo dõi không có nó thì không biết vẽ chiều nào.
  @JsonKey(name: 'following')
  bool get following => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String get createdAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  Resource? get avatar => throw _privateConstructorUsedError;

  /// Serializes this PublicAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicAccountCopyWith<PublicAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicAccountCopyWith<$Res> {
  factory $PublicAccountCopyWith(
    PublicAccount value,
    $Res Function(PublicAccount) then,
  ) = _$PublicAccountCopyWithImpl<$Res, PublicAccount>;
  @useResult
  $Res call({
    String id,
    String name,
    @JsonKey(name: 'follower_count') int followerCount,
    @JsonKey(name: 'identity_verified') bool identityVerified,
    @JsonKey(name: 'following') bool following,
    @JsonKey(name: 'created_at') String createdAt,
    String? description,
    Resource? avatar,
  });
}

/// @nodoc
class _$PublicAccountCopyWithImpl<$Res, $Val extends PublicAccount>
    implements $PublicAccountCopyWith<$Res> {
  _$PublicAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? followerCount = null,
    Object? identityVerified = null,
    Object? following = null,
    Object? createdAt = null,
    Object? description = freezed,
    Object? avatar = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            followerCount: null == followerCount
                ? _value.followerCount
                : followerCount // ignore: cast_nullable_to_non_nullable
                      as int,
            identityVerified: null == identityVerified
                ? _value.identityVerified
                : identityVerified // ignore: cast_nullable_to_non_nullable
                      as bool,
            following: null == following
                ? _value.following
                : following // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: null == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            avatar: freezed == avatar
                ? _value.avatar
                : avatar // ignore: cast_nullable_to_non_nullable
                      as Resource?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PublicAccountImplCopyWith<$Res>
    implements $PublicAccountCopyWith<$Res> {
  factory _$$PublicAccountImplCopyWith(
    _$PublicAccountImpl value,
    $Res Function(_$PublicAccountImpl) then,
  ) = __$$PublicAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    @JsonKey(name: 'follower_count') int followerCount,
    @JsonKey(name: 'identity_verified') bool identityVerified,
    @JsonKey(name: 'following') bool following,
    @JsonKey(name: 'created_at') String createdAt,
    String? description,
    Resource? avatar,
  });
}

/// @nodoc
class __$$PublicAccountImplCopyWithImpl<$Res>
    extends _$PublicAccountCopyWithImpl<$Res, _$PublicAccountImpl>
    implements _$$PublicAccountImplCopyWith<$Res> {
  __$$PublicAccountImplCopyWithImpl(
    _$PublicAccountImpl _value,
    $Res Function(_$PublicAccountImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PublicAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? followerCount = null,
    Object? identityVerified = null,
    Object? following = null,
    Object? createdAt = null,
    Object? description = freezed,
    Object? avatar = freezed,
  }) {
    return _then(
      _$PublicAccountImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        followerCount: null == followerCount
            ? _value.followerCount
            : followerCount // ignore: cast_nullable_to_non_nullable
                  as int,
        identityVerified: null == identityVerified
            ? _value.identityVerified
            : identityVerified // ignore: cast_nullable_to_non_nullable
                  as bool,
        following: null == following
            ? _value.following
            : following // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: null == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        avatar: freezed == avatar
            ? _value.avatar
            : avatar // ignore: cast_nullable_to_non_nullable
                  as Resource?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicAccountImpl extends _PublicAccount {
  const _$PublicAccountImpl({
    required this.id,
    required this.name,
    @JsonKey(name: 'follower_count') required this.followerCount,
    @JsonKey(name: 'identity_verified') required this.identityVerified,
    @JsonKey(name: 'following') required this.following,
    @JsonKey(name: 'created_at') required this.createdAt,
    this.description,
    this.avatar,
  }) : super._();

  factory _$PublicAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicAccountImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'follower_count')
  final int followerCount;
  @override
  @JsonKey(name: 'identity_verified')
  final bool identityVerified;

  /// Quan hệ của *người đọc* với account này — false khi đọc ẩn danh và trên
  /// trang của chính mình. Nút theo dõi không có nó thì không biết vẽ chiều nào.
  @override
  @JsonKey(name: 'following')
  final bool following;
  @override
  @JsonKey(name: 'created_at')
  final String createdAt;
  @override
  final String? description;
  @override
  final Resource? avatar;

  @override
  String toString() {
    return 'PublicAccount(id: $id, name: $name, followerCount: $followerCount, identityVerified: $identityVerified, following: $following, createdAt: $createdAt, description: $description, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicAccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.followerCount, followerCount) ||
                other.followerCount == followerCount) &&
            (identical(other.identityVerified, identityVerified) ||
                other.identityVerified == identityVerified) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    followerCount,
    identityVerified,
    following,
    createdAt,
    description,
    avatar,
  );

  /// Create a copy of PublicAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicAccountImplCopyWith<_$PublicAccountImpl> get copyWith =>
      __$$PublicAccountImplCopyWithImpl<_$PublicAccountImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicAccountImplToJson(this);
  }
}

abstract class _PublicAccount extends PublicAccount {
  const factory _PublicAccount({
    required final String id,
    required final String name,
    @JsonKey(name: 'follower_count') required final int followerCount,
    @JsonKey(name: 'identity_verified') required final bool identityVerified,
    @JsonKey(name: 'following') required final bool following,
    @JsonKey(name: 'created_at') required final String createdAt,
    final String? description,
    final Resource? avatar,
  }) = _$PublicAccountImpl;
  const _PublicAccount._() : super._();

  factory _PublicAccount.fromJson(Map<String, dynamic> json) =
      _$PublicAccountImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'follower_count')
  int get followerCount;
  @override
  @JsonKey(name: 'identity_verified')
  bool get identityVerified;

  /// Quan hệ của *người đọc* với account này — false khi đọc ẩn danh và trên
  /// trang của chính mình. Nút theo dõi không có nó thì không biết vẽ chiều nào.
  @override
  @JsonKey(name: 'following')
  bool get following;
  @override
  @JsonKey(name: 'created_at')
  String get createdAt;
  @override
  String? get description;
  @override
  Resource? get avatar;

  /// Create a copy of PublicAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicAccountImplCopyWith<_$PublicAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
