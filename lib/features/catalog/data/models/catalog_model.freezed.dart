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
mixin _$RecentListing {

 String get id; String get name; int get price;@JsonKey(name: 'cover_url') String? get coverUrl;@JsonKey(name: 'seller_name') String? get sellerName; double get rating; bool get negotiable;
/// Create a copy of RecentListing
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecentListingCopyWith<RecentListing> get copyWith => _$RecentListingCopyWithImpl<RecentListing>(this as RecentListing, _$identity);

  /// Serializes this RecentListing to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecentListing&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.negotiable, negotiable) || other.negotiable == negotiable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,coverUrl,sellerName,rating,negotiable);

@override
String toString() {
  return 'RecentListing(id: $id, name: $name, price: $price, coverUrl: $coverUrl, sellerName: $sellerName, rating: $rating, negotiable: $negotiable)';
}


}

/// @nodoc
abstract mixin class $RecentListingCopyWith<$Res>  {
  factory $RecentListingCopyWith(RecentListing value, $Res Function(RecentListing) _then) = _$RecentListingCopyWithImpl;
@useResult
$Res call({
 String id, String name, int price,@JsonKey(name: 'cover_url') String? coverUrl,@JsonKey(name: 'seller_name') String? sellerName, double rating, bool negotiable
});




}
/// @nodoc
class _$RecentListingCopyWithImpl<$Res>
    implements $RecentListingCopyWith<$Res> {
  _$RecentListingCopyWithImpl(this._self, this._then);

  final RecentListing _self;
  final $Res Function(RecentListing) _then;

/// Create a copy of RecentListing
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? price = null,Object? coverUrl = freezed,Object? sellerName = freezed,Object? rating = null,Object? negotiable = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,sellerName: freezed == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,negotiable: null == negotiable ? _self.negotiable : negotiable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RecentListing].
extension RecentListingPatterns on RecentListing {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecentListing value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecentListing() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecentListing value)  $default,){
final _that = this;
switch (_that) {
case _RecentListing():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecentListing value)?  $default,){
final _that = this;
switch (_that) {
case _RecentListing() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  int price, @JsonKey(name: 'cover_url')  String? coverUrl, @JsonKey(name: 'seller_name')  String? sellerName,  double rating,  bool negotiable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecentListing() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.coverUrl,_that.sellerName,_that.rating,_that.negotiable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  int price, @JsonKey(name: 'cover_url')  String? coverUrl, @JsonKey(name: 'seller_name')  String? sellerName,  double rating,  bool negotiable)  $default,) {final _that = this;
switch (_that) {
case _RecentListing():
return $default(_that.id,_that.name,_that.price,_that.coverUrl,_that.sellerName,_that.rating,_that.negotiable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  int price, @JsonKey(name: 'cover_url')  String? coverUrl, @JsonKey(name: 'seller_name')  String? sellerName,  double rating,  bool negotiable)?  $default,) {final _that = this;
switch (_that) {
case _RecentListing() when $default != null:
return $default(_that.id,_that.name,_that.price,_that.coverUrl,_that.sellerName,_that.rating,_that.negotiable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecentListing extends RecentListing {
  const _RecentListing({required this.id, required this.name, required this.price, @JsonKey(name: 'cover_url') this.coverUrl, @JsonKey(name: 'seller_name') this.sellerName, this.rating = 0.0, this.negotiable = false}): super._();
  factory _RecentListing.fromJson(Map<String, dynamic> json) => _$RecentListingFromJson(json);

@override final  String id;
@override final  String name;
@override final  int price;
@override@JsonKey(name: 'cover_url') final  String? coverUrl;
@override@JsonKey(name: 'seller_name') final  String? sellerName;
@override@JsonKey() final  double rating;
@override@JsonKey() final  bool negotiable;

/// Create a copy of RecentListing
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecentListingCopyWith<_RecentListing> get copyWith => __$RecentListingCopyWithImpl<_RecentListing>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecentListingToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecentListing&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.coverUrl, coverUrl) || other.coverUrl == coverUrl)&&(identical(other.sellerName, sellerName) || other.sellerName == sellerName)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.negotiable, negotiable) || other.negotiable == negotiable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,price,coverUrl,sellerName,rating,negotiable);

@override
String toString() {
  return 'RecentListing(id: $id, name: $name, price: $price, coverUrl: $coverUrl, sellerName: $sellerName, rating: $rating, negotiable: $negotiable)';
}


}

