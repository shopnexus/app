// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Category {

 String get id; String get name; String get slug; String? get icon;@JsonKey(name: 'parent_id') String? get parentId;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,icon,parentId);

@override
String toString() {
  return 'Category(id: $id, name: $name, slug: $slug, icon: $icon, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? icon,@JsonKey(name: 'parent_id') String? parentId
});




}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? icon = freezed,Object? parentId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Category].
extension CategoryPatterns on Category {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Category value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Category value)  $default,){
final _that = this;
switch (_that) {
case _Category():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Category value)?  $default,){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? icon, @JsonKey(name: 'parent_id')  String? parentId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.icon,_that.parentId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? icon, @JsonKey(name: 'parent_id')  String? parentId)  $default,) {final _that = this;
switch (_that) {
case _Category():
return $default(_that.id,_that.name,_that.slug,_that.icon,_that.parentId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String? icon, @JsonKey(name: 'parent_id')  String? parentId)?  $default,) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.icon,_that.parentId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Category implements Category {
  const _Category({required this.id, required this.name, required this.slug, this.icon, @JsonKey(name: 'parent_id') this.parentId});
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String? icon;
@override@JsonKey(name: 'parent_id') final  String? parentId;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.icon, icon) || other.icon == icon)&&(identical(other.parentId, parentId) || other.parentId == parentId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,icon,parentId);

@override
String toString() {
  return 'Category(id: $id, name: $name, slug: $slug, icon: $icon, parentId: $parentId)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? icon,@JsonKey(name: 'parent_id') String? parentId
});




}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? icon = freezed,Object? parentId = freezed,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$TProductCard {

 String get id; String get name; String get slug; String? get thumbnail; int get price;@JsonKey(name: 'original_price') int? get originalPrice;@JsonKey(name: 'discount_rate') double? get discountRate; RatingModel? get rating;@JsonKey(name: 'sold_count') int? get soldCount; List<String>? get tags;@JsonKey(name: 'vendor_id') String? get vendorId;@JsonKey(name: 'vendor_name') String? get vendorName;
/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TProductCardCopyWith<TProductCard> get copyWith => _$TProductCardCopyWithImpl<TProductCard>(this as TProductCard, _$identity);

  /// Serializes this TProductCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TProductCard&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,thumbnail,price,originalPrice,discountRate,rating,soldCount,const DeepCollectionEquality().hash(tags),vendorId,vendorName);

@override
String toString() {
  return 'TProductCard(id: $id, name: $name, slug: $slug, thumbnail: $thumbnail, price: $price, originalPrice: $originalPrice, discountRate: $discountRate, rating: $rating, soldCount: $soldCount, tags: $tags, vendorId: $vendorId, vendorName: $vendorName)';
}


}

/// @nodoc
abstract mixin class $TProductCardCopyWith<$Res>  {
  factory $TProductCardCopyWith(TProductCard value, $Res Function(TProductCard) _then) = _$TProductCardCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? thumbnail, int price,@JsonKey(name: 'original_price') int? originalPrice,@JsonKey(name: 'discount_rate') double? discountRate, RatingModel? rating,@JsonKey(name: 'sold_count') int? soldCount, List<String>? tags,@JsonKey(name: 'vendor_id') String? vendorId,@JsonKey(name: 'vendor_name') String? vendorName
});


$RatingModelCopyWith<$Res>? get rating;

}
/// @nodoc
class _$TProductCardCopyWithImpl<$Res>
    implements $TProductCardCopyWith<$Res> {
  _$TProductCardCopyWithImpl(this._self, this._then);

  final TProductCard _self;
  final $Res Function(TProductCard) _then;

/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? thumbnail = freezed,Object? price = null,Object? originalPrice = freezed,Object? discountRate = freezed,Object? rating = freezed,Object? soldCount = freezed,Object? tags = freezed,Object? vendorId = freezed,Object? vendorName = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,discountRate: freezed == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as double?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as RatingModel?,soldCount: freezed == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String?,vendorName: freezed == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RatingModelCopyWith<$Res>? get rating {
    if (_self.rating == null) {
    return null;
  }

  return $RatingModelCopyWith<$Res>(_self.rating!, (value) {
    return _then(_self.copyWith(rating: value));
  });
}
}


