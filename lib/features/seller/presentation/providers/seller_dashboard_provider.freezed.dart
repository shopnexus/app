// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_dashboard_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellerDashboard {

 OrderSummary get summary; Map<ListingStatus, int> get listings;
/// Create a copy of SellerDashboard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerDashboardCopyWith<SellerDashboard> get copyWith => _$SellerDashboardCopyWithImpl<SellerDashboard>(this as SellerDashboard, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerDashboard&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other.listings, listings));
}


@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(listings));

@override
String toString() {
  return 'SellerDashboard(summary: $summary, listings: $listings)';
}


}

/// @nodoc
abstract mixin class $SellerDashboardCopyWith<$Res>  {
  factory $SellerDashboardCopyWith(SellerDashboard value, $Res Function(SellerDashboard) _then) = _$SellerDashboardCopyWithImpl;
@useResult
$Res call({
 OrderSummary summary, Map<ListingStatus, int> listings
});




}
/// @nodoc
class _$SellerDashboardCopyWithImpl<$Res>
    implements $SellerDashboardCopyWith<$Res> {
  _$SellerDashboardCopyWithImpl(this._self, this._then);

  final SellerDashboard _self;
  final $Res Function(SellerDashboard) _then;

/// Create a copy of SellerDashboard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summary = null,Object? listings = null,}) {
  return _then(_self.copyWith(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as OrderSummary,listings: null == listings ? _self.listings : listings // ignore: cast_nullable_to_non_nullable
as Map<ListingStatus, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerDashboard].
extension SellerDashboardPatterns on SellerDashboard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerDashboard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerDashboard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerDashboard value)  $default,){
final _that = this;
switch (_that) {
case _SellerDashboard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerDashboard value)?  $default,){
final _that = this;
switch (_that) {
case _SellerDashboard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderSummary summary,  Map<ListingStatus, int> listings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerDashboard() when $default != null:
return $default(_that.summary,_that.listings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderSummary summary,  Map<ListingStatus, int> listings)  $default,) {final _that = this;
switch (_that) {
case _SellerDashboard():
return $default(_that.summary,_that.listings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderSummary summary,  Map<ListingStatus, int> listings)?  $default,) {final _that = this;
switch (_that) {
case _SellerDashboard() when $default != null:
return $default(_that.summary,_that.listings);case _:
  return null;

}
}

}

/// @nodoc


class _SellerDashboard extends SellerDashboard {
  const _SellerDashboard({required this.summary, required final  Map<ListingStatus, int> listings}): _listings = listings,super._();
  

@override final  OrderSummary summary;
 final  Map<ListingStatus, int> _listings;
@override Map<ListingStatus, int> get listings {
  if (_listings is EqualUnmodifiableMapView) return _listings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_listings);
}


/// Create a copy of SellerDashboard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerDashboardCopyWith<_SellerDashboard> get copyWith => __$SellerDashboardCopyWithImpl<_SellerDashboard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerDashboard&&(identical(other.summary, summary) || other.summary == summary)&&const DeepCollectionEquality().equals(other._listings, _listings));
}


@override
int get hashCode => Object.hash(runtimeType,summary,const DeepCollectionEquality().hash(_listings));

@override
String toString() {
  return 'SellerDashboard(summary: $summary, listings: $listings)';
}


}

/// @nodoc
abstract mixin class _$SellerDashboardCopyWith<$Res> implements $SellerDashboardCopyWith<$Res> {
  factory _$SellerDashboardCopyWith(_SellerDashboard value, $Res Function(_SellerDashboard) _then) = __$SellerDashboardCopyWithImpl;
@override @useResult
$Res call({
 OrderSummary summary, Map<ListingStatus, int> listings
});




}
/// @nodoc
class __$SellerDashboardCopyWithImpl<$Res>
    implements _$SellerDashboardCopyWith<$Res> {
  __$SellerDashboardCopyWithImpl(this._self, this._then);

  final _SellerDashboard _self;
  final $Res Function(_SellerDashboard) _then;

/// Create a copy of SellerDashboard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summary = null,Object? listings = null,}) {
  return _then(_SellerDashboard(
summary: null == summary ? _self.summary : summary // ignore: cast_nullable_to_non_nullable
as OrderSummary,listings: null == listings ? _self._listings : listings // ignore: cast_nullable_to_non_nullable
as Map<ListingStatus, int>,
  ));
}


}

// dart format on