/// @nodoc
abstract mixin class _$RecentListingCopyWith<$Res> implements $RecentListingCopyWith<$Res> {
  factory _$RecentListingCopyWith(_RecentListing value, $Res Function(_RecentListing) _then) = __$RecentListingCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, int price,@JsonKey(name: 'cover_url') String? coverUrl,@JsonKey(name: 'seller_name') String? sellerName, double rating, bool negotiable
});




}
/// @nodoc
class __$RecentListingCopyWithImpl<$Res>
    implements _$RecentListingCopyWith<$Res> {
  __$RecentListingCopyWithImpl(this._self, this._then);

  final _RecentListing _self;
  final $Res Function(_RecentListing) _then;

/// Create a copy of RecentListing
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? price = null,Object? coverUrl = freezed,Object? sellerName = freezed,Object? rating = null,Object? negotiable = null,}) {
  return _then(_RecentListing(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,coverUrl: freezed == coverUrl ? _self.coverUrl : coverUrl // ignore: cast_nullable_to_non_nullable
as String?,sellerName: freezed == sellerName ? _self.sellerName : sellerName // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,negotiable: null == negotiable ? _self.negotiable : negotiable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$ListingSeller {

 String get id; String get name; Resource? get avatar;
/// Create a copy of ListingSeller
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingSellerCopyWith<ListingSeller> get copyWith => _$ListingSellerCopyWithImpl<ListingSeller>(this as ListingSeller, _$identity);

  /// Serializes this ListingSeller to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingSeller&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar);

@override
String toString() {
  return 'ListingSeller(id: $id, name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $ListingSellerCopyWith<$Res>  {
  factory $ListingSellerCopyWith(ListingSeller value, $Res Function(ListingSeller) _then) = _$ListingSellerCopyWithImpl;
@useResult
$Res call({
 String id, String name, Resource? avatar
});




}
/// @nodoc
class _$ListingSellerCopyWithImpl<$Res>
    implements $ListingSellerCopyWith<$Res> {
  _$ListingSellerCopyWithImpl(this._self, this._then);

  final ListingSeller _self;
  final $Res Function(ListingSeller) _then;

/// Create a copy of ListingSeller
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Resource?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListingSeller].
extension ListingSellerPatterns on ListingSeller {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingSeller value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingSeller() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingSeller value)  $default,){
final _that = this;
switch (_that) {
case _ListingSeller():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingSeller value)?  $default,){
final _that = this;
switch (_that) {
case _ListingSeller() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  Resource? avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingSeller() when $default != null:
return $default(_that.id,_that.name,_that.avatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  Resource? avatar)  $default,) {final _that = this;
switch (_that) {
case _ListingSeller():
return $default(_that.id,_that.name,_that.avatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  Resource? avatar)?  $default,) {final _that = this;
switch (_that) {
case _ListingSeller() when $default != null:
return $default(_that.id,_that.name,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListingSeller implements ListingSeller {
  const _ListingSeller({required this.id, required this.name, this.avatar});
  factory _ListingSeller.fromJson(Map<String, dynamic> json) => _$ListingSellerFromJson(json);

@override final  String id;
@override final  String name;
@override final  Resource? avatar;

/// Create a copy of ListingSeller
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingSellerCopyWith<_ListingSeller> get copyWith => __$ListingSellerCopyWithImpl<_ListingSeller>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingSellerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingSeller&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar);

@override
String toString() {
  return 'ListingSeller(id: $id, name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$ListingSellerCopyWith<$Res> implements $ListingSellerCopyWith<$Res> {
  factory _$ListingSellerCopyWith(_ListingSeller value, $Res Function(_ListingSeller) _then) = __$ListingSellerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, Resource? avatar
});




}
/// @nodoc
class __$ListingSellerCopyWithImpl<$Res>
    implements _$ListingSellerCopyWith<$Res> {
  __$ListingSellerCopyWithImpl(this._self, this._then);

  final _ListingSeller _self;
  final $Res Function(_ListingSeller) _then;

/// Create a copy of ListingSeller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,}) {
  return _then(_ListingSeller(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Resource?,
  ));
}


}


/// @nodoc
mixin _$TProductCard {

 String get id; String get name; String get slug; int get price;@JsonKey(name: 'price_mode') String? get priceMode; String? get currency;@JsonKey(name: 'category_id') String? get categoryId; String? get condition; Resource? get cover; double get rating;@JsonKey(name: 'review_count') int get reviewCount; int get sold; String? get status; bool get favorited; ListingSeller? get seller; ListingLocation? get location;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'deleted_at') String? get deletedAt; double? get score;// Backward-compatibility legacy fields
 String? get thumbnail;@JsonKey(name: 'original_price') int? get originalPrice;@JsonKey(name: 'discount_rate') double? get discountRate;@JsonKey(name: 'sold_count') int? get soldCount; List<String>? get tags;@JsonKey(name: 'vendor_id') String? get vendorId;@JsonKey(name: 'vendor_name') String? get vendorName;@JsonKey(name: 'is_negotiable') bool get isNegotiable;
/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TProductCardCopyWith<TProductCard> get copyWith => _$TProductCardCopyWithImpl<TProductCard>(this as TProductCard, _$identity);

  /// Serializes this TProductCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TProductCard&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.sold, sold) || other.sold == sold)&&(identical(other.status, status) || other.status == status)&&(identical(other.favorited, favorited) || other.favorited == favorited)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.location, location) || other.location == location)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.score, score) || other.score == score)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,price,priceMode,currency,categoryId,condition,cover,rating,reviewCount,sold,status,favorited,seller,location,createdAt,deletedAt,score,thumbnail,originalPrice,discountRate,soldCount,const DeepCollectionEquality().hash(tags),vendorId,vendorName,isNegotiable]);

@override
String toString() {
  return 'TProductCard(id: $id, name: $name, slug: $slug, price: $price, priceMode: $priceMode, currency: $currency, categoryId: $categoryId, condition: $condition, cover: $cover, rating: $rating, reviewCount: $reviewCount, sold: $sold, status: $status, favorited: $favorited, seller: $seller, location: $location, createdAt: $createdAt, deletedAt: $deletedAt, score: $score, thumbnail: $thumbnail, originalPrice: $originalPrice, discountRate: $discountRate, soldCount: $soldCount, tags: $tags, vendorId: $vendorId, vendorName: $vendorName, isNegotiable: $isNegotiable)';
}


}

/// @nodoc
abstract mixin class $TProductCardCopyWith<$Res>  {
  factory $TProductCardCopyWith(TProductCard value, $Res Function(TProductCard) _then) = _$TProductCardCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, int price,@JsonKey(name: 'price_mode') String? priceMode, String? currency,@JsonKey(name: 'category_id') String? categoryId, String? condition, Resource? cover, double rating,@JsonKey(name: 'review_count') int reviewCount, int sold, String? status, bool favorited, ListingSeller? seller, ListingLocation? location,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deleted_at') String? deletedAt, double? score, String? thumbnail,@JsonKey(name: 'original_price') int? originalPrice,@JsonKey(name: 'discount_rate') double? discountRate,@JsonKey(name: 'sold_count') int? soldCount, List<String>? tags,@JsonKey(name: 'vendor_id') String? vendorId,@JsonKey(name: 'vendor_name') String? vendorName,@JsonKey(name: 'is_negotiable') bool isNegotiable
});


$ListingSellerCopyWith<$Res>? get seller;

}
/// @nodoc
class _$TProductCardCopyWithImpl<$Res>
    implements $TProductCardCopyWith<$Res> {
  _$TProductCardCopyWithImpl(this._self, this._then);

  final TProductCard _self;
  final $Res Function(TProductCard) _then;

/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? price = null,Object? priceMode = freezed,Object? currency = freezed,Object? categoryId = freezed,Object? condition = freezed,Object? cover = freezed,Object? rating = null,Object? reviewCount = null,Object? sold = null,Object? status = freezed,Object? favorited = null,Object? seller = freezed,Object? location = freezed,Object? createdAt = freezed,Object? deletedAt = freezed,Object? score = freezed,Object? thumbnail = freezed,Object? originalPrice = freezed,Object? discountRate = freezed,Object? soldCount = freezed,Object? tags = freezed,Object? vendorId = freezed,Object? vendorName = freezed,Object? isNegotiable = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,priceMode: freezed == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as Resource?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,favorited: null == favorited ? _self.favorited : favorited // ignore: cast_nullable_to_non_nullable
as bool,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as ListingSeller?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ListingLocation?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,discountRate: freezed == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as double?,soldCount: freezed == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String?,vendorName: freezed == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String?,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingSellerCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $ListingSellerCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  int price, @JsonKey(name: 'price_mode')  String? priceMode,  String? currency, @JsonKey(name: 'category_id')  String? categoryId,  String? condition,  Resource? cover,  double rating, @JsonKey(name: 'review_count')  int reviewCount,  int sold,  String? status,  bool favorited,  ListingSeller? seller,  ListingLocation? location, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt,  double? score,  String? thumbnail, @JsonKey(name: 'original_price')  int? originalPrice, @JsonKey(name: 'discount_rate')  double? discountRate, @JsonKey(name: 'sold_count')  int? soldCount,  List<String>? tags, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'is_negotiable')  bool isNegotiable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TProductCard() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.price,_that.priceMode,_that.currency,_that.categoryId,_that.condition,_that.cover,_that.rating,_that.reviewCount,_that.sold,_that.status,_that.favorited,_that.seller,_that.location,_that.createdAt,_that.deletedAt,_that.score,_that.thumbnail,_that.originalPrice,_that.discountRate,_that.soldCount,_that.tags,_that.vendorId,_that.vendorName,_that.isNegotiable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  int price, @JsonKey(name: 'price_mode')  String? priceMode,  String? currency, @JsonKey(name: 'category_id')  String? categoryId,  String? condition,  Resource? cover,  double rating, @JsonKey(name: 'review_count')  int reviewCount,  int sold,  String? status,  bool favorited,  ListingSeller? seller,  ListingLocation? location, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt,  double? score,  String? thumbnail, @JsonKey(name: 'original_price')  int? originalPrice, @JsonKey(name: 'discount_rate')  double? discountRate, @JsonKey(name: 'sold_count')  int? soldCount,  List<String>? tags, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'is_negotiable')  bool isNegotiable)  $default,) {final _that = this;
switch (_that) {
case _TProductCard():
return $default(_that.id,_that.name,_that.slug,_that.price,_that.priceMode,_that.currency,_that.categoryId,_that.condition,_that.cover,_that.rating,_that.reviewCount,_that.sold,_that.status,_that.favorited,_that.seller,_that.location,_that.createdAt,_that.deletedAt,_that.score,_that.thumbnail,_that.originalPrice,_that.discountRate,_that.soldCount,_that.tags,_that.vendorId,_that.vendorName,_that.isNegotiable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  int price, @JsonKey(name: 'price_mode')  String? priceMode,  String? currency, @JsonKey(name: 'category_id')  String? categoryId,  String? condition,  Resource? cover,  double rating, @JsonKey(name: 'review_count')  int reviewCount,  int sold,  String? status,  bool favorited,  ListingSeller? seller,  ListingLocation? location, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt,  double? score,  String? thumbnail, @JsonKey(name: 'original_price')  int? originalPrice, @JsonKey(name: 'discount_rate')  double? discountRate, @JsonKey(name: 'sold_count')  int? soldCount,  List<String>? tags, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'is_negotiable')  bool isNegotiable)?  $default,) {final _that = this;
switch (_that) {
case _TProductCard() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.price,_that.priceMode,_that.currency,_that.categoryId,_that.condition,_that.cover,_that.rating,_that.reviewCount,_that.sold,_that.status,_that.favorited,_that.seller,_that.location,_that.createdAt,_that.deletedAt,_that.score,_that.thumbnail,_that.originalPrice,_that.discountRate,_that.soldCount,_that.tags,_that.vendorId,_that.vendorName,_that.isNegotiable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TProductCard extends TProductCard {
  const _TProductCard({required this.id, required this.name, this.slug = '', this.price = 0, @JsonKey(name: 'price_mode') this.priceMode, this.currency, @JsonKey(name: 'category_id') this.categoryId, this.condition, this.cover, this.rating = 0.0, @JsonKey(name: 'review_count') this.reviewCount = 0, this.sold = 0, this.status, this.favorited = false, this.seller, this.location, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'deleted_at') this.deletedAt, this.score, this.thumbnail, @JsonKey(name: 'original_price') this.originalPrice, @JsonKey(name: 'discount_rate') this.discountRate, @JsonKey(name: 'sold_count') this.soldCount, final  List<String>? tags, @JsonKey(name: 'vendor_id') this.vendorId, @JsonKey(name: 'vendor_name') this.vendorName, @JsonKey(name: 'is_negotiable') this.isNegotiable = false}): _tags = tags,super._();
  factory _TProductCard.fromJson(Map<String, dynamic> json) => _$TProductCardFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String slug;
@override@JsonKey() final  int price;
@override@JsonKey(name: 'price_mode') final  String? priceMode;
@override final  String? currency;
@override@JsonKey(name: 'category_id') final  String? categoryId;
@override final  String? condition;
@override final  Resource? cover;
@override@JsonKey() final  double rating;
@override@JsonKey(name: 'review_count') final  int reviewCount;
@override@JsonKey() final  int sold;
@override final  String? status;
@override@JsonKey() final  bool favorited;
@override final  ListingSeller? seller;
@override final  ListingLocation? location;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override final  double? score;
// Backward-compatibility legacy fields
@override final  String? thumbnail;
@override@JsonKey(name: 'original_price') final  int? originalPrice;
@override@JsonKey(name: 'discount_rate') final  double? discountRate;
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
@override@JsonKey(name: 'is_negotiable') final  bool isNegotiable;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TProductCard&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.sold, sold) || other.sold == sold)&&(identical(other.status, status) || other.status == status)&&(identical(other.favorited, favorited) || other.favorited == favorited)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.location, location) || other.location == location)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.score, score) || other.score == score)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,price,priceMode,currency,categoryId,condition,cover,rating,reviewCount,sold,status,favorited,seller,location,createdAt,deletedAt,score,thumbnail,originalPrice,discountRate,soldCount,const DeepCollectionEquality().hash(_tags),vendorId,vendorName,isNegotiable]);

