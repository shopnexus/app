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
mixin _$Resource {

 String get id; String get mime;@JsonKey(name: 'object_key') String get objectKey; String get provider; int get size; String? get checksum; String? get url;@JsonKey(name: 'url_expires_at') String? get urlExpiresAt;
/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResourceCopyWith<Resource> get copyWith => _$ResourceCopyWithImpl<Resource>(this as Resource, _$identity);

  /// Serializes this Resource to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Resource&&(identical(other.id, id) || other.id == id)&&(identical(other.mime, mime) || other.mime == mime)&&(identical(other.objectKey, objectKey) || other.objectKey == objectKey)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.size, size) || other.size == size)&&(identical(other.checksum, checksum) || other.checksum == checksum)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mime,objectKey,provider,size,checksum,url,urlExpiresAt);

@override
String toString() {
  return 'Resource(id: $id, mime: $mime, objectKey: $objectKey, provider: $provider, size: $size, checksum: $checksum, url: $url, urlExpiresAt: $urlExpiresAt)';
}


}

/// @nodoc
abstract mixin class $ResourceCopyWith<$Res>  {
  factory $ResourceCopyWith(Resource value, $Res Function(Resource) _then) = _$ResourceCopyWithImpl;
@useResult
$Res call({
 String id, String mime,@JsonKey(name: 'object_key') String objectKey, String provider, int size, String? checksum, String? url,@JsonKey(name: 'url_expires_at') String? urlExpiresAt
});




}
/// @nodoc
class _$ResourceCopyWithImpl<$Res>
    implements $ResourceCopyWith<$Res> {
  _$ResourceCopyWithImpl(this._self, this._then);

  final Resource _self;
  final $Res Function(Resource) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? mime = null,Object? objectKey = null,Object? provider = null,Object? size = null,Object? checksum = freezed,Object? url = freezed,Object? urlExpiresAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mime: null == mime ? _self.mime : mime // ignore: cast_nullable_to_non_nullable
as String,objectKey: null == objectKey ? _self.objectKey : objectKey // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,checksum: freezed == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Resource].
extension ResourcePatterns on Resource {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Resource value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Resource() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Resource value)  $default,){
final _that = this;
switch (_that) {
case _Resource():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Resource value)?  $default,){
final _that = this;
switch (_that) {
case _Resource() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String mime, @JsonKey(name: 'object_key')  String objectKey,  String provider,  int size,  String? checksum,  String? url, @JsonKey(name: 'url_expires_at')  String? urlExpiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Resource() when $default != null:
return $default(_that.id,_that.mime,_that.objectKey,_that.provider,_that.size,_that.checksum,_that.url,_that.urlExpiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String mime, @JsonKey(name: 'object_key')  String objectKey,  String provider,  int size,  String? checksum,  String? url, @JsonKey(name: 'url_expires_at')  String? urlExpiresAt)  $default,) {final _that = this;
switch (_that) {
case _Resource():
return $default(_that.id,_that.mime,_that.objectKey,_that.provider,_that.size,_that.checksum,_that.url,_that.urlExpiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String mime, @JsonKey(name: 'object_key')  String objectKey,  String provider,  int size,  String? checksum,  String? url, @JsonKey(name: 'url_expires_at')  String? urlExpiresAt)?  $default,) {final _that = this;
switch (_that) {
case _Resource() when $default != null:
return $default(_that.id,_that.mime,_that.objectKey,_that.provider,_that.size,_that.checksum,_that.url,_that.urlExpiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Resource implements Resource {
  const _Resource({required this.id, required this.mime, @JsonKey(name: 'object_key') required this.objectKey, required this.provider, required this.size, this.checksum, this.url, @JsonKey(name: 'url_expires_at') this.urlExpiresAt});
  factory _Resource.fromJson(Map<String, dynamic> json) => _$ResourceFromJson(json);

@override final  String id;
@override final  String mime;
@override@JsonKey(name: 'object_key') final  String objectKey;
@override final  String provider;
@override final  int size;
@override final  String? checksum;
@override final  String? url;
@override@JsonKey(name: 'url_expires_at') final  String? urlExpiresAt;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResourceCopyWith<_Resource> get copyWith => __$ResourceCopyWithImpl<_Resource>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResourceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Resource&&(identical(other.id, id) || other.id == id)&&(identical(other.mime, mime) || other.mime == mime)&&(identical(other.objectKey, objectKey) || other.objectKey == objectKey)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.size, size) || other.size == size)&&(identical(other.checksum, checksum) || other.checksum == checksum)&&(identical(other.url, url) || other.url == url)&&(identical(other.urlExpiresAt, urlExpiresAt) || other.urlExpiresAt == urlExpiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,mime,objectKey,provider,size,checksum,url,urlExpiresAt);

@override
String toString() {
  return 'Resource(id: $id, mime: $mime, objectKey: $objectKey, provider: $provider, size: $size, checksum: $checksum, url: $url, urlExpiresAt: $urlExpiresAt)';
}


}

/// @nodoc
abstract mixin class _$ResourceCopyWith<$Res> implements $ResourceCopyWith<$Res> {
  factory _$ResourceCopyWith(_Resource value, $Res Function(_Resource) _then) = __$ResourceCopyWithImpl;
@override @useResult
$Res call({
 String id, String mime,@JsonKey(name: 'object_key') String objectKey, String provider, int size, String? checksum, String? url,@JsonKey(name: 'url_expires_at') String? urlExpiresAt
});




}
/// @nodoc
class __$ResourceCopyWithImpl<$Res>
    implements _$ResourceCopyWith<$Res> {
  __$ResourceCopyWithImpl(this._self, this._then);

  final _Resource _self;
  final $Res Function(_Resource) _then;

/// Create a copy of Resource
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? mime = null,Object? objectKey = null,Object? provider = null,Object? size = null,Object? checksum = freezed,Object? url = freezed,Object? urlExpiresAt = freezed,}) {
  return _then(_Resource(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,mime: null == mime ? _self.mime : mime // ignore: cast_nullable_to_non_nullable
as String,objectKey: null == objectKey ? _self.objectKey : objectKey // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,checksum: freezed == checksum ? _self.checksum : checksum // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String?,urlExpiresAt: freezed == urlExpiresAt ? _self.urlExpiresAt : urlExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Profile {

 String get name; String get country; String get locale; String get timezone;@JsonKey(name: 'created_at') String get createdAt; Resource? get avatar;@JsonKey(name: 'date_of_birth') String? get dateOfBirth; String? get description; dynamic get gender;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.gender, gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,country,locale,timezone,createdAt,avatar,dateOfBirth,description,const DeepCollectionEquality().hash(gender));

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
 String name, String country, String locale, String timezone,@JsonKey(name: 'created_at') String createdAt, Resource? avatar,@JsonKey(name: 'date_of_birth') String? dateOfBirth, String? description, dynamic gender
});


$ResourceCopyWith<$Res>? get avatar;

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
as dynamic,
  ));
}
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ResourceCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String country,  String locale,  String timezone, @JsonKey(name: 'created_at')  String createdAt,  Resource? avatar, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? description,  dynamic gender)?  $default,{required TResult orElse(),}) {final _that = this;
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String country,  String locale,  String timezone, @JsonKey(name: 'created_at')  String createdAt,  Resource? avatar, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? description,  dynamic gender)  $default,) {final _that = this;
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String country,  String locale,  String timezone, @JsonKey(name: 'created_at')  String createdAt,  Resource? avatar, @JsonKey(name: 'date_of_birth')  String? dateOfBirth,  String? description,  dynamic gender)?  $default,) {final _that = this;
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
@override final  dynamic gender;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.avatar, avatar) || other.avatar == avatar)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.gender, gender));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,country,locale,timezone,createdAt,avatar,dateOfBirth,description,const DeepCollectionEquality().hash(gender));

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
 String name, String country, String locale, String timezone,@JsonKey(name: 'created_at') String createdAt, Resource? avatar,@JsonKey(name: 'date_of_birth') String? dateOfBirth, String? description, dynamic gender
});


