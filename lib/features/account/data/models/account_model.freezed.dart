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
mixin _$AccountProfile {

 String get id;@JsonKey(name: 'date_created') String get dateCreated;@JsonKey(name: 'date_updated') String get dateUpdated; String get status; String get role; String? get phone; String? get email; String? get username; int? get gender; String? get name;@JsonKey(name: 'date_of_birth') String? get dateOfBirth;@JsonKey(name: 'email_verified') bool get emailVerified;@JsonKey(name: 'phone_verified') bool get phoneVerified;@JsonKey(name: 'default_contact_id') String? get defaultContactId;@JsonKey(name: 'avatar_url') String? get avatarUrl; String? get description; String get country; String get currency;@JsonKey(name: 'internal_balance') int get internalBalance;
/// Create a copy of AccountProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountProfileCopyWith<AccountProfile> get copyWith => _$AccountProfileCopyWithImpl<AccountProfile>(this as AccountProfile, _$identity);

  /// Serializes this AccountProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateUpdated, dateUpdated) || other.dateUpdated == dateUpdated)&&(identical(other.status, status) || other.status == status)&&(identical(other.role, role) || other.role == role)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.name, name) || other.name == name)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.defaultContactId, defaultContactId) || other.defaultContactId == defaultContactId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.country, country) || other.country == country)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.internalBalance, internalBalance) || other.internalBalance == internalBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,dateCreated,dateUpdated,status,role,phone,email,username,gender,name,dateOfBirth,emailVerified,phoneVerified,defaultContactId,avatarUrl,description,country,currency,internalBalance]);

@override
String toString() {
  return 'AccountProfile(id: $id, dateCreated: $dateCreated, dateUpdated: $dateUpdated, status: $status, role: $role, phone: $phone, email: $email, username: $username, gender: $gender, name: $name, dateOfBirth: $dateOfBirth, emailVerified: $emailVerified, phoneVerified: $phoneVerified, defaultContactId: $defaultContactId, avatarUrl: $avatarUrl, description: $description, country: $country, currency: $currency, internalBalance: $internalBalance)';
}


}

/// @nodoc
abstract mixin class $AccountProfileCopyWith<$Res>  {
  factory $AccountProfileCopyWith(AccountProfile value, $Res Function(AccountProfile) _then) = _$AccountProfileCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'date_created') String dateCreated,@JsonKey(name: 'date_updated') String dateUpdated, String status, String role, String? phone, String? email, String? username, int? gender, String? name,@JsonKey(name: 'date_of_birth') String? dateOfBirth,@JsonKey(name: 'email_verified') bool emailVerified,@JsonKey(name: 'phone_verified') bool phoneVerified,@JsonKey(name: 'default_contact_id') String? defaultContactId,@JsonKey(name: 'avatar_url') String? avatarUrl, String? description, String country, String currency,@JsonKey(name: 'internal_balance') int internalBalance
});




}
/// @nodoc
class _$AccountProfileCopyWithImpl<$Res>
    implements $AccountProfileCopyWith<$Res> {
  _$AccountProfileCopyWithImpl(this._self, this._then);

  final AccountProfile _self;
  final $Res Function(AccountProfile) _then;

/// Create a copy of AccountProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? dateCreated = null,Object? dateUpdated = null,Object? status = null,Object? role = null,Object? phone = freezed,Object? email = freezed,Object? username = freezed,Object? gender = freezed,Object? name = freezed,Object? dateOfBirth = freezed,Object? emailVerified = null,Object? phoneVerified = null,Object? defaultContactId = freezed,Object? avatarUrl = freezed,Object? description = freezed,Object? country = null,Object? currency = null,Object? internalBalance = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,dateUpdated: null == dateUpdated ? _self.dateUpdated : dateUpdated // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,defaultContactId: freezed == defaultContactId ? _self.defaultContactId : defaultContactId // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,internalBalance: null == internalBalance ? _self.internalBalance : internalBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountProfile].
extension AccountProfilePatterns on AccountProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountProfile value)  $default,){
final _that = this;
switch (_that) {
case _AccountProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountProfile value)?  $default,){
final _that = this;
switch (_that) {
case _AccountProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'date_updated')  String dateUpdated,  String status,  String role,  String? phone,  String? email,  String? username,  int? gender,  String? name, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'email_verified')  bool emailVerified, @JsonKey(name: 'phone_verified')  bool phoneVerified, @JsonKey(name: 'default_contact_id')  String? defaultContactId, @JsonKey(name: 'avatar_url')  String? avatarUrl,  String? description,  String country,  String currency, @JsonKey(name: 'internal_balance')  int internalBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountProfile() when $default != null:
return $default(_that.id,_that.dateCreated,_that.dateUpdated,_that.status,_that.role,_that.phone,_that.email,_that.username,_that.gender,_that.name,_that.dateOfBirth,_that.emailVerified,_that.phoneVerified,_that.defaultContactId,_that.avatarUrl,_that.description,_that.country,_that.currency,_that.internalBalance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'date_updated')  String dateUpdated,  String status,  String role,  String? phone,  String? email,  String? username,  int? gender,  String? name, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'email_verified')  bool emailVerified, @JsonKey(name: 'phone_verified')  bool phoneVerified, @JsonKey(name: 'default_contact_id')  String? defaultContactId, @JsonKey(name: 'avatar_url')  String? avatarUrl,  String? description,  String country,  String currency, @JsonKey(name: 'internal_balance')  int internalBalance)  $default,) {final _that = this;
switch (_that) {
case _AccountProfile():
return $default(_that.id,_that.dateCreated,_that.dateUpdated,_that.status,_that.role,_that.phone,_that.email,_that.username,_that.gender,_that.name,_that.dateOfBirth,_that.emailVerified,_that.phoneVerified,_that.defaultContactId,_that.avatarUrl,_that.description,_that.country,_that.currency,_that.internalBalance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'date_updated')  String dateUpdated,  String status,  String role,  String? phone,  String? email,  String? username,  int? gender,  String? name, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'email_verified')  bool emailVerified, @JsonKey(name: 'phone_verified')  bool phoneVerified, @JsonKey(name: 'default_contact_id')  String? defaultContactId, @JsonKey(name: 'avatar_url')  String? avatarUrl,  String? description,  String country,  String currency, @JsonKey(name: 'internal_balance')  int internalBalance)?  $default,) {final _that = this;
switch (_that) {
case _AccountProfile() when $default != null:
return $default(_that.id,_that.dateCreated,_that.dateUpdated,_that.status,_that.role,_that.phone,_that.email,_that.username,_that.gender,_that.name,_that.dateOfBirth,_that.emailVerified,_that.phoneVerified,_that.defaultContactId,_that.avatarUrl,_that.description,_that.country,_that.currency,_that.internalBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountProfile implements AccountProfile {
  const _AccountProfile({required this.id, @JsonKey(name: 'date_created') required this.dateCreated, @JsonKey(name: 'date_updated') required this.dateUpdated, required this.status, required this.role, this.phone, this.email, this.username, this.gender, this.name, @JsonKey(name: 'date_of_birth') this.dateOfBirth, @JsonKey(name: 'email_verified') required this.emailVerified, @JsonKey(name: 'phone_verified') required this.phoneVerified, @JsonKey(name: 'default_contact_id') this.defaultContactId, @JsonKey(name: 'avatar_url') this.avatarUrl, this.description, required this.country, required this.currency, @JsonKey(name: 'internal_balance') required this.internalBalance});
  factory _AccountProfile.fromJson(Map<String, dynamic> json) => _$AccountProfileFromJson(json);

@override final  String id;
@override@JsonKey(name: 'date_created') final  String dateCreated;
@override@JsonKey(name: 'date_updated') final  String dateUpdated;
@override final  String status;
@override final  String role;
@override final  String? phone;
@override final  String? email;
@override final  String? username;
@override final  int? gender;
@override final  String? name;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override@JsonKey(name: 'email_verified') final  bool emailVerified;
@override@JsonKey(name: 'phone_verified') final  bool phoneVerified;
@override@JsonKey(name: 'default_contact_id') final  String? defaultContactId;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override final  String? description;
@override final  String country;
@override final  String currency;
@override@JsonKey(name: 'internal_balance') final  int internalBalance;

/// Create a copy of AccountProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountProfileCopyWith<_AccountProfile> get copyWith => __$AccountProfileCopyWithImpl<_AccountProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateUpdated, dateUpdated) || other.dateUpdated == dateUpdated)&&(identical(other.status, status) || other.status == status)&&(identical(other.role, role) || other.role == role)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.username, username) || other.username == username)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.name, name) || other.name == name)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.emailVerified, emailVerified) || other.emailVerified == emailVerified)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.defaultContactId, defaultContactId) || other.defaultContactId == defaultContactId)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.description, description) || other.description == description)&&(identical(other.country, country) || other.country == country)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.internalBalance, internalBalance) || other.internalBalance == internalBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,dateCreated,dateUpdated,status,role,phone,email,username,gender,name,dateOfBirth,emailVerified,phoneVerified,defaultContactId,avatarUrl,description,country,currency,internalBalance]);

@override
String toString() {
  return 'AccountProfile(id: $id, dateCreated: $dateCreated, dateUpdated: $dateUpdated, status: $status, role: $role, phone: $phone, email: $email, username: $username, gender: $gender, name: $name, dateOfBirth: $dateOfBirth, emailVerified: $emailVerified, phoneVerified: $phoneVerified, defaultContactId: $defaultContactId, avatarUrl: $avatarUrl, description: $description, country: $country, currency: $currency, internalBalance: $internalBalance)';
}


}

/// @nodoc
abstract mixin class _$AccountProfileCopyWith<$Res> implements $AccountProfileCopyWith<$Res> {
  factory _$AccountProfileCopyWith(_AccountProfile value, $Res Function(_AccountProfile) _then) = __$AccountProfileCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'date_created') String dateCreated,@JsonKey(name: 'date_updated') String dateUpdated, String status, String role, String? phone, String? email, String? username, int? gender, String? name,@JsonKey(name: 'date_of_birth') String? dateOfBirth,@JsonKey(name: 'email_verified') bool emailVerified,@JsonKey(name: 'phone_verified') bool phoneVerified,@JsonKey(name: 'default_contact_id') String? defaultContactId,@JsonKey(name: 'avatar_url') String? avatarUrl, String? description, String country, String currency,@JsonKey(name: 'internal_balance') int internalBalance
});




}
/// @nodoc
class __$AccountProfileCopyWithImpl<$Res>
    implements _$AccountProfileCopyWith<$Res> {
  __$AccountProfileCopyWithImpl(this._self, this._then);

  final _AccountProfile _self;
  final $Res Function(_AccountProfile) _then;

/// Create a copy of AccountProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? dateCreated = null,Object? dateUpdated = null,Object? status = null,Object? role = null,Object? phone = freezed,Object? email = freezed,Object? username = freezed,Object? gender = freezed,Object? name = freezed,Object? dateOfBirth = freezed,Object? emailVerified = null,Object? phoneVerified = null,Object? defaultContactId = freezed,Object? avatarUrl = freezed,Object? description = freezed,Object? country = null,Object? currency = null,Object? internalBalance = null,}) {
  return _then(_AccountProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,dateUpdated: null == dateUpdated ? _self.dateUpdated : dateUpdated // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,emailVerified: null == emailVerified ? _self.emailVerified : emailVerified // ignore: cast_nullable_to_non_nullable
as bool,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,defaultContactId: freezed == defaultContactId ? _self.defaultContactId : defaultContactId // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,internalBalance: null == internalBalance ? _self.internalBalance : internalBalance // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$UpdateProfileRequest {

 String? get username; String? get phone; String? get email; String? get gender;// 'Male' | 'Female' | 'Other'
 String? get name;@JsonKey(name: 'date_of_birth') String? get dateOfBirth;@JsonKey(name: 'avatar_rs_id') String? get avatarRsId;@JsonKey(name: 'default_contact_id') String? get defaultContactId; String? get description;
/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileRequestCopyWith<UpdateProfileRequest> get copyWith => _$UpdateProfileRequestCopyWithImpl<UpdateProfileRequest>(this as UpdateProfileRequest, _$identity);

  /// Serializes this UpdateProfileRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.name, name) || other.name == name)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.avatarRsId, avatarRsId) || other.avatarRsId == avatarRsId)&&(identical(other.defaultContactId, defaultContactId) || other.defaultContactId == defaultContactId)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,phone,email,gender,name,dateOfBirth,avatarRsId,defaultContactId,description);

@override
String toString() {
  return 'UpdateProfileRequest(username: $username, phone: $phone, email: $email, gender: $gender, name: $name, dateOfBirth: $dateOfBirth, avatarRsId: $avatarRsId, defaultContactId: $defaultContactId, description: $description)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileRequestCopyWith<$Res>  {
  factory $UpdateProfileRequestCopyWith(UpdateProfileRequest value, $Res Function(UpdateProfileRequest) _then) = _$UpdateProfileRequestCopyWithImpl;
@useResult
$Res call({
 String? username, String? phone, String? email, String? gender, String? name,@JsonKey(name: 'date_of_birth') String? dateOfBirth,@JsonKey(name: 'avatar_rs_id') String? avatarRsId,@JsonKey(name: 'default_contact_id') String? defaultContactId, String? description
});




}
/// @nodoc
class _$UpdateProfileRequestCopyWithImpl<$Res>
    implements $UpdateProfileRequestCopyWith<$Res> {
  _$UpdateProfileRequestCopyWithImpl(this._self, this._then);

  final UpdateProfileRequest _self;
  final $Res Function(UpdateProfileRequest) _then;

/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? username = freezed,Object? phone = freezed,Object? email = freezed,Object? gender = freezed,Object? name = freezed,Object? dateOfBirth = freezed,Object? avatarRsId = freezed,Object? defaultContactId = freezed,Object? description = freezed,}) {
  return _then(_self.copyWith(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,avatarRsId: freezed == avatarRsId ? _self.avatarRsId : avatarRsId // ignore: cast_nullable_to_non_nullable
as String?,defaultContactId: freezed == defaultContactId ? _self.defaultContactId : defaultContactId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateProfileRequest].
extension UpdateProfileRequestPatterns on UpdateProfileRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? username,  String? phone,  String? email,  String? gender,  String? name, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'avatar_rs_id')  String? avatarRsId, @JsonKey(name: 'default_contact_id')  String? defaultContactId,  String? description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
return $default(_that.username,_that.phone,_that.email,_that.gender,_that.name,_that.dateOfBirth,_that.avatarRsId,_that.defaultContactId,_that.description);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? username,  String? phone,  String? email,  String? gender,  String? name, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'avatar_rs_id')  String? avatarRsId, @JsonKey(name: 'default_contact_id')  String? defaultContactId,  String? description)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileRequest():
return $default(_that.username,_that.phone,_that.email,_that.gender,_that.name,_that.dateOfBirth,_that.avatarRsId,_that.defaultContactId,_that.description);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? username,  String? phone,  String? email,  String? gender,  String? name, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'avatar_rs_id')  String? avatarRsId, @JsonKey(name: 'default_contact_id')  String? defaultContactId,  String? description)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileRequest() when $default != null:
return $default(_that.username,_that.phone,_that.email,_that.gender,_that.name,_that.dateOfBirth,_that.avatarRsId,_that.defaultContactId,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateProfileRequest implements UpdateProfileRequest {
  const _UpdateProfileRequest({this.username, this.phone, this.email, this.gender, this.name, @JsonKey(name: 'date_of_birth') this.dateOfBirth, @JsonKey(name: 'avatar_rs_id') this.avatarRsId, @JsonKey(name: 'default_contact_id') this.defaultContactId, this.description});
  factory _UpdateProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdateProfileRequestFromJson(json);

@override final  String? username;
@override final  String? phone;
@override final  String? email;
@override final  String? gender;
// 'Male' | 'Female' | 'Other'
@override final  String? name;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override@JsonKey(name: 'avatar_rs_id') final  String? avatarRsId;
@override@JsonKey(name: 'default_contact_id') final  String? defaultContactId;
@override final  String? description;

/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileRequestCopyWith<_UpdateProfileRequest> get copyWith => __$UpdateProfileRequestCopyWithImpl<_UpdateProfileRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateProfileRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileRequest&&(identical(other.username, username) || other.username == username)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.email, email) || other.email == email)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.name, name) || other.name == name)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.avatarRsId, avatarRsId) || other.avatarRsId == avatarRsId)&&(identical(other.defaultContactId, defaultContactId) || other.defaultContactId == defaultContactId)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,username,phone,email,gender,name,dateOfBirth,avatarRsId,defaultContactId,description);

