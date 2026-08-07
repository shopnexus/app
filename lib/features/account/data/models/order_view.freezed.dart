// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderLineView {

 OrderItem get item; Listing? get listing;
/// Create a copy of OrderLineView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderLineViewCopyWith<OrderLineView> get copyWith => _$OrderLineViewCopyWithImpl<OrderLineView>(this as OrderLineView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderLineView&&(identical(other.item, item) || other.item == item)&&(identical(other.listing, listing) || other.listing == listing));
}


@override
int get hashCode => Object.hash(runtimeType,item,listing);

@override
String toString() {
  return 'OrderLineView(item: $item, listing: $listing)';
}


}

/// @nodoc
abstract mixin class $OrderLineViewCopyWith<$Res>  {
  factory $OrderLineViewCopyWith(OrderLineView value, $Res Function(OrderLineView) _then) = _$OrderLineViewCopyWithImpl;
@useResult
$Res call({
 OrderItem item, Listing? listing
});




}
/// @nodoc
class _$OrderLineViewCopyWithImpl<$Res>
    implements $OrderLineViewCopyWith<$Res> {
  _$OrderLineViewCopyWithImpl(this._self, this._then);

  final OrderLineView _self;
  final $Res Function(OrderLineView) _then;

/// Create a copy of OrderLineView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? listing = freezed,}) {
  return _then(OrderLineView(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OrderItem,listing: freezed == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing?,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderLineView].
extension OrderLineViewPatterns on OrderLineView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderLineView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderLineView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderLineView value)  $default,){
final _that = this;
switch (_that) {
case _OrderLineView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderLineView value)?  $default,){
final _that = this;
switch (_that) {
case _OrderLineView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderItem item,  Listing? listing)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderLineView() when $default != null:
return $default(_that.item,_that.listing);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderItem item,  Listing? listing)  $default,) {final _that = this;
switch (_that) {
case _OrderLineView():
return $default(_that.item,_that.listing);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderItem item,  Listing? listing)?  $default,) {final _that = this;
switch (_that) {
case _OrderLineView() when $default != null:
return $default(_that.item,_that.listing);case _:
  return null;

}
}

}

/// @nodoc


class _OrderLineView extends OrderLineView {
  const _OrderLineView({required this.item, this.listing}): super._();
  

@override final  OrderItem item;
@override final  Listing? listing;

/// Create a copy of OrderLineView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderLineViewCopyWith<_OrderLineView> get copyWith => __$OrderLineViewCopyWithImpl<_OrderLineView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderLineView&&(identical(other.item, item) || other.item == item)&&(identical(other.listing, listing) || other.listing == listing));
}


@override
int get hashCode => Object.hash(runtimeType,item,listing);

@override
String toString() {
  return 'OrderLineView(item: $item, listing: $listing)';
}


}

/// @nodoc
abstract mixin class _$OrderLineViewCopyWith<$Res> implements $OrderLineViewCopyWith<$Res> {
  factory _$OrderLineViewCopyWith(_OrderLineView value, $Res Function(_OrderLineView) _then) = __$OrderLineViewCopyWithImpl;
@override @useResult
$Res call({
 OrderItem item, Listing? listing
});




}
/// @nodoc
class __$OrderLineViewCopyWithImpl<$Res>
    implements _$OrderLineViewCopyWith<$Res> {
  __$OrderLineViewCopyWithImpl(this._self, this._then);

  final _OrderLineView _self;
  final $Res Function(_OrderLineView) _then;

/// Create a copy of OrderLineView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? listing = freezed,}) {
  return _then(_OrderLineView(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as OrderItem,listing: freezed == listing ? _self.listing : listing // ignore: cast_nullable_to_non_nullable
as Listing?,
  ));
}


}

/// @nodoc
mixin _$OrderView {

 Order get order; List<OrderLineView> get lines;
/// Create a copy of OrderView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderViewCopyWith<OrderView> get copyWith => _$OrderViewCopyWithImpl<OrderView>(this as OrderView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderView&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other.lines, lines));
}


@override
int get hashCode => Object.hash(runtimeType,order,const DeepCollectionEquality().hash(lines));

@override
String toString() {
  return 'OrderView(order: $order, lines: $lines)';
}


}

/// @nodoc
abstract mixin class $OrderViewCopyWith<$Res>  {
  factory $OrderViewCopyWith(OrderView value, $Res Function(OrderView) _then) = _$OrderViewCopyWithImpl;
@useResult
$Res call({
 Order order, List<OrderLineView> lines
});




}
/// @nodoc
class _$OrderViewCopyWithImpl<$Res>
    implements $OrderViewCopyWith<$Res> {
  _$OrderViewCopyWithImpl(this._self, this._then);

  final OrderView _self;
  final $Res Function(OrderView) _then;

/// Create a copy of OrderView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? order = null,Object? lines = null,}) {
  return _then(OrderView(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLineView>,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderView].
extension OrderViewPatterns on OrderView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderView value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderView() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderView value)  $default,){
final _that = this;
switch (_that) {
case _OrderView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderView value)?  $default,){
final _that = this;
switch (_that) {
case _OrderView() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Order order,  List<OrderLineView> lines)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderView() when $default != null:
return $default(_that.order,_that.lines);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Order order,  List<OrderLineView> lines)  $default,) {final _that = this;
switch (_that) {
case _OrderView():
return $default(_that.order,_that.lines);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Order order,  List<OrderLineView> lines)?  $default,) {final _that = this;
switch (_that) {
case _OrderView() when $default != null:
return $default(_that.order,_that.lines);case _:
  return null;

}
}

}

/// @nodoc


class _OrderView extends OrderView {
  const _OrderView({required this.order, required  List<OrderLineView> lines}): _lines = lines,super._();
  

@override final  Order order;
 final  List<OrderLineView> _lines;
@override List<OrderLineView> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}


/// Create a copy of OrderView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderViewCopyWith<_OrderView> get copyWith => __$OrderViewCopyWithImpl<_OrderView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderView&&(identical(other.order, order) || other.order == order)&&const DeepCollectionEquality().equals(other._lines, _lines));
}


@override
int get hashCode => Object.hash(runtimeType,order,const DeepCollectionEquality().hash(_lines));

@override
String toString() {
  return 'OrderView(order: $order, lines: $lines)';
}


}

/// @nodoc
abstract mixin class _$OrderViewCopyWith<$Res> implements $OrderViewCopyWith<$Res> {
  factory _$OrderViewCopyWith(_OrderView value, $Res Function(_OrderView) _then) = __$OrderViewCopyWithImpl;
@override @useResult
$Res call({
 Order order, List<OrderLineView> lines
});




}
/// @nodoc
class __$OrderViewCopyWithImpl<$Res>
    implements _$OrderViewCopyWith<$Res> {
  __$OrderViewCopyWithImpl(this._self, this._then);

  final _OrderView _self;
  final $Res Function(_OrderView) _then;

/// Create a copy of OrderView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? order = null,Object? lines = null,}) {
  return _then(_OrderView(
order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as Order,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<OrderLineView>,
  ));
}


}

// dart format on
