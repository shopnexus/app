// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile {

 String get name; String get country; String get locale; String get timezone;@JsonKey(name: 'created_at') String get createdAt; Resource? get avatar;@JsonKey(name: 'date_of_birth') String? get dateOfBirth; String? get description; String? get gender;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.description, description) || other.description == description)&&(identical(other.gender, gender) || other.gender == gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,country,locale,timezone,createdAt,avatar,dateOfBirth,description,gender);

@override
String toString() {
  return 'Profile(name: $name, country: $country, locale: $locale, timezone: $timezone, createdAt: $createdAt, avatar: $avatar, dateOfBirth: $dateOfBirth, description: $description, gender: $gender)';
}


}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
@useResult
$Res call({
 String name, String country, String locale, String timezone,@JsonKey(name: 'created_at') String createdAt, Resource? avatar,@JsonKey(name: 'date_of_birth') String? dateOfBirth, String? description, String? gender
});




}
/// @nodoc
class _$ProfileCopyWithImpl<$Res>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? country = null,Object? locale = null,Object? timezone = null,Object? createdAt = null,Object? avatar = freezed,Object? dateOfBirth = freezed,Object? description = freezed,Object? gender = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Resource?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Profile].
extension ProfilePatterns on Profile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profile value)  $default,){
final _that = this;
switch (_that) {
case _Profile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profile value)?  $default,){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String country,  String locale,  String timezone, @JsonKey(name: 'created_at')  String createdAt,  Resource? avatar, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? description,  String? gender)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.name,_that.country,_that.locale,_that.timezone,_that.createdAt,_that.avatar,_that.dateOfBirth,_that.description,_that.gender);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String country,  String locale,  String timezone, @JsonKey(name: 'created_at')  String createdAt,  Resource? avatar, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? description,  String? gender)  $default,) {final _that = this;
switch (_that) {
case _Profile():
return $default(_that.name,_that.country,_that.locale,_that.timezone,_that.createdAt,_that.avatar,_that.dateOfBirth,_that.description,_that.gender);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String country,  String locale,  String timezone, @JsonKey(name: 'created_at')  String createdAt,  Resource? avatar, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? description,  String? gender)?  $default,) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.name,_that.country,_that.locale,_that.timezone,_that.createdAt,_that.avatar,_that.dateOfBirth,_that.description,_that.gender);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Profile implements Profile {
  const _Profile({required this.name, required this.country, required this.locale, required this.timezone, @JsonKey(name: 'created_at') required this.createdAt, this.avatar, @JsonKey(name: 'date_of_birth') this.dateOfBirth, this.description, this.gender});
  factory _Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

@override final  String name;
@override final  String country;
@override final  String locale;
@override final  String timezone;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override final  Resource? avatar;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override final  String? description;
@override final  String? gender;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCopyWith<_Profile> get copyWith => __$ProfileCopyWithImpl<_Profile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.description, description) || other.description == description)&&(identical(other.gender, gender) || other.gender == gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,country,locale,timezone,createdAt,avatar,dateOfBirth,description,gender);

