// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CatalogSearchFilters {

 String? get keyword; String? get categoryId; int? get priceMin; int? get priceMax; List<String>? get tags; String? get sort; String? get location; int get page; int get size;
/// Create a copy of CatalogSearchFilters
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogSearchFiltersCopyWith<CatalogSearchFilters> get copyWith => _$CatalogSearchFiltersCopyWithImpl<CatalogSearchFilters>(this as CatalogSearchFilters, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogSearchFilters&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.priceMin, priceMin) || other.priceMin == priceMin)&&(identical(other.priceMax, priceMax) || other.priceMax == priceMax)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.location, location) || other.location == location)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,keyword,categoryId,priceMin,priceMax,const DeepCollectionEquality().hash(tags),sort,location,page,size);

@override
String toString() {
  return 'CatalogSearchFilters(keyword: $keyword, categoryId: $categoryId, priceMin: $priceMin, priceMax: $priceMax, tags: $tags, sort: $sort, location: $location, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class $CatalogSearchFiltersCopyWith<$Res>  {
  factory $CatalogSearchFiltersCopyWith(CatalogSearchFilters value, $Res Function(CatalogSearchFilters) _then) = _$CatalogSearchFiltersCopyWithImpl;
@useResult
$Res call({
 String? keyword, String? categoryId, int? priceMin, int? priceMax, List<String>? tags, String? sort, String? location, int page, int size
});




}
/// @nodoc
class _$CatalogSearchFiltersCopyWithImpl<$Res>
    implements $CatalogSearchFiltersCopyWith<$Res> {
  _$CatalogSearchFiltersCopyWithImpl(this._self, this._then);

  final CatalogSearchFilters _self;
  final $Res Function(CatalogSearchFilters) _then;

/// Create a copy of CatalogSearchFilters
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? keyword = freezed,Object? categoryId = freezed,Object? priceMin = freezed,Object? priceMax = freezed,Object? tags = freezed,Object? sort = freezed,Object? location = freezed,Object? page = null,Object? size = null,}) {
  return _then(_self.copyWith(
keyword: freezed == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,priceMin: freezed == priceMin ? _self.priceMin : priceMin // ignore: cast_nullable_to_non_nullable
as int?,priceMax: freezed == priceMax ? _self.priceMax : priceMax // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogSearchFilters].
extension CatalogSearchFiltersPatterns on CatalogSearchFilters {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogSearchFilters value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogSearchFilters() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogSearchFilters value)  $default,){
final _that = this;
switch (_that) {
case _CatalogSearchFilters():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogSearchFilters value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogSearchFilters() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? keyword,  String? categoryId,  int? priceMin,  int? priceMax,  List<String>? tags,  String? sort,  String? location,  int page,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogSearchFilters() when $default != null:
return $default(_that.keyword,_that.categoryId,_that.priceMin,_that.priceMax,_that.tags,_that.sort,_that.location,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? keyword,  String? categoryId,  int? priceMin,  int? priceMax,  List<String>? tags,  String? sort,  String? location,  int page,  int size)  $default,) {final _that = this;
switch (_that) {
case _CatalogSearchFilters():
return $default(_that.keyword,_that.categoryId,_that.priceMin,_that.priceMax,_that.tags,_that.sort,_that.location,_that.page,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? keyword,  String? categoryId,  int? priceMin,  int? priceMax,  List<String>? tags,  String? sort,  String? location,  int page,  int size)?  $default,) {final _that = this;
switch (_that) {
case _CatalogSearchFilters() when $default != null:
return $default(_that.keyword,_that.categoryId,_that.priceMin,_that.priceMax,_that.tags,_that.sort,_that.location,_that.page,_that.size);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogSearchFilters implements CatalogSearchFilters {
  const _CatalogSearchFilters({this.keyword, this.categoryId, this.priceMin, this.priceMax, final  List<String>? tags, this.sort, this.location, this.page = 1, this.size = 20}): _tags = tags;
  

@override final  String? keyword;
@override final  String? categoryId;
@override final  int? priceMin;
@override final  int? priceMax;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? sort;
@override final  String? location;
@override@JsonKey() final  int page;
@override@JsonKey() final  int size;

/// Create a copy of CatalogSearchFilters
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogSearchFiltersCopyWith<_CatalogSearchFilters> get copyWith => __$CatalogSearchFiltersCopyWithImpl<_CatalogSearchFilters>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogSearchFilters&&(identical(other.keyword, keyword) || other.keyword == keyword)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.priceMin, priceMin) || other.priceMin == priceMin)&&(identical(other.priceMax, priceMax) || other.priceMax == priceMax)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.sort, sort) || other.sort == sort)&&(identical(other.location, location) || other.location == location)&&(identical(other.page, page) || other.page == page)&&(identical(other.size, size) || other.size == size));
}


@override
int get hashCode => Object.hash(runtimeType,keyword,categoryId,priceMin,priceMax,const DeepCollectionEquality().hash(_tags),sort,location,page,size);

@override
String toString() {
  return 'CatalogSearchFilters(keyword: $keyword, categoryId: $categoryId, priceMin: $priceMin, priceMax: $priceMax, tags: $tags, sort: $sort, location: $location, page: $page, size: $size)';
}


}