@override
String toString() {
  return 'UpdateProfileRequest(username: $username, phone: $phone, email: $email, gender: $gender, name: $name, dateOfBirth: $dateOfBirth, avatarRsId: $avatarRsId, defaultContactId: $defaultContactId, description: $description)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileRequestCopyWith<$Res> implements $UpdateProfileRequestCopyWith<$Res> {
  factory _$UpdateProfileRequestCopyWith(_UpdateProfileRequest value, $Res Function(_UpdateProfileRequest) _then) = __$UpdateProfileRequestCopyWithImpl;
@override @useResult
$Res call({
 String? username, String? phone, String? email, String? gender, String? name,@JsonKey(name: 'date_of_birth') String? dateOfBirth,@JsonKey(name: 'avatar_rs_id') String? avatarRsId,@JsonKey(name: 'default_contact_id') String? defaultContactId, String? description
});




}
/// @nodoc
class __$UpdateProfileRequestCopyWithImpl<$Res>
    implements _$UpdateProfileRequestCopyWith<$Res> {
  __$UpdateProfileRequestCopyWithImpl(this._self, this._then);

  final _UpdateProfileRequest _self;
  final $Res Function(_UpdateProfileRequest) _then;

/// Create a copy of UpdateProfileRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? username = freezed,Object? phone = freezed,Object? email = freezed,Object? gender = freezed,Object? name = freezed,Object? dateOfBirth = freezed,Object? avatarRsId = freezed,Object? defaultContactId = freezed,Object? description = freezed,}) {
  return _then(_UpdateProfileRequest(
username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,avatarRsId: freezed == avatarRsId ? _self.avatarRsId : avatarRsId // ignore: cast_nullable_to_non_nullable
as String?,defaultContactId: freezed == defaultContactId ? _self.defaultContactId : defaultContactId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UpdateCountryRequest {

 String get country;
/// Create a copy of UpdateCountryRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCountryRequestCopyWith<UpdateCountryRequest> get copyWith => _$UpdateCountryRequestCopyWithImpl<UpdateCountryRequest>(this as UpdateCountryRequest, _$identity);

  /// Serializes this UpdateCountryRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCountryRequest&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country);

@override
String toString() {
  return 'UpdateCountryRequest(country: $country)';
}


}

/// @nodoc
abstract mixin class $UpdateCountryRequestCopyWith<$Res>  {
  factory $UpdateCountryRequestCopyWith(UpdateCountryRequest value, $Res Function(UpdateCountryRequest) _then) = _$UpdateCountryRequestCopyWithImpl;
@useResult
$Res call({
 String country
});




}
/// @nodoc
class _$UpdateCountryRequestCopyWithImpl<$Res>
    implements $UpdateCountryRequestCopyWith<$Res> {
  _$UpdateCountryRequestCopyWithImpl(this._self, this._then);

  final UpdateCountryRequest _self;
  final $Res Function(UpdateCountryRequest) _then;

/// Create a copy of UpdateCountryRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? country = null,}) {
  return _then(_self.copyWith(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateCountryRequest].
extension UpdateCountryRequestPatterns on UpdateCountryRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCountryRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCountryRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCountryRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCountryRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCountryRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCountryRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String country)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCountryRequest() when $default != null:
return $default(_that.country);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String country)  $default,) {final _that = this;
switch (_that) {
case _UpdateCountryRequest():
return $default(_that.country);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String country)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCountryRequest() when $default != null:
return $default(_that.country);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateCountryRequest implements UpdateCountryRequest {
  const _UpdateCountryRequest({required this.country});
  factory _UpdateCountryRequest.fromJson(Map<String, dynamic> json) => _$UpdateCountryRequestFromJson(json);

@override final  String country;

/// Create a copy of UpdateCountryRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCountryRequestCopyWith<_UpdateCountryRequest> get copyWith => __$UpdateCountryRequestCopyWithImpl<_UpdateCountryRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateCountryRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCountryRequest&&(identical(other.country, country) || other.country == country));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country);

@override
String toString() {
  return 'UpdateCountryRequest(country: $country)';
}


}

/// @nodoc
abstract mixin class _$UpdateCountryRequestCopyWith<$Res> implements $UpdateCountryRequestCopyWith<$Res> {
  factory _$UpdateCountryRequestCopyWith(_UpdateCountryRequest value, $Res Function(_UpdateCountryRequest) _then) = __$UpdateCountryRequestCopyWithImpl;
@override @useResult
$Res call({
 String country
});




}
/// @nodoc
class __$UpdateCountryRequestCopyWithImpl<$Res>
    implements _$UpdateCountryRequestCopyWith<$Res> {
  __$UpdateCountryRequestCopyWithImpl(this._self, this._then);

  final _UpdateCountryRequest _self;
  final $Res Function(_UpdateCountryRequest) _then;

/// Create a copy of UpdateCountryRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? country = null,}) {
  return _then(_UpdateCountryRequest(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdateCountryResponse {

 String get country;@JsonKey(name: 'inferred_currency') String get inferredCurrency;
/// Create a copy of UpdateCountryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCountryResponseCopyWith<UpdateCountryResponse> get copyWith => _$UpdateCountryResponseCopyWithImpl<UpdateCountryResponse>(this as UpdateCountryResponse, _$identity);

  /// Serializes this UpdateCountryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCountryResponse&&(identical(other.country, country) || other.country == country)&&(identical(other.inferredCurrency, inferredCurrency) || other.inferredCurrency == inferredCurrency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country,inferredCurrency);

@override
String toString() {
  return 'UpdateCountryResponse(country: $country, inferredCurrency: $inferredCurrency)';
}


}

/// @nodoc
abstract mixin class $UpdateCountryResponseCopyWith<$Res>  {
  factory $UpdateCountryResponseCopyWith(UpdateCountryResponse value, $Res Function(UpdateCountryResponse) _then) = _$UpdateCountryResponseCopyWithImpl;
@useResult
$Res call({
 String country,@JsonKey(name: 'inferred_currency') String inferredCurrency
});




}
/// @nodoc
class _$UpdateCountryResponseCopyWithImpl<$Res>
    implements $UpdateCountryResponseCopyWith<$Res> {
  _$UpdateCountryResponseCopyWithImpl(this._self, this._then);

  final UpdateCountryResponse _self;
  final $Res Function(UpdateCountryResponse) _then;

/// Create a copy of UpdateCountryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? country = null,Object? inferredCurrency = null,}) {
  return _then(_self.copyWith(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,inferredCurrency: null == inferredCurrency ? _self.inferredCurrency : inferredCurrency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateCountryResponse].
extension UpdateCountryResponsePatterns on UpdateCountryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCountryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCountryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCountryResponse value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCountryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCountryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCountryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String country, @JsonKey(name: 'inferred_currency')  String inferredCurrency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCountryResponse() when $default != null:
return $default(_that.country,_that.inferredCurrency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String country, @JsonKey(name: 'inferred_currency')  String inferredCurrency)  $default,) {final _that = this;
switch (_that) {
case _UpdateCountryResponse():
return $default(_that.country,_that.inferredCurrency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String country, @JsonKey(name: 'inferred_currency')  String inferredCurrency)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCountryResponse() when $default != null:
return $default(_that.country,_that.inferredCurrency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateCountryResponse implements UpdateCountryResponse {
  const _UpdateCountryResponse({required this.country, @JsonKey(name: 'inferred_currency') required this.inferredCurrency});
  factory _UpdateCountryResponse.fromJson(Map<String, dynamic> json) => _$UpdateCountryResponseFromJson(json);

@override final  String country;
@override@JsonKey(name: 'inferred_currency') final  String inferredCurrency;

/// Create a copy of UpdateCountryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCountryResponseCopyWith<_UpdateCountryResponse> get copyWith => __$UpdateCountryResponseCopyWithImpl<_UpdateCountryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateCountryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCountryResponse&&(identical(other.country, country) || other.country == country)&&(identical(other.inferredCurrency, inferredCurrency) || other.inferredCurrency == inferredCurrency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,country,inferredCurrency);

@override
String toString() {
  return 'UpdateCountryResponse(country: $country, inferredCurrency: $inferredCurrency)';
}


}

/// @nodoc
abstract mixin class _$UpdateCountryResponseCopyWith<$Res> implements $UpdateCountryResponseCopyWith<$Res> {
  factory _$UpdateCountryResponseCopyWith(_UpdateCountryResponse value, $Res Function(_UpdateCountryResponse) _then) = __$UpdateCountryResponseCopyWithImpl;
@override @useResult
$Res call({
 String country,@JsonKey(name: 'inferred_currency') String inferredCurrency
});




}
/// @nodoc
class __$UpdateCountryResponseCopyWithImpl<$Res>
    implements _$UpdateCountryResponseCopyWith<$Res> {
  __$UpdateCountryResponseCopyWithImpl(this._self, this._then);

  final _UpdateCountryResponse _self;
  final $Res Function(_UpdateCountryResponse) _then;

/// Create a copy of UpdateCountryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? country = null,Object? inferredCurrency = null,}) {
  return _then(_UpdateCountryResponse(
country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,inferredCurrency: null == inferredCurrency ? _self.inferredCurrency : inferredCurrency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$Contact {

 String get id;@JsonKey(name: 'account_id') String get accountId;@JsonKey(name: 'full_name') String get fullName; String get phone;@JsonKey(name: 'phone_verified') bool get phoneVerified; String get address;@JsonKey(name: 'address_detail') String? get addressDetail;@JsonKey(name: 'address_type') String get addressType;// 'Home' | 'Office' | 'Other'
 double? get latitude; double? get longitude;@JsonKey(name: 'date_created') String get dateCreated;@JsonKey(name: 'date_updated') String get dateUpdated;
/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactCopyWith<Contact> get copyWith => _$ContactCopyWithImpl<Contact>(this as Contact, _$identity);

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contact&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressDetail, addressDetail) || other.addressDetail == addressDetail)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateUpdated, dateUpdated) || other.dateUpdated == dateUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,fullName,phone,phoneVerified,address,addressDetail,addressType,latitude,longitude,dateCreated,dateUpdated);

@override
String toString() {
  return 'Contact(id: $id, accountId: $accountId, fullName: $fullName, phone: $phone, phoneVerified: $phoneVerified, address: $address, addressDetail: $addressDetail, addressType: $addressType, latitude: $latitude, longitude: $longitude, dateCreated: $dateCreated, dateUpdated: $dateUpdated)';
}


}

/// @nodoc
abstract mixin class $ContactCopyWith<$Res>  {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) _then) = _$ContactCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'account_id') String accountId,@JsonKey(name: 'full_name') String fullName, String phone,@JsonKey(name: 'phone_verified') bool phoneVerified, String address,@JsonKey(name: 'address_detail') String? addressDetail,@JsonKey(name: 'address_type') String addressType, double? latitude, double? longitude,@JsonKey(name: 'date_created') String dateCreated,@JsonKey(name: 'date_updated') String dateUpdated
});




}
/// @nodoc
class _$ContactCopyWithImpl<$Res>
    implements $ContactCopyWith<$Res> {
  _$ContactCopyWithImpl(this._self, this._then);

  final Contact _self;
  final $Res Function(Contact) _then;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = null,Object? fullName = null,Object? phone = null,Object? phoneVerified = null,Object? address = null,Object? addressDetail = freezed,Object? addressType = null,Object? latitude = freezed,Object? longitude = freezed,Object? dateCreated = null,Object? dateUpdated = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,addressDetail: freezed == addressDetail ? _self.addressDetail : addressDetail // ignore: cast_nullable_to_non_nullable
as String?,addressType: null == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,dateUpdated: null == dateUpdated ? _self.dateUpdated : dateUpdated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Contact].
extension ContactPatterns on Contact {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Contact value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Contact() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Contact value)  $default,){
final _that = this;
switch (_that) {
case _Contact():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Contact value)?  $default,){
final _that = this;
switch (_that) {
case _Contact() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'account_id')  String accountId, @JsonKey(name: 'full_name')  String fullName,  String phone, @JsonKey(name: 'phone_verified')  bool phoneVerified,  String address, @JsonKey(name: 'address_detail')  String? addressDetail, @JsonKey(name: 'address_type')  String addressType,  double? latitude,  double? longitude, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'date_updated')  String dateUpdated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Contact() when $default != null:
return $default(_that.id,_that.accountId,_that.fullName,_that.phone,_that.phoneVerified,_that.address,_that.addressDetail,_that.addressType,_that.latitude,_that.longitude,_that.dateCreated,_that.dateUpdated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'account_id')  String accountId, @JsonKey(name: 'full_name')  String fullName,  String phone, @JsonKey(name: 'phone_verified')  bool phoneVerified,  String address, @JsonKey(name: 'address_detail')  String? addressDetail, @JsonKey(name: 'address_type')  String addressType,  double? latitude,  double? longitude, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'date_updated')  String dateUpdated)  $default,) {final _that = this;
switch (_that) {
case _Contact():
return $default(_that.id,_that.accountId,_that.fullName,_that.phone,_that.phoneVerified,_that.address,_that.addressDetail,_that.addressType,_that.latitude,_that.longitude,_that.dateCreated,_that.dateUpdated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'account_id')  String accountId, @JsonKey(name: 'full_name')  String fullName,  String phone, @JsonKey(name: 'phone_verified')  bool phoneVerified,  String address, @JsonKey(name: 'address_detail')  String? addressDetail, @JsonKey(name: 'address_type')  String addressType,  double? latitude,  double? longitude, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'date_updated')  String dateUpdated)?  $default,) {final _that = this;
switch (_that) {
case _Contact() when $default != null:
return $default(_that.id,_that.accountId,_that.fullName,_that.phone,_that.phoneVerified,_that.address,_that.addressDetail,_that.addressType,_that.latitude,_that.longitude,_that.dateCreated,_that.dateUpdated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Contact implements Contact {
  const _Contact({required this.id, @JsonKey(name: 'account_id') required this.accountId, @JsonKey(name: 'full_name') required this.fullName, required this.phone, @JsonKey(name: 'phone_verified') required this.phoneVerified, required this.address, @JsonKey(name: 'address_detail') this.addressDetail, @JsonKey(name: 'address_type') required this.addressType, this.latitude, this.longitude, @JsonKey(name: 'date_created') required this.dateCreated, @JsonKey(name: 'date_updated') required this.dateUpdated});
  factory _Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

@override final  String id;
@override@JsonKey(name: 'account_id') final  String accountId;
@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String phone;
@override@JsonKey(name: 'phone_verified') final  bool phoneVerified;
@override final  String address;
@override@JsonKey(name: 'address_detail') final  String? addressDetail;
@override@JsonKey(name: 'address_type') final  String addressType;
// 'Home' | 'Office' | 'Other'
@override final  double? latitude;
@override final  double? longitude;
@override@JsonKey(name: 'date_created') final  String dateCreated;
@override@JsonKey(name: 'date_updated') final  String dateUpdated;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ContactCopyWith<_Contact> get copyWith => __$ContactCopyWithImpl<_Contact>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ContactToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contact&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressDetail, addressDetail) || other.addressDetail == addressDetail)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateUpdated, dateUpdated) || other.dateUpdated == dateUpdated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,fullName,phone,phoneVerified,address,addressDetail,addressType,latitude,longitude,dateCreated,dateUpdated);

