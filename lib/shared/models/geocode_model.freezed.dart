// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geocode_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GeocodeLatLng {

 double get latitude; double get longitude;
/// Create a copy of GeocodeLatLng
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeocodeLatLngCopyWith<GeocodeLatLng> get copyWith => _$GeocodeLatLngCopyWithImpl<GeocodeLatLng>(this as GeocodeLatLng, _$identity);

  /// Serializes this GeocodeLatLng to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeocodeLatLng&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'GeocodeLatLng(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $GeocodeLatLngCopyWith<$Res>  {
  factory $GeocodeLatLngCopyWith(GeocodeLatLng value, $Res Function(GeocodeLatLng) _then) = _$GeocodeLatLngCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class _$GeocodeLatLngCopyWithImpl<$Res>
    implements $GeocodeLatLngCopyWith<$Res> {
  _$GeocodeLatLngCopyWithImpl(this._self, this._then);

  final GeocodeLatLng _self;
  final $Res Function(GeocodeLatLng) _then;

/// Create a copy of GeocodeLatLng
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GeocodeLatLng].
extension GeocodeLatLngPatterns on GeocodeLatLng {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeocodeLatLng value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeocodeLatLng() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeocodeLatLng value)  $default,){
final _that = this;
switch (_that) {
case _GeocodeLatLng():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeocodeLatLng value)?  $default,){
final _that = this;
switch (_that) {
case _GeocodeLatLng() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeocodeLatLng() when $default != null:
return $default(_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude)  $default,) {final _that = this;
switch (_that) {
case _GeocodeLatLng():
return $default(_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _GeocodeLatLng() when $default != null:
return $default(_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeocodeLatLng implements GeocodeLatLng {
  const _GeocodeLatLng({required this.latitude, required this.longitude});
  factory _GeocodeLatLng.fromJson(Map<String, dynamic> json) => _$GeocodeLatLngFromJson(json);

@override final  double latitude;
@override final  double longitude;

/// Create a copy of GeocodeLatLng
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeocodeLatLngCopyWith<_GeocodeLatLng> get copyWith => __$GeocodeLatLngCopyWithImpl<_GeocodeLatLng>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeocodeLatLngToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeocodeLatLng&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'GeocodeLatLng(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$GeocodeLatLngCopyWith<$Res> implements $GeocodeLatLngCopyWith<$Res> {
  factory _$GeocodeLatLngCopyWith(_GeocodeLatLng value, $Res Function(_GeocodeLatLng) _then) = __$GeocodeLatLngCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class __$GeocodeLatLngCopyWithImpl<$Res>
    implements _$GeocodeLatLngCopyWith<$Res> {
  __$GeocodeLatLngCopyWithImpl(this._self, this._then);

  final _GeocodeLatLng _self;
  final $Res Function(_GeocodeLatLng) _then;

/// Create a copy of GeocodeLatLng
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(_GeocodeLatLng(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$GeocodeSuggestion {

@JsonKey(name: 'display_name') String get displayName; double get latitude; double get longitude;
/// Create a copy of GeocodeSuggestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeocodeSuggestionCopyWith<GeocodeSuggestion> get copyWith => _$GeocodeSuggestionCopyWithImpl<GeocodeSuggestion>(this as GeocodeSuggestion, _$identity);

  /// Serializes this GeocodeSuggestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeocodeSuggestion&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayName,latitude,longitude);

@override
String toString() {
  return 'GeocodeSuggestion(displayName: $displayName, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $GeocodeSuggestionCopyWith<$Res>  {
  factory $GeocodeSuggestionCopyWith(GeocodeSuggestion value, $Res Function(GeocodeSuggestion) _then) = _$GeocodeSuggestionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'display_name') String displayName, double latitude, double longitude
});




}
/// @nodoc
class _$GeocodeSuggestionCopyWithImpl<$Res>
    implements $GeocodeSuggestionCopyWith<$Res> {
  _$GeocodeSuggestionCopyWithImpl(this._self, this._then);

  final GeocodeSuggestion _self;
  final $Res Function(GeocodeSuggestion) _then;

/// Create a copy of GeocodeSuggestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? displayName = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [GeocodeSuggestion].
extension GeocodeSuggestionPatterns on GeocodeSuggestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GeocodeSuggestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GeocodeSuggestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GeocodeSuggestion value)  $default,){
final _that = this;
switch (_that) {
case _GeocodeSuggestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GeocodeSuggestion value)?  $default,){
final _that = this;
switch (_that) {
case _GeocodeSuggestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'display_name')  String displayName,  double latitude,  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GeocodeSuggestion() when $default != null:
return $default(_that.displayName,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'display_name')  String displayName,  double latitude,  double longitude)  $default,) {final _that = this;
switch (_that) {
case _GeocodeSuggestion():
return $default(_that.displayName,_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'display_name')  String displayName,  double latitude,  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _GeocodeSuggestion() when $default != null:
return $default(_that.displayName,_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GeocodeSuggestion implements GeocodeSuggestion {
  const _GeocodeSuggestion({@JsonKey(name: 'display_name') required this.displayName, required this.latitude, required this.longitude});
  factory _GeocodeSuggestion.fromJson(Map<String, dynamic> json) => _$GeocodeSuggestionFromJson(json);

@override@JsonKey(name: 'display_name') final  String displayName;
@override final  double latitude;
@override final  double longitude;

/// Create a copy of GeocodeSuggestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GeocodeSuggestionCopyWith<_GeocodeSuggestion> get copyWith => __$GeocodeSuggestionCopyWithImpl<_GeocodeSuggestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GeocodeSuggestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GeocodeSuggestion&&(identical(other.displayName, displayName) || other.displayName == displayName)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,displayName,latitude,longitude);

@override
String toString() {
  return 'GeocodeSuggestion(displayName: $displayName, latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$GeocodeSuggestionCopyWith<$Res> implements $GeocodeSuggestionCopyWith<$Res> {
  factory _$GeocodeSuggestionCopyWith(_GeocodeSuggestion value, $Res Function(_GeocodeSuggestion) _then) = __$GeocodeSuggestionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'display_name') String displayName, double latitude, double longitude
});




}
/// @nodoc
class __$GeocodeSuggestionCopyWithImpl<$Res>
    implements _$GeocodeSuggestionCopyWith<$Res> {
  __$GeocodeSuggestionCopyWithImpl(this._self, this._then);

  final _GeocodeSuggestion _self;
  final $Res Function(_GeocodeSuggestion) _then;

/// Create a copy of GeocodeSuggestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? displayName = null,Object? latitude = null,Object? longitude = null,}) {
  return _then(_GeocodeSuggestion(
displayName: null == displayName ? _self.displayName : displayName // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$ForwardGeocodeRequest {

 String get address;
/// Create a copy of ForwardGeocodeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForwardGeocodeRequestCopyWith<ForwardGeocodeRequest> get copyWith => _$ForwardGeocodeRequestCopyWithImpl<ForwardGeocodeRequest>(this as ForwardGeocodeRequest, _$identity);

  /// Serializes this ForwardGeocodeRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForwardGeocodeRequest&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address);

@override
String toString() {
  return 'ForwardGeocodeRequest(address: $address)';
}


}

/// @nodoc
abstract mixin class $ForwardGeocodeRequestCopyWith<$Res>  {
  factory $ForwardGeocodeRequestCopyWith(ForwardGeocodeRequest value, $Res Function(ForwardGeocodeRequest) _then) = _$ForwardGeocodeRequestCopyWithImpl;
@useResult
$Res call({
 String address
});




}
/// @nodoc
class _$ForwardGeocodeRequestCopyWithImpl<$Res>
    implements $ForwardGeocodeRequestCopyWith<$Res> {
  _$ForwardGeocodeRequestCopyWithImpl(this._self, this._then);

  final ForwardGeocodeRequest _self;
  final $Res Function(ForwardGeocodeRequest) _then;

/// Create a copy of ForwardGeocodeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ForwardGeocodeRequest].
extension ForwardGeocodeRequestPatterns on ForwardGeocodeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForwardGeocodeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForwardGeocodeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForwardGeocodeRequest value)  $default,){
final _that = this;
switch (_that) {
case _ForwardGeocodeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForwardGeocodeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ForwardGeocodeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForwardGeocodeRequest() when $default != null:
return $default(_that.address);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address)  $default,) {final _that = this;
switch (_that) {
case _ForwardGeocodeRequest():
return $default(_that.address);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address)?  $default,) {final _that = this;
switch (_that) {
case _ForwardGeocodeRequest() when $default != null:
return $default(_that.address);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ForwardGeocodeRequest implements ForwardGeocodeRequest {
  const _ForwardGeocodeRequest({required this.address});
  factory _ForwardGeocodeRequest.fromJson(Map<String, dynamic> json) => _$ForwardGeocodeRequestFromJson(json);

@override final  String address;

/// Create a copy of ForwardGeocodeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForwardGeocodeRequestCopyWith<_ForwardGeocodeRequest> get copyWith => __$ForwardGeocodeRequestCopyWithImpl<_ForwardGeocodeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForwardGeocodeRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForwardGeocodeRequest&&(identical(other.address, address) || other.address == address));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address);

@override
String toString() {
  return 'ForwardGeocodeRequest(address: $address)';
}


}

/// @nodoc
abstract mixin class _$ForwardGeocodeRequestCopyWith<$Res> implements $ForwardGeocodeRequestCopyWith<$Res> {
  factory _$ForwardGeocodeRequestCopyWith(_ForwardGeocodeRequest value, $Res Function(_ForwardGeocodeRequest) _then) = __$ForwardGeocodeRequestCopyWithImpl;
@override @useResult
$Res call({
 String address
});




}
/// @nodoc
class __$ForwardGeocodeRequestCopyWithImpl<$Res>
    implements _$ForwardGeocodeRequestCopyWith<$Res> {
  __$ForwardGeocodeRequestCopyWithImpl(this._self, this._then);

  final _ForwardGeocodeRequest _self;
  final $Res Function(_ForwardGeocodeRequest) _then;

/// Create a copy of ForwardGeocodeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,}) {
  return _then(_ForwardGeocodeRequest(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ReverseGeocodeRequest {

 double get latitude; double get longitude;
/// Create a copy of ReverseGeocodeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReverseGeocodeRequestCopyWith<ReverseGeocodeRequest> get copyWith => _$ReverseGeocodeRequestCopyWithImpl<ReverseGeocodeRequest>(this as ReverseGeocodeRequest, _$identity);

  /// Serializes this ReverseGeocodeRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReverseGeocodeRequest&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'ReverseGeocodeRequest(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class $ReverseGeocodeRequestCopyWith<$Res>  {
  factory $ReverseGeocodeRequestCopyWith(ReverseGeocodeRequest value, $Res Function(ReverseGeocodeRequest) _then) = _$ReverseGeocodeRequestCopyWithImpl;
@useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class _$ReverseGeocodeRequestCopyWithImpl<$Res>
    implements $ReverseGeocodeRequestCopyWith<$Res> {
  _$ReverseGeocodeRequestCopyWithImpl(this._self, this._then);

  final ReverseGeocodeRequest _self;
  final $Res Function(ReverseGeocodeRequest) _then;

/// Create a copy of ReverseGeocodeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ReverseGeocodeRequest].
extension ReverseGeocodeRequestPatterns on ReverseGeocodeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReverseGeocodeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReverseGeocodeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReverseGeocodeRequest value)  $default,){
final _that = this;
switch (_that) {
case _ReverseGeocodeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReverseGeocodeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ReverseGeocodeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double latitude,  double longitude)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReverseGeocodeRequest() when $default != null:
return $default(_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double latitude,  double longitude)  $default,) {final _that = this;
switch (_that) {
case _ReverseGeocodeRequest():
return $default(_that.latitude,_that.longitude);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double latitude,  double longitude)?  $default,) {final _that = this;
switch (_that) {
case _ReverseGeocodeRequest() when $default != null:
return $default(_that.latitude,_that.longitude);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReverseGeocodeRequest implements ReverseGeocodeRequest {
  const _ReverseGeocodeRequest({required this.latitude, required this.longitude});
  factory _ReverseGeocodeRequest.fromJson(Map<String, dynamic> json) => _$ReverseGeocodeRequestFromJson(json);

@override final  double latitude;
@override final  double longitude;

/// Create a copy of ReverseGeocodeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReverseGeocodeRequestCopyWith<_ReverseGeocodeRequest> get copyWith => __$ReverseGeocodeRequestCopyWithImpl<_ReverseGeocodeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReverseGeocodeRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReverseGeocodeRequest&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude);

@override
String toString() {
  return 'ReverseGeocodeRequest(latitude: $latitude, longitude: $longitude)';
}


}

/// @nodoc
abstract mixin class _$ReverseGeocodeRequestCopyWith<$Res> implements $ReverseGeocodeRequestCopyWith<$Res> {
  factory _$ReverseGeocodeRequestCopyWith(_ReverseGeocodeRequest value, $Res Function(_ReverseGeocodeRequest) _then) = __$ReverseGeocodeRequestCopyWithImpl;
@override @useResult
$Res call({
 double latitude, double longitude
});




}
/// @nodoc
class __$ReverseGeocodeRequestCopyWithImpl<$Res>
    implements _$ReverseGeocodeRequestCopyWith<$Res> {
  __$ReverseGeocodeRequestCopyWithImpl(this._self, this._then);

  final _ReverseGeocodeRequest _self;
  final $Res Function(_ReverseGeocodeRequest) _then;

/// Create a copy of ReverseGeocodeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,}) {
  return _then(_ReverseGeocodeRequest(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$FileUploadResponse {

@JsonKey(name: 'rs_id') String get rsId; String get url;@JsonKey(name: 'mime_type') String get mimeType;
/// Create a copy of FileUploadResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileUploadResponseCopyWith<FileUploadResponse> get copyWith => _$FileUploadResponseCopyWithImpl<FileUploadResponse>(this as FileUploadResponse, _$identity);

  /// Serializes this FileUploadResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileUploadResponse&&(identical(other.rsId, rsId) || other.rsId == rsId)&&(identical(other.url, url) || other.url == url)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rsId,url,mimeType);

@override
String toString() {
  return 'FileUploadResponse(rsId: $rsId, url: $url, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class $FileUploadResponseCopyWith<$Res>  {
  factory $FileUploadResponseCopyWith(FileUploadResponse value, $Res Function(FileUploadResponse) _then) = _$FileUploadResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'rs_id') String rsId, String url,@JsonKey(name: 'mime_type') String mimeType
});




}
/// @nodoc
class _$FileUploadResponseCopyWithImpl<$Res>
    implements $FileUploadResponseCopyWith<$Res> {
  _$FileUploadResponseCopyWithImpl(this._self, this._then);

  final FileUploadResponse _self;
  final $Res Function(FileUploadResponse) _then;

/// Create a copy of FileUploadResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rsId = null,Object? url = null,Object? mimeType = null,}) {
  return _then(_self.copyWith(
rsId: null == rsId ? _self.rsId : rsId // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FileUploadResponse].
extension FileUploadResponsePatterns on FileUploadResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileUploadResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileUploadResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileUploadResponse value)  $default,){
final _that = this;
switch (_that) {
case _FileUploadResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileUploadResponse value)?  $default,){
final _that = this;
switch (_that) {
case _FileUploadResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'rs_id')  String rsId,  String url, @JsonKey(name: 'mime_type')  String mimeType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileUploadResponse() when $default != null:
return $default(_that.rsId,_that.url,_that.mimeType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'rs_id')  String rsId,  String url, @JsonKey(name: 'mime_type')  String mimeType)  $default,) {final _that = this;
switch (_that) {
case _FileUploadResponse():
return $default(_that.rsId,_that.url,_that.mimeType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'rs_id')  String rsId,  String url, @JsonKey(name: 'mime_type')  String mimeType)?  $default,) {final _that = this;
switch (_that) {
case _FileUploadResponse() when $default != null:
return $default(_that.rsId,_that.url,_that.mimeType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FileUploadResponse implements FileUploadResponse {
  const _FileUploadResponse({@JsonKey(name: 'rs_id') required this.rsId, required this.url, @JsonKey(name: 'mime_type') required this.mimeType});
  factory _FileUploadResponse.fromJson(Map<String, dynamic> json) => _$FileUploadResponseFromJson(json);

@override@JsonKey(name: 'rs_id') final  String rsId;
@override final  String url;
@override@JsonKey(name: 'mime_type') final  String mimeType;

/// Create a copy of FileUploadResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileUploadResponseCopyWith<_FileUploadResponse> get copyWith => __$FileUploadResponseCopyWithImpl<_FileUploadResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileUploadResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileUploadResponse&&(identical(other.rsId, rsId) || other.rsId == rsId)&&(identical(other.url, url) || other.url == url)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,rsId,url,mimeType);

@override
String toString() {
  return 'FileUploadResponse(rsId: $rsId, url: $url, mimeType: $mimeType)';
}


}

/// @nodoc
abstract mixin class _$FileUploadResponseCopyWith<$Res> implements $FileUploadResponseCopyWith<$Res> {
  factory _$FileUploadResponseCopyWith(_FileUploadResponse value, $Res Function(_FileUploadResponse) _then) = __$FileUploadResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'rs_id') String rsId, String url,@JsonKey(name: 'mime_type') String mimeType
});




}
/// @nodoc
class __$FileUploadResponseCopyWithImpl<$Res>
    implements _$FileUploadResponseCopyWith<$Res> {
  __$FileUploadResponseCopyWithImpl(this._self, this._then);

  final _FileUploadResponse _self;
  final $Res Function(_FileUploadResponse) _then;

/// Create a copy of FileUploadResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rsId = null,Object? url = null,Object? mimeType = null,}) {
  return _then(_FileUploadResponse(
rsId: null == rsId ? _self.rsId : rsId // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,mimeType: null == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