/// @nodoc
abstract mixin class _$CatalogSearchFiltersCopyWith<$Res> implements $CatalogSearchFiltersCopyWith<$Res> {
  factory _$CatalogSearchFiltersCopyWith(_CatalogSearchFilters value, $Res Function(_CatalogSearchFilters) _then) = __$CatalogSearchFiltersCopyWithImpl;
@override @useResult
$Res call({
 String? keyword, String? categoryId, int? priceMin, int? priceMax, List<String>? tags, String? sort, String? location, int page, int size
});




}
/// @nodoc
class __$CatalogSearchFiltersCopyWithImpl<$Res>
    implements _$CatalogSearchFiltersCopyWith<$Res> {
  __$CatalogSearchFiltersCopyWithImpl(this._self, this._then);

  final _CatalogSearchFilters _self;
  final $Res Function(_CatalogSearchFilters) _then;

/// Create a copy of CatalogSearchFilters
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? keyword = freezed,Object? categoryId = freezed,Object? priceMin = freezed,Object? priceMax = freezed,Object? tags = freezed,Object? sort = freezed,Object? location = freezed,Object? page = null,Object? size = null,}) {
  return _then(_CatalogSearchFilters(
keyword: freezed == keyword ? _self.keyword : keyword // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,priceMin: freezed == priceMin ? _self.priceMin : priceMin // ignore: cast_nullable_to_non_nullable
as int?,priceMax: freezed == priceMax ? _self.priceMax : priceMax // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,sort: freezed == sort ? _self.sort : sort // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CatalogProductsState {

 List<TProductCard> get products; bool get hasMore; bool get isLoadingMore; CatalogSearchFilters get filters;
/// Create a copy of CatalogProductsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogProductsStateCopyWith<CatalogProductsState> get copyWith => _$CatalogProductsStateCopyWithImpl<CatalogProductsState>(this as CatalogProductsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogProductsState&&const DeepCollectionEquality().equals(other.products, products)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.filters, filters) || other.filters == filters));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(products),hasMore,isLoadingMore,filters);

@override
String toString() {
  return 'CatalogProductsState(products: $products, hasMore: $hasMore, isLoadingMore: $isLoadingMore, filters: $filters)';
}


}

/// @nodoc
abstract mixin class $CatalogProductsStateCopyWith<$Res>  {
  factory $CatalogProductsStateCopyWith(CatalogProductsState value, $Res Function(CatalogProductsState) _then) = _$CatalogProductsStateCopyWithImpl;
@useResult
$Res call({
 List<TProductCard> products, bool hasMore, bool isLoadingMore, CatalogSearchFilters filters
});


$CatalogSearchFiltersCopyWith<$Res> get filters;

}
/// @nodoc
class _$CatalogProductsStateCopyWithImpl<$Res>
    implements $CatalogProductsStateCopyWith<$Res> {
  _$CatalogProductsStateCopyWithImpl(this._self, this._then);

  final CatalogProductsState _self;
  final $Res Function(CatalogProductsState) _then;

/// Create a copy of CatalogProductsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? products = null,Object? hasMore = null,Object? isLoadingMore = null,Object? filters = null,}) {
  return _then(_self.copyWith(
products: null == products ? _self.products : products // ignore: cast_nullable_to_non_nullable
as List<TProductCard>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as CatalogSearchFilters,
  ));
}
/// Create a copy of CatalogProductsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogSearchFiltersCopyWith<$Res> get filters {
  
  return $CatalogSearchFiltersCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}


/// Adds pattern-matching-related methods to [CatalogProductsState].
extension CatalogProductsStatePatterns on CatalogProductsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogProductsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogProductsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogProductsState value)  $default,){
final _that = this;
switch (_that) {
case _CatalogProductsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogProductsState value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogProductsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TProductCard> products,  bool hasMore,  bool isLoadingMore,  CatalogSearchFilters filters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogProductsState() when $default != null:
return $default(_that.products,_that.hasMore,_that.isLoadingMore,_that.filters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TProductCard> products,  bool hasMore,  bool isLoadingMore,  CatalogSearchFilters filters)  $default,) {final _that = this;
switch (_that) {
case _CatalogProductsState():
return $default(_that.products,_that.hasMore,_that.isLoadingMore,_that.filters);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TProductCard> products,  bool hasMore,  bool isLoadingMore,  CatalogSearchFilters filters)?  $default,) {final _that = this;
switch (_that) {
case _CatalogProductsState() when $default != null:
return $default(_that.products,_that.hasMore,_that.isLoadingMore,_that.filters);case _:
  return null;

}
}

}