/// Adds pattern-matching-related methods to [TProductCard].
extension TProductCardPatterns on TProductCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TProductCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TProductCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TProductCard value)  $default,){
final _that = this;
switch (_that) {
case _TProductCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TProductCard value)?  $default,){
final _that = this;
switch (_that) {
case _TProductCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? thumbnail,  int price, @JsonKey(name: 'original_price')  int? originalPrice, @JsonKey(name: 'discount_rate')  double? discountRate,  RatingModel? rating, @JsonKey(name: 'sold_count')  int? soldCount,  List<String>? tags, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TProductCard() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.thumbnail,_that.price,_that.originalPrice,_that.discountRate,_that.rating,_that.soldCount,_that.tags,_that.vendorId,_that.vendorName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? thumbnail,  int price, @JsonKey(name: 'original_price')  int? originalPrice, @JsonKey(name: 'discount_rate')  double? discountRate,  RatingModel? rating, @JsonKey(name: 'sold_count')  int? soldCount,  List<String>? tags, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName)  $default,) {final _that = this;
switch (_that) {
case _TProductCard():
return $default(_that.id,_that.name,_that.slug,_that.thumbnail,_that.price,_that.originalPrice,_that.discountRate,_that.rating,_that.soldCount,_that.tags,_that.vendorId,_that.vendorName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String? thumbnail,  int price, @JsonKey(name: 'original_price')  int? originalPrice, @JsonKey(name: 'discount_rate')  double? discountRate,  RatingModel? rating, @JsonKey(name: 'sold_count')  int? soldCount,  List<String>? tags, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName)?  $default,) {final _that = this;
switch (_that) {
case _TProductCard() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.thumbnail,_that.price,_that.originalPrice,_that.discountRate,_that.rating,_that.soldCount,_that.tags,_that.vendorId,_that.vendorName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TProductCard implements TProductCard {
  const _TProductCard({required this.id, required this.name, required this.slug, this.thumbnail, required this.price, @JsonKey(name: 'original_price') this.originalPrice, @JsonKey(name: 'discount_rate') this.discountRate, this.rating, @JsonKey(name: 'sold_count') this.soldCount, final  List<String>? tags, @JsonKey(name: 'vendor_id') this.vendorId, @JsonKey(name: 'vendor_name') this.vendorName}): _tags = tags;
  factory _TProductCard.fromJson(Map<String, dynamic> json) => _$TProductCardFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String? thumbnail;
@override final  int price;
@override@JsonKey(name: 'original_price') final  int? originalPrice;
@override@JsonKey(name: 'discount_rate') final  double? discountRate;
@override final  RatingModel? rating;
@override@JsonKey(name: 'sold_count') final  int? soldCount;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'vendor_id') final  String? vendorId;
@override@JsonKey(name: 'vendor_name') final  String? vendorName;

/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TProductCardCopyWith<_TProductCard> get copyWith => __$TProductCardCopyWithImpl<_TProductCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TProductCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TProductCard&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,thumbnail,price,originalPrice,discountRate,rating,soldCount,const DeepCollectionEquality().hash(_tags),vendorId,vendorName);

@override
String toString() {
  return 'TProductCard(id: $id, name: $name, slug: $slug, thumbnail: $thumbnail, price: $price, originalPrice: $originalPrice, discountRate: $discountRate, rating: $rating, soldCount: $soldCount, tags: $tags, vendorId: $vendorId, vendorName: $vendorName)';
}


}

/// @nodoc
abstract mixin class _$TProductCardCopyWith<$Res> implements $TProductCardCopyWith<$Res> {
  factory _$TProductCardCopyWith(_TProductCard value, $Res Function(_TProductCard) _then) = __$TProductCardCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? thumbnail, int price,@JsonKey(name: 'original_price') int? originalPrice,@JsonKey(name: 'discount_rate') double? discountRate, RatingModel? rating,@JsonKey(name: 'sold_count') int? soldCount, List<String>? tags,@JsonKey(name: 'vendor_id') String? vendorId,@JsonKey(name: 'vendor_name') String? vendorName
});