@override
String toString() {
  return 'TProductCard(id: $id, name: $name, slug: $slug, price: $price, priceMode: $priceMode, currency: $currency, categoryId: $categoryId, condition: $condition, cover: $cover, rating: $rating, reviewCount: $reviewCount, sold: $sold, status: $status, favorited: $favorited, seller: $seller, location: $location, createdAt: $createdAt, deletedAt: $deletedAt, score: $score, thumbnail: $thumbnail, originalPrice: $originalPrice, discountRate: $discountRate, soldCount: $soldCount, tags: $tags, vendorId: $vendorId, vendorName: $vendorName, isNegotiable: $isNegotiable)';
}


}

/// @nodoc
abstract mixin class _$TProductCardCopyWith<$Res> implements $TProductCardCopyWith<$Res> {
  factory _$TProductCardCopyWith(_TProductCard value, $Res Function(_TProductCard) _then) = __$TProductCardCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, int price,@JsonKey(name: 'price_mode') String? priceMode, String? currency,@JsonKey(name: 'category_id') String? categoryId, String? condition, Resource? cover, double rating,@JsonKey(name: 'review_count') int reviewCount, int sold, String? status, bool favorited, ListingSeller? seller, ListingLocation? location,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deleted_at') String? deletedAt, double? score, String? thumbnail,@JsonKey(name: 'original_price') int? originalPrice,@JsonKey(name: 'discount_rate') double? discountRate,@JsonKey(name: 'sold_count') int? soldCount, List<String>? tags,@JsonKey(name: 'vendor_id') String? vendorId,@JsonKey(name: 'vendor_name') String? vendorName,@JsonKey(name: 'is_negotiable') bool isNegotiable
});