@override
String toString() {
  return 'Contact(id: $id, accountId: $accountId, fullName: $fullName, phone: $phone, phoneVerified: $phoneVerified, address: $address, addressDetail: $addressDetail, addressType: $addressType, latitude: $latitude, longitude: $longitude, dateCreated: $dateCreated, dateUpdated: $dateUpdated)';
}


}

/// @nodoc
abstract mixin class _$ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$ContactCopyWith(_Contact value, $Res Function(_Contact) _then) = __$ContactCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'account_id') String accountId,@JsonKey(name: 'full_name') String fullName, String phone,@JsonKey(name: 'phone_verified') bool phoneVerified, String address,@JsonKey(name: 'address_detail') String? addressDetail,@JsonKey(name: 'address_type') String addressType, double? latitude, double? longitude,@JsonKey(name: 'date_created') String dateCreated,@JsonKey(name: 'date_updated') String dateUpdated
});




}
/// @nodoc
class __$ContactCopyWithImpl<$Res>
    implements _$ContactCopyWith<$Res> {
  __$ContactCopyWithImpl(this._self, this._then);

  final _Contact _self;
  final $Res Function(_Contact) _then;

/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? fullName = null,Object? phone = null,Object? phoneVerified = null,Object? address = null,Object? addressDetail = freezed,Object? addressType = null,Object? latitude = freezed,Object? longitude = freezed,Object? dateCreated = null,Object? dateUpdated = null,}) {
  return _then(_Contact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,addressDetail: freezed == addressDetail ? _self.addressDetail : addressDetail // ignore: cast_nullable_to_non_nullable
as String?,addressType: null == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,dateUpdated: null == dateUpdated ? _self.dateUpdated : dateUpdated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CreateContactRequest {

@JsonKey(name: 'full_name') String get fullName; String get phone; String get address;@JsonKey(name: 'address_detail') String? get addressDetail;@JsonKey(name: 'address_type') String get addressType;// 'Home' | 'Office' | 'Other'
 double get latitude; double get longitude;
/// Create a copy of CreateContactRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateContactRequestCopyWith<CreateContactRequest> get copyWith => _$CreateContactRequestCopyWithImpl<CreateContactRequest>(this as CreateContactRequest, _$identity);

  /// Serializes this CreateContactRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateContactRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressDetail, addressDetail) || other.addressDetail == addressDetail)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phone,address,addressDetail,addressType,latitude,longitude);

@override
String toString() {
  return 'CreateContactRequest(fullName: $fullName, phone: $phone, address: $address, addressDetail: $addressDetail, addressType: $addressType, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $CreateContactRequestCopyWith<$Res>  {
  factory $CreateContactRequestCopyWith(CreateContactRequest value, $Res Function(CreateContactRequest) _then) = _$CreateContactRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'full_name') String fullName, String phone, String address,@JsonKey(name: 'address_detail') String? addressDetail,@JsonKey(name: 'address_type') String addressType, double latitude, double longitude
});




}
/// @nodoc
class _$CreateContactRequestCopyWithImpl<$Res>
    implements $CreateContactRequestCopyWith<$Res> {
  _$CreateContactRequestCopyWithImpl(this._self, this._then);

  final CreateContactRequest _self;
  final $Res Function(CreateContactRequest) _then;

/// Create a copy of CreateContactRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = null,Object? phone = null,Object? address = null,Object? addressDetail = freezed,Object? addressType = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,addressDetail: freezed == addressDetail ? _self.addressDetail : addressDetail // ignore: cast_nullable_to_non_nullable
as String?,addressType: null == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateContactRequest].
extension CreateContactRequestPatterns on CreateContactRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateContactRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateContactRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateContactRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateContactRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateContactRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateContactRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName,  String phone,  String address, @JsonKey(name: 'address_detail')  String? addressDetail, @JsonKey(name: 'address_type')  String addressType,  double latitude,  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateContactRequest() when $default != null:
return $default(_that.fullName,_that.phone,_that.address,_that.addressDetail,_that.addressType,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String fullName,  String phone,  String address, @JsonKey(name: 'address_detail')  String? addressDetail, @JsonKey(name: 'address_type')  String addressType,  double latitude,  double longitude)  $default,) {final _that = this;
switch (_that) {
case _CreateContactRequest():
return $default(_that.fullName,_that.phone,_that.address,_that.addressDetail,_that.addressType,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'full_name')  String fullName,  String phone,  String address, @JsonKey(name: 'address_detail')  String? addressDetail, @JsonKey(name: 'address_type')  String addressType,  double latitude,  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _CreateContactRequest() when $default != null:
return $default(_that.fullName,_that.phone,_that.address,_that.addressDetail,_that.addressType,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateContactRequest implements CreateContactRequest {
  const _CreateContactRequest({@JsonKey(name: 'full_name') required this.fullName, required this.phone, required this.address, @JsonKey(name: 'address_detail') this.addressDetail, @JsonKey(name: 'address_type') required this.addressType, required this.latitude, required this.longitude});
  factory _CreateContactRequest.fromJson(Map<String, dynamic> json) => _$CreateContactRequestFromJson(json);

@override@JsonKey(name: 'full_name') final  String fullName;
@override final  String phone;
@override final  String address;
@override@JsonKey(name: 'address_detail') final  String? addressDetail;
@override@JsonKey(name: 'address_type') final  String addressType;
// 'Home' | 'Office' | 'Other'
@override final  double latitude;
@override final  double longitude;

/// Create a copy of CreateContactRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateContactRequestCopyWith<_CreateContactRequest> get copyWith => __$CreateContactRequestCopyWithImpl<_CreateContactRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateContactRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateContactRequest&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressDetail, addressDetail) || other.addressDetail == addressDetail)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,phone,address,addressDetail,addressType,latitude,longitude);

@override
String toString() {
  return 'CreateContactRequest(fullName: $fullName, phone: $phone, address: $address, addressDetail: $addressDetail, addressType: $addressType, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$CreateContactRequestCopyWith<$Res> implements $CreateContactRequestCopyWith<$Res> {
  factory _$CreateContactRequestCopyWith(_CreateContactRequest value, $Res Function(_CreateContactRequest) _then) = __$CreateContactRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'full_name') String fullName, String phone, String address,@JsonKey(name: 'address_detail') String? addressDetail,@JsonKey(name: 'address_type') String addressType, double latitude, double longitude
});




}
/// @nodoc
class __$CreateContactRequestCopyWithImpl<$Res>
    implements _$CreateContactRequestCopyWith<$Res> {
  __$CreateContactRequestCopyWithImpl(this._self, this._then);

  final _CreateContactRequest _self;
  final $Res Function(_CreateContactRequest) _then;

/// Create a copy of CreateContactRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = null,Object? phone = null,Object? address = null,Object? addressDetail = freezed,Object? addressType = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(_CreateContactRequest(
fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,addressDetail: freezed == addressDetail ? _self.addressDetail : addressDetail // ignore: cast_nullable_to_non_nullable
as String?,addressType: null == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$UpdateContactRequest {

@JsonKey(name: 'contact_id') String get contactId;@JsonKey(name: 'full_name') String? get fullName; String? get phone; String? get address;@JsonKey(name: 'address_detail') String? get addressDetail;@JsonKey(name: 'address_type') String? get addressType;// 'Home' | 'Office' | 'Other'
@JsonKey(name: 'phone_verified') bool? get phoneVerified; double? get latitude; double? get longitude;
/// Create a copy of UpdateContactRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateContactRequestCopyWith<UpdateContactRequest> get copyWith => _$UpdateContactRequestCopyWithImpl<UpdateContactRequest>(this as UpdateContactRequest, _$identity);

  /// Serializes this UpdateContactRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateContactRequest&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressDetail, addressDetail) || other.addressDetail == addressDetail)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,fullName,phone,address,addressDetail,addressType,phoneVerified,latitude,longitude);

@override
String toString() {
  return 'UpdateContactRequest(contactId: $contactId, fullName: $fullName, phone: $phone, address: $address, addressDetail: $addressDetail, addressType: $addressType, phoneVerified: $phoneVerified, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $UpdateContactRequestCopyWith<$Res>  {
  factory $UpdateContactRequestCopyWith(UpdateContactRequest value, $Res Function(UpdateContactRequest) _then) = _$UpdateContactRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'contact_id') String contactId,@JsonKey(name: 'full_name') String? fullName, String? phone, String? address,@JsonKey(name: 'address_detail') String? addressDetail,@JsonKey(name: 'address_type') String? addressType,@JsonKey(name: 'phone_verified') bool? phoneVerified, double? latitude, double? longitude
});




}
/// @nodoc
class _$UpdateContactRequestCopyWithImpl<$Res>
    implements $UpdateContactRequestCopyWith<$Res> {
  _$UpdateContactRequestCopyWithImpl(this._self, this._then);

  final UpdateContactRequest _self;
  final $Res Function(UpdateContactRequest) _then;

/// Create a copy of UpdateContactRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contactId = null,Object? fullName = freezed,Object? phone = freezed,Object? address = freezed,Object? addressDetail = freezed,Object? addressType = freezed,Object? phoneVerified = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_self.copyWith(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,addressDetail: freezed == addressDetail ? _self.addressDetail : addressDetail // ignore: cast_nullable_to_non_nullable
as String?,addressType: freezed == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String?,phoneVerified: freezed == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateContactRequest].
extension UpdateContactRequestPatterns on UpdateContactRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateContactRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateContactRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateContactRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateContactRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateContactRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateContactRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'contact_id')  String contactId, @JsonKey(name: 'full_name')  String? fullName,  String? phone,  String? address, @JsonKey(name: 'address_detail')  String? addressDetail, @JsonKey(name: 'address_type')  String? addressType, @JsonKey(name: 'phone_verified')  bool? phoneVerified,  double? latitude,  double? longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateContactRequest() when $default != null:
return $default(_that.contactId,_that.fullName,_that.phone,_that.address,_that.addressDetail,_that.addressType,_that.phoneVerified,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'contact_id')  String contactId, @JsonKey(name: 'full_name')  String? fullName,  String? phone,  String? address, @JsonKey(name: 'address_detail')  String? addressDetail, @JsonKey(name: 'address_type')  String? addressType, @JsonKey(name: 'phone_verified')  bool? phoneVerified,  double? latitude,  double? longitude)  $default,) {final _that = this;
switch (_that) {
case _UpdateContactRequest():
return $default(_that.contactId,_that.fullName,_that.phone,_that.address,_that.addressDetail,_that.addressType,_that.phoneVerified,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'contact_id')  String contactId, @JsonKey(name: 'full_name')  String? fullName,  String? phone,  String? address, @JsonKey(name: 'address_detail')  String? addressDetail, @JsonKey(name: 'address_type')  String? addressType, @JsonKey(name: 'phone_verified')  bool? phoneVerified,  double? latitude,  double? longitude)?  $default,) {final _that = this;
switch (_that) {
case _UpdateContactRequest() when $default != null:
return $default(_that.contactId,_that.fullName,_that.phone,_that.address,_that.addressDetail,_that.addressType,_that.phoneVerified,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateContactRequest implements UpdateContactRequest {
  const _UpdateContactRequest({@JsonKey(name: 'contact_id') required this.contactId, @JsonKey(name: 'full_name') this.fullName, this.phone, this.address, @JsonKey(name: 'address_detail') this.addressDetail, @JsonKey(name: 'address_type') this.addressType, @JsonKey(name: 'phone_verified') this.phoneVerified, this.latitude, this.longitude});
  factory _UpdateContactRequest.fromJson(Map<String, dynamic> json) => _$UpdateContactRequestFromJson(json);

@override@JsonKey(name: 'contact_id') final  String contactId;
@override@JsonKey(name: 'full_name') final  String? fullName;
@override final  String? phone;
@override final  String? address;
@override@JsonKey(name: 'address_detail') final  String? addressDetail;
@override@JsonKey(name: 'address_type') final  String? addressType;
// 'Home' | 'Office' | 'Other'
@override@JsonKey(name: 'phone_verified') final  bool? phoneVerified;
@override final  double? latitude;
@override final  double? longitude;

/// Create a copy of UpdateContactRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateContactRequestCopyWith<_UpdateContactRequest> get copyWith => __$UpdateContactRequestCopyWithImpl<_UpdateContactRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateContactRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateContactRequest&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressDetail, addressDetail) || other.addressDetail == addressDetail)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,fullName,phone,address,addressDetail,addressType,phoneVerified,latitude,longitude);

@override
String toString() {
  return 'UpdateContactRequest(contactId: $contactId, fullName: $fullName, phone: $phone, address: $address, addressDetail: $addressDetail, addressType: $addressType, phoneVerified: $phoneVerified, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$UpdateContactRequestCopyWith<$Res> implements $UpdateContactRequestCopyWith<$Res> {
  factory _$UpdateContactRequestCopyWith(_UpdateContactRequest value, $Res Function(_UpdateContactRequest) _then) = __$UpdateContactRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'contact_id') String contactId,@JsonKey(name: 'full_name') String? fullName, String? phone, String? address,@JsonKey(name: 'address_detail') String? addressDetail,@JsonKey(name: 'address_type') String? addressType,@JsonKey(name: 'phone_verified') bool? phoneVerified, double? latitude, double? longitude
});




}
/// @nodoc
class __$UpdateContactRequestCopyWithImpl<$Res>
    implements _$UpdateContactRequestCopyWith<$Res> {
  __$UpdateContactRequestCopyWithImpl(this._self, this._then);

  final _UpdateContactRequest _self;
  final $Res Function(_UpdateContactRequest) _then;

/// Create a copy of UpdateContactRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contactId = null,Object? fullName = freezed,Object? phone = freezed,Object? address = freezed,Object? addressDetail = freezed,Object? addressType = freezed,Object? phoneVerified = freezed,Object? latitude = freezed,Object? longitude = freezed,}) {
  return _then(_UpdateContactRequest(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,addressDetail: freezed == addressDetail ? _self.addressDetail : addressDetail // ignore: cast_nullable_to_non_nullable
as String?,addressType: freezed == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String?,phoneVerified: freezed == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$AccountFavorite {

 int get id;@JsonKey(name: 'account_id') String get accountId;@JsonKey(name: 'spu_id') String get spuId;@JsonKey(name: 'date_created') String get dateCreated;
/// Create a copy of AccountFavorite
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountFavoriteCopyWith<AccountFavorite> get copyWith => _$AccountFavoriteCopyWithImpl<AccountFavorite>(this as AccountFavorite, _$identity);

  /// Serializes this AccountFavorite to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountFavorite&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,spuId,dateCreated);

@override
String toString() {
  return 'AccountFavorite(id: $id, accountId: $accountId, spuId: $spuId, dateCreated: $dateCreated)';
}


}

/// @nodoc
abstract mixin class $AccountFavoriteCopyWith<$Res>  {
  factory $AccountFavoriteCopyWith(AccountFavorite value, $Res Function(AccountFavorite) _then) = _$AccountFavoriteCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'account_id') String accountId,@JsonKey(name: 'spu_id') String spuId,@JsonKey(name: 'date_created') String dateCreated
});




}
/// @nodoc
class _$AccountFavoriteCopyWithImpl<$Res>
    implements $AccountFavoriteCopyWith<$Res> {
  _$AccountFavoriteCopyWithImpl(this._self, this._then);

  final AccountFavorite _self;
  final $Res Function(AccountFavorite) _then;

/// Create a copy of AccountFavorite
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = null,Object? spuId = null,Object? dateCreated = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountFavorite].
extension AccountFavoritePatterns on AccountFavorite {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountFavorite value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountFavorite() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountFavorite value)  $default,){
final _that = this;
switch (_that) {
case _AccountFavorite():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountFavorite value)?  $default,){
final _that = this;
switch (_that) {
case _AccountFavorite() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'account_id')  String accountId, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'date_created')  String dateCreated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountFavorite() when $default != null:
return $default(_that.id,_that.accountId,_that.spuId,_that.dateCreated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'account_id')  String accountId, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'date_created')  String dateCreated)  $default,) {final _that = this;
switch (_that) {
case _AccountFavorite():
return $default(_that.id,_that.accountId,_that.spuId,_that.dateCreated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'account_id')  String accountId, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'date_created')  String dateCreated)?  $default,) {final _that = this;
switch (_that) {
case _AccountFavorite() when $default != null:
return $default(_that.id,_that.accountId,_that.spuId,_that.dateCreated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountFavorite implements AccountFavorite {
  const _AccountFavorite({required this.id, @JsonKey(name: 'account_id') required this.accountId, @JsonKey(name: 'spu_id') required this.spuId, @JsonKey(name: 'date_created') required this.dateCreated});
  factory _AccountFavorite.fromJson(Map<String, dynamic> json) => _$AccountFavoriteFromJson(json);

@override final  int id;
@override@JsonKey(name: 'account_id') final  String accountId;
@override@JsonKey(name: 'spu_id') final  String spuId;
@override@JsonKey(name: 'date_created') final  String dateCreated;

/// Create a copy of AccountFavorite
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountFavoriteCopyWith<_AccountFavorite> get copyWith => __$AccountFavoriteCopyWithImpl<_AccountFavorite>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountFavoriteToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountFavorite&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,spuId,dateCreated);

@override
String toString() {
  return 'AccountFavorite(id: $id, accountId: $accountId, spuId: $spuId, dateCreated: $dateCreated)';
}


}

/// @nodoc
abstract mixin class _$AccountFavoriteCopyWith<$Res> implements $AccountFavoriteCopyWith<$Res> {
  factory _$AccountFavoriteCopyWith(_AccountFavorite value, $Res Function(_AccountFavorite) _then) = __$AccountFavoriteCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'account_id') String accountId,@JsonKey(name: 'spu_id') String spuId,@JsonKey(name: 'date_created') String dateCreated
});




}
/// @nodoc
class __$AccountFavoriteCopyWithImpl<$Res>
    implements _$AccountFavoriteCopyWith<$Res> {
  __$AccountFavoriteCopyWithImpl(this._self, this._then);

  final _AccountFavorite _self;
  final $Res Function(_AccountFavorite) _then;

/// Create a copy of AccountFavorite
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? spuId = null,Object? dateCreated = null,}) {
  return _then(_AccountFavorite(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$NotificationMetadata {

@JsonKey(name: 'order_id') String? get orderId;@JsonKey(name: 'refund_id') String? get refundId;@JsonKey(name: 'redirect_url') String? get redirectUrl;
/// Create a copy of NotificationMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationMetadataCopyWith<NotificationMetadata> get copyWith => _$NotificationMetadataCopyWithImpl<NotificationMetadata>(this as NotificationMetadata, _$identity);

  /// Serializes this NotificationMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationMetadata&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.refundId, refundId) || other.refundId == refundId)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,refundId,redirectUrl);

@override
String toString() {
  return 'NotificationMetadata(orderId: $orderId, refundId: $refundId, redirectUrl: $redirectUrl)';
}


}

/// @nodoc
abstract mixin class $NotificationMetadataCopyWith<$Res>  {
  factory $NotificationMetadataCopyWith(NotificationMetadata value, $Res Function(NotificationMetadata) _then) = _$NotificationMetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'order_id') String? orderId,@JsonKey(name: 'refund_id') String? refundId,@JsonKey(name: 'redirect_url') String? redirectUrl
});




}
/// @nodoc
class _$NotificationMetadataCopyWithImpl<$Res>
    implements $NotificationMetadataCopyWith<$Res> {
  _$NotificationMetadataCopyWithImpl(this._self, this._then);

  final NotificationMetadata _self;
  final $Res Function(NotificationMetadata) _then;

/// Create a copy of NotificationMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = freezed,Object? refundId = freezed,Object? redirectUrl = freezed,}) {
  return _then(_self.copyWith(
orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,refundId: freezed == refundId ? _self.refundId : refundId // ignore: cast_nullable_to_non_nullable
as String?,redirectUrl: freezed == redirectUrl ? _self.redirectUrl : redirectUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationMetadata].
extension NotificationMetadataPatterns on NotificationMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationMetadata value)  $default,){
final _that = this;
switch (_that) {
case _NotificationMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'refund_id')  String? refundId, @JsonKey(name: 'redirect_url')  String? redirectUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationMetadata() when $default != null:
return $default(_that.orderId,_that.refundId,_that.redirectUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'refund_id')  String? refundId, @JsonKey(name: 'redirect_url')  String? redirectUrl)  $default,) {final _that = this;
switch (_that) {
case _NotificationMetadata():
return $default(_that.orderId,_that.refundId,_that.redirectUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'refund_id')  String? refundId, @JsonKey(name: 'redirect_url')  String? redirectUrl)?  $default,) {final _that = this;
switch (_that) {
case _NotificationMetadata() when $default != null:
return $default(_that.orderId,_that.refundId,_that.redirectUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationMetadata implements NotificationMetadata {
  const _NotificationMetadata({@JsonKey(name: 'order_id') this.orderId, @JsonKey(name: 'refund_id') this.refundId, @JsonKey(name: 'redirect_url') this.redirectUrl});
  factory _NotificationMetadata.fromJson(Map<String, dynamic> json) => _$NotificationMetadataFromJson(json);

@override@JsonKey(name: 'order_id') final  String? orderId;
@override@JsonKey(name: 'refund_id') final  String? refundId;
@override@JsonKey(name: 'redirect_url') final  String? redirectUrl;

/// Create a copy of NotificationMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationMetadataCopyWith<_NotificationMetadata> get copyWith => __$NotificationMetadataCopyWithImpl<_NotificationMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationMetadata&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.refundId, refundId) || other.refundId == refundId)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,refundId,redirectUrl);

@override
String toString() {
  return 'NotificationMetadata(orderId: $orderId, refundId: $refundId, redirectUrl: $redirectUrl)';
}


}

/// @nodoc
abstract mixin class _$NotificationMetadataCopyWith<$Res> implements $NotificationMetadataCopyWith<$Res> {
  factory _$NotificationMetadataCopyWith(_NotificationMetadata value, $Res Function(_NotificationMetadata) _then) = __$NotificationMetadataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'order_id') String? orderId,@JsonKey(name: 'refund_id') String? refundId,@JsonKey(name: 'redirect_url') String? redirectUrl
});




}
/// @nodoc
class __$NotificationMetadataCopyWithImpl<$Res>
    implements _$NotificationMetadataCopyWith<$Res> {
  __$NotificationMetadataCopyWithImpl(this._self, this._then);

  final _NotificationMetadata _self;
  final $Res Function(_NotificationMetadata) _then;

/// Create a copy of NotificationMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = freezed,Object? refundId = freezed,Object? redirectUrl = freezed,}) {
  return _then(_NotificationMetadata(
orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,refundId: freezed == refundId ? _self.refundId : refundId // ignore: cast_nullable_to_non_nullable
as String?,redirectUrl: freezed == redirectUrl ? _self.redirectUrl : redirectUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Notification {

 int get id;@JsonKey(name: 'account_id') String get accountId; String get type; String get channel; String get title; String get content;@JsonKey(name: 'is_read') bool get isRead; NotificationMetadata? get metadata;@JsonKey(name: 'date_created') String get dateCreated;
/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationCopyWith<Notification> get copyWith => _$NotificationCopyWithImpl<Notification>(this as Notification, _$identity);

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Notification&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.type, type) || other.type == type)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,type,channel,title,content,isRead,metadata,dateCreated);

@override
String toString() {
  return 'Notification(id: $id, accountId: $accountId, type: $type, channel: $channel, title: $title, content: $content, isRead: $isRead, metadata: $metadata, dateCreated: $dateCreated)';
}


}