@override $RatingModelCopyWith<$Res>? get rating;

}
/// @nodoc
class __$TProductCardCopyWithImpl<$Res>
    implements _$TProductCardCopyWith<$Res> {
  __$TProductCardCopyWithImpl(this._self, this._then);

  final _TProductCard _self;
  final $Res Function(_TProductCard) _then;

/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? thumbnail = freezed,Object? price = null,Object? originalPrice = freezed,Object? discountRate = freezed,Object? rating = freezed,Object? soldCount = freezed,Object? tags = freezed,Object? vendorId = freezed,Object? vendorName = freezed,}) {
  return _then(_TProductCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,discountRate: freezed == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as double?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as RatingModel?,soldCount: freezed == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String?,vendorName: freezed == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RatingModelCopyWith<$Res>? get rating {
    if (_self.rating == null) {
    return null;
  }

  return $RatingModelCopyWith<$Res>(_self.rating!, (value) {
    return _then(_self.copyWith(rating: value));
  });
}
}


/// @nodoc
mixin _$ProductSpecification {

@JsonKey(name: 'name') String get key; String get value;
/// Create a copy of ProductSpecification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSpecificationCopyWith<ProductSpecification> get copyWith => _$ProductSpecificationCopyWithImpl<ProductSpecification>(this as ProductSpecification, _$identity);

  /// Serializes this ProductSpecification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSpecification&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'ProductSpecification(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $ProductSpecificationCopyWith<$Res>  {
  factory $ProductSpecificationCopyWith(ProductSpecification value, $Res Function(ProductSpecification) _then) = _$ProductSpecificationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String key, String value
});




}
/// @nodoc
class _$ProductSpecificationCopyWithImpl<$Res>
    implements $ProductSpecificationCopyWith<$Res> {
  _$ProductSpecificationCopyWithImpl(this._self, this._then);

  final ProductSpecification _self;
  final $Res Function(ProductSpecification) _then;

/// Create a copy of ProductSpecification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? value = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductSpecification].
extension ProductSpecificationPatterns on ProductSpecification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSpecification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSpecification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSpecification value)  $default,){
final _that = this;
switch (_that) {
case _ProductSpecification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSpecification value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSpecification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String key,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSpecification() when $default != null:
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String key,  String value)  $default,) {final _that = this;
switch (_that) {
case _ProductSpecification():
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'name')  String key,  String value)?  $default,) {final _that = this;
switch (_that) {
case _ProductSpecification() when $default != null:
return $default(_that.key,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSpecification implements ProductSpecification {
  const _ProductSpecification({@JsonKey(name: 'name') required this.key, required this.value});
  factory _ProductSpecification.fromJson(Map<String, dynamic> json) => _$ProductSpecificationFromJson(json);

@override@JsonKey(name: 'name') final  String key;
@override final  String value;

/// Create a copy of ProductSpecification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSpecificationCopyWith<_ProductSpecification> get copyWith => __$ProductSpecificationCopyWithImpl<_ProductSpecification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSpecificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSpecification&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'ProductSpecification(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ProductSpecificationCopyWith<$Res> implements $ProductSpecificationCopyWith<$Res> {
  factory _$ProductSpecificationCopyWith(_ProductSpecification value, $Res Function(_ProductSpecification) _then) = __$ProductSpecificationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String key, String value
});




}
/// @nodoc
class __$ProductSpecificationCopyWithImpl<$Res>
    implements _$ProductSpecificationCopyWith<$Res> {
  __$ProductSpecificationCopyWithImpl(this._self, this._then);

  final _ProductSpecification _self;
  final $Res Function(_ProductSpecification) _then;

/// Create a copy of ProductSpecification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = null,}) {
  return _then(_ProductSpecification(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SkuAttribute {

@JsonKey(name: 'name') String get key; String get value;
/// Create a copy of SkuAttribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SkuAttributeCopyWith<SkuAttribute> get copyWith => _$SkuAttributeCopyWithImpl<SkuAttribute>(this as SkuAttribute, _$identity);

  /// Serializes this SkuAttribute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkuAttribute&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'SkuAttribute(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $SkuAttributeCopyWith<$Res>  {
  factory $SkuAttributeCopyWith(SkuAttribute value, $Res Function(SkuAttribute) _then) = _$SkuAttributeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String key, String value
});




}
/// @nodoc
class _$SkuAttributeCopyWithImpl<$Res>
    implements $SkuAttributeCopyWith<$Res> {
  _$SkuAttributeCopyWithImpl(this._self, this._then);

  final SkuAttribute _self;
  final $Res Function(SkuAttribute) _then;

/// Create a copy of SkuAttribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? value = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SkuAttribute].
extension SkuAttributePatterns on SkuAttribute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SkuAttribute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SkuAttribute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SkuAttribute value)  $default,){
final _that = this;
switch (_that) {
case _SkuAttribute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SkuAttribute value)?  $default,){
final _that = this;
switch (_that) {
case _SkuAttribute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String key,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SkuAttribute() when $default != null:
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String key,  String value)  $default,) {final _that = this;
switch (_that) {
case _SkuAttribute():
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'name')  String key,  String value)?  $default,) {final _that = this;
switch (_that) {
case _SkuAttribute() when $default != null:
return $default(_that.key,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SkuAttribute implements SkuAttribute {
  const _SkuAttribute({@JsonKey(name: 'name') required this.key, required this.value});
  factory _SkuAttribute.fromJson(Map<String, dynamic> json) => _$SkuAttributeFromJson(json);

@override@JsonKey(name: 'name') final  String key;
@override final  String value;

/// Create a copy of SkuAttribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SkuAttributeCopyWith<_SkuAttribute> get copyWith => __$SkuAttributeCopyWithImpl<_SkuAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SkuAttributeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkuAttribute&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'SkuAttribute(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SkuAttributeCopyWith<$Res> implements $SkuAttributeCopyWith<$Res> {
  factory _$SkuAttributeCopyWith(_SkuAttribute value, $Res Function(_SkuAttribute) _then) = __$SkuAttributeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String key, String value
});




}
/// @nodoc
class __$SkuAttributeCopyWithImpl<$Res>
    implements _$SkuAttributeCopyWith<$Res> {
  __$SkuAttributeCopyWithImpl(this._self, this._then);

  final _SkuAttribute _self;
  final $Res Function(_SkuAttribute) _then;

/// Create a copy of SkuAttribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = null,}) {
  return _then(_SkuAttribute(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ProductSku {

 String get id;@JsonKey(name: 'spu_id') String get spuId;@JsonKey(name: 'name') String get name; int get price;@JsonKey(name: 'original_price') int? get originalPrice; int get stock;@JsonKey(name: 'resources') List<ResourceModel>? get images; List<SkuAttribute>? get attributes;
/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSkuCopyWith<ProductSku> get copyWith => _$ProductSkuCopyWithImpl<ProductSku>(this as ProductSku, _$identity);

  /// Serializes this ProductSku to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSku&&(identical(other.id, id) || other.id == id)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.stock, stock) || other.stock == stock)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,spuId,name,price,originalPrice,stock,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'ProductSku(id: $id, spuId: $spuId, name: $name, price: $price, originalPrice: $originalPrice, stock: $stock, images: $images, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $ProductSkuCopyWith<$Res>  {
  factory $ProductSkuCopyWith(ProductSku value, $Res Function(ProductSku) _then) = _$ProductSkuCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'spu_id') String spuId,@JsonKey(name: 'name') String name, int price,@JsonKey(name: 'original_price') int? originalPrice, int stock,@JsonKey(name: 'resources') List<ResourceModel>? images, List<SkuAttribute>? attributes
});




}
/// @nodoc
class _$ProductSkuCopyWithImpl<$Res>
    implements $ProductSkuCopyWith<$Res> {
  _$ProductSkuCopyWithImpl(this._self, this._then);

  final ProductSku _self;
  final $Res Function(ProductSku) _then;

/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? spuId = null,Object? name = null,Object? price = null,Object? originalPrice = freezed,Object? stock = null,Object? images = freezed,Object? attributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>?,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductSku].
extension ProductSkuPatterns on ProductSku {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSku value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSku() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSku value)  $default,){
final _that = this;
switch (_that) {
case _ProductSku():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSku value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSku() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'name')  String name,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  int stock, @JsonKey(name: 'resources')  List<ResourceModel>? images,  List<SkuAttribute>? attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSku() when $default != null:
return $default(_that.id,_that.spuId,_that.name,_that.price,_that.originalPrice,_that.stock,_that.images,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'name')  String name,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  int stock, @JsonKey(name: 'resources')  List<ResourceModel>? images,  List<SkuAttribute>? attributes)  $default,) {final _that = this;
switch (_that) {
case _ProductSku():
return $default(_that.id,_that.spuId,_that.name,_that.price,_that.originalPrice,_that.stock,_that.images,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'name')  String name,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  int stock, @JsonKey(name: 'resources')  List<ResourceModel>? images,  List<SkuAttribute>? attributes)?  $default,) {final _that = this;
switch (_that) {
case _ProductSku() when $default != null:
return $default(_that.id,_that.spuId,_that.name,_that.price,_that.originalPrice,_that.stock,_that.images,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSku implements ProductSku {
  const _ProductSku({required this.id, @JsonKey(name: 'spu_id') this.spuId = '', @JsonKey(name: 'name') this.name = '', required this.price, @JsonKey(name: 'original_price') this.originalPrice, required this.stock, @JsonKey(name: 'resources') final  List<ResourceModel>? images, final  List<SkuAttribute>? attributes}): _images = images,_attributes = attributes;
  factory _ProductSku.fromJson(Map<String, dynamic> json) => _$ProductSkuFromJson(json);

@override final  String id;
@override@JsonKey(name: 'spu_id') final  String spuId;
@override@JsonKey(name: 'name') final  String name;
@override final  int price;
@override@JsonKey(name: 'original_price') final  int? originalPrice;
@override final  int stock;
 final  List<ResourceModel>? _images;
@override@JsonKey(name: 'resources') List<ResourceModel>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SkuAttribute>? _attributes;
@override List<SkuAttribute>? get attributes {
  final value = _attributes;
  if (value == null) return null;
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSkuCopyWith<_ProductSku> get copyWith => __$ProductSkuCopyWithImpl<_ProductSku>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSkuToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSku&&(identical(other.id, id) || other.id == id)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.stock, stock) || other.stock == stock)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,spuId,name,price,originalPrice,stock,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'ProductSku(id: $id, spuId: $spuId, name: $name, price: $price, originalPrice: $originalPrice, stock: $stock, images: $images, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$ProductSkuCopyWith<$Res> implements $ProductSkuCopyWith<$Res> {
  factory _$ProductSkuCopyWith(_ProductSku value, $Res Function(_ProductSku) _then) = __$ProductSkuCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'spu_id') String spuId,@JsonKey(name: 'name') String name, int price,@JsonKey(name: 'original_price') int? originalPrice, int stock,@JsonKey(name: 'resources') List<ResourceModel>? images, List<SkuAttribute>? attributes
});




}
/// @nodoc
class __$ProductSkuCopyWithImpl<$Res>
    implements _$ProductSkuCopyWith<$Res> {
  __$ProductSkuCopyWithImpl(this._self, this._then);

  final _ProductSku _self;
  final $Res Function(_ProductSku) _then;

/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? spuId = null,Object? name = null,Object? price = null,Object? originalPrice = freezed,Object? stock = null,Object? images = freezed,Object? attributes = freezed,}) {
  return _then(_ProductSku(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>?,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,
  ));
}


}


