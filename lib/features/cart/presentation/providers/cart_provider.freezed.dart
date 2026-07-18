// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CartState {

 List<CartItem> get items; bool get isLoading; String? get errorMessage; String get preferredCurrency; Map<String, double> get rates;
/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartStateCopyWith<CartState> get copyWith => _$CartStateCopyWithImpl<CartState>(this as CartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartState&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.preferredCurrency, preferredCurrency) || other.preferredCurrency == preferredCurrency)&&const DeepCollectionEquality().equals(other.rates, rates));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),isLoading,errorMessage,preferredCurrency,const DeepCollectionEquality().hash(rates));

@override
String toString() {
  return 'CartState(items: $items, isLoading: $isLoading, errorMessage: $errorMessage, preferredCurrency: $preferredCurrency, rates: $rates)';
}


}

/// @nodoc
abstract mixin class $CartStateCopyWith<$Res>  {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) _then) = _$CartStateCopyWithImpl;
@useResult
$Res call({
 List<CartItem> items, bool isLoading, String? errorMessage, String preferredCurrency, Map<String, double> rates
});




}
/// @nodoc
class _$CartStateCopyWithImpl<$Res>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._self, this._then);

  final CartState _self;
  final $Res Function(CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? isLoading = null,Object? errorMessage = freezed,Object? preferredCurrency = null,Object? rates = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,preferredCurrency: null == preferredCurrency ? _self.preferredCurrency : preferredCurrency // ignore: cast_nullable_to_non_nullable
as String,rates: null == rates ? _self.rates : rates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}

}


/// Adds pattern-matching-related methods to [CartState].
extension CartStatePatterns on CartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartState value)  $default,){
final _that = this;
switch (_that) {
case _CartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartState value)?  $default,){
final _that = this;
switch (_that) {
case _CartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CartItem> items,  bool isLoading,  String? errorMessage,  String preferredCurrency,  Map<String, double> rates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.items,_that.isLoading,_that.errorMessage,_that.preferredCurrency,_that.rates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CartItem> items,  bool isLoading,  String? errorMessage,  String preferredCurrency,  Map<String, double> rates)  $default,) {final _that = this;
switch (_that) {
case _CartState():
return $default(_that.items,_that.isLoading,_that.errorMessage,_that.preferredCurrency,_that.rates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CartItem> items,  bool isLoading,  String? errorMessage,  String preferredCurrency,  Map<String, double> rates)?  $default,) {final _that = this;
switch (_that) {
case _CartState() when $default != null:
return $default(_that.items,_that.isLoading,_that.errorMessage,_that.preferredCurrency,_that.rates);case _:
  return null;

}
}

}

/// @nodoc


class _CartState extends CartState {
  const _CartState({final  List<CartItem> items = const [], this.isLoading = false, this.errorMessage, this.preferredCurrency = 'VND', final  Map<String, double> rates = const {}}): _items = items,_rates = rates,super._();
  

 final  List<CartItem> _items;
@override@JsonKey() List<CartItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override@JsonKey() final  String preferredCurrency;
 final  Map<String, double> _rates;
@override@JsonKey() Map<String, double> get rates {
  if (_rates is EqualUnmodifiableMapView) return _rates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rates);
}


/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartStateCopyWith<_CartState> get copyWith => __$CartStateCopyWithImpl<_CartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartState&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.preferredCurrency, preferredCurrency) || other.preferredCurrency == preferredCurrency)&&const DeepCollectionEquality().equals(other._rates, _rates));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),isLoading,errorMessage,preferredCurrency,const DeepCollectionEquality().hash(_rates));

@override
String toString() {
  return 'CartState(items: $items, isLoading: $isLoading, errorMessage: $errorMessage, preferredCurrency: $preferredCurrency, rates: $rates)';
}


}

/// @nodoc
abstract mixin class _$CartStateCopyWith<$Res> implements $CartStateCopyWith<$Res> {
  factory _$CartStateCopyWith(_CartState value, $Res Function(_CartState) _then) = __$CartStateCopyWithImpl;
@override @useResult
$Res call({
 List<CartItem> items, bool isLoading, String? errorMessage, String preferredCurrency, Map<String, double> rates
});




}
/// @nodoc
class __$CartStateCopyWithImpl<$Res>
    implements _$CartStateCopyWith<$Res> {
  __$CartStateCopyWithImpl(this._self, this._then);

  final _CartState _self;
  final $Res Function(_CartState) _then;

/// Create a copy of CartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? isLoading = null,Object? errorMessage = freezed,Object? preferredCurrency = null,Object? rates = null,}) {
  return _then(_CartState(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CartItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,preferredCurrency: null == preferredCurrency ? _self.preferredCurrency : preferredCurrency // ignore: cast_nullable_to_non_nullable
as String,rates: null == rates ? _self._rates : rates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,
  ));
}


}

// dart format on
