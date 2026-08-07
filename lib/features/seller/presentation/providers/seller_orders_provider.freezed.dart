// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_orders_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellerOrdersState {

/// The contract's own three states. There is no `processing`/`shipping`/
/// `disputing`: where the parcel is comes off `order.transport`.
 OrderState get selected; List<OrderView> get orders;/// Paid lines the money has not turned into an order yet. Only meaningful
/// beside the open tab, and nothing here waits on the seller.
 List<OrderLineView> get unsettled; bool get isLoading; bool get isActionLoading; String? get errorMessage;
/// Create a copy of SellerOrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerOrdersStateCopyWith<SellerOrdersState> get copyWith => _$SellerOrdersStateCopyWithImpl<SellerOrdersState>(this as SellerOrdersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerOrdersState&&(identical(other.selected, selected) || other.selected == selected)&&const DeepCollectionEquality().equals(other.orders, orders)&&const DeepCollectionEquality().equals(other.unsettled, unsettled)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isActionLoading, isActionLoading) || other.isActionLoading == isActionLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selected,const DeepCollectionEquality().hash(orders),const DeepCollectionEquality().hash(unsettled),isLoading,isActionLoading,errorMessage);

@override
String toString() {
  return 'SellerOrdersState(selected: $selected, orders: $orders, unsettled: $unsettled, isLoading: $isLoading, isActionLoading: $isActionLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SellerOrdersStateCopyWith<$Res>  {
  factory $SellerOrdersStateCopyWith(SellerOrdersState value, $Res Function(SellerOrdersState) _then) = _$SellerOrdersStateCopyWithImpl;
@useResult
$Res call({
 OrderState selected, List<OrderView> orders, List<OrderLineView> unsettled, bool isLoading, bool isActionLoading, String? errorMessage
});




}
/// @nodoc
class _$SellerOrdersStateCopyWithImpl<$Res>
    implements $SellerOrdersStateCopyWith<$Res> {
  _$SellerOrdersStateCopyWithImpl(this._self, this._then);

  final SellerOrdersState _self;
  final $Res Function(SellerOrdersState) _then;

/// Create a copy of SellerOrdersState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selected = null,Object? orders = null,Object? unsettled = null,Object? isLoading = null,Object? isActionLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as OrderState,orders: null == orders ? _self.orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderView>,unsettled: null == unsettled ? _self.unsettled : unsettled // ignore: cast_nullable_to_non_nullable
as List<OrderLineView>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isActionLoading: null == isActionLoading ? _self.isActionLoading : isActionLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerOrdersState].
extension SellerOrdersStatePatterns on SellerOrdersState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerOrdersState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerOrdersState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerOrdersState value)  $default,){
final _that = this;
switch (_that) {
case _SellerOrdersState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerOrdersState value)?  $default,){
final _that = this;
switch (_that) {
case _SellerOrdersState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( OrderState selected,  List<OrderView> orders,  List<OrderLineView> unsettled,  bool isLoading,  bool isActionLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerOrdersState() when $default != null:
return $default(_that.selected,_that.orders,_that.unsettled,_that.isLoading,_that.isActionLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( OrderState selected,  List<OrderView> orders,  List<OrderLineView> unsettled,  bool isLoading,  bool isActionLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SellerOrdersState():
return $default(_that.selected,_that.orders,_that.unsettled,_that.isLoading,_that.isActionLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( OrderState selected,  List<OrderView> orders,  List<OrderLineView> unsettled,  bool isLoading,  bool isActionLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SellerOrdersState() when $default != null:
return $default(_that.selected,_that.orders,_that.unsettled,_that.isLoading,_that.isActionLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SellerOrdersState implements SellerOrdersState {
  const _SellerOrdersState({this.selected = OrderState.open, final  List<OrderView> orders = const [], final  List<OrderLineView> unsettled = const [], this.isLoading = true, this.isActionLoading = false, this.errorMessage}): _orders = orders,_unsettled = unsettled;
  

/// The contract's own three states. There is no `processing`/`shipping`/
/// `disputing`: where the parcel is comes off `order.transport`.
@override@JsonKey() final  OrderState selected;
 final  List<OrderView> _orders;
@override@JsonKey() List<OrderView> get orders {
  if (_orders is EqualUnmodifiableListView) return _orders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_orders);
}

/// Paid lines the money has not turned into an order yet. Only meaningful
/// beside the open tab, and nothing here waits on the seller.
 final  List<OrderLineView> _unsettled;
/// Paid lines the money has not turned into an order yet. Only meaningful
/// beside the open tab, and nothing here waits on the seller.
@override@JsonKey() List<OrderLineView> get unsettled {
  if (_unsettled is EqualUnmodifiableListView) return _unsettled;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_unsettled);
}

@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isActionLoading;
@override final  String? errorMessage;

/// Create a copy of SellerOrdersState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerOrdersStateCopyWith<_SellerOrdersState> get copyWith => __$SellerOrdersStateCopyWithImpl<_SellerOrdersState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerOrdersState&&(identical(other.selected, selected) || other.selected == selected)&&const DeepCollectionEquality().equals(other._orders, _orders)&&const DeepCollectionEquality().equals(other._unsettled, _unsettled)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isActionLoading, isActionLoading) || other.isActionLoading == isActionLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selected,const DeepCollectionEquality().hash(_orders),const DeepCollectionEquality().hash(_unsettled),isLoading,isActionLoading,errorMessage);

@override
String toString() {
  return 'SellerOrdersState(selected: $selected, orders: $orders, unsettled: $unsettled, isLoading: $isLoading, isActionLoading: $isActionLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SellerOrdersStateCopyWith<$Res> implements $SellerOrdersStateCopyWith<$Res> {
  factory _$SellerOrdersStateCopyWith(_SellerOrdersState value, $Res Function(_SellerOrdersState) _then) = __$SellerOrdersStateCopyWithImpl;
@override @useResult
$Res call({
 OrderState selected, List<OrderView> orders, List<OrderLineView> unsettled, bool isLoading, bool isActionLoading, String? errorMessage
});




}
/// @nodoc
class __$SellerOrdersStateCopyWithImpl<$Res>
    implements _$SellerOrdersStateCopyWith<$Res> {
  __$SellerOrdersStateCopyWithImpl(this._self, this._then);

  final _SellerOrdersState _self;
  final $Res Function(_SellerOrdersState) _then;

/// Create a copy of SellerOrdersState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selected = null,Object? orders = null,Object? unsettled = null,Object? isLoading = null,Object? isActionLoading = null,Object? errorMessage = freezed,}) {
  return _then(_SellerOrdersState(
selected: null == selected ? _self.selected : selected // ignore: cast_nullable_to_non_nullable
as OrderState,orders: null == orders ? _self._orders : orders // ignore: cast_nullable_to_non_nullable
as List<OrderView>,unsettled: null == unsettled ? _self._unsettled : unsettled // ignore: cast_nullable_to_non_nullable
as List<OrderLineView>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isActionLoading: null == isActionLoading ? _self.isActionLoading : isActionLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