/// @nodoc
mixin _$TProductDetail {

 String get id; String get name; String get slug; String? get description; int get price;@JsonKey(name: 'original_price') int? get originalPrice; RatingModel? get rating;@JsonKey(name: 'sold_count') int? get soldCount;@JsonKey(name: 'resources') List<ResourceModel>? get images; List<ProductSpecification>? get specifications; List<ProductSku>? get skus;@JsonKey(name: 'vendor_id') String? get vendorId;@JsonKey(name: 'vendor_name') String? get vendorName;@JsonKey(name: 'vendor_avatar') String? get vendorAvatar;@JsonKey(name: 'category_id') String? get categoryId;
/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TProductDetailCopyWith<TProductDetail> get copyWith => _$TProductDetailCopyWithImpl<TProductDetail>(this as TProductDetail, _$identity);

  /// Serializes this TProductDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TProductDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.specifications, specifications)&&const DeepCollectionEquality().equals(other.skus, skus)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.vendorAvatar, vendorAvatar) || other.vendorAvatar == vendorAvatar)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,price,originalPrice,rating,soldCount,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(specifications),const DeepCollectionEquality().hash(skus),vendorId,vendorName,vendorAvatar,categoryId);

@override
String toString() {
  return 'TProductDetail(id: $id, name: $name, slug: $slug, description: $description, price: $price, originalPrice: $originalPrice, rating: $rating, soldCount: $soldCount, images: $images, specifications: $specifications, skus: $skus, vendorId: $vendorId, vendorName: $vendorName, vendorAvatar: $vendorAvatar, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class $TProductDetailCopyWith<$Res>  {
  factory $TProductDetailCopyWith(TProductDetail value, $Res Function(TProductDetail) _then) = _$TProductDetailCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? description, int price,@JsonKey(name: 'original_price') int? originalPrice, RatingModel? rating,@JsonKey(name: 'sold_count') int? soldCount,@JsonKey(name: 'resources') List<ResourceModel>? images, List<ProductSpecification>? specifications, List<ProductSku>? skus,@JsonKey(name: 'vendor_id') String? vendorId,@JsonKey(name: 'vendor_name') String? vendorName,@JsonKey(name: 'vendor_avatar') String? vendorAvatar,@JsonKey(name: 'category_id') String? categoryId
});