@override $ListingSellerCopyWith<$Res>? get seller;

}
/// @nodoc
class __$TProductCardCopyWithImpl<$Res>
    implements _$TProductCardCopyWith<$Res> {
  __$TProductCardCopyWithImpl(this._self, this._then);

  final _TProductCard _self;
  final $Res Function(_TProductCard) _then;

/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? price = null,Object? priceMode = freezed,Object? currency = freezed,Object? categoryId = freezed,Object? condition = freezed,Object? cover = freezed,Object? rating = null,Object? reviewCount = null,Object? sold = null,Object? status = freezed,Object? favorited = null,Object? seller = freezed,Object? location = freezed,Object? createdAt = freezed,Object? deletedAt = freezed,Object? score = freezed,Object? thumbnail = freezed,Object? originalPrice = freezed,Object? discountRate = freezed,Object? soldCount = freezed,Object? tags = freezed,Object? vendorId = freezed,Object? vendorName = freezed,Object? isNegotiable = null,}) {
  return _then(_TProductCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,priceMode: freezed == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as Resource?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,favorited: null == favorited ? _self.favorited : favorited // ignore: cast_nullable_to_non_nullable
as bool,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as ListingSeller?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ListingLocation?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,discountRate: freezed == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as double?,soldCount: freezed == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String?,vendorName: freezed == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String?,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingSellerCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $ListingSellerCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
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
mixin _$VariantStock {

 int get available; int get quantity; int get reserved; int get sold;
/// Create a copy of VariantStock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariantStockCopyWith<VariantStock> get copyWith => _$VariantStockCopyWithImpl<VariantStock>(this as VariantStock, _$identity);

  /// Serializes this VariantStock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariantStock&&(identical(other.available, available) || other.available == available)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.reserved, reserved) || other.reserved == reserved)&&(identical(other.sold, sold) || other.sold == sold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,available,quantity,reserved,sold);

@override
String toString() {
  return 'VariantStock(available: $available, quantity: $quantity, reserved: $reserved, sold: $sold)';
}


}

/// @nodoc
abstract mixin class $VariantStockCopyWith<$Res>  {
  factory $VariantStockCopyWith(VariantStock value, $Res Function(VariantStock) _then) = _$VariantStockCopyWithImpl;
@useResult
$Res call({
 int available, int quantity, int reserved, int sold
});




}
/// @nodoc
class _$VariantStockCopyWithImpl<$Res>
    implements $VariantStockCopyWith<$Res> {
  _$VariantStockCopyWithImpl(this._self, this._then);

  final VariantStock _self;
  final $Res Function(VariantStock) _then;

/// Create a copy of VariantStock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? available = null,Object? quantity = null,Object? reserved = null,Object? sold = null,}) {
  return _then(_self.copyWith(
available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as int,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VariantStock].
extension VariantStockPatterns on VariantStock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VariantStock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VariantStock() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VariantStock value)  $default,){
final _that = this;
switch (_that) {
case _VariantStock():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VariantStock value)?  $default,){
final _that = this;
switch (_that) {
case _VariantStock() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int available,  int quantity,  int reserved,  int sold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VariantStock() when $default != null:
return $default(_that.available,_that.quantity,_that.reserved,_that.sold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int available,  int quantity,  int reserved,  int sold)  $default,) {final _that = this;
switch (_that) {
case _VariantStock():
return $default(_that.available,_that.quantity,_that.reserved,_that.sold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int available,  int quantity,  int reserved,  int sold)?  $default,) {final _that = this;
switch (_that) {
case _VariantStock() when $default != null:
return $default(_that.available,_that.quantity,_that.reserved,_that.sold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VariantStock implements VariantStock {
  const _VariantStock({this.available = 0, this.quantity = 0, this.reserved = 0, this.sold = 0});
  factory _VariantStock.fromJson(Map<String, dynamic> json) => _$VariantStockFromJson(json);

@override@JsonKey() final  int available;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  int reserved;
@override@JsonKey() final  int sold;

/// Create a copy of VariantStock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariantStockCopyWith<_VariantStock> get copyWith => __$VariantStockCopyWithImpl<_VariantStock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariantStockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariantStock&&(identical(other.available, available) || other.available == available)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.reserved, reserved) || other.reserved == reserved)&&(identical(other.sold, sold) || other.sold == sold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,available,quantity,reserved,sold);

@override
String toString() {
  return 'VariantStock(available: $available, quantity: $quantity, reserved: $reserved, sold: $sold)';
}


}

/// @nodoc
abstract mixin class _$VariantStockCopyWith<$Res> implements $VariantStockCopyWith<$Res> {
  factory _$VariantStockCopyWith(_VariantStock value, $Res Function(_VariantStock) _then) = __$VariantStockCopyWithImpl;
@override @useResult
$Res call({
 int available, int quantity, int reserved, int sold
});




}
/// @nodoc
class __$VariantStockCopyWithImpl<$Res>
    implements _$VariantStockCopyWith<$Res> {
  __$VariantStockCopyWithImpl(this._self, this._then);

  final _VariantStock _self;
  final $Res Function(_VariantStock) _then;

/// Create a copy of VariantStock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? available = null,Object? quantity = null,Object? reserved = null,Object? sold = null,}) {
  return _then(_VariantStock(
available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as int,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ProductSku {

 String get id;@JsonKey(name: 'spu_id') String get spuId;@JsonKey(name: 'name') String get name; int get price;@JsonKey(name: 'original_price') int? get originalPrice; int get stock; VariantStock? get stockInfo;@JsonKey(name: 'is_featured') bool get isFeatured;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'resources') List<Resource>? get images; List<SkuAttribute>? get attributes;
/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSkuCopyWith<ProductSku> get copyWith => _$ProductSkuCopyWithImpl<ProductSku>(this as ProductSku, _$identity);

  /// Serializes this ProductSku to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSku&&(identical(other.id, id) || other.id == id)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.stockInfo, stockInfo) || other.stockInfo == stockInfo)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,spuId,name,price,originalPrice,stock,stockInfo,isFeatured,createdAt,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'ProductSku(id: $id, spuId: $spuId, name: $name, price: $price, originalPrice: $originalPrice, stock: $stock, stockInfo: $stockInfo, isFeatured: $isFeatured, createdAt: $createdAt, images: $images, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $ProductSkuCopyWith<$Res>  {
  factory $ProductSkuCopyWith(ProductSku value, $Res Function(ProductSku) _then) = _$ProductSkuCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'spu_id') String spuId,@JsonKey(name: 'name') String name, int price,@JsonKey(name: 'original_price') int? originalPrice, int stock, VariantStock? stockInfo,@JsonKey(name: 'is_featured') bool isFeatured,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'resources') List<Resource>? images, List<SkuAttribute>? attributes
});


$VariantStockCopyWith<$Res>? get stockInfo;

}
/// @nodoc
class _$ProductSkuCopyWithImpl<$Res>
    implements $ProductSkuCopyWith<$Res> {
  _$ProductSkuCopyWithImpl(this._self, this._then);

  final ProductSku _self;
  final $Res Function(ProductSku) _then;

/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? spuId = null,Object? name = null,Object? price = null,Object? originalPrice = freezed,Object? stock = null,Object? stockInfo = freezed,Object? isFeatured = null,Object? createdAt = freezed,Object? images = freezed,Object? attributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,stockInfo: freezed == stockInfo ? _self.stockInfo : stockInfo // ignore: cast_nullable_to_non_nullable
as VariantStock?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<Resource>?,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,
  ));
}
/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VariantStockCopyWith<$Res>? get stockInfo {
    if (_self.stockInfo == null) {
    return null;
  }

  return $VariantStockCopyWith<$Res>(_self.stockInfo!, (value) {
    return _then(_self.copyWith(stockInfo: value));
  });
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'name')  String name,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  int stock,  VariantStock? stockInfo, @JsonKey(name: 'is_featured')  bool isFeatured, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'resources')  List<Resource>? images,  List<SkuAttribute>? attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSku() when $default != null:
return $default(_that.id,_that.spuId,_that.name,_that.price,_that.originalPrice,_that.stock,_that.stockInfo,_that.isFeatured,_that.createdAt,_that.images,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'name')  String name,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  int stock,  VariantStock? stockInfo, @JsonKey(name: 'is_featured')  bool isFeatured, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'resources')  List<Resource>? images,  List<SkuAttribute>? attributes)  $default,) {final _that = this;
switch (_that) {
case _ProductSku():
return $default(_that.id,_that.spuId,_that.name,_that.price,_that.originalPrice,_that.stock,_that.stockInfo,_that.isFeatured,_that.createdAt,_that.images,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'name')  String name,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  int stock,  VariantStock? stockInfo, @JsonKey(name: 'is_featured')  bool isFeatured, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'resources')  List<Resource>? images,  List<SkuAttribute>? attributes)?  $default,) {final _that = this;
switch (_that) {
case _ProductSku() when $default != null:
return $default(_that.id,_that.spuId,_that.name,_that.price,_that.originalPrice,_that.stock,_that.stockInfo,_that.isFeatured,_that.createdAt,_that.images,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSku extends ProductSku {
  const _ProductSku({required this.id, @JsonKey(name: 'spu_id') this.spuId = '', @JsonKey(name: 'name') this.name = '', this.price = 0, @JsonKey(name: 'original_price') this.originalPrice, this.stock = 0, this.stockInfo, @JsonKey(name: 'is_featured') this.isFeatured = false, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'resources') final  List<Resource>? images, final  List<SkuAttribute>? attributes}): _images = images,_attributes = attributes,super._();
  factory _ProductSku.fromJson(Map<String, dynamic> json) => _$ProductSkuFromJson(json);

@override final  String id;
@override@JsonKey(name: 'spu_id') final  String spuId;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey() final  int price;
@override@JsonKey(name: 'original_price') final  int? originalPrice;
@override@JsonKey() final  int stock;
@override final  VariantStock? stockInfo;
@override@JsonKey(name: 'is_featured') final  bool isFeatured;
@override@JsonKey(name: 'created_at') final  String? createdAt;
 final  List<Resource>? _images;
@override@JsonKey(name: 'resources') List<Resource>? get images {
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSku&&(identical(other.id, id) || other.id == id)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.stockInfo, stockInfo) || other.stockInfo == stockInfo)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,spuId,name,price,originalPrice,stock,stockInfo,isFeatured,createdAt,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'ProductSku(id: $id, spuId: $spuId, name: $name, price: $price, originalPrice: $originalPrice, stock: $stock, stockInfo: $stockInfo, isFeatured: $isFeatured, createdAt: $createdAt, images: $images, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$ProductSkuCopyWith<$Res> implements $ProductSkuCopyWith<$Res> {
  factory _$ProductSkuCopyWith(_ProductSku value, $Res Function(_ProductSku) _then) = __$ProductSkuCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'spu_id') String spuId,@JsonKey(name: 'name') String name, int price,@JsonKey(name: 'original_price') int? originalPrice, int stock, VariantStock? stockInfo,@JsonKey(name: 'is_featured') bool isFeatured,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'resources') List<Resource>? images, List<SkuAttribute>? attributes
});