/// @nodoc
abstract mixin class $NotificationCopyWith<$Res>  {
  factory $NotificationCopyWith(Notification value, $Res Function(Notification) _then) = _$NotificationCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'account_id') String accountId, String type, String channel, String title, String content,@JsonKey(name: 'is_read') bool isRead, NotificationMetadata? metadata,@JsonKey(name: 'date_created') String dateCreated
});


$NotificationMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$NotificationCopyWithImpl<$Res>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._self, this._then);

  final Notification _self;
  final $Res Function(Notification) _then;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = null,Object? type = null,Object? channel = null,Object? title = null,Object? content = null,Object? isRead = null,Object? metadata = freezed,Object? dateCreated = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as NotificationMetadata?,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $NotificationMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [Notification].
extension NotificationPatterns on Notification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Notification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Notification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Notification value)  $default,){
final _that = this;
switch (_that) {
case _Notification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Notification value)?  $default,){
final _that = this;
switch (_that) {
case _Notification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'account_id')  String accountId,  String type,  String channel,  String title,  String content, @JsonKey(name: 'is_read')  bool isRead,  NotificationMetadata? metadata, @JsonKey(name: 'date_created')  String dateCreated)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Notification() when $default != null:
return $default(_that.id,_that.accountId,_that.type,_that.channel,_that.title,_that.content,_that.isRead,_that.metadata,_that.dateCreated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'account_id')  String accountId,  String type,  String channel,  String title,  String content, @JsonKey(name: 'is_read')  bool isRead,  NotificationMetadata? metadata, @JsonKey(name: 'date_created')  String dateCreated)  $default,) {final _that = this;
switch (_that) {
case _Notification():
return $default(_that.id,_that.accountId,_that.type,_that.channel,_that.title,_that.content,_that.isRead,_that.metadata,_that.dateCreated);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'account_id')  String accountId,  String type,  String channel,  String title,  String content, @JsonKey(name: 'is_read')  bool isRead,  NotificationMetadata? metadata, @JsonKey(name: 'date_created')  String dateCreated)?  $default,) {final _that = this;
switch (_that) {
case _Notification() when $default != null:
return $default(_that.id,_that.accountId,_that.type,_that.channel,_that.title,_that.content,_that.isRead,_that.metadata,_that.dateCreated);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Notification implements Notification {
  const _Notification({required this.id, @JsonKey(name: 'account_id') required this.accountId, required this.type, required this.channel, required this.title, required this.content, @JsonKey(name: 'is_read') required this.isRead, this.metadata, @JsonKey(name: 'date_created') required this.dateCreated});
  factory _Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

@override final  int id;
@override@JsonKey(name: 'account_id') final  String accountId;
@override final  String type;
@override final  String channel;
@override final  String title;
@override final  String content;
@override@JsonKey(name: 'is_read') final  bool isRead;
@override final  NotificationMetadata? metadata;
@override@JsonKey(name: 'date_created') final  String dateCreated;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationCopyWith<_Notification> get copyWith => __$NotificationCopyWithImpl<_Notification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Notification&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.type, type) || other.type == type)&&(identical(other.channel, channel) || other.channel == channel)&&(identical(other.title, title) || other.title == title)&&(identical(other.content, content) || other.content == content)&&(identical(other.isRead, isRead) || other.isRead == isRead)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,type,channel,title,content,isRead,metadata,dateCreated);