$RatingModelCopyWith<$Res>? get rating;

}
/// @nodoc
class _$TProductDetailCopyWithImpl<$Res>
    implements $TProductDetailCopyWith<$Res> {
  _$TProductDetailCopyWithImpl(this._self, this._then);

  final TProductDetail _self;
  final $Res Function(TProductDetail) _then;

/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? price = null,Object? originalPrice = freezed,Object? rating = freezed,Object? soldCount = freezed,Object? images = freezed,Object? specifications = freezed,Object? skus = freezed,Object? vendorId = freezed,Object? vendorName = freezed,Object? vendorAvatar = freezed,Object? categoryId = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as RatingModel?,soldCount: freezed == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>?,specifications: freezed == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as List<ProductSpecification>?,skus: freezed == skus ? _self.skus : skus // ignore: cast_nullable_to_non_nullable
as List<ProductSku>?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String?,vendorName: freezed == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String?,vendorAvatar: freezed == vendorAvatar ? _self.vendorAvatar : vendorAvatar // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RatingModelCopyWith<$Res>? get rating {
    if (_self.rating == null) {
    return null;
  }

  return $RatingModelCopyWith<$Res>(_self.rating!, (value) {
    return _then(_self.copyWith(rating: value));
  });
}
}


/// Adds pattern-matching-related methods to [TProductDetail].
extension TProductDetailPatterns on TProductDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TProductDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TProductDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TProductDetail value)  $default,){
final _that = this;
switch (_that) {
case _TProductDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TProductDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TProductDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  RatingModel? rating, @JsonKey(name: 'sold_count')  int? soldCount, @JsonKey(name: 'resources')  List<ResourceModel>? images,  List<ProductSpecification>? specifications,  List<ProductSku>? skus, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'vendor_avatar')  String? vendorAvatar, @JsonKey(name: 'category_id')  String? categoryId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TProductDetail() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.price,_that.originalPrice,_that.rating,_that.soldCount,_that.images,_that.specifications,_that.skus,_that.vendorId,_that.vendorName,_that.vendorAvatar,_that.categoryId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  RatingModel? rating, @JsonKey(name: 'sold_count')  int? soldCount, @JsonKey(name: 'resources')  List<ResourceModel>? images,  List<ProductSpecification>? specifications,  List<ProductSku>? skus, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'vendor_avatar')  String? vendorAvatar, @JsonKey(name: 'category_id')  String? categoryId)  $default,) {final _that = this;
switch (_that) {
case _TProductDetail():
return $default(_that.id,_that.name,_that.slug,_that.description,_that.price,_that.originalPrice,_that.rating,_that.soldCount,_that.images,_that.specifications,_that.skus,_that.vendorId,_that.vendorName,_that.vendorAvatar,_that.categoryId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String? description,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  RatingModel? rating, @JsonKey(name: 'sold_count')  int? soldCount, @JsonKey(name: 'resources')  List<ResourceModel>? images,  List<ProductSpecification>? specifications,  List<ProductSku>? skus, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'vendor_avatar')  String? vendorAvatar, @JsonKey(name: 'category_id')  String? categoryId)?  $default,) {final _that = this;
switch (_that) {
case _TProductDetail() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.price,_that.originalPrice,_that.rating,_that.soldCount,_that.images,_that.specifications,_that.skus,_that.vendorId,_that.vendorName,_that.vendorAvatar,_that.categoryId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TProductDetail implements TProductDetail {
  const _TProductDetail({required this.id, required this.name, required this.slug, this.description, this.price = 0, @JsonKey(name: 'original_price') this.originalPrice, this.rating, @JsonKey(name: 'sold_count') this.soldCount, @JsonKey(name: 'resources') final  List<ResourceModel>? images, final  List<ProductSpecification>? specifications, final  List<ProductSku>? skus, @JsonKey(name: 'vendor_id') this.vendorId, @JsonKey(name: 'vendor_name') this.vendorName, @JsonKey(name: 'vendor_avatar') this.vendorAvatar, @JsonKey(name: 'category_id') this.categoryId}): _images = images,_specifications = specifications,_skus = skus;
  factory _TProductDetail.fromJson(Map<String, dynamic> json) => _$TProductDetailFromJson(json);

@override final  String id;
@override final  String name;
@override final  String slug;
@override final  String? description;
@override@JsonKey() final  int price;
@override@JsonKey(name: 'original_price') final  int? originalPrice;
@override final  RatingModel? rating;
@override@JsonKey(name: 'sold_count') final  int? soldCount;
 final  List<ResourceModel>? _images;
@override@JsonKey(name: 'resources') List<ResourceModel>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductSpecification>? _specifications;
@override List<ProductSpecification>? get specifications {
  final value = _specifications;
  if (value == null) return null;
  if (_specifications is EqualUnmodifiableListView) return _specifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductSku>? _skus;
@override List<ProductSku>? get skus {
  final value = _skus;
  if (value == null) return null;
  if (_skus is EqualUnmodifiableListView) return _skus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'vendor_id') final  String? vendorId;
@override@JsonKey(name: 'vendor_name') final  String? vendorName;
@override@JsonKey(name: 'vendor_avatar') final  String? vendorAvatar;
@override@JsonKey(name: 'category_id') final  String? categoryId;

/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TProductDetailCopyWith<_TProductDetail> get copyWith => __$TProductDetailCopyWithImpl<_TProductDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TProductDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TProductDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._specifications, _specifications)&&const DeepCollectionEquality().equals(other._skus, _skus)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.vendorAvatar, vendorAvatar) || other.vendorAvatar == vendorAvatar)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,slug,description,price,originalPrice,rating,soldCount,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_specifications),const DeepCollectionEquality().hash(_skus),vendorId,vendorName,vendorAvatar,categoryId);