@override $VariantStockCopyWith<$Res>? get stockInfo;

}
/// @nodoc
class __$ProductSkuCopyWithImpl<$Res>
    implements _$ProductSkuCopyWith<$Res> {
  __$ProductSkuCopyWithImpl(this._self, this._then);

  final _ProductSku _self;
  final $Res Function(_ProductSku) _then;

/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? spuId = null,Object? name = null,Object? price = null,Object? originalPrice = freezed,Object? stock = null,Object? stockInfo = freezed,Object? isFeatured = null,Object? createdAt = freezed,Object? images = freezed,Object? attributes = freezed,}) {
  return _then(_ProductSku(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,stockInfo: freezed == stockInfo ? _self.stockInfo : stockInfo // ignore: cast_nullable_to_non_nullable
as VariantStock?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Resource>?,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,
  ));
}

/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VariantStockCopyWith<$Res>? get stockInfo {
    if (_self.stockInfo == null) {
    return null;
  }

  return $VariantStockCopyWith<$Res>(_self.stockInfo!, (value) {
    return _then(_self.copyWith(stockInfo: value));
  });
}
}


/// @nodoc
mixin _$TProductDetail {

 String get id; String get name; String get slug; String? get description; int get price;@JsonKey(name: 'price_mode') String? get priceMode; String? get currency; String? get condition; String? get status;@JsonKey(name: 'original_price') int? get originalPrice; double get rating;@JsonKey(name: 'review_count') int get reviewCount;@JsonKey(name: 'favorite_count') int get favoriteCount; bool get favorited; int get sold;@JsonKey(name: 'sold_count') int? get soldCount; Category? get category; ListingSeller? get seller; ListingLocation? get location;@JsonKey(name: 'resources') List<Resource>? get images; List<ProductSpecification>? get specifications; List<ProductSku>? get skus; List<ProductSku>? get variants; List<String>? get tags;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'deleted_at') String? get deletedAt;@JsonKey(name: 'vendor_id') String? get vendorId;@JsonKey(name: 'vendor_name') String? get vendorName;@JsonKey(name: 'vendor_avatar') String? get vendorAvatar;@JsonKey(name: 'category_id') String? get categoryId;@JsonKey(name: 'is_negotiable') bool get isNegotiable;
