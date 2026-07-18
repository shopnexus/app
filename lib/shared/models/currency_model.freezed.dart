// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExchangeRatesResponse {

 String get base; Map<String, double> get rates;@JsonKey(name: 'fetched_at') String get fetchedAt; List<String> get supported;
/// Create a copy of ExchangeRatesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeRatesResponseCopyWith<ExchangeRatesResponse> get copyWith => _$ExchangeRatesResponseCopyWithImpl<ExchangeRatesResponse>(this as ExchangeRatesResponse, _$identity);

  /// Serializes this ExchangeRatesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeRatesResponse&&(identical(other.base, base) || other.base == base)&&const DeepCollectionEquality().equals(other.rates, rates)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt)&&const DeepCollectionEquality().equals(other.supported, supported));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,base,const DeepCollectionEquality().hash(rates),fetchedAt,const DeepCollectionEquality().hash(supported));

@override
String toString() {
  return 'ExchangeRatesResponse(base: $base, rates: $rates, fetchedAt: $fetchedAt, supported: $supported)';
}


}

/// @nodoc
abstract mixin class $ExchangeRatesResponseCopyWith<$Res>  {
  factory $ExchangeRatesResponseCopyWith(ExchangeRatesResponse value, $Res Function(ExchangeRatesResponse) _then) = _$ExchangeRatesResponseCopyWithImpl;
@useResult
$Res call({
 String base, Map<String, double> rates,@JsonKey(name: 'fetched_at') String fetchedAt, List<String> supported
});




}
/// @nodoc
class _$ExchangeRatesResponseCopyWithImpl<$Res>
    implements $ExchangeRatesResponseCopyWith<$Res> {
  _$ExchangeRatesResponseCopyWithImpl(this._self, this._then);

  final ExchangeRatesResponse _self;
  final $Res Function(ExchangeRatesResponse) _then;

/// Create a copy of ExchangeRatesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? base = null,Object? rates = null,Object? fetchedAt = null,Object? supported = null,}) {
  return _then(_self.copyWith(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,rates: null == rates ? _self.rates : rates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as String,supported: null == supported ? _self.supported : supported // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [ExchangeRatesResponse].
extension ExchangeRatesResponsePatterns on ExchangeRatesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExchangeRatesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExchangeRatesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExchangeRatesResponse value)  $default,){
final _that = this;
switch (_that) {
case _ExchangeRatesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExchangeRatesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ExchangeRatesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String base,  Map<String, double> rates, @JsonKey(name: 'fetched_at')  String fetchedAt,  List<String> supported)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExchangeRatesResponse() when $default != null:
return $default(_that.base,_that.rates,_that.fetchedAt,_that.supported);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String base,  Map<String, double> rates, @JsonKey(name: 'fetched_at')  String fetchedAt,  List<String> supported)  $default,) {final _that = this;
switch (_that) {
case _ExchangeRatesResponse():
return $default(_that.base,_that.rates,_that.fetchedAt,_that.supported);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String base,  Map<String, double> rates, @JsonKey(name: 'fetched_at')  String fetchedAt,  List<String> supported)?  $default,) {final _that = this;
switch (_that) {
case _ExchangeRatesResponse() when $default != null:
return $default(_that.base,_that.rates,_that.fetchedAt,_that.supported);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExchangeRatesResponse implements ExchangeRatesResponse {
  const _ExchangeRatesResponse({required this.base, required final  Map<String, double> rates, @JsonKey(name: 'fetched_at') required this.fetchedAt, required final  List<String> supported}): _rates = rates,_supported = supported;
  factory _ExchangeRatesResponse.fromJson(Map<String, dynamic> json) => _$ExchangeRatesResponseFromJson(json);

@override final  String base;
 final  Map<String, double> _rates;
@override Map<String, double> get rates {
  if (_rates is EqualUnmodifiableMapView) return _rates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rates);
}

@override@JsonKey(name: 'fetched_at') final  String fetchedAt;
 final  List<String> _supported;
@override List<String> get supported {
  if (_supported is EqualUnmodifiableListView) return _supported;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_supported);
}


/// Create a copy of ExchangeRatesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExchangeRatesResponseCopyWith<_ExchangeRatesResponse> get copyWith => __$ExchangeRatesResponseCopyWithImpl<_ExchangeRatesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExchangeRatesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExchangeRatesResponse&&(identical(other.base, base) || other.base == base)&&const DeepCollectionEquality().equals(other._rates, _rates)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt)&&const DeepCollectionEquality().equals(other._supported, _supported));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,base,const DeepCollectionEquality().hash(_rates),fetchedAt,const DeepCollectionEquality().hash(_supported));

@override
String toString() {
  return 'ExchangeRatesResponse(base: $base, rates: $rates, fetchedAt: $fetchedAt, supported: $supported)';
}


}

/// @nodoc
abstract mixin class _$ExchangeRatesResponseCopyWith<$Res> implements $ExchangeRatesResponseCopyWith<$Res> {
  factory _$ExchangeRatesResponseCopyWith(_ExchangeRatesResponse value, $Res Function(_ExchangeRatesResponse) _then) = __$ExchangeRatesResponseCopyWithImpl;
@override @useResult
$Res call({
 String base, Map<String, double> rates,@JsonKey(name: 'fetched_at') String fetchedAt, List<String> supported
});




}
/// @nodoc
class __$ExchangeRatesResponseCopyWithImpl<$Res>
    implements _$ExchangeRatesResponseCopyWith<$Res> {
  __$ExchangeRatesResponseCopyWithImpl(this._self, this._then);

  final _ExchangeRatesResponse _self;
  final $Res Function(_ExchangeRatesResponse) _then;

/// Create a copy of ExchangeRatesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? base = null,Object? rates = null,Object? fetchedAt = null,Object? supported = null,}) {
  return _then(_ExchangeRatesResponse(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,rates: null == rates ? _self._rates : rates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as String,supported: null == supported ? _self._supported : supported // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