@override
String toString() {
  return 'TProductDetail(id: $id, name: $name, slug: $slug, description: $description, price: $price, originalPrice: $originalPrice, rating: $rating, soldCount: $soldCount, images: $images, specifications: $specifications, skus: $skus, vendorId: $vendorId, vendorName: $vendorName, vendorAvatar: $vendorAvatar, categoryId: $categoryId)';
}


}

/// @nodoc
abstract mixin class _$TProductDetailCopyWith<$Res> implements $TProductDetailCopyWith<$Res> {
  factory _$TProductDetailCopyWith(_TProductDetail value, $Res Function(_TProductDetail) _then) = __$TProductDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? description, int price,@JsonKey(name: 'original_price') int? originalPrice, RatingModel? rating,@JsonKey(name: 'sold_count') int? soldCount,@JsonKey(name: 'resources') List<ResourceModel>? images, List<ProductSpecification>? specifications, List<ProductSku>? skus,@JsonKey(name: 'vendor_id') String? vendorId,@JsonKey(name: 'vendor_name') String? vendorName,@JsonKey(name: 'vendor_avatar') String? vendorAvatar,@JsonKey(name: 'category_id') String? categoryId
});


@override $RatingModelCopyWith<$Res>? get rating;

}
/// @nodoc
class __$TProductDetailCopyWithImpl<$Res>
    implements _$TProductDetailCopyWith<$Res> {
  __$TProductDetailCopyWithImpl(this._self, this._then);

  final _TProductDetail _self;
  final $Res Function(_TProductDetail) _then;

/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? price = null,Object? originalPrice = freezed,Object? rating = freezed,Object? soldCount = freezed,Object? images = freezed,Object? specifications = freezed,Object? skus = freezed,Object? vendorId = freezed,Object? vendorName = freezed,Object? vendorAvatar = freezed,Object? categoryId = freezed,}) {
  return _then(_TProductDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as RatingModel?,soldCount: freezed == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>?,specifications: freezed == specifications ? _self._specifications : specifications // ignore: cast_nullable_to_non_nullable
as List<ProductSpecification>?,skus: freezed == skus ? _self._skus : skus // ignore: cast_nullable_to_non_nullable
as List<ProductSku>?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String?,vendorName: freezed == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String?,vendorAvatar: freezed == vendorAvatar ? _self.vendorAvatar : vendorAvatar // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RatingModelCopyWith<$Res>? get rating {
    if (_self.rating == null) {
    return null;
  }

  return $RatingModelCopyWith<$Res>(_self.rating!, (value) {
    return _then(_self.copyWith(rating: value));
  });
}
}