@override
String toString() {
  return 'Profile(name: $name, country: $country, locale: $locale, timezone: $timezone, createdAt: $createdAt, avatar: $avatar, dateOfBirth: $dateOfBirth, description: $description, gender: $gender)';
}


}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) = __$ProfileCopyWithImpl;
@override @useResult
$Res call({
 String name, String country, String locale, String timezone,@JsonKey(name: 'created_at') String createdAt, Resource? avatar,@JsonKey(name: 'date_of_birth') String? dateOfBirth, String? description, String? gender
});




}
/// @nodoc
class __$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? country = null,Object? locale = null,Object? timezone = null,Object? createdAt = null,Object? avatar = freezed,Object? dateOfBirth = freezed,Object? description = freezed,Object? gender = freezed,}) {
  return _then(_Profile(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Resource?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Me {

 String get id;@JsonKey(name: 'created_at') String get createdAt; String? get email;@JsonKey(name: 'email_verified') bool get emailVerified;@JsonKey(name: 'has_password') bool get hasPassword;@JsonKey(name: 'identity_verified') bool get identityVerified; String? get phone; Profile? get profile; String get role; String get status; String? get username;
/// Create a copy of Me
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MeCopyWith<Me> get copyWith => _$MeCopyWithImpl<Me>(this as Me, _$identity);

  /// Serializes this Me to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Me&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.hasPassword, hasPassword) || other.hasPassword == hasPassword)&&(identical(other.identityVerified, identityVerified) || other.identityVerified == identityVerified)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,email,emailVerified,hasPassword,identityVerified,phone,profile,role,status,username);

@override
String toString() {
  return 'Me(id: $id, createdAt: $createdAt, email: $email, emailVerified: $emailVerified, hasPassword: $hasPassword, identityVerified: $identityVerified, phone: $phone, profile: $profile, role: $role, status: $status, username: $username)';
}


}

/// @nodoc
abstract mixin class $MeCopyWith<$Res>  {
  factory $MeCopyWith(Me value, $Res Function(Me) _then) = _$MeCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'created_at') String createdAt, String? email,@JsonKey(name: 'email_verified') bool emailVerified,@JsonKey(name: 'has_password') bool hasPassword,@JsonKey(name: 'identity_verified') bool identityVerified, String? phone, Profile? profile, String role, String status, String? username
});


$ProfileCopyWith<$Res>? get profile;

}
/// @nodoc
class _$MeCopyWithImpl<$Res>
    implements $MeCopyWith<$Res> {
  _$MeCopyWithImpl(this._self, this._then);

  final Me _self;
  final $Res Function(Me) _then;

/// Create a copy of Me
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? email = freezed,Object? emailVerified = null,Object? hasPassword = null,Object? identityVerified = null,Object? phone = freezed,Object? profile = freezed,Object? role = null,Object? status = null,Object? username = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,hasPassword: null == hasPassword ? _self.hasPassword : hasPassword // ignore: cast_nullable_to_non_nullable
as bool,identityVerified: null == identityVerified ? _self.identityVerified : identityVerified // ignore: cast_nullable_to_non_nullable
as bool,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Me
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $ProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [Me].
extension MePatterns on Me {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Me value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Me() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Me value)  $default,){
final _that = this;
switch (_that) {
case _Me():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Me value)?  $default,){
final _that = this;
switch (_that) {
case _Me() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'created_at')  String createdAt,  String? email, @JsonKey(name: 'email_verified')  bool emailVerified, @JsonKey(name: 'has_password')  bool hasPassword, @JsonKey(name: 'identity_verified')  bool identityVerified,  String? phone,  Profile? profile,  String role,  String status,  String? username)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Me() when $default != null:
return $default(_that.id,_that.createdAt,_that.email,_that.emailVerified,_that.hasPassword,_that.identityVerified,_that.phone,_that.profile,_that.role,_that.status,_that.username);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'created_at')  String createdAt,  String? email, @JsonKey(name: 'email_verified')  bool emailVerified, @JsonKey(name: 'has_password')  bool hasPassword, @JsonKey(name: 'identity_verified')  bool identityVerified,  String? phone,  Profile? profile,  String role,  String status,  String? username)  $default,) {final _that = this;
switch (_that) {
case _Me():
return $default(_that.id,_that.createdAt,_that.email,_that.emailVerified,_that.hasPassword,_that.identityVerified,_that.phone,_that.profile,_that.role,_that.status,_that.username);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'created_at')  String createdAt,  String? email, @JsonKey(name: 'email_verified')  bool emailVerified, @JsonKey(name: 'has_password')  bool hasPassword, @JsonKey(name: 'identity_verified')  bool identityVerified,  String? phone,  Profile? profile,  String role,  String status,  String? username)?  $default,) {final _that = this;
switch (_that) {
case _Me() when $default != null:
return $default(_that.id,_that.createdAt,_that.email,_that.emailVerified,_that.hasPassword,_that.identityVerified,_that.phone,_that.profile,_that.role,_that.status,_that.username);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Me extends Me {
  const _Me({required this.id, @JsonKey(name: 'created_at') required this.createdAt, this.email, @JsonKey(name: 'email_verified') required this.emailVerified, @JsonKey(name: 'has_password') required this.hasPassword, @JsonKey(name: 'identity_verified') required this.identityVerified, this.phone, this.profile, required this.role, required this.status, this.username}): super._();
  factory _Me.fromJson(Map<String, dynamic> json) => _$MeFromJson(json);

@override final  String id;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override final  String? email;
@override@JsonKey(name: 'email_verified') final  bool emailVerified;
@override@JsonKey(name: 'has_password') final  bool hasPassword;
@override@JsonKey(name: 'identity_verified') final  bool identityVerified;
@override final  String? phone;
@override final  Profile? profile;
@override final  String role;
@override final  String status;
@override final  String? username;

/// Create a copy of Me
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MeCopyWith<_Me> get copyWith => __$MeCopyWithImpl<_Me>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Me&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.email, email) || other.email == email)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.hasPassword, hasPassword) || other.hasPassword == hasPassword)&&(identical(other.identityVerified, identityVerified) || other.identityVerified == identityVerified)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.username, username) || other.username == username));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,email,emailVerified,hasPassword,identityVerified,phone,profile,role,status,username);