@override
String toString() {
  return 'Notification(id: $id, accountId: $accountId, type: $type, channel: $channel, title: $title, content: $content, isRead: $isRead, metadata: $metadata, dateCreated: $dateCreated)';
}


}

/// @nodoc
abstract mixin class _$NotificationCopyWith<$Res> implements $NotificationCopyWith<$Res> {
  factory _$NotificationCopyWith(_Notification value, $Res Function(_Notification) _then) = __$NotificationCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'account_id') String accountId, String type, String channel, String title, String content,@JsonKey(name: 'is_read') bool isRead, NotificationMetadata? metadata,@JsonKey(name: 'date_created') String dateCreated
});


@override $NotificationMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(this._self, this._then);

  final _Notification _self;
  final $Res Function(_Notification) _then;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? type = null,Object? channel = null,Object? title = null,Object? content = null,Object? isRead = null,Object? metadata = freezed,Object? dateCreated = null,}) {
  return _then(_Notification(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,channel: null == channel ? _self.channel : channel // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,isRead: null == isRead ? _self.isRead : isRead // ignore: cast_nullable_to_non_nullable
as bool,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as NotificationMetadata?,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$NotificationMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $NotificationMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// @nodoc
mixin _$UnreadCountResponse {

 int get count;
/// Create a copy of UnreadCountResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnreadCountResponseCopyWith<UnreadCountResponse> get copyWith => _$UnreadCountResponseCopyWithImpl<UnreadCountResponse>(this as UnreadCountResponse, _$identity);

  /// Serializes this UnreadCountResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnreadCountResponse&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'UnreadCountResponse(count: $count)';
}


}

/// @nodoc
abstract mixin class $UnreadCountResponseCopyWith<$Res>  {
  factory $UnreadCountResponseCopyWith(UnreadCountResponse value, $Res Function(UnreadCountResponse) _then) = _$UnreadCountResponseCopyWithImpl;
@useResult
$Res call({
 int count
});




}
/// @nodoc
class _$UnreadCountResponseCopyWithImpl<$Res>
    implements $UnreadCountResponseCopyWith<$Res> {
  _$UnreadCountResponseCopyWithImpl(this._self, this._then);

  final UnreadCountResponse _self;
  final $Res Function(UnreadCountResponse) _then;

/// Create a copy of UnreadCountResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? count = null,}) {
  return _then(_self.copyWith(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UnreadCountResponse].
extension UnreadCountResponsePatterns on UnreadCountResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UnreadCountResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UnreadCountResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UnreadCountResponse value)  $default,){
final _that = this;
switch (_that) {
case _UnreadCountResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UnreadCountResponse value)?  $default,){
final _that = this;
switch (_that) {
case _UnreadCountResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnreadCountResponse() when $default != null:
return $default(_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int count)  $default,) {final _that = this;
switch (_that) {
case _UnreadCountResponse():
return $default(_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int count)?  $default,) {final _that = this;
switch (_that) {
case _UnreadCountResponse() when $default != null:
return $default(_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnreadCountResponse implements UnreadCountResponse {
  const _UnreadCountResponse({required this.count});
  factory _UnreadCountResponse.fromJson(Map<String, dynamic> json) => _$UnreadCountResponseFromJson(json);

@override final  int count;

/// Create a copy of UnreadCountResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnreadCountResponseCopyWith<_UnreadCountResponse> get copyWith => __$UnreadCountResponseCopyWithImpl<_UnreadCountResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UnreadCountResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnreadCountResponse&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,count);

@override
String toString() {
  return 'UnreadCountResponse(count: $count)';
}


}

/// @nodoc
abstract mixin class _$UnreadCountResponseCopyWith<$Res> implements $UnreadCountResponseCopyWith<$Res> {
  factory _$UnreadCountResponseCopyWith(_UnreadCountResponse value, $Res Function(_UnreadCountResponse) _then) = __$UnreadCountResponseCopyWithImpl;
@override @useResult
$Res call({
 int count
});




}
/// @nodoc
class __$UnreadCountResponseCopyWithImpl<$Res>
    implements _$UnreadCountResponseCopyWith<$Res> {
  __$UnreadCountResponseCopyWithImpl(this._self, this._then);

  final _UnreadCountResponse _self;
  final $Res Function(_UnreadCountResponse) _then;

/// Create a copy of UnreadCountResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? count = null,}) {
  return _then(_UnreadCountResponse(
count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ReadNotificationsRequest {

 List<int> get ids;
/// Create a copy of ReadNotificationsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadNotificationsRequestCopyWith<ReadNotificationsRequest> get copyWith => _$ReadNotificationsRequestCopyWithImpl<ReadNotificationsRequest>(this as ReadNotificationsRequest, _$identity);

  /// Serializes this ReadNotificationsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadNotificationsRequest&&const DeepCollectionEquality().equals(other.ids, ids));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(ids));

@override
String toString() {
  return 'ReadNotificationsRequest(ids: $ids)';
}


}

/// @nodoc
abstract mixin class $ReadNotificationsRequestCopyWith<$Res>  {
  factory $ReadNotificationsRequestCopyWith(ReadNotificationsRequest value, $Res Function(ReadNotificationsRequest) _then) = _$ReadNotificationsRequestCopyWithImpl;
@useResult
$Res call({
 List<int> ids
});




}
/// @nodoc
class _$ReadNotificationsRequestCopyWithImpl<$Res>
    implements $ReadNotificationsRequestCopyWith<$Res> {
  _$ReadNotificationsRequestCopyWithImpl(this._self, this._then);

  final ReadNotificationsRequest _self;
  final $Res Function(ReadNotificationsRequest) _then;

/// Create a copy of ReadNotificationsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ids = null,}) {
  return _then(_self.copyWith(
ids: null == ids ? _self.ids : ids // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadNotificationsRequest].
extension ReadNotificationsRequestPatterns on ReadNotificationsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadNotificationsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadNotificationsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadNotificationsRequest value)  $default,){
final _that = this;
switch (_that) {
case _ReadNotificationsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadNotificationsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ReadNotificationsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<int> ids)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadNotificationsRequest() when $default != null:
return $default(_that.ids);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<int> ids)  $default,) {final _that = this;
switch (_that) {
case _ReadNotificationsRequest():
return $default(_that.ids);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<int> ids)?  $default,) {final _that = this;
switch (_that) {
case _ReadNotificationsRequest() when $default != null:
return $default(_that.ids);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReadNotificationsRequest implements ReadNotificationsRequest {
  const _ReadNotificationsRequest({required final  List<int> ids}): _ids = ids;
  factory _ReadNotificationsRequest.fromJson(Map<String, dynamic> json) => _$ReadNotificationsRequestFromJson(json);

 final  List<int> _ids;
@override List<int> get ids {
  if (_ids is EqualUnmodifiableListView) return _ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ids);
}


/// Create a copy of ReadNotificationsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadNotificationsRequestCopyWith<_ReadNotificationsRequest> get copyWith => __$ReadNotificationsRequestCopyWithImpl<_ReadNotificationsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReadNotificationsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadNotificationsRequest&&const DeepCollectionEquality().equals(other._ids, _ids));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_ids));

@override
String toString() {
  return 'ReadNotificationsRequest(ids: $ids)';
}


}

/// @nodoc
abstract mixin class _$ReadNotificationsRequestCopyWith<$Res> implements $ReadNotificationsRequestCopyWith<$Res> {
  factory _$ReadNotificationsRequestCopyWith(_ReadNotificationsRequest value, $Res Function(_ReadNotificationsRequest) _then) = __$ReadNotificationsRequestCopyWithImpl;
@override @useResult
$Res call({
 List<int> ids
});




}
/// @nodoc
class __$ReadNotificationsRequestCopyWithImpl<$Res>
    implements _$ReadNotificationsRequestCopyWith<$Res> {
  __$ReadNotificationsRequestCopyWithImpl(this._self, this._then);

  final _ReadNotificationsRequest _self;
  final $Res Function(_ReadNotificationsRequest) _then;

/// Create a copy of ReadNotificationsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ids = null,}) {
  return _then(_ReadNotificationsRequest(
ids: null == ids ? _self._ids : ids // ignore: cast_nullable_to_non_nullable
as List<int>,
  ));
}


}


/// @nodoc
mixin _$BuyerOrderItem {

 int get id;@JsonKey(name: 'order_id') String? get orderId;@JsonKey(name: 'sku_id') String get skuId;@JsonKey(name: 'spu_id') String get spuId;@JsonKey(name: 'sku_name') String get skuName; int get quantity;@JsonKey(name: 'subtotal_amount') int get subtotalAmount;@JsonKey(name: 'total_amount') int get totalAmount;@JsonKey(name: 'payment_session_id') int? get paymentSessionId; String get slug;@JsonKey(name: 'image_url') String? get imageUrl;
/// Create a copy of BuyerOrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyerOrderItemCopyWith<BuyerOrderItem> get copyWith => _$BuyerOrderItemCopyWithImpl<BuyerOrderItem>(this as BuyerOrderItem, _$identity);

  /// Serializes this BuyerOrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyerOrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.skuName, skuName) || other.skuName == skuName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.subtotalAmount, subtotalAmount) || other.subtotalAmount == subtotalAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paymentSessionId, paymentSessionId) || other.paymentSessionId == paymentSessionId)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,skuId,spuId,skuName,quantity,subtotalAmount,totalAmount,paymentSessionId,slug,imageUrl);

@override
String toString() {
  return 'BuyerOrderItem(id: $id, orderId: $orderId, skuId: $skuId, spuId: $spuId, skuName: $skuName, quantity: $quantity, subtotalAmount: $subtotalAmount, totalAmount: $totalAmount, paymentSessionId: $paymentSessionId, slug: $slug, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $BuyerOrderItemCopyWith<$Res>  {
  factory $BuyerOrderItemCopyWith(BuyerOrderItem value, $Res Function(BuyerOrderItem) _then) = _$BuyerOrderItemCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'order_id') String? orderId,@JsonKey(name: 'sku_id') String skuId,@JsonKey(name: 'spu_id') String spuId,@JsonKey(name: 'sku_name') String skuName, int quantity,@JsonKey(name: 'subtotal_amount') int subtotalAmount,@JsonKey(name: 'total_amount') int totalAmount,@JsonKey(name: 'payment_session_id') int? paymentSessionId, String slug,@JsonKey(name: 'image_url') String? imageUrl
});




}
/// @nodoc
class _$BuyerOrderItemCopyWithImpl<$Res>
    implements $BuyerOrderItemCopyWith<$Res> {
  _$BuyerOrderItemCopyWithImpl(this._self, this._then);

  final BuyerOrderItem _self;
  final $Res Function(BuyerOrderItem) _then;

/// Create a copy of BuyerOrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = freezed,Object? skuId = null,Object? spuId = null,Object? skuName = null,Object? quantity = null,Object? subtotalAmount = null,Object? totalAmount = null,Object? paymentSessionId = freezed,Object? slug = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,skuName: null == skuName ? _self.skuName : skuName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,subtotalAmount: null == subtotalAmount ? _self.subtotalAmount : subtotalAmount // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,paymentSessionId: freezed == paymentSessionId ? _self.paymentSessionId : paymentSessionId // ignore: cast_nullable_to_non_nullable
as int?,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BuyerOrderItem].
extension BuyerOrderItemPatterns on BuyerOrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuyerOrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuyerOrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuyerOrderItem value)  $default,){
final _that = this;
switch (_that) {
case _BuyerOrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuyerOrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _BuyerOrderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'sku_id')  String skuId, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'sku_name')  String skuName,  int quantity, @JsonKey(name: 'subtotal_amount')  int subtotalAmount, @JsonKey(name: 'total_amount')  int totalAmount, @JsonKey(name: 'payment_session_id')  int? paymentSessionId,  String slug, @JsonKey(name: 'image_url')  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuyerOrderItem() when $default != null:
return $default(_that.id,_that.orderId,_that.skuId,_that.spuId,_that.skuName,_that.quantity,_that.subtotalAmount,_that.totalAmount,_that.paymentSessionId,_that.slug,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'sku_id')  String skuId, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'sku_name')  String skuName,  int quantity, @JsonKey(name: 'subtotal_amount')  int subtotalAmount, @JsonKey(name: 'total_amount')  int totalAmount, @JsonKey(name: 'payment_session_id')  int? paymentSessionId,  String slug, @JsonKey(name: 'image_url')  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _BuyerOrderItem():
return $default(_that.id,_that.orderId,_that.skuId,_that.spuId,_that.skuName,_that.quantity,_that.subtotalAmount,_that.totalAmount,_that.paymentSessionId,_that.slug,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'sku_id')  String skuId, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'sku_name')  String skuName,  int quantity, @JsonKey(name: 'subtotal_amount')  int subtotalAmount, @JsonKey(name: 'total_amount')  int totalAmount, @JsonKey(name: 'payment_session_id')  int? paymentSessionId,  String slug, @JsonKey(name: 'image_url')  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _BuyerOrderItem() when $default != null:
return $default(_that.id,_that.orderId,_that.skuId,_that.spuId,_that.skuName,_that.quantity,_that.subtotalAmount,_that.totalAmount,_that.paymentSessionId,_that.slug,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuyerOrderItem implements BuyerOrderItem {
  const _BuyerOrderItem({required this.id, @JsonKey(name: 'order_id') this.orderId, @JsonKey(name: 'sku_id') required this.skuId, @JsonKey(name: 'spu_id') required this.spuId, @JsonKey(name: 'sku_name') required this.skuName, required this.quantity, @JsonKey(name: 'subtotal_amount') required this.subtotalAmount, @JsonKey(name: 'total_amount') required this.totalAmount, @JsonKey(name: 'payment_session_id') this.paymentSessionId, required this.slug, @JsonKey(name: 'image_url') this.imageUrl});
  factory _BuyerOrderItem.fromJson(Map<String, dynamic> json) => _$BuyerOrderItemFromJson(json);

@override final  int id;
@override@JsonKey(name: 'order_id') final  String? orderId;
@override@JsonKey(name: 'sku_id') final  String skuId;
@override@JsonKey(name: 'spu_id') final  String spuId;
@override@JsonKey(name: 'sku_name') final  String skuName;
@override final  int quantity;
@override@JsonKey(name: 'subtotal_amount') final  int subtotalAmount;
@override@JsonKey(name: 'total_amount') final  int totalAmount;
@override@JsonKey(name: 'payment_session_id') final  int? paymentSessionId;
@override final  String slug;
@override@JsonKey(name: 'image_url') final  String? imageUrl;

/// Create a copy of BuyerOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyerOrderItemCopyWith<_BuyerOrderItem> get copyWith => __$BuyerOrderItemCopyWithImpl<_BuyerOrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuyerOrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyerOrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.skuName, skuName) || other.skuName == skuName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.subtotalAmount, subtotalAmount) || other.subtotalAmount == subtotalAmount)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.paymentSessionId, paymentSessionId) || other.paymentSessionId == paymentSessionId)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,skuId,spuId,skuName,quantity,subtotalAmount,totalAmount,paymentSessionId,slug,imageUrl);

@override
String toString() {
  return 'BuyerOrderItem(id: $id, orderId: $orderId, skuId: $skuId, spuId: $spuId, skuName: $skuName, quantity: $quantity, subtotalAmount: $subtotalAmount, totalAmount: $totalAmount, paymentSessionId: $paymentSessionId, slug: $slug, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$BuyerOrderItemCopyWith<$Res> implements $BuyerOrderItemCopyWith<$Res> {
  factory _$BuyerOrderItemCopyWith(_BuyerOrderItem value, $Res Function(_BuyerOrderItem) _then) = __$BuyerOrderItemCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'order_id') String? orderId,@JsonKey(name: 'sku_id') String skuId,@JsonKey(name: 'spu_id') String spuId,@JsonKey(name: 'sku_name') String skuName, int quantity,@JsonKey(name: 'subtotal_amount') int subtotalAmount,@JsonKey(name: 'total_amount') int totalAmount,@JsonKey(name: 'payment_session_id') int? paymentSessionId, String slug,@JsonKey(name: 'image_url') String? imageUrl
});




}
/// @nodoc
class __$BuyerOrderItemCopyWithImpl<$Res>
    implements _$BuyerOrderItemCopyWith<$Res> {
  __$BuyerOrderItemCopyWithImpl(this._self, this._then);

  final _BuyerOrderItem _self;
  final $Res Function(_BuyerOrderItem) _then;

/// Create a copy of BuyerOrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = freezed,Object? skuId = null,Object? spuId = null,Object? skuName = null,Object? quantity = null,Object? subtotalAmount = null,Object? totalAmount = null,Object? paymentSessionId = freezed,Object? slug = null,Object? imageUrl = freezed,}) {
  return _then(_BuyerOrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,skuName: null == skuName ? _self.skuName : skuName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,subtotalAmount: null == subtotalAmount ? _self.subtotalAmount : subtotalAmount // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,paymentSessionId: freezed == paymentSessionId ? _self.paymentSessionId : paymentSessionId // ignore: cast_nullable_to_non_nullable
as int?,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BuyerOrderTransport {

 int get id; String get option; String? get status;
/// Create a copy of BuyerOrderTransport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyerOrderTransportCopyWith<BuyerOrderTransport> get copyWith => _$BuyerOrderTransportCopyWithImpl<BuyerOrderTransport>(this as BuyerOrderTransport, _$identity);

  /// Serializes this BuyerOrderTransport to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyerOrderTransport&&(identical(other.id, id) || other.id == id)&&(identical(other.option, option) || other.option == option)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,option,status);

@override
String toString() {
  return 'BuyerOrderTransport(id: $id, option: $option, status: $status)';
}


}

/// @nodoc
abstract mixin class $BuyerOrderTransportCopyWith<$Res>  {
  factory $BuyerOrderTransportCopyWith(BuyerOrderTransport value, $Res Function(BuyerOrderTransport) _then) = _$BuyerOrderTransportCopyWithImpl;
@useResult
$Res call({
 int id, String option, String? status
});




}
/// @nodoc
class _$BuyerOrderTransportCopyWithImpl<$Res>
    implements $BuyerOrderTransportCopyWith<$Res> {
  _$BuyerOrderTransportCopyWithImpl(this._self, this._then);

  final BuyerOrderTransport _self;
  final $Res Function(BuyerOrderTransport) _then;

/// Create a copy of BuyerOrderTransport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? option = null,Object? status = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [BuyerOrderTransport].
extension BuyerOrderTransportPatterns on BuyerOrderTransport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuyerOrderTransport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuyerOrderTransport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuyerOrderTransport value)  $default,){
final _that = this;
switch (_that) {
case _BuyerOrderTransport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuyerOrderTransport value)?  $default,){
final _that = this;
switch (_that) {
case _BuyerOrderTransport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String option,  String? status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuyerOrderTransport() when $default != null:
return $default(_that.id,_that.option,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String option,  String? status)  $default,) {final _that = this;
switch (_that) {
case _BuyerOrderTransport():
return $default(_that.id,_that.option,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String option,  String? status)?  $default,) {final _that = this;
switch (_that) {
case _BuyerOrderTransport() when $default != null:
return $default(_that.id,_that.option,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuyerOrderTransport implements BuyerOrderTransport {
  const _BuyerOrderTransport({required this.id, required this.option, this.status});
  factory _BuyerOrderTransport.fromJson(Map<String, dynamic> json) => _$BuyerOrderTransportFromJson(json);

@override final  int id;
@override final  String option;
@override final  String? status;

/// Create a copy of BuyerOrderTransport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyerOrderTransportCopyWith<_BuyerOrderTransport> get copyWith => __$BuyerOrderTransportCopyWithImpl<_BuyerOrderTransport>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuyerOrderTransportToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyerOrderTransport&&(identical(other.id, id) || other.id == id)&&(identical(other.option, option) || other.option == option)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,option,status);

@override
String toString() {
  return 'BuyerOrderTransport(id: $id, option: $option, status: $status)';
}


}

/// @nodoc
abstract mixin class _$BuyerOrderTransportCopyWith<$Res> implements $BuyerOrderTransportCopyWith<$Res> {
  factory _$BuyerOrderTransportCopyWith(_BuyerOrderTransport value, $Res Function(_BuyerOrderTransport) _then) = __$BuyerOrderTransportCopyWithImpl;
@override @useResult
$Res call({
 int id, String option, String? status
});




}
/// @nodoc
class __$BuyerOrderTransportCopyWithImpl<$Res>
    implements _$BuyerOrderTransportCopyWith<$Res> {
  __$BuyerOrderTransportCopyWithImpl(this._self, this._then);

  final _BuyerOrderTransport _self;
  final $Res Function(_BuyerOrderTransport) _then;

/// Create a copy of BuyerOrderTransport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? option = null,Object? status = freezed,}) {
  return _then(_BuyerOrderTransport(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as String,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$BuyerOrder {

 String get id;@JsonKey(name: 'buyer_id') String get buyerId;@JsonKey(name: 'seller_id') String get sellerId; String get address;@JsonKey(name: 'date_created') String get dateCreated;@JsonKey(name: 'total_amount') int get totalAmount; List<BuyerOrderItem> get items; BuyerOrderTransport? get transport;
/// Create a copy of BuyerOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyerOrderCopyWith<BuyerOrder> get copyWith => _$BuyerOrderCopyWithImpl<BuyerOrder>(this as BuyerOrder, _$identity);

  /// Serializes this BuyerOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyerOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.address, address) || other.address == address)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.transport, transport) || other.transport == transport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,buyerId,sellerId,address,dateCreated,totalAmount,const DeepCollectionEquality().hash(items),transport);

@override
String toString() {
  return 'BuyerOrder(id: $id, buyerId: $buyerId, sellerId: $sellerId, address: $address, dateCreated: $dateCreated, totalAmount: $totalAmount, items: $items, transport: $transport)';
}


}

/// @nodoc
abstract mixin class $BuyerOrderCopyWith<$Res>  {
  factory $BuyerOrderCopyWith(BuyerOrder value, $Res Function(BuyerOrder) _then) = _$BuyerOrderCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'buyer_id') String buyerId,@JsonKey(name: 'seller_id') String sellerId, String address,@JsonKey(name: 'date_created') String dateCreated,@JsonKey(name: 'total_amount') int totalAmount, List<BuyerOrderItem> items, BuyerOrderTransport? transport
});


$BuyerOrderTransportCopyWith<$Res>? get transport;

}
/// @nodoc
class _$BuyerOrderCopyWithImpl<$Res>
    implements $BuyerOrderCopyWith<$Res> {
  _$BuyerOrderCopyWithImpl(this._self, this._then);

  final BuyerOrder _self;
  final $Res Function(BuyerOrder) _then;

/// Create a copy of BuyerOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? buyerId = null,Object? sellerId = null,Object? address = null,Object? dateCreated = null,Object? totalAmount = null,Object? items = null,Object? transport = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,buyerId: null == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<BuyerOrderItem>,transport: freezed == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as BuyerOrderTransport?,
  ));
}
/// Create a copy of BuyerOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerOrderTransportCopyWith<$Res>? get transport {
    if (_self.transport == null) {
    return null;
  }

  return $BuyerOrderTransportCopyWith<$Res>(_self.transport!, (value) {
    return _then(_self.copyWith(transport: value));
  });
}
}


/// Adds pattern-matching-related methods to [BuyerOrder].
extension BuyerOrderPatterns on BuyerOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuyerOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuyerOrder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuyerOrder value)  $default,){
final _that = this;
switch (_that) {
case _BuyerOrder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuyerOrder value)?  $default,){
final _that = this;
switch (_that) {
case _BuyerOrder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'buyer_id')  String buyerId, @JsonKey(name: 'seller_id')  String sellerId,  String address, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'total_amount')  int totalAmount,  List<BuyerOrderItem> items,  BuyerOrderTransport? transport)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuyerOrder() when $default != null:
return $default(_that.id,_that.buyerId,_that.sellerId,_that.address,_that.dateCreated,_that.totalAmount,_that.items,_that.transport);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'buyer_id')  String buyerId, @JsonKey(name: 'seller_id')  String sellerId,  String address, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'total_amount')  int totalAmount,  List<BuyerOrderItem> items,  BuyerOrderTransport? transport)  $default,) {final _that = this;
switch (_that) {
case _BuyerOrder():
return $default(_that.id,_that.buyerId,_that.sellerId,_that.address,_that.dateCreated,_that.totalAmount,_that.items,_that.transport);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'buyer_id')  String buyerId, @JsonKey(name: 'seller_id')  String sellerId,  String address, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'total_amount')  int totalAmount,  List<BuyerOrderItem> items,  BuyerOrderTransport? transport)?  $default,) {final _that = this;
switch (_that) {
case _BuyerOrder() when $default != null:
return $default(_that.id,_that.buyerId,_that.sellerId,_that.address,_that.dateCreated,_that.totalAmount,_that.items,_that.transport);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuyerOrder implements BuyerOrder {
  const _BuyerOrder({required this.id, @JsonKey(name: 'buyer_id') required this.buyerId, @JsonKey(name: 'seller_id') required this.sellerId, required this.address, @JsonKey(name: 'date_created') required this.dateCreated, @JsonKey(name: 'total_amount') required this.totalAmount, required final  List<BuyerOrderItem> items, this.transport}): _items = items;
  factory _BuyerOrder.fromJson(Map<String, dynamic> json) => _$BuyerOrderFromJson(json);

@override final  String id;
@override@JsonKey(name: 'buyer_id') final  String buyerId;
@override@JsonKey(name: 'seller_id') final  String sellerId;
@override final  String address;
@override@JsonKey(name: 'date_created') final  String dateCreated;
@override@JsonKey(name: 'total_amount') final  int totalAmount;
 final  List<BuyerOrderItem> _items;
@override List<BuyerOrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override final  BuyerOrderTransport? transport;

/// Create a copy of BuyerOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyerOrderCopyWith<_BuyerOrder> get copyWith => __$BuyerOrderCopyWithImpl<_BuyerOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuyerOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyerOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.address, address) || other.address == address)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.transport, transport) || other.transport == transport));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,buyerId,sellerId,address,dateCreated,totalAmount,const DeepCollectionEquality().hash(_items),transport);

@override
String toString() {
  return 'BuyerOrder(id: $id, buyerId: $buyerId, sellerId: $sellerId, address: $address, dateCreated: $dateCreated, totalAmount: $totalAmount, items: $items, transport: $transport)';
}


}

/// @nodoc
abstract mixin class _$BuyerOrderCopyWith<$Res> implements $BuyerOrderCopyWith<$Res> {
  factory _$BuyerOrderCopyWith(_BuyerOrder value, $Res Function(_BuyerOrder) _then) = __$BuyerOrderCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'buyer_id') String buyerId,@JsonKey(name: 'seller_id') String sellerId, String address,@JsonKey(name: 'date_created') String dateCreated,@JsonKey(name: 'total_amount') int totalAmount, List<BuyerOrderItem> items, BuyerOrderTransport? transport
});