@override $ResourceCopyWith<$Res>? get avatar;

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
as dynamic,
  ));
}

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ResourceCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
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


$ResourceCopyWith<$Res>? get avatar;

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
/// Create a copy of PublicAccount
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ResourceCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
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


@override $ResourceCopyWith<$Res>? get avatar;

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

/// Create a copy of PublicAccount
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ResourceCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}


/// @nodoc
mixin _$Contact {

 String get id;@JsonKey(name: 'full_name') String get fullName;@JsonKey(fromJson: _parsePhone) String get phone;@JsonKey(name: 'phone_verified') bool get phoneVerified; String get address;@JsonKey(name: 'address_detail') String? get addressDetail;@JsonKey(name: 'address_type') String get addressType;// 'home' | 'work'
 String get country;@JsonKey(name: 'province_code') String get provinceCode;@JsonKey(name: 'province_name') String get provinceName;@JsonKey(name: 'district_code') String? get districtCode;@JsonKey(name: 'district_name') String? get districtName;@JsonKey(name: 'ward_code') String get wardCode;@JsonKey(name: 'ward_name') String get wardName;@JsonKey(name: 'postal_code') String? get postalCode;@JsonKey(name: 'is_default_delivery') bool get isDefaultDelivery;@JsonKey(name: 'is_default_pickup') bool get isDefaultPickup; double? get latitude; double? get longitude;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of Contact
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ContactCopyWith<Contact> get copyWith => _$ContactCopyWithImpl<Contact>(this as Contact, _$identity);

  /// Serializes this Contact to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Contact&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressDetail, addressDetail) || other.addressDetail == addressDetail)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.country, country) || other.country == country)&&(identical(other.provinceCode, provinceCode) || other.provinceCode == provinceCode)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.districtCode, districtCode) || other.districtCode == districtCode)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.wardCode, wardCode) || other.wardCode == wardCode)&&(identical(other.wardName, wardName) || other.wardName == wardName)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.isDefaultDelivery, isDefaultDelivery) || other.isDefaultDelivery == isDefaultDelivery)&&(identical(other.isDefaultPickup, isDefaultPickup) || other.isDefaultPickup == isDefaultPickup)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,fullName,phone,phoneVerified,address,addressDetail,addressType,country,provinceCode,provinceName,districtCode,districtName,wardCode,wardName,postalCode,isDefaultDelivery,isDefaultPickup,latitude,longitude,createdAt]);

@override
String toString() {
  return 'Contact(id: $id, fullName: $fullName, phone: $phone, phoneVerified: $phoneVerified, address: $address, addressDetail: $addressDetail, addressType: $addressType, country: $country, provinceCode: $provinceCode, provinceName: $provinceName, districtCode: $districtCode, districtName: $districtName, wardCode: $wardCode, wardName: $wardName, postalCode: $postalCode, isDefaultDelivery: $isDefaultDelivery, isDefaultPickup: $isDefaultPickup, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ContactCopyWith<$Res>  {
  factory $ContactCopyWith(Contact value, $Res Function(Contact) _then) = _$ContactCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'full_name') String fullName,@JsonKey(fromJson: _parsePhone) String phone,@JsonKey(name: 'phone_verified') bool phoneVerified, String address,@JsonKey(name: 'address_detail') String? addressDetail,@JsonKey(name: 'address_type') String addressType, String country,@JsonKey(name: 'province_code') String provinceCode,@JsonKey(name: 'province_name') String provinceName,@JsonKey(name: 'district_code') String? districtCode,@JsonKey(name: 'district_name') String? districtName,@JsonKey(name: 'ward_code') String wardCode,@JsonKey(name: 'ward_name') String wardName,@JsonKey(name: 'postal_code') String? postalCode,@JsonKey(name: 'is_default_delivery') bool isDefaultDelivery,@JsonKey(name: 'is_default_pickup') bool isDefaultPickup, double? latitude, double? longitude,@JsonKey(name: 'created_at') String createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? fullName = null,Object? phone = null,Object? phoneVerified = null,Object? address = null,Object? addressDetail = freezed,Object? addressType = null,Object? country = null,Object? provinceCode = null,Object? provinceName = null,Object? districtCode = freezed,Object? districtName = freezed,Object? wardCode = null,Object? wardName = null,Object? postalCode = freezed,Object? isDefaultDelivery = null,Object? isDefaultPickup = null,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,addressDetail: freezed == addressDetail ? _self.addressDetail : addressDetail // ignore: cast_nullable_to_non_nullable
as String?,addressType: null == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,provinceCode: null == provinceCode ? _self.provinceCode : provinceCode // ignore: cast_nullable_to_non_nullable
as String,provinceName: null == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String,districtCode: freezed == districtCode ? _self.districtCode : districtCode // ignore: cast_nullable_to_non_nullable
as String?,districtName: freezed == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String?,wardCode: null == wardCode ? _self.wardCode : wardCode // ignore: cast_nullable_to_non_nullable
as String,wardName: null == wardName ? _self.wardName : wardName // ignore: cast_nullable_to_non_nullable
as String,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,isDefaultDelivery: null == isDefaultDelivery ? _self.isDefaultDelivery : isDefaultDelivery // ignore: cast_nullable_to_non_nullable
as bool,isDefaultPickup: null == isDefaultPickup ? _self.isDefaultPickup : isDefaultPickup // ignore: cast_nullable_to_non_nullable
as bool,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'full_name')  String fullName, @JsonKey(fromJson: _parsePhone)  String phone, @JsonKey(name: 'phone_verified')  bool phoneVerified,  String address, @JsonKey(name: 'address_detail')  String? addressDetail, @JsonKey(name: 'address_type')  String addressType,  String country, @JsonKey(name: 'province_code')  String provinceCode, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'district_code')  String? districtCode, @JsonKey(name: 'district_name')  String? districtName, @JsonKey(name: 'ward_code')  String wardCode, @JsonKey(name: 'ward_name')  String wardName, @JsonKey(name: 'postal_code')  String? postalCode, @JsonKey(name: 'is_default_delivery')  bool isDefaultDelivery, @JsonKey(name: 'is_default_pickup')  bool isDefaultPickup,  double? latitude,  double? longitude, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Contact() when $default != null:
return $default(_that.id,_that.fullName,_that.phone,_that.phoneVerified,_that.address,_that.addressDetail,_that.addressType,_that.country,_that.provinceCode,_that.provinceName,_that.districtCode,_that.districtName,_that.wardCode,_that.wardName,_that.postalCode,_that.isDefaultDelivery,_that.isDefaultPickup,_that.latitude,_that.longitude,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'full_name')  String fullName, @JsonKey(fromJson: _parsePhone)  String phone, @JsonKey(name: 'phone_verified')  bool phoneVerified,  String address, @JsonKey(name: 'address_detail')  String? addressDetail, @JsonKey(name: 'address_type')  String addressType,  String country, @JsonKey(name: 'province_code')  String provinceCode, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'district_code')  String? districtCode, @JsonKey(name: 'district_name')  String? districtName, @JsonKey(name: 'ward_code')  String wardCode, @JsonKey(name: 'ward_name')  String wardName, @JsonKey(name: 'postal_code')  String? postalCode, @JsonKey(name: 'is_default_delivery')  bool isDefaultDelivery, @JsonKey(name: 'is_default_pickup')  bool isDefaultPickup,  double? latitude,  double? longitude, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _Contact():
return $default(_that.id,_that.fullName,_that.phone,_that.phoneVerified,_that.address,_that.addressDetail,_that.addressType,_that.country,_that.provinceCode,_that.provinceName,_that.districtCode,_that.districtName,_that.wardCode,_that.wardName,_that.postalCode,_that.isDefaultDelivery,_that.isDefaultPickup,_that.latitude,_that.longitude,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'full_name')  String fullName, @JsonKey(fromJson: _parsePhone)  String phone, @JsonKey(name: 'phone_verified')  bool phoneVerified,  String address, @JsonKey(name: 'address_detail')  String? addressDetail, @JsonKey(name: 'address_type')  String addressType,  String country, @JsonKey(name: 'province_code')  String provinceCode, @JsonKey(name: 'province_name')  String provinceName, @JsonKey(name: 'district_code')  String? districtCode, @JsonKey(name: 'district_name')  String? districtName, @JsonKey(name: 'ward_code')  String wardCode, @JsonKey(name: 'ward_name')  String wardName, @JsonKey(name: 'postal_code')  String? postalCode, @JsonKey(name: 'is_default_delivery')  bool isDefaultDelivery, @JsonKey(name: 'is_default_pickup')  bool isDefaultPickup,  double? latitude,  double? longitude, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Contact() when $default != null:
return $default(_that.id,_that.fullName,_that.phone,_that.phoneVerified,_that.address,_that.addressDetail,_that.addressType,_that.country,_that.provinceCode,_that.provinceName,_that.districtCode,_that.districtName,_that.wardCode,_that.wardName,_that.postalCode,_that.isDefaultDelivery,_that.isDefaultPickup,_that.latitude,_that.longitude,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Contact implements Contact {
  const _Contact({required this.id, @JsonKey(name: 'full_name') required this.fullName, @JsonKey(fromJson: _parsePhone) required this.phone, @JsonKey(name: 'phone_verified') required this.phoneVerified, required this.address, @JsonKey(name: 'address_detail') this.addressDetail, @JsonKey(name: 'address_type') required this.addressType, required this.country, @JsonKey(name: 'province_code') required this.provinceCode, @JsonKey(name: 'province_name') required this.provinceName, @JsonKey(name: 'district_code') this.districtCode, @JsonKey(name: 'district_name') this.districtName, @JsonKey(name: 'ward_code') required this.wardCode, @JsonKey(name: 'ward_name') required this.wardName, @JsonKey(name: 'postal_code') this.postalCode, @JsonKey(name: 'is_default_delivery') required this.isDefaultDelivery, @JsonKey(name: 'is_default_pickup') required this.isDefaultPickup, this.latitude, this.longitude, @JsonKey(name: 'created_at') required this.createdAt});
  factory _Contact.fromJson(Map<String, dynamic> json) => _$ContactFromJson(json);

@override final  String id;
@override@JsonKey(name: 'full_name') final  String fullName;
@override@JsonKey(fromJson: _parsePhone) final  String phone;
@override@JsonKey(name: 'phone_verified') final  bool phoneVerified;
@override final  String address;
@override@JsonKey(name: 'address_detail') final  String? addressDetail;
@override@JsonKey(name: 'address_type') final  String addressType;
// 'home' | 'work'
@override final  String country;
@override@JsonKey(name: 'province_code') final  String provinceCode;
@override@JsonKey(name: 'province_name') final  String provinceName;
@override@JsonKey(name: 'district_code') final  String? districtCode;
@override@JsonKey(name: 'district_name') final  String? districtName;
@override@JsonKey(name: 'ward_code') final  String wardCode;
@override@JsonKey(name: 'ward_name') final  String wardName;
@override@JsonKey(name: 'postal_code') final  String? postalCode;
@override@JsonKey(name: 'is_default_delivery') final  bool isDefaultDelivery;
@override@JsonKey(name: 'is_default_pickup') final  bool isDefaultPickup;
@override final  double? latitude;
@override final  double? longitude;
@override@JsonKey(name: 'created_at') final  String createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Contact&&(identical(other.id, id) || other.id == id)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneVerified, phoneVerified) || other.phoneVerified == phoneVerified)&&(identical(other.address, address) || other.address == address)&&(identical(other.addressDetail, addressDetail) || other.addressDetail == addressDetail)&&(identical(other.addressType, addressType) || other.addressType == addressType)&&(identical(other.country, country) || other.country == country)&&(identical(other.provinceCode, provinceCode) || other.provinceCode == provinceCode)&&(identical(other.provinceName, provinceName) || other.provinceName == provinceName)&&(identical(other.districtCode, districtCode) || other.districtCode == districtCode)&&(identical(other.districtName, districtName) || other.districtName == districtName)&&(identical(other.wardCode, wardCode) || other.wardCode == wardCode)&&(identical(other.wardName, wardName) || other.wardName == wardName)&&(identical(other.postalCode, postalCode) || other.postalCode == postalCode)&&(identical(other.isDefaultDelivery, isDefaultDelivery) || other.isDefaultDelivery == isDefaultDelivery)&&(identical(other.isDefaultPickup, isDefaultPickup) || other.isDefaultPickup == isDefaultPickup)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,fullName,phone,phoneVerified,address,addressDetail,addressType,country,provinceCode,provinceName,districtCode,districtName,wardCode,wardName,postalCode,isDefaultDelivery,isDefaultPickup,latitude,longitude,createdAt]);

