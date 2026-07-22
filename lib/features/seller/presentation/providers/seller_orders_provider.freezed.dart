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

 int get selectedTab;// 0: Chờ gom đơn, 1: Đã xác nhận, 2: Đang giao, 3: Đã giao, 4: Khiếu nại
 List<SellerPendingItem> get pendingItems; List<SellerOrder> get confirmedOrders; bool get isLoading; bool get isActionLoading; String? get errorMessage;
/// Create a copy of SellerOrdersState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerOrdersStateCopyWith<SellerOrdersState> get copyWith => _$SellerOrdersStateCopyWithImpl<SellerOrdersState>(this as SellerOrdersState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerOrdersState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&const DeepCollectionEquality().equals(other.pendingItems, pendingItems)&&const DeepCollectionEquality().equals(other.confirmedOrders, confirmedOrders)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isActionLoading, isActionLoading) || other.isActionLoading == isActionLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,const DeepCollectionEquality().hash(pendingItems),const DeepCollectionEquality().hash(confirmedOrders),isLoading,isActionLoading,errorMessage);

@override
String toString() {
  return 'SellerOrdersState(selectedTab: $selectedTab, pendingItems: $pendingItems, confirmedOrders: $confirmedOrders, isLoading: $isLoading, isActionLoading: $isActionLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SellerOrdersStateCopyWith<$Res>  {
  factory $SellerOrdersStateCopyWith(SellerOrdersState value, $Res Function(SellerOrdersState) _then) = _$SellerOrdersStateCopyWithImpl;
@useResult
$Res call({
 int selectedTab, List<SellerPendingItem> pendingItems, List<SellerOrder> confirmedOrders, bool isLoading, bool isActionLoading, String? errorMessage
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
@pragma('vm:prefer-inline') @override $Res call({Object? selectedTab = null,Object? pendingItems = null,Object? confirmedOrders = null,Object? isLoading = null,Object? isActionLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as int,pendingItems: null == pendingItems ? _self.pendingItems : pendingItems // ignore: cast_nullable_to_non_nullable
as List<SellerPendingItem>,confirmedOrders: null == confirmedOrders ? _self.confirmedOrders : confirmedOrders // ignore: cast_nullable_to_non_nullable
as List<SellerOrder>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int selectedTab,  List<SellerPendingItem> pendingItems,  List<SellerOrder> confirmedOrders,  bool isLoading,  bool isActionLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerOrdersState() when $default != null:
return $default(_that.selectedTab,_that.pendingItems,_that.confirmedOrders,_that.isLoading,_that.isActionLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int selectedTab,  List<SellerPendingItem> pendingItems,  List<SellerOrder> confirmedOrders,  bool isLoading,  bool isActionLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SellerOrdersState():
return $default(_that.selectedTab,_that.pendingItems,_that.confirmedOrders,_that.isLoading,_that.isActionLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int selectedTab,  List<SellerPendingItem> pendingItems,  List<SellerOrder> confirmedOrders,  bool isLoading,  bool isActionLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SellerOrdersState() when $default != null:
return $default(_that.selectedTab,_that.pendingItems,_that.confirmedOrders,_that.isLoading,_that.isActionLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SellerOrdersState implements SellerOrdersState {
  const _SellerOrdersState({this.selectedTab = 0, final  List<SellerPendingItem> pendingItems = const [], final  List<SellerOrder> confirmedOrders = const [], this.isLoading = true, this.isActionLoading = false, this.errorMessage}): _pendingItems = pendingItems,_confirmedOrders = confirmedOrders;
  

@override@JsonKey() final  int selectedTab;
// 0: Chờ gom đơn, 1: Đã xác nhận, 2: Đang giao, 3: Đã giao, 4: Khiếu nại
 final  List<SellerPendingItem> _pendingItems;
// 0: Chờ gom đơn, 1: Đã xác nhận, 2: Đang giao, 3: Đã giao, 4: Khiếu nại
@override@JsonKey() List<SellerPendingItem> get pendingItems {
  if (_pendingItems is EqualUnmodifiableListView) return _pendingItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingItems);
}

 final  List<SellerOrder> _confirmedOrders;
@override@JsonKey() List<SellerOrder> get confirmedOrders {
  if (_confirmedOrders is EqualUnmodifiableListView) return _confirmedOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_confirmedOrders);
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerOrdersState&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab)&&const DeepCollectionEquality().equals(other._pendingItems, _pendingItems)&&const DeepCollectionEquality().equals(other._confirmedOrders, _confirmedOrders)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isActionLoading, isActionLoading) || other.isActionLoading == isActionLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab,const DeepCollectionEquality().hash(_pendingItems),const DeepCollectionEquality().hash(_confirmedOrders),isLoading,isActionLoading,errorMessage);

@override
String toString() {
  return 'SellerOrdersState(selectedTab: $selectedTab, pendingItems: $pendingItems, confirmedOrders: $confirmedOrders, isLoading: $isLoading, isActionLoading: $isActionLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SellerOrdersStateCopyWith<$Res> implements $SellerOrdersStateCopyWith<$Res> {
  factory _$SellerOrdersStateCopyWith(_SellerOrdersState value, $Res Function(_SellerOrdersState) _then) = __$SellerOrdersStateCopyWithImpl;
@override @useResult
$Res call({
 int selectedTab, List<SellerPendingItem> pendingItems, List<SellerOrder> confirmedOrders, bool isLoading, bool isActionLoading, String? errorMessage
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
@override @pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,Object? pendingItems = null,Object? confirmedOrders = null,Object? isLoading = null,Object? isActionLoading = null,Object? errorMessage = freezed,}) {
  return _then(_SellerOrdersState(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as int,pendingItems: null == pendingItems ? _self._pendingItems : pendingItems // ignore: cast_nullable_to_non_nullable
as List<SellerPendingItem>,confirmedOrders: null == confirmedOrders ? _self._confirmedOrders : confirmedOrders // ignore: cast_nullable_to_non_nullable
as List<SellerOrder>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isActionLoading: null == isActionLoading ? _self.isActionLoading : isActionLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
