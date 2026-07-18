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

// dart format on