@override
String toString() {
  return 'Contact(id: $id, fullName: $fullName, phone: $phone, phoneVerified: $phoneVerified, address: $address, addressDetail: $addressDetail, addressType: $addressType, country: $country, provinceCode: $provinceCode, provinceName: $provinceName, districtCode: $districtCode, districtName: $districtName, wardCode: $wardCode, wardName: $wardName, postalCode: $postalCode, isDefaultDelivery: $isDefaultDelivery, isDefaultPickup: $isDefaultPickup, latitude: $latitude, longitude: $longitude, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ContactCopyWith<$Res> implements $ContactCopyWith<$Res> {
  factory _$ContactCopyWith(_Contact value, $Res Function(_Contact) _then) = __$ContactCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'full_name') String fullName,@JsonKey(fromJson: _parsePhone) String phone,@JsonKey(name: 'phone_verified') bool phoneVerified, String address,@JsonKey(name: 'address_detail') String? addressDetail,@JsonKey(name: 'address_type') String addressType, String country,@JsonKey(name: 'province_code') String provinceCode,@JsonKey(name: 'province_name') String provinceName,@JsonKey(name: 'district_code') String? districtCode,@JsonKey(name: 'district_name') String? districtName,@JsonKey(name: 'ward_code') String wardCode,@JsonKey(name: 'ward_name') String wardName,@JsonKey(name: 'postal_code') String? postalCode,@JsonKey(name: 'is_default_delivery') bool isDefaultDelivery,@JsonKey(name: 'is_default_pickup') bool isDefaultPickup, double? latitude, double? longitude,@JsonKey(name: 'created_at') String createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? fullName = null,Object? phone = null,Object? phoneVerified = null,Object? address = null,Object? addressDetail = freezed,Object? addressType = null,Object? country = null,Object? provinceCode = null,Object? provinceName = null,Object? districtCode = freezed,Object? districtName = freezed,Object? wardCode = null,Object? wardName = null,Object? postalCode = freezed,Object? isDefaultDelivery = null,Object? isDefaultPickup = null,Object? latitude = freezed,Object? longitude = freezed,Object? createdAt = null,}) {
  return _then(_Contact(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneVerified: null == phoneVerified ? _self.phoneVerified : phoneVerified // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,addressDetail: freezed == addressDetail ? _self.addressDetail : addressDetail // ignore: cast_nullable_to_non_nullable
as String?,addressType: null == addressType ? _self.addressType : addressType // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,provinceCode: null == provinceCode ? _self.provinceCode : provinceCode // ignore: cast_nullable_to_non_nullable
as String,provinceName: null == provinceName ? _self.provinceName : provinceName // ignore: cast_nullable_to_non_nullable
as String,districtCode: freezed == districtCode ? _self.districtCode : districtCode // ignore: cast_nullable_to_non_nullable
as String?,districtName: freezed == districtName ? _self.districtName : districtName // ignore: cast_nullable_to_non_nullable
as String?,wardCode: null == wardCode ? _self.wardCode : wardCode // ignore: cast_nullable_to_non_nullable
as String,wardName: null == wardName ? _self.wardName : wardName // ignore: cast_nullable_to_non_nullable
as String,postalCode: freezed == postalCode ? _self.postalCode : postalCode // ignore: cast_nullable_to_non_nullable
as String?,isDefaultDelivery: null == isDefaultDelivery ? _self.isDefaultDelivery : isDefaultDelivery // ignore: cast_nullable_to_non_nullable
as bool,isDefaultPickup: null == isDefaultPickup ? _self.isDefaultPickup : isDefaultPickup // ignore: cast_nullable_to_non_nullable
as bool,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
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

@JsonKey(name: 'order_id') String? get orderId;@JsonKey(name: 'ticket_id') String? get ticketId;@JsonKey(name: 'redirect_url') String? get redirectUrl;
/// Create a copy of NotificationMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationMetadataCopyWith<NotificationMetadata> get copyWith => _$NotificationMetadataCopyWithImpl<NotificationMetadata>(this as NotificationMetadata, _$identity);

  /// Serializes this NotificationMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationMetadata&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,ticketId,redirectUrl);

@override
String toString() {
  return 'NotificationMetadata(orderId: $orderId, ticketId: $ticketId, redirectUrl: $redirectUrl)';
}


}

/// @nodoc
abstract mixin class $NotificationMetadataCopyWith<$Res>  {
  factory $NotificationMetadataCopyWith(NotificationMetadata value, $Res Function(NotificationMetadata) _then) = _$NotificationMetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'order_id') String? orderId,@JsonKey(name: 'ticket_id') String? ticketId,@JsonKey(name: 'redirect_url') String? redirectUrl
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
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = freezed,Object? ticketId = freezed,Object? redirectUrl = freezed,}) {
  return _then(_self.copyWith(
orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,ticketId: freezed == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'ticket_id')  String? ticketId, @JsonKey(name: 'redirect_url')  String? redirectUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationMetadata() when $default != null:
return $default(_that.orderId,_that.ticketId,_that.redirectUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'ticket_id')  String? ticketId, @JsonKey(name: 'redirect_url')  String? redirectUrl)  $default,) {final _that = this;
switch (_that) {
case _NotificationMetadata():
return $default(_that.orderId,_that.ticketId,_that.redirectUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'ticket_id')  String? ticketId, @JsonKey(name: 'redirect_url')  String? redirectUrl)?  $default,) {final _that = this;
switch (_that) {
case _NotificationMetadata() when $default != null:
return $default(_that.orderId,_that.ticketId,_that.redirectUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationMetadata implements NotificationMetadata {
  const _NotificationMetadata({@JsonKey(name: 'order_id') this.orderId, @JsonKey(name: 'ticket_id') this.ticketId, @JsonKey(name: 'redirect_url') this.redirectUrl});
  factory _NotificationMetadata.fromJson(Map<String, dynamic> json) => _$NotificationMetadataFromJson(json);

@override@JsonKey(name: 'order_id') final  String? orderId;
@override@JsonKey(name: 'ticket_id') final  String? ticketId;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationMetadata&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId)&&(identical(other.redirectUrl, redirectUrl) || other.redirectUrl == redirectUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,ticketId,redirectUrl);

@override
String toString() {
  return 'NotificationMetadata(orderId: $orderId, ticketId: $ticketId, redirectUrl: $redirectUrl)';
}


}

/// @nodoc
abstract mixin class _$NotificationMetadataCopyWith<$Res> implements $NotificationMetadataCopyWith<$Res> {
  factory _$NotificationMetadataCopyWith(_NotificationMetadata value, $Res Function(_NotificationMetadata) _then) = __$NotificationMetadataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'order_id') String? orderId,@JsonKey(name: 'ticket_id') String? ticketId,@JsonKey(name: 'redirect_url') String? redirectUrl
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
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = freezed,Object? ticketId = freezed,Object? redirectUrl = freezed,}) {
  return _then(_NotificationMetadata(
orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,ticketId: freezed == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as String?,redirectUrl: freezed == redirectUrl ? _self.redirectUrl : redirectUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Notification {

 String get title; String get category;// 'order' | 'promotion' | 'system' | 'chat' | 'social'
@JsonKey(name: 'created_at') String get createdAt; Map<String, dynamic>? get payload;@JsonKey(name: 'read_at') String? get readAt;// Fields tương thích
 int? get legacyId; String? get legacyContent;
/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationCopyWith<Notification> get copyWith => _$NotificationCopyWithImpl<Notification>(this as Notification, _$identity);

  /// Serializes this Notification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Notification&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.payload, payload)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.legacyId, legacyId) || other.legacyId == legacyId)&&(identical(other.legacyContent, legacyContent) || other.legacyContent == legacyContent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,category,createdAt,const DeepCollectionEquality().hash(payload),readAt,legacyId,legacyContent);

@override
String toString() {
  return 'Notification(title: $title, category: $category, createdAt: $createdAt, payload: $payload, readAt: $readAt, legacyId: $legacyId, legacyContent: $legacyContent)';
}


}

/// @nodoc
abstract mixin class $NotificationCopyWith<$Res>  {
  factory $NotificationCopyWith(Notification value, $Res Function(Notification) _then) = _$NotificationCopyWithImpl;
@useResult
$Res call({
 String title, String category,@JsonKey(name: 'created_at') String createdAt, Map<String, dynamic>? payload,@JsonKey(name: 'read_at') String? readAt, int? legacyId, String? legacyContent
});




}
/// @nodoc
class _$NotificationCopyWithImpl<$Res>
    implements $NotificationCopyWith<$Res> {
  _$NotificationCopyWithImpl(this._self, this._then);

  final Notification _self;
  final $Res Function(Notification) _then;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? category = null,Object? createdAt = null,Object? payload = freezed,Object? readAt = freezed,Object? legacyId = freezed,Object? legacyContent = freezed,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,payload: freezed == payload ? _self.payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as String?,legacyId: freezed == legacyId ? _self.legacyId : legacyId // ignore: cast_nullable_to_non_nullable
as int?,legacyContent: freezed == legacyContent ? _self.legacyContent : legacyContent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String title,  String category, @JsonKey(name: 'created_at')  String createdAt,  Map<String, dynamic>? payload, @JsonKey(name: 'read_at')  String? readAt,  int? legacyId,  String? legacyContent)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Notification() when $default != null:
return $default(_that.title,_that.category,_that.createdAt,_that.payload,_that.readAt,_that.legacyId,_that.legacyContent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String title,  String category, @JsonKey(name: 'created_at')  String createdAt,  Map<String, dynamic>? payload, @JsonKey(name: 'read_at')  String? readAt,  int? legacyId,  String? legacyContent)  $default,) {final _that = this;
switch (_that) {
case _Notification():
return $default(_that.title,_that.category,_that.createdAt,_that.payload,_that.readAt,_that.legacyId,_that.legacyContent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String title,  String category, @JsonKey(name: 'created_at')  String createdAt,  Map<String, dynamic>? payload, @JsonKey(name: 'read_at')  String? readAt,  int? legacyId,  String? legacyContent)?  $default,) {final _that = this;
switch (_that) {
case _Notification() when $default != null:
return $default(_that.title,_that.category,_that.createdAt,_that.payload,_that.readAt,_that.legacyId,_that.legacyContent);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Notification extends Notification {
  const _Notification({required this.title, required this.category, @JsonKey(name: 'created_at') required this.createdAt, final  Map<String, dynamic>? payload, @JsonKey(name: 'read_at') this.readAt, this.legacyId, this.legacyContent}): _payload = payload,super._();
  factory _Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

@override final  String title;
@override final  String category;
// 'order' | 'promotion' | 'system' | 'chat' | 'social'
@override@JsonKey(name: 'created_at') final  String createdAt;
 final  Map<String, dynamic>? _payload;
@override Map<String, dynamic>? get payload {
  final value = _payload;
  if (value == null) return null;
  if (_payload is EqualUnmodifiableMapView) return _payload;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'read_at') final  String? readAt;
// Fields tương thích
@override final  int? legacyId;
@override final  String? legacyContent;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Notification&&(identical(other.title, title) || other.title == title)&&(identical(other.category, category) || other.category == category)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._payload, _payload)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.legacyId, legacyId) || other.legacyId == legacyId)&&(identical(other.legacyContent, legacyContent) || other.legacyContent == legacyContent));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,category,createdAt,const DeepCollectionEquality().hash(_payload),readAt,legacyId,legacyContent);

@override
String toString() {
  return 'Notification(title: $title, category: $category, createdAt: $createdAt, payload: $payload, readAt: $readAt, legacyId: $legacyId, legacyContent: $legacyContent)';
}


}