/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TProductDetailCopyWith<TProductDetail> get copyWith => _$TProductDetailCopyWithImpl<TProductDetail>(this as TProductDetail, _$identity);

  /// Serializes this TProductDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TProductDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.status, status) || other.status == status)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.favoriteCount, favoriteCount) || other.favoriteCount == favoriteCount)&&(identical(other.favorited, favorited) || other.favorited == favorited)&&(identical(other.sold, sold) || other.sold == sold)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&(identical(other.category, category) || other.category == category)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.specifications, specifications)&&const DeepCollectionEquality().equals(other.skus, skus)&&const DeepCollectionEquality().equals(other.variants, variants)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.vendorAvatar, vendorAvatar) || other.vendorAvatar == vendorAvatar)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,description,price,priceMode,currency,condition,status,originalPrice,rating,reviewCount,favoriteCount,favorited,sold,soldCount,category,seller,location,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(specifications),const DeepCollectionEquality().hash(skus),const DeepCollectionEquality().hash(variants),const DeepCollectionEquality().hash(tags),createdAt,deletedAt,vendorId,vendorName,vendorAvatar,categoryId,isNegotiable]);

@override
String toString() {
  return 'TProductDetail(id: $id, name: $name, slug: $slug, description: $description, price: $price, priceMode: $priceMode, currency: $currency, condition: $condition, status: $status, originalPrice: $originalPrice, rating: $rating, reviewCount: $reviewCount, favoriteCount: $favoriteCount, favorited: $favorited, sold: $sold, soldCount: $soldCount, category: $category, seller: $seller, location: $location, images: $images, specifications: $specifications, skus: $skus, variants: $variants, tags: $tags, createdAt: $createdAt, deletedAt: $deletedAt, vendorId: $vendorId, vendorName: $vendorName, vendorAvatar: $vendorAvatar, categoryId: $categoryId, isNegotiable: $isNegotiable)';
}


}

/// @nodoc
abstract mixin class $TProductDetailCopyWith<$Res>  {
  factory $TProductDetailCopyWith(TProductDetail value, $Res Function(TProductDetail) _then) = _$TProductDetailCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? description, int price,@JsonKey(name: 'price_mode') String? priceMode, String? currency, String? condition, String? status,@JsonKey(name: 'original_price') int? originalPrice, double rating,@JsonKey(name: 'review_count') int reviewCount,@JsonKey(name: 'favorite_count') int favoriteCount, bool favorited, int sold,@JsonKey(name: 'sold_count') int? soldCount, Category? category, ListingSeller? seller, ListingLocation? location,@JsonKey(name: 'resources') List<Resource>? images, List<ProductSpecification>? specifications, List<ProductSku>? skus, List<ProductSku>? variants, List<String>? tags,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'vendor_id') String? vendorId,@JsonKey(name: 'vendor_name') String? vendorName,@JsonKey(name: 'vendor_avatar') String? vendorAvatar,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'is_negotiable') bool isNegotiable
});


