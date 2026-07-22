// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_products_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellerProductsState {

 String? get selectedStatus;// null: Tất cả, 'active': Đang bán, 'inactive': Hết hàng/Tạm ẩn, 'violated': Vi phạm/Chờ duyệt
 String get searchQuery; List<TProductDetail> get spuList; bool get isLoading; String? get errorMessage;
/// Create a copy of SellerProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerProductsStateCopyWith<SellerProductsState> get copyWith => _$SellerProductsStateCopyWithImpl<SellerProductsState>(this as SellerProductsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerProductsState&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other.spuList, spuList)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedStatus,searchQuery,const DeepCollectionEquality().hash(spuList),isLoading,errorMessage);

@override
String toString() {
  return 'SellerProductsState(selectedStatus: $selectedStatus, searchQuery: $searchQuery, spuList: $spuList, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SellerProductsStateCopyWith<$Res>  {
  factory $SellerProductsStateCopyWith(SellerProductsState value, $Res Function(SellerProductsState) _then) = _$SellerProductsStateCopyWithImpl;
@useResult
$Res call({
 String? selectedStatus, String searchQuery, List<TProductDetail> spuList, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$SellerProductsStateCopyWithImpl<$Res>
    implements $SellerProductsStateCopyWith<$Res> {
  _$SellerProductsStateCopyWithImpl(this._self, this._then);

  final SellerProductsState _self;
  final $Res Function(SellerProductsState) _then;

/// Create a copy of SellerProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedStatus = freezed,Object? searchQuery = null,Object? spuList = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
selectedStatus: freezed == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,spuList: null == spuList ? _self.spuList : spuList // ignore: cast_nullable_to_non_nullable
as List<TProductDetail>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerProductsState].
extension SellerProductsStatePatterns on SellerProductsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerProductsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerProductsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerProductsState value)  $default,){
final _that = this;
switch (_that) {
case _SellerProductsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerProductsState value)?  $default,){
final _that = this;
switch (_that) {
case _SellerProductsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? selectedStatus,  String searchQuery,  List<TProductDetail> spuList,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerProductsState() when $default != null:
return $default(_that.selectedStatus,_that.searchQuery,_that.spuList,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? selectedStatus,  String searchQuery,  List<TProductDetail> spuList,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SellerProductsState():
return $default(_that.selectedStatus,_that.searchQuery,_that.spuList,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? selectedStatus,  String searchQuery,  List<TProductDetail> spuList,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SellerProductsState() when $default != null:
return $default(_that.selectedStatus,_that.searchQuery,_that.spuList,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SellerProductsState implements SellerProductsState {
  const _SellerProductsState({this.selectedStatus, this.searchQuery = '', final  List<TProductDetail> spuList = const [], this.isLoading = true, this.errorMessage}): _spuList = spuList;
  

@override final  String? selectedStatus;
// null: Tất cả, 'active': Đang bán, 'inactive': Hết hàng/Tạm ẩn, 'violated': Vi phạm/Chờ duyệt
@override@JsonKey() final  String searchQuery;
 final  List<TProductDetail> _spuList;
@override@JsonKey() List<TProductDetail> get spuList {
  if (_spuList is EqualUnmodifiableListView) return _spuList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_spuList);
}

@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of SellerProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerProductsStateCopyWith<_SellerProductsState> get copyWith => __$SellerProductsStateCopyWithImpl<_SellerProductsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerProductsState&&(identical(other.selectedStatus, selectedStatus) || other.selectedStatus == selectedStatus)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&const DeepCollectionEquality().equals(other._spuList, _spuList)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,selectedStatus,searchQuery,const DeepCollectionEquality().hash(_spuList),isLoading,errorMessage);

@override
String toString() {
  return 'SellerProductsState(selectedStatus: $selectedStatus, searchQuery: $searchQuery, spuList: $spuList, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SellerProductsStateCopyWith<$Res> implements $SellerProductsStateCopyWith<$Res> {
  factory _$SellerProductsStateCopyWith(_SellerProductsState value, $Res Function(_SellerProductsState) _then) = __$SellerProductsStateCopyWithImpl;
@override @useResult
$Res call({
 String? selectedStatus, String searchQuery, List<TProductDetail> spuList, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$SellerProductsStateCopyWithImpl<$Res>
    implements _$SellerProductsStateCopyWith<$Res> {
  __$SellerProductsStateCopyWithImpl(this._self, this._then);

  final _SellerProductsState _self;
  final $Res Function(_SellerProductsState) _then;

/// Create a copy of SellerProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedStatus = freezed,Object? searchQuery = null,Object? spuList = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_SellerProductsState(
selectedStatus: freezed == selectedStatus ? _self.selectedStatus : selectedStatus // ignore: cast_nullable_to_non_nullable
as String?,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,spuList: null == spuList ? _self._spuList : spuList // ignore: cast_nullable_to_non_nullable
as List<TProductDetail>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