/// @nodoc
mixin _$CommentProfile {

 String get id; String? get username; String? get name;@JsonKey(name: 'avatar_url') String? get avatarUrl;
/// Create a copy of CommentProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentProfileCopyWith<CommentProfile> get copyWith => _$CommentProfileCopyWithImpl<CommentProfile>(this as CommentProfile, _$identity);

  /// Serializes this CommentProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name,avatarUrl);

@override
String toString() {
  return 'CommentProfile(id: $id, username: $username, name: $name, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $CommentProfileCopyWith<$Res>  {
  factory $CommentProfileCopyWith(CommentProfile value, $Res Function(CommentProfile) _then) = _$CommentProfileCopyWithImpl;
@useResult
$Res call({
 String id, String? username, String? name,@JsonKey(name: 'avatar_url') String? avatarUrl
});




}
/// @nodoc
class _$CommentProfileCopyWithImpl<$Res>
    implements $CommentProfileCopyWith<$Res> {
  _$CommentProfileCopyWithImpl(this._self, this._then);

  final CommentProfile _self;
  final $Res Function(CommentProfile) _then;

/// Create a copy of CommentProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = freezed,Object? name = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentProfile].
extension CommentProfilePatterns on CommentProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentProfile value)  $default,){
final _that = this;
switch (_that) {
case _CommentProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentProfile value)?  $default,){
final _that = this;
switch (_that) {
case _CommentProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? username,  String? name, @JsonKey(name: 'avatar_url')  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentProfile() when $default != null:
return $default(_that.id,_that.username,_that.name,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? username,  String? name, @JsonKey(name: 'avatar_url')  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _CommentProfile():
return $default(_that.id,_that.username,_that.name,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? username,  String? name, @JsonKey(name: 'avatar_url')  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _CommentProfile() when $default != null:
return $default(_that.id,_that.username,_that.name,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentProfile implements CommentProfile {
  const _CommentProfile({required this.id, this.username, this.name, @JsonKey(name: 'avatar_url') this.avatarUrl});
  factory _CommentProfile.fromJson(Map<String, dynamic> json) => _$CommentProfileFromJson(json);

@override final  String id;
@override final  String? username;
@override final  String? name;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;

/// Create a copy of CommentProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentProfileCopyWith<_CommentProfile> get copyWith => __$CommentProfileCopyWithImpl<_CommentProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name,avatarUrl);

@override
String toString() {
  return 'CommentProfile(id: $id, username: $username, name: $name, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$CommentProfileCopyWith<$Res> implements $CommentProfileCopyWith<$Res> {
  factory _$CommentProfileCopyWith(_CommentProfile value, $Res Function(_CommentProfile) _then) = __$CommentProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String? username, String? name,@JsonKey(name: 'avatar_url') String? avatarUrl
});




}
/// @nodoc
class __$CommentProfileCopyWithImpl<$Res>
    implements _$CommentProfileCopyWith<$Res> {
  __$CommentProfileCopyWithImpl(this._self, this._then);

  final _CommentProfile _self;
  final $Res Function(_CommentProfile) _then;

/// Create a copy of CommentProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = freezed,Object? name = freezed,Object? avatarUrl = freezed,}) {
  return _then(_CommentProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ProductComment {

 String get id;@JsonKey(name: 'ref_id') String get refId;@JsonKey(name: 'ref_type') String get refType;@JsonKey(name: 'account_id') String? get accountId;@JsonKey(name: 'order_id') String? get orderId; CommentProfile? get profile; String? get body; int? get upvote; int? get downvote; double get score;@JsonKey(name: 'date_created') String? get dateCreated;@JsonKey(name: 'date_updated') String? get dateUpdated;@JsonKey(name: 'resources') List<ResourceModel>? get attachments; List<SkuAttribute>? get attributes;
/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCommentCopyWith<ProductComment> get copyWith => _$ProductCommentCopyWithImpl<ProductComment>(this as ProductComment, _$identity);

  /// Serializes this ProductComment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductComment&&(identical(other.id, id) || other.id == id)&&(identical(other.refId, refId) || other.refId == refId)&&(identical(other.refType, refType) || other.refType == refType)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.body, body) || other.body == body)&&(identical(other.upvote, upvote) || other.upvote == upvote)&&(identical(other.downvote, downvote) || other.downvote == downvote)&&(identical(other.score, score) || other.score == score)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateUpdated, dateUpdated) || other.dateUpdated == dateUpdated)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,refId,refType,accountId,orderId,profile,body,upvote,downvote,score,dateCreated,dateUpdated,const DeepCollectionEquality().hash(attachments),const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'ProductComment(id: $id, refId: $refId, refType: $refType, accountId: $accountId, orderId: $orderId, profile: $profile, body: $body, upvote: $upvote, downvote: $downvote, score: $score, dateCreated: $dateCreated, dateUpdated: $dateUpdated, attachments: $attachments, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $ProductCommentCopyWith<$Res>  {
  factory $ProductCommentCopyWith(ProductComment value, $Res Function(ProductComment) _then) = _$ProductCommentCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'ref_id') String refId,@JsonKey(name: 'ref_type') String refType,@JsonKey(name: 'account_id') String? accountId,@JsonKey(name: 'order_id') String? orderId, CommentProfile? profile, String? body, int? upvote, int? downvote, double score,@JsonKey(name: 'date_created') String? dateCreated,@JsonKey(name: 'date_updated') String? dateUpdated,@JsonKey(name: 'resources') List<ResourceModel>? attachments, List<SkuAttribute>? attributes
});


$CommentProfileCopyWith<$Res>? get profile;

}
/// @nodoc
class _$ProductCommentCopyWithImpl<$Res>
    implements $ProductCommentCopyWith<$Res> {
  _$ProductCommentCopyWithImpl(this._self, this._then);

  final ProductComment _self;
  final $Res Function(ProductComment) _then;

/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? refId = null,Object? refType = null,Object? accountId = freezed,Object? orderId = freezed,Object? profile = freezed,Object? body = freezed,Object? upvote = freezed,Object? downvote = freezed,Object? score = null,Object? dateCreated = freezed,Object? dateUpdated = freezed,Object? attachments = freezed,Object? attributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,refId: null == refId ? _self.refId : refId // ignore: cast_nullable_to_non_nullable
as String,refType: null == refType ? _self.refType : refType // ignore: cast_nullable_to_non_nullable
as String,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as CommentProfile?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,upvote: freezed == upvote ? _self.upvote : upvote // ignore: cast_nullable_to_non_nullable
as int?,downvote: freezed == downvote ? _self.downvote : downvote // ignore: cast_nullable_to_non_nullable
as int?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,dateCreated: freezed == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String?,dateUpdated: freezed == dateUpdated ? _self.dateUpdated : dateUpdated // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>?,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,
  ));
}
/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $CommentProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductComment].
extension ProductCommentPatterns on ProductComment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductComment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductComment value)  $default,){
final _that = this;
switch (_that) {
case _ProductComment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductComment value)?  $default,){
final _that = this;
switch (_that) {
case _ProductComment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'ref_id')  String refId, @JsonKey(name: 'ref_type')  String refType, @JsonKey(name: 'account_id')  String? accountId, @JsonKey(name: 'order_id')  String? orderId,  CommentProfile? profile,  String? body,  int? upvote,  int? downvote,  double score, @JsonKey(name: 'date_created')  String? dateCreated, @JsonKey(name: 'date_updated')  String? dateUpdated, @JsonKey(name: 'resources')  List<ResourceModel>? attachments,  List<SkuAttribute>? attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductComment() when $default != null:
return $default(_that.id,_that.refId,_that.refType,_that.accountId,_that.orderId,_that.profile,_that.body,_that.upvote,_that.downvote,_that.score,_that.dateCreated,_that.dateUpdated,_that.attachments,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'ref_id')  String refId, @JsonKey(name: 'ref_type')  String refType, @JsonKey(name: 'account_id')  String? accountId, @JsonKey(name: 'order_id')  String? orderId,  CommentProfile? profile,  String? body,  int? upvote,  int? downvote,  double score, @JsonKey(name: 'date_created')  String? dateCreated, @JsonKey(name: 'date_updated')  String? dateUpdated, @JsonKey(name: 'resources')  List<ResourceModel>? attachments,  List<SkuAttribute>? attributes)  $default,) {final _that = this;
switch (_that) {
case _ProductComment():
return $default(_that.id,_that.refId,_that.refType,_that.accountId,_that.orderId,_that.profile,_that.body,_that.upvote,_that.downvote,_that.score,_that.dateCreated,_that.dateUpdated,_that.attachments,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'ref_id')  String refId, @JsonKey(name: 'ref_type')  String refType, @JsonKey(name: 'account_id')  String? accountId, @JsonKey(name: 'order_id')  String? orderId,  CommentProfile? profile,  String? body,  int? upvote,  int? downvote,  double score, @JsonKey(name: 'date_created')  String? dateCreated, @JsonKey(name: 'date_updated')  String? dateUpdated, @JsonKey(name: 'resources')  List<ResourceModel>? attachments,  List<SkuAttribute>? attributes)?  $default,) {final _that = this;
switch (_that) {
case _ProductComment() when $default != null:
return $default(_that.id,_that.refId,_that.refType,_that.accountId,_that.orderId,_that.profile,_that.body,_that.upvote,_that.downvote,_that.score,_that.dateCreated,_that.dateUpdated,_that.attachments,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductComment implements ProductComment {
  const _ProductComment({required this.id, @JsonKey(name: 'ref_id') required this.refId, @JsonKey(name: 'ref_type') required this.refType, @JsonKey(name: 'account_id') this.accountId, @JsonKey(name: 'order_id') this.orderId, this.profile, this.body, this.upvote, this.downvote, required this.score, @JsonKey(name: 'date_created') this.dateCreated, @JsonKey(name: 'date_updated') this.dateUpdated, @JsonKey(name: 'resources') final  List<ResourceModel>? attachments, final  List<SkuAttribute>? attributes}): _attachments = attachments,_attributes = attributes;
  factory _ProductComment.fromJson(Map<String, dynamic> json) => _$ProductCommentFromJson(json);

@override final  String id;
@override@JsonKey(name: 'ref_id') final  String refId;
@override@JsonKey(name: 'ref_type') final  String refType;
@override@JsonKey(name: 'account_id') final  String? accountId;
@override@JsonKey(name: 'order_id') final  String? orderId;
@override final  CommentProfile? profile;
@override final  String? body;
@override final  int? upvote;
@override final  int? downvote;
@override final  double score;
@override@JsonKey(name: 'date_created') final  String? dateCreated;
@override@JsonKey(name: 'date_updated') final  String? dateUpdated;
 final  List<ResourceModel>? _attachments;
@override@JsonKey(name: 'resources') List<ResourceModel>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SkuAttribute>? _attributes;
@override List<SkuAttribute>? get attributes {
  final value = _attributes;
  if (value == null) return null;
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCommentCopyWith<_ProductComment> get copyWith => __$ProductCommentCopyWithImpl<_ProductComment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductCommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductComment&&(identical(other.id, id) || other.id == id)&&(identical(other.refId, refId) || other.refId == refId)&&(identical(other.refType, refType) || other.refType == refType)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.body, body) || other.body == body)&&(identical(other.upvote, upvote) || other.upvote == upvote)&&(identical(other.downvote, downvote) || other.downvote == downvote)&&(identical(other.score, score) || other.score == score)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateUpdated, dateUpdated) || other.dateUpdated == dateUpdated)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,refId,refType,accountId,orderId,profile,body,upvote,downvote,score,dateCreated,dateUpdated,const DeepCollectionEquality().hash(_attachments),const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'ProductComment(id: $id, refId: $refId, refType: $refType, accountId: $accountId, orderId: $orderId, profile: $profile, body: $body, upvote: $upvote, downvote: $downvote, score: $score, dateCreated: $dateCreated, dateUpdated: $dateUpdated, attachments: $attachments, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$ProductCommentCopyWith<$Res> implements $ProductCommentCopyWith<$Res> {
  factory _$ProductCommentCopyWith(_ProductComment value, $Res Function(_ProductComment) _then) = __$ProductCommentCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'ref_id') String refId,@JsonKey(name: 'ref_type') String refType,@JsonKey(name: 'account_id') String? accountId,@JsonKey(name: 'order_id') String? orderId, CommentProfile? profile, String? body, int? upvote, int? downvote, double score,@JsonKey(name: 'date_created') String? dateCreated,@JsonKey(name: 'date_updated') String? dateUpdated,@JsonKey(name: 'resources') List<ResourceModel>? attachments, List<SkuAttribute>? attributes
});