$ListingSellerCopyWith<$Res>? get seller;

}
/// @nodoc
class _$TProductDetailCopyWithImpl<$Res>
    implements $TProductDetailCopyWith<$Res> {
  _$TProductDetailCopyWithImpl(this._self, this._then);

  final TProductDetail _self;
  final $Res Function(TProductDetail) _then;

/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? price = null,Object? priceMode = freezed,Object? currency = freezed,Object? condition = freezed,Object? status = freezed,Object? originalPrice = freezed,Object? rating = null,Object? reviewCount = null,Object? favoriteCount = null,Object? favorited = null,Object? sold = null,Object? soldCount = freezed,Object? category = freezed,Object? seller = freezed,Object? location = freezed,Object? images = freezed,Object? specifications = freezed,Object? skus = freezed,Object? variants = freezed,Object? tags = freezed,Object? createdAt = freezed,Object? deletedAt = freezed,Object? vendorId = freezed,Object? vendorName = freezed,Object? vendorAvatar = freezed,Object? categoryId = freezed,Object? isNegotiable = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,priceMode: freezed == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,favoriteCount: null == favoriteCount ? _self.favoriteCount : favoriteCount // ignore: cast_nullable_to_non_nullable
as int,favorited: null == favorited ? _self.favorited : favorited // ignore: cast_nullable_to_non_nullable
as bool,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,soldCount: freezed == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as ListingSeller?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ListingLocation?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<Resource>?,specifications: freezed == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as List<ProductSpecification>?,skus: freezed == skus ? _self.skus : skus // ignore: cast_nullable_to_non_nullable
as List<ProductSku>?,variants: freezed == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<ProductSku>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String?,vendorName: freezed == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String?,vendorAvatar: freezed == vendorAvatar ? _self.vendorAvatar : vendorAvatar // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingSellerCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $ListingSellerCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  int price, @JsonKey(name: 'price_mode')  String? priceMode,  String? currency,  String? condition,  String? status, @JsonKey(name: 'original_price')  int? originalPrice,  double rating, @JsonKey(name: 'review_count')  int reviewCount, @JsonKey(name: 'favorite_count')  int favoriteCount,  bool favorited,  int sold, @JsonKey(name: 'sold_count')  int? soldCount,  Category? category,  ListingSeller? seller,  ListingLocation? location, @JsonKey(name: 'resources')  List<Resource>? images,  List<ProductSpecification>? specifications,  List<ProductSku>? skus,  List<ProductSku>? variants,  List<String>? tags, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'vendor_avatar')  String? vendorAvatar, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'is_negotiable')  bool isNegotiable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TProductDetail() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.price,_that.priceMode,_that.currency,_that.condition,_that.status,_that.originalPrice,_that.rating,_that.reviewCount,_that.favoriteCount,_that.favorited,_that.sold,_that.soldCount,_that.category,_that.seller,_that.location,_that.images,_that.specifications,_that.skus,_that.variants,_that.tags,_that.createdAt,_that.deletedAt,_that.vendorId,_that.vendorName,_that.vendorAvatar,_that.categoryId,_that.isNegotiable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  int price, @JsonKey(name: 'price_mode')  String? priceMode,  String? currency,  String? condition,  String? status, @JsonKey(name: 'original_price')  int? originalPrice,  double rating, @JsonKey(name: 'review_count')  int reviewCount, @JsonKey(name: 'favorite_count')  int favoriteCount,  bool favorited,  int sold, @JsonKey(name: 'sold_count')  int? soldCount,  Category? category,  ListingSeller? seller,  ListingLocation? location, @JsonKey(name: 'resources')  List<Resource>? images,  List<ProductSpecification>? specifications,  List<ProductSku>? skus,  List<ProductSku>? variants,  List<String>? tags, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'vendor_avatar')  String? vendorAvatar, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'is_negotiable')  bool isNegotiable)  $default,) {final _that = this;
switch (_that) {
case _TProductDetail():
return $default(_that.id,_that.name,_that.slug,_that.description,_that.price,_that.priceMode,_that.currency,_that.condition,_that.status,_that.originalPrice,_that.rating,_that.reviewCount,_that.favoriteCount,_that.favorited,_that.sold,_that.soldCount,_that.category,_that.seller,_that.location,_that.images,_that.specifications,_that.skus,_that.variants,_that.tags,_that.createdAt,_that.deletedAt,_that.vendorId,_that.vendorName,_that.vendorAvatar,_that.categoryId,_that.isNegotiable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String? description,  int price, @JsonKey(name: 'price_mode')  String? priceMode,  String? currency,  String? condition,  String? status, @JsonKey(name: 'original_price')  int? originalPrice,  double rating, @JsonKey(name: 'review_count')  int reviewCount, @JsonKey(name: 'favorite_count')  int favoriteCount,  bool favorited,  int sold, @JsonKey(name: 'sold_count')  int? soldCount,  Category? category,  ListingSeller? seller,  ListingLocation? location, @JsonKey(name: 'resources')  List<Resource>? images,  List<ProductSpecification>? specifications,  List<ProductSku>? skus,  List<ProductSku>? variants,  List<String>? tags, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'vendor_avatar')  String? vendorAvatar, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'is_negotiable')  bool isNegotiable)?  $default,) {final _that = this;
switch (_that) {
case _TProductDetail() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.price,_that.priceMode,_that.currency,_that.condition,_that.status,_that.originalPrice,_that.rating,_that.reviewCount,_that.favoriteCount,_that.favorited,_that.sold,_that.soldCount,_that.category,_that.seller,_that.location,_that.images,_that.specifications,_that.skus,_that.variants,_that.tags,_that.createdAt,_that.deletedAt,_that.vendorId,_that.vendorName,_that.vendorAvatar,_that.categoryId,_that.isNegotiable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TProductDetail extends TProductDetail {
  const _TProductDetail({required this.id, required this.name, this.slug = '', this.description, this.price = 0, @JsonKey(name: 'price_mode') this.priceMode, this.currency, this.condition, this.status, @JsonKey(name: 'original_price') this.originalPrice, this.rating = 0.0, @JsonKey(name: 'review_count') this.reviewCount = 0, @JsonKey(name: 'favorite_count') this.favoriteCount = 0, this.favorited = false, this.sold = 0, @JsonKey(name: 'sold_count') this.soldCount, this.category, this.seller, this.location, @JsonKey(name: 'resources') final  List<Resource>? images, final  List<ProductSpecification>? specifications, final  List<ProductSku>? skus, final  List<ProductSku>? variants, final  List<String>? tags, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'vendor_id') this.vendorId, @JsonKey(name: 'vendor_name') this.vendorName, @JsonKey(name: 'vendor_avatar') this.vendorAvatar, @JsonKey(name: 'category_id') this.categoryId, @JsonKey(name: 'is_negotiable') this.isNegotiable = false}): _images = images,_specifications = specifications,_skus = skus,_variants = variants,_tags = tags,super._();
  factory _TProductDetail.fromJson(Map<String, dynamic> json) => _$TProductDetailFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String slug;
@override final  String? description;
@override@JsonKey() final  int price;
@override@JsonKey(name: 'price_mode') final  String? priceMode;
@override final  String? currency;
@override final  String? condition;
@override final  String? status;
@override@JsonKey(name: 'original_price') final  int? originalPrice;
@override@JsonKey() final  double rating;
@override@JsonKey(name: 'review_count') final  int reviewCount;
@override@JsonKey(name: 'favorite_count') final  int favoriteCount;
@override@JsonKey() final  bool favorited;
@override@JsonKey() final  int sold;
@override@JsonKey(name: 'sold_count') final  int? soldCount;
@override final  Category? category;
@override final  ListingSeller? seller;
@override final  ListingLocation? location;
 final  List<Resource>? _images;
@override@JsonKey(name: 'resources') List<Resource>? get images {
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

 final  List<ProductSku>? _variants;
@override List<ProductSku>? get variants {
  final value = _variants;
  if (value == null) return null;
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override@JsonKey(name: 'vendor_id') final  String? vendorId;
@override@JsonKey(name: 'vendor_name') final  String? vendorName;
@override@JsonKey(name: 'vendor_avatar') final  String? vendorAvatar;
@override@JsonKey(name: 'category_id') final  String? categoryId;
@override@JsonKey(name: 'is_negotiable') final  bool isNegotiable;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TProductDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.status, status) || other.status == status)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.favoriteCount, favoriteCount) || other.favoriteCount == favoriteCount)&&(identical(other.favorited, favorited) || other.favorited == favorited)&&(identical(other.sold, sold) || other.sold == sold)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&(identical(other.category, category) || other.category == category)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._specifications, _specifications)&&const DeepCollectionEquality().equals(other._skus, _skus)&&const DeepCollectionEquality().equals(other._variants, _variants)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.vendorAvatar, vendorAvatar) || other.vendorAvatar == vendorAvatar)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,description,price,priceMode,currency,condition,status,originalPrice,rating,reviewCount,favoriteCount,favorited,sold,soldCount,category,seller,location,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_specifications),const DeepCollectionEquality().hash(_skus),const DeepCollectionEquality().hash(_variants),const DeepCollectionEquality().hash(_tags),createdAt,deletedAt,vendorId,vendorName,vendorAvatar,categoryId,isNegotiable]);