/// @nodoc
abstract mixin class _$NotificationCopyWith<$Res> implements $NotificationCopyWith<$Res> {
  factory _$NotificationCopyWith(_Notification value, $Res Function(_Notification) _then) = __$NotificationCopyWithImpl;
@override @useResult
$Res call({
 String title, String category,@JsonKey(name: 'created_at') String createdAt, Map<String, dynamic>? payload,@JsonKey(name: 'read_at') String? readAt, int? legacyId, String? legacyContent
});




}
/// @nodoc
class __$NotificationCopyWithImpl<$Res>
    implements _$NotificationCopyWith<$Res> {
  __$NotificationCopyWithImpl(this._self, this._then);

  final _Notification _self;
  final $Res Function(_Notification) _then;

/// Create a copy of Notification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? category = null,Object? createdAt = null,Object? payload = freezed,Object? readAt = freezed,Object? legacyId = freezed,Object? legacyContent = freezed,}) {
  return _then(_Notification(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,payload: freezed == payload ? _self._payload : payload // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as String?,legacyId: freezed == legacyId ? _self.legacyId : legacyId // ignore: cast_nullable_to_non_nullable
as int?,legacyContent: freezed == legacyContent ? _self.legacyContent : legacyContent // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$UnreadCountResponse {

 int get unread;
/// Create a copy of UnreadCountResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UnreadCountResponseCopyWith<UnreadCountResponse> get copyWith => _$UnreadCountResponseCopyWithImpl<UnreadCountResponse>(this as UnreadCountResponse, _$identity);

  /// Serializes this UnreadCountResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UnreadCountResponse&&(identical(other.unread, unread) || other.unread == unread));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unread);

@override
String toString() {
  return 'UnreadCountResponse(unread: $unread)';
}


}

/// @nodoc
abstract mixin class $UnreadCountResponseCopyWith<$Res>  {
  factory $UnreadCountResponseCopyWith(UnreadCountResponse value, $Res Function(UnreadCountResponse) _then) = _$UnreadCountResponseCopyWithImpl;
@useResult
$Res call({
 int unread
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
@pragma('vm:prefer-inline') @override $Res call({Object? unread = null,}) {
  return _then(_self.copyWith(
unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int unread)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UnreadCountResponse() when $default != null:
return $default(_that.unread);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int unread)  $default,) {final _that = this;
switch (_that) {
case _UnreadCountResponse():
return $default(_that.unread);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int unread)?  $default,) {final _that = this;
switch (_that) {
case _UnreadCountResponse() when $default != null:
return $default(_that.unread);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UnreadCountResponse extends UnreadCountResponse {
  const _UnreadCountResponse({required this.unread}): super._();
  factory _UnreadCountResponse.fromJson(Map<String, dynamic> json) => _$UnreadCountResponseFromJson(json);

@override final  int unread;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnreadCountResponse&&(identical(other.unread, unread) || other.unread == unread));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,unread);

@override
String toString() {
  return 'UnreadCountResponse(unread: $unread)';
}


}

/// @nodoc
abstract mixin class _$UnreadCountResponseCopyWith<$Res> implements $UnreadCountResponseCopyWith<$Res> {
  factory _$UnreadCountResponseCopyWith(_UnreadCountResponse value, $Res Function(_UnreadCountResponse) _then) = __$UnreadCountResponseCopyWithImpl;
@override @useResult
$Res call({
 int unread
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
@override @pragma('vm:prefer-inline') $Res call({Object? unread = null,}) {
  return _then(_UnreadCountResponse(
unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MarkNotificationsReadRequest {

 String get before;
/// Create a copy of MarkNotificationsReadRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkNotificationsReadRequestCopyWith<MarkNotificationsReadRequest> get copyWith => _$MarkNotificationsReadRequestCopyWithImpl<MarkNotificationsReadRequest>(this as MarkNotificationsReadRequest, _$identity);

  /// Serializes this MarkNotificationsReadRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkNotificationsReadRequest&&(identical(other.before, before) || other.before == before));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,before);

@override
String toString() {
  return 'MarkNotificationsReadRequest(before: $before)';
}


}

/// @nodoc
abstract mixin class $MarkNotificationsReadRequestCopyWith<$Res>  {
  factory $MarkNotificationsReadRequestCopyWith(MarkNotificationsReadRequest value, $Res Function(MarkNotificationsReadRequest) _then) = _$MarkNotificationsReadRequestCopyWithImpl;
@useResult
$Res call({
 String before
});




}
/// @nodoc
class _$MarkNotificationsReadRequestCopyWithImpl<$Res>
    implements $MarkNotificationsReadRequestCopyWith<$Res> {
  _$MarkNotificationsReadRequestCopyWithImpl(this._self, this._then);

  final MarkNotificationsReadRequest _self;
  final $Res Function(MarkNotificationsReadRequest) _then;

/// Create a copy of MarkNotificationsReadRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? before = null,}) {
  return _then(_self.copyWith(
before: null == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MarkNotificationsReadRequest].
extension MarkNotificationsReadRequestPatterns on MarkNotificationsReadRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarkNotificationsReadRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarkNotificationsReadRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarkNotificationsReadRequest value)  $default,){
final _that = this;
switch (_that) {
case _MarkNotificationsReadRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarkNotificationsReadRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MarkNotificationsReadRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String before)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarkNotificationsReadRequest() when $default != null:
return $default(_that.before);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String before)  $default,) {final _that = this;
switch (_that) {
case _MarkNotificationsReadRequest():
return $default(_that.before);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String before)?  $default,) {final _that = this;
switch (_that) {
case _MarkNotificationsReadRequest() when $default != null:
return $default(_that.before);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarkNotificationsReadRequest implements MarkNotificationsReadRequest {
  const _MarkNotificationsReadRequest({required this.before});
  factory _MarkNotificationsReadRequest.fromJson(Map<String, dynamic> json) => _$MarkNotificationsReadRequestFromJson(json);

@override final  String before;

/// Create a copy of MarkNotificationsReadRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkNotificationsReadRequestCopyWith<_MarkNotificationsReadRequest> get copyWith => __$MarkNotificationsReadRequestCopyWithImpl<_MarkNotificationsReadRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarkNotificationsReadRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkNotificationsReadRequest&&(identical(other.before, before) || other.before == before));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,before);

@override
String toString() {
  return 'MarkNotificationsReadRequest(before: $before)';
}


}

/// @nodoc
abstract mixin class _$MarkNotificationsReadRequestCopyWith<$Res> implements $MarkNotificationsReadRequestCopyWith<$Res> {
  factory _$MarkNotificationsReadRequestCopyWith(_MarkNotificationsReadRequest value, $Res Function(_MarkNotificationsReadRequest) _then) = __$MarkNotificationsReadRequestCopyWithImpl;
@override @useResult
$Res call({
 String before
});




}
/// @nodoc
class __$MarkNotificationsReadRequestCopyWithImpl<$Res>
    implements _$MarkNotificationsReadRequestCopyWith<$Res> {
  __$MarkNotificationsReadRequestCopyWithImpl(this._self, this._then);

  final _MarkNotificationsReadRequest _self;
  final $Res Function(_MarkNotificationsReadRequest) _then;

/// Create a copy of MarkNotificationsReadRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? before = null,}) {
  return _then(_MarkNotificationsReadRequest(
before: null == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as String,
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