@override
String toString() {
  return 'Me(id: $id, createdAt: $createdAt, email: $email, emailVerified: $emailVerified, hasPassword: $hasPassword, identityVerified: $identityVerified, phone: $phone, profile: $profile, role: $role, status: $status, username: $username)';
}


}

/// @nodoc
abstract mixin class _$MeCopyWith<$Res> implements $MeCopyWith<$Res> {
  factory _$MeCopyWith(_Me value, $Res Function(_Me) _then) = __$MeCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'created_at') String createdAt, String? email,@JsonKey(name: 'email_verified') bool emailVerified,@JsonKey(name: 'has_password') bool hasPassword,@JsonKey(name: 'identity_verified') bool identityVerified, String? phone, Profile? profile, String role, String status, String? username
});


@override $ProfileCopyWith<$Res>? get profile;

}
/// @nodoc
class __$MeCopyWithImpl<$Res>
    implements _$MeCopyWith<$Res> {
  __$MeCopyWithImpl(this._self, this._then);

  final _Me _self;
  final $Res Function(_Me) _then;

/// Create a copy of Me
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? email = freezed,Object? emailVerified = null,Object? hasPassword = null,Object? identityVerified = null,Object? phone = freezed,Object? profile = freezed,Object? role = null,Object? status = null,Object? username = freezed,}) {
  return _then(_Me(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,hasPassword: null == hasPassword ? _self.hasPassword : hasPassword // ignore: cast_nullable_to_non_nullable
as bool,identityVerified: null == identityVerified ? _self.identityVerified : identityVerified // ignore: cast_nullable_to_non_nullable
as bool,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile?,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Me
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $ProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// @nodoc
mixin _$PublicAccount {

 String get id; String get name;@JsonKey(name: 'follower_count') int get followerCount;@JsonKey(name: 'identity_verified') bool get identityVerified;@JsonKey(name: 'created_at') String get createdAt; String? get description; Resource? get avatar;
/// Create a copy of PublicAccount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PublicAccountCopyWith<PublicAccount> get copyWith => _$PublicAccountCopyWithImpl<PublicAccount>(this as PublicAccount, _$identity);

  /// Serializes this PublicAccount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PublicAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&(identical(other.identityVerified, identityVerified) || other.identityVerified == identityVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,followerCount,identityVerified,createdAt,description,avatar);

@override
String toString() {
  return 'PublicAccount(id: $id, name: $name, followerCount: $followerCount, identityVerified: $identityVerified, createdAt: $createdAt, description: $description, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $PublicAccountCopyWith<$Res>  {
  factory $PublicAccountCopyWith(PublicAccount value, $Res Function(PublicAccount) _then) = _$PublicAccountCopyWithImpl;
@useResult
$Res call({
 String id, String name,@JsonKey(name: 'follower_count') int followerCount,@JsonKey(name: 'identity_verified') bool identityVerified,@JsonKey(name: 'created_at') String createdAt, String? description, Resource? avatar
});




}
/// @nodoc
class _$PublicAccountCopyWithImpl<$Res>
    implements $PublicAccountCopyWith<$Res> {
  _$PublicAccountCopyWithImpl(this._self, this._then);

  final PublicAccount _self;
  final $Res Function(PublicAccount) _then;

/// Create a copy of PublicAccount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? followerCount = null,Object? identityVerified = null,Object? createdAt = null,Object? description = freezed,Object? avatar = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,followerCount: null == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int,identityVerified: null == identityVerified ? _self.identityVerified : identityVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Resource?,
  ));
}

}


/// Adds pattern-matching-related methods to [PublicAccount].
extension PublicAccountPatterns on PublicAccount {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PublicAccount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PublicAccount() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PublicAccount value)  $default,){
final _that = this;
switch (_that) {
case _PublicAccount():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PublicAccount value)?  $default,){
final _that = this;
switch (_that) {
case _PublicAccount() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'follower_count')  int followerCount, @JsonKey(name: 'identity_verified')  bool identityVerified, @JsonKey(name: 'created_at')  String createdAt,  String? description,  Resource? avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PublicAccount() when $default != null:
return $default(_that.id,_that.name,_that.followerCount,_that.identityVerified,_that.createdAt,_that.description,_that.avatar);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name, @JsonKey(name: 'follower_count')  int followerCount, @JsonKey(name: 'identity_verified')  bool identityVerified, @JsonKey(name: 'created_at')  String createdAt,  String? description,  Resource? avatar)  $default,) {final _that = this;
switch (_that) {
case _PublicAccount():
return $default(_that.id,_that.name,_that.followerCount,_that.identityVerified,_that.createdAt,_that.description,_that.avatar);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name, @JsonKey(name: 'follower_count')  int followerCount, @JsonKey(name: 'identity_verified')  bool identityVerified, @JsonKey(name: 'created_at')  String createdAt,  String? description,  Resource? avatar)?  $default,) {final _that = this;
switch (_that) {
case _PublicAccount() when $default != null:
return $default(_that.id,_that.name,_that.followerCount,_that.identityVerified,_that.createdAt,_that.description,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PublicAccount extends PublicAccount {
  const _PublicAccount({required this.id, required this.name, @JsonKey(name: 'follower_count') required this.followerCount, @JsonKey(name: 'identity_verified') required this.identityVerified, @JsonKey(name: 'created_at') required this.createdAt, this.description, this.avatar}): super._();
  factory _PublicAccount.fromJson(Map<String, dynamic> json) => _$PublicAccountFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey(name: 'follower_count') final  int followerCount;
@override@JsonKey(name: 'identity_verified') final  bool identityVerified;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override final  String? description;
@override final  Resource? avatar;

/// Create a copy of PublicAccount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PublicAccountCopyWith<_PublicAccount> get copyWith => __$PublicAccountCopyWithImpl<_PublicAccount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PublicAccountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PublicAccount&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.followerCount, followerCount) || other.followerCount == followerCount)&&(identical(other.identityVerified, identityVerified) || other.identityVerified == identityVerified)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.description, description) || other.description == description)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,followerCount,identityVerified,createdAt,description,avatar);

@override
String toString() {
  return 'PublicAccount(id: $id, name: $name, followerCount: $followerCount, identityVerified: $identityVerified, createdAt: $createdAt, description: $description, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$PublicAccountCopyWith<$Res> implements $PublicAccountCopyWith<$Res> {
  factory _$PublicAccountCopyWith(_PublicAccount value, $Res Function(_PublicAccount) _then) = __$PublicAccountCopyWithImpl;
@override @useResult
$Res call({
 String id, String name,@JsonKey(name: 'follower_count') int followerCount,@JsonKey(name: 'identity_verified') bool identityVerified,@JsonKey(name: 'created_at') String createdAt, String? description, Resource? avatar
});




}
/// @nodoc
class __$PublicAccountCopyWithImpl<$Res>
    implements _$PublicAccountCopyWith<$Res> {
  __$PublicAccountCopyWithImpl(this._self, this._then);

  final _PublicAccount _self;
  final $Res Function(_PublicAccount) _then;

/// Create a copy of PublicAccount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? followerCount = null,Object? identityVerified = null,Object? createdAt = null,Object? description = freezed,Object? avatar = freezed,}) {
  return _then(_PublicAccount(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,followerCount: null == followerCount ? _self.followerCount : followerCount // ignore: cast_nullable_to_non_nullable
as int,identityVerified: null == identityVerified ? _self.identityVerified : identityVerified // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Resource?,
  ));
}


}

// dart format on