/// @nodoc


class _CatalogProductsState implements CatalogProductsState {
  const _CatalogProductsState({required final  List<TProductCard> products, required this.hasMore, required this.isLoadingMore, required this.filters}): _products = products;
  

 final  List<TProductCard> _products;
@override List<TProductCard> get products {
  if (_products is EqualUnmodifiableListView) return _products;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_products);
}

@override final  bool hasMore;
@override final  bool isLoadingMore;
@override final  CatalogSearchFilters filters;

/// Create a copy of CatalogProductsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogProductsStateCopyWith<_CatalogProductsState> get copyWith => __$CatalogProductsStateCopyWithImpl<_CatalogProductsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogProductsState&&const DeepCollectionEquality().equals(other._products, _products)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.filters, filters) || other.filters == filters));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_products),hasMore,isLoadingMore,filters);

@override
String toString() {
  return 'CatalogProductsState(products: $products, hasMore: $hasMore, isLoadingMore: $isLoadingMore, filters: $filters)';
}


}

/// @nodoc
abstract mixin class _$CatalogProductsStateCopyWith<$Res> implements $CatalogProductsStateCopyWith<$Res> {
  factory _$CatalogProductsStateCopyWith(_CatalogProductsState value, $Res Function(_CatalogProductsState) _then) = __$CatalogProductsStateCopyWithImpl;
@override @useResult
$Res call({
 List<TProductCard> products, bool hasMore, bool isLoadingMore, CatalogSearchFilters filters
});


@override $CatalogSearchFiltersCopyWith<$Res> get filters;

}
/// @nodoc
class __$CatalogProductsStateCopyWithImpl<$Res>
    implements _$CatalogProductsStateCopyWith<$Res> {
  __$CatalogProductsStateCopyWithImpl(this._self, this._then);

  final _CatalogProductsState _self;
  final $Res Function(_CatalogProductsState) _then;

/// Create a copy of CatalogProductsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? products = null,Object? hasMore = null,Object? isLoadingMore = null,Object? filters = null,}) {
  return _then(_CatalogProductsState(
products: null == products ? _self._products : products // ignore: cast_nullable_to_non_nullable
as List<TProductCard>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as CatalogSearchFilters,
  ));
}

/// Create a copy of CatalogProductsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CatalogSearchFiltersCopyWith<$Res> get filters {
  
  return $CatalogSearchFiltersCopyWith<$Res>(_self.filters, (value) {
    return _then(_self.copyWith(filters: value));
  });
}
}

// dart format on