@override
String toString() {
  return 'TProductDetail(id: $id, name: $name, slug: $slug, description: $description, price: $price, priceMode: $priceMode, currency: $currency, condition: $condition, status: $status, originalPrice: $originalPrice, rating: $rating, reviewCount: $reviewCount, favoriteCount: $favoriteCount, favorited: $favorited, sold: $sold, soldCount: $soldCount, category: $category, seller: $seller, location: $location, images: $images, specifications: $specifications, skus: $skus, variants: $variants, tags: $tags, createdAt: $createdAt, deletedAt: $deletedAt, vendorId: $vendorId, vendorName: $vendorName, vendorAvatar: $vendorAvatar, categoryId: $categoryId, isNegotiable: $isNegotiable)';
}


}

/// @nodoc
abstract mixin class _$TProductDetailCopyWith<$Res> implements $TProductDetailCopyWith<$Res> {
  factory _$TProductDetailCopyWith(_TProductDetail value, $Res Function(_TProductDetail) _then) = __$TProductDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? description, int price,@JsonKey(name: 'price_mode') String? priceMode, String? currency, String? condition, String? status,@JsonKey(name: 'original_price') int? originalPrice, double rating,@JsonKey(name: 'review_count') int reviewCount,@JsonKey(name: 'favorite_count') int favoriteCount, bool favorited, int sold,@JsonKey(name: 'sold_count') int? soldCount, Category? category, ListingSeller? seller, ListingLocation? location,@JsonKey(name: 'resources') List<Resource>? images, List<ProductSpecification>? specifications, List<ProductSku>? skus, List<ProductSku>? variants, List<String>? tags,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'vendor_id') String? vendorId,@JsonKey(name: 'vendor_name') String? vendorName,@JsonKey(name: 'vendor_avatar') String? vendorAvatar,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'is_negotiable') bool isNegotiable
});


@override $ListingSellerCopyWith<$Res>? get seller;

}
/// @nodoc
class __$TProductDetailCopyWithImpl<$Res>
    implements _$TProductDetailCopyWith<$Res> {
  __$TProductDetailCopyWithImpl(this._self, this._then);

  final _TProductDetail _self;
  final $Res Function(_TProductDetail) _then;

/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? price = null,Object? priceMode = freezed,Object? currency = freezed,Object? condition = freezed,Object? status = freezed,Object? originalPrice = freezed,Object? rating = null,Object? reviewCount = null,Object? favoriteCount = null,Object? favorited = null,Object? sold = null,Object? soldCount = freezed,Object? category = freezed,Object? seller = freezed,Object? location = freezed,Object? images = freezed,Object? specifications = freezed,Object? skus = freezed,Object? variants = freezed,Object? tags = freezed,Object? createdAt = freezed,Object? deletedAt = freezed,Object? vendorId = freezed,Object? vendorName = freezed,Object? vendorAvatar = freezed,Object? categoryId = freezed,Object? isNegotiable = null,}) {
  return _then(_TProductDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,priceMode: freezed == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,favoriteCount: null == favoriteCount ? _self.favoriteCount : favoriteCount // ignore: cast_nullable_to_non_nullable
as int,favorited: null == favorited ? _self.favorited : favorited // ignore: cast_nullable_to_non_nullable
as bool,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,soldCount: freezed == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as ListingSeller?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as ListingLocation?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<Resource>?,specifications: freezed == specifications ? _self._specifications : specifications // ignore: cast_nullable_to_non_nullable
as List<ProductSpecification>?,skus: freezed == skus ? _self._skus : skus // ignore: cast_nullable_to_non_nullable
as List<ProductSku>?,variants: freezed == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<ProductSku>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String?,vendorName: freezed == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String?,vendorAvatar: freezed == vendorAvatar ? _self.vendorAvatar : vendorAvatar // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingSellerCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $ListingSellerCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}

// dart format on