@override $BuyerOrderTransportCopyWith<$Res>? get transport;

}
/// @nodoc
class __$BuyerOrderCopyWithImpl<$Res>
    implements _$BuyerOrderCopyWith<$Res> {
  __$BuyerOrderCopyWithImpl(this._self, this._then);

  final _BuyerOrder _self;
  final $Res Function(_BuyerOrder) _then;

/// Create a copy of BuyerOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? buyerId = null,Object? sellerId = null,Object? address = null,Object? dateCreated = null,Object? totalAmount = null,Object? items = null,Object? transport = freezed,}) {
  return _then(_BuyerOrder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,buyerId: null == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<BuyerOrderItem>,transport: freezed == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as BuyerOrderTransport?,
  ));
}

/// Create a copy of BuyerOrder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BuyerOrderTransportCopyWith<$Res>? get transport {
    if (_self.transport == null) {
    return null;
  }

  return $BuyerOrderTransportCopyWith<$Res>(_self.transport!, (value) {
    return _then(_self.copyWith(transport: value));
  });
}
}


/// @nodoc
mixin _$MessageResponse {

 String get message;
/// Create a copy of MessageResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessageResponseCopyWith<MessageResponse> get copyWith => _$MessageResponseCopyWithImpl<MessageResponse>(this as MessageResponse, _$identity);

  /// Serializes this MessageResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessageResponse&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MessageResponse(message: $message)';
}


}

