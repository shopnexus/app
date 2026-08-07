// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
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
  return _then(RecentListing(
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

// dart format on