@override $CommentProfileCopyWith<$Res>? get profile;

}
/// @nodoc
class __$ProductCommentCopyWithImpl<$Res>
    implements _$ProductCommentCopyWith<$Res> {
  __$ProductCommentCopyWithImpl(this._self, this._then);

  final _ProductComment _self;
  final $Res Function(_ProductComment) _then;

/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? refId = null,Object? refType = null,Object? accountId = freezed,Object? orderId = freezed,Object? profile = freezed,Object? body = freezed,Object? upvote = freezed,Object? downvote = freezed,Object? score = null,Object? dateCreated = freezed,Object? dateUpdated = freezed,Object? attachments = freezed,Object? attributes = freezed,}) {
  return _then(_ProductComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,refId: null == refId ? _self.refId : refId // ignore: cast_nullable_to_non_nullable
as String,refType: null == refType ? _self.refType : refType // ignore: cast_nullable_to_non_nullable
as String,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as CommentProfile?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,upvote: freezed == upvote ? _self.upvote : upvote // ignore: cast_nullable_to_non_nullable
as int?,downvote: freezed == downvote ? _self.downvote : downvote // ignore: cast_nullable_to_non_nullable
as int?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double,dateCreated: freezed == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String?,dateUpdated: freezed == dateUpdated ? _self.dateUpdated : dateUpdated // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>?,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,
  ));
}

/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $CommentProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

// dart format on