/// @nodoc
abstract mixin class $MessageResponseCopyWith<$Res>  {
  factory $MessageResponseCopyWith(MessageResponse value, $Res Function(MessageResponse) _then) = _$MessageResponseCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$MessageResponseCopyWithImpl<$Res>
    implements $MessageResponseCopyWith<$Res> {
  _$MessageResponseCopyWithImpl(this._self, this._then);

  final MessageResponse _self;
  final $Res Function(MessageResponse) _then;

/// Create a copy of MessageResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? message = null,}) {
  return _then(_self.copyWith(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MessageResponse].
extension MessageResponsePatterns on MessageResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessageResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessageResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessageResponse value)  $default,){
final _that = this;
switch (_that) {
case _MessageResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessageResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MessageResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessageResponse() when $default != null:
return $default(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String message)  $default,) {final _that = this;
switch (_that) {
case _MessageResponse():
return $default(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String message)?  $default,) {final _that = this;
switch (_that) {
case _MessageResponse() when $default != null:
return $default(_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessageResponse implements MessageResponse {
  const _MessageResponse({required this.message});
  factory _MessageResponse.fromJson(Map<String, dynamic> json) => _$MessageResponseFromJson(json);

@override final  String message;

/// Create a copy of MessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessageResponseCopyWith<_MessageResponse> get copyWith => __$MessageResponseCopyWithImpl<_MessageResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessageResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessageResponse&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'MessageResponse(message: $message)';
}


}

/// @nodoc
abstract mixin class _$MessageResponseCopyWith<$Res> implements $MessageResponseCopyWith<$Res> {
  factory _$MessageResponseCopyWith(_MessageResponse value, $Res Function(_MessageResponse) _then) = __$MessageResponseCopyWithImpl;
@override @useResult
$Res call({
 String message
});




}
/// @nodoc
class __$MessageResponseCopyWithImpl<$Res>
    implements _$MessageResponseCopyWith<$Res> {
  __$MessageResponseCopyWithImpl(this._self, this._then);

  final _MessageResponse _self;
  final $Res Function(_MessageResponse) _then;

/// Create a copy of MessageResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_MessageResponse(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
