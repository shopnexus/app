// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PackageDetails {

@JsonKey(name: 'weight_grams') int get weightGrams;@JsonKey(name: 'length_cm') int get lengthCm;@JsonKey(name: 'width_cm') int get widthCm;@JsonKey(name: 'height_cm') int get heightCm;
/// Create a copy of PackageDetails
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PackageDetailsCopyWith<PackageDetails> get copyWith => _$PackageDetailsCopyWithImpl<PackageDetails>(this as PackageDetails, _$identity);

  /// Serializes this PackageDetails to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PackageDetails&&(identical(other.weightGrams, weightGrams) || other.weightGrams == weightGrams)&&(identical(other.lengthCm, lengthCm) || other.lengthCm == lengthCm)&&(identical(other.widthCm, widthCm) || other.widthCm == widthCm)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weightGrams,lengthCm,widthCm,heightCm);

@override
String toString() {
  return 'PackageDetails(weightGrams: $weightGrams, lengthCm: $lengthCm, widthCm: $widthCm, heightCm: $heightCm)';
}


}

/// @nodoc
abstract mixin class $PackageDetailsCopyWith<$Res>  {
  factory $PackageDetailsCopyWith(PackageDetails value, $Res Function(PackageDetails) _then) = _$PackageDetailsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'weight_grams') int weightGrams,@JsonKey(name: 'length_cm') int lengthCm,@JsonKey(name: 'width_cm') int widthCm,@JsonKey(name: 'height_cm') int heightCm
});




}
/// @nodoc
class _$PackageDetailsCopyWithImpl<$Res>
    implements $PackageDetailsCopyWith<$Res> {
  _$PackageDetailsCopyWithImpl(this._self, this._then);

  final PackageDetails _self;
  final $Res Function(PackageDetails) _then;

/// Create a copy of PackageDetails
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? weightGrams = null,Object? lengthCm = null,Object? widthCm = null,Object? heightCm = null,}) {
  return _then(_self.copyWith(
weightGrams: null == weightGrams ? _self.weightGrams : weightGrams // ignore: cast_nullable_to_non_nullable
as int,lengthCm: null == lengthCm ? _self.lengthCm : lengthCm // ignore: cast_nullable_to_non_nullable
as int,widthCm: null == widthCm ? _self.widthCm : widthCm // ignore: cast_nullable_to_non_nullable
as int,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PackageDetails].
extension PackageDetailsPatterns on PackageDetails {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PackageDetails value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PackageDetails() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PackageDetails value)  $default,){
final _that = this;
switch (_that) {
case _PackageDetails():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PackageDetails value)?  $default,){
final _that = this;
switch (_that) {
case _PackageDetails() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'weight_grams')  int weightGrams, @JsonKey(name: 'length_cm')  int lengthCm, @JsonKey(name: 'width_cm')  int widthCm, @JsonKey(name: 'height_cm')  int heightCm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PackageDetails() when $default != null:
return $default(_that.weightGrams,_that.lengthCm,_that.widthCm,_that.heightCm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'weight_grams')  int weightGrams, @JsonKey(name: 'length_cm')  int lengthCm, @JsonKey(name: 'width_cm')  int widthCm, @JsonKey(name: 'height_cm')  int heightCm)  $default,) {final _that = this;
switch (_that) {
case _PackageDetails():
return $default(_that.weightGrams,_that.lengthCm,_that.widthCm,_that.heightCm);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'weight_grams')  int weightGrams, @JsonKey(name: 'length_cm')  int lengthCm, @JsonKey(name: 'width_cm')  int widthCm, @JsonKey(name: 'height_cm')  int heightCm)?  $default,) {final _that = this;
switch (_that) {
case _PackageDetails() when $default != null:
return $default(_that.weightGrams,_that.lengthCm,_that.widthCm,_that.heightCm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PackageDetails implements PackageDetails {
  const _PackageDetails({@JsonKey(name: 'weight_grams') required this.weightGrams, @JsonKey(name: 'length_cm') required this.lengthCm, @JsonKey(name: 'width_cm') required this.widthCm, @JsonKey(name: 'height_cm') required this.heightCm});
  factory _PackageDetails.fromJson(Map<String, dynamic> json) => _$PackageDetailsFromJson(json);

@override@JsonKey(name: 'weight_grams') final  int weightGrams;
@override@JsonKey(name: 'length_cm') final  int lengthCm;
@override@JsonKey(name: 'width_cm') final  int widthCm;
@override@JsonKey(name: 'height_cm') final  int heightCm;

/// Create a copy of PackageDetails
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PackageDetailsCopyWith<_PackageDetails> get copyWith => __$PackageDetailsCopyWithImpl<_PackageDetails>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PackageDetailsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PackageDetails&&(identical(other.weightGrams, weightGrams) || other.weightGrams == weightGrams)&&(identical(other.lengthCm, lengthCm) || other.lengthCm == lengthCm)&&(identical(other.widthCm, widthCm) || other.widthCm == widthCm)&&(identical(other.heightCm, heightCm) || other.heightCm == heightCm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,weightGrams,lengthCm,widthCm,heightCm);

@override
String toString() {
  return 'PackageDetails(weightGrams: $weightGrams, lengthCm: $lengthCm, widthCm: $widthCm, heightCm: $heightCm)';
}


}

/// @nodoc
abstract mixin class _$PackageDetailsCopyWith<$Res> implements $PackageDetailsCopyWith<$Res> {
  factory _$PackageDetailsCopyWith(_PackageDetails value, $Res Function(_PackageDetails) _then) = __$PackageDetailsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'weight_grams') int weightGrams,@JsonKey(name: 'length_cm') int lengthCm,@JsonKey(name: 'width_cm') int widthCm,@JsonKey(name: 'height_cm') int heightCm
});




}
/// @nodoc
class __$PackageDetailsCopyWithImpl<$Res>
    implements _$PackageDetailsCopyWith<$Res> {
  __$PackageDetailsCopyWithImpl(this._self, this._then);

  final _PackageDetails _self;
  final $Res Function(_PackageDetails) _then;

/// Create a copy of PackageDetails
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? weightGrams = null,Object? lengthCm = null,Object? widthCm = null,Object? heightCm = null,}) {
  return _then(_PackageDetails(
weightGrams: null == weightGrams ? _self.weightGrams : weightGrams // ignore: cast_nullable_to_non_nullable
as int,lengthCm: null == lengthCm ? _self.lengthCm : lengthCm // ignore: cast_nullable_to_non_nullable
as int,widthCm: null == widthCm ? _self.widthCm : widthCm // ignore: cast_nullable_to_non_nullable
as int,heightCm: null == heightCm ? _self.heightCm : heightCm // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CartSku {

 String get id;@JsonKey(name: 'spu_id') String get spuId;@JsonKey(name: 'name') String get name; int get price; int get stock; List<SkuAttribute>? get attributes;@JsonKey(name: 'package_details') PackageDetails? get packageDetails;
/// Create a copy of CartSku
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartSkuCopyWith<CartSku> get copyWith => _$CartSkuCopyWithImpl<CartSku>(this as CartSku, _$identity);

  /// Serializes this CartSku to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartSku&&(identical(other.id, id) || other.id == id)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,spuId,name,price,stock,const DeepCollectionEquality().hash(attributes),packageDetails);

@override
String toString() {
  return 'CartSku(id: $id, spuId: $spuId, name: $name, price: $price, stock: $stock, attributes: $attributes, packageDetails: $packageDetails)';
}


}

/// @nodoc
abstract mixin class $CartSkuCopyWith<$Res>  {
  factory $CartSkuCopyWith(CartSku value, $Res Function(CartSku) _then) = _$CartSkuCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'spu_id') String spuId,@JsonKey(name: 'name') String name, int price, int stock, List<SkuAttribute>? attributes,@JsonKey(name: 'package_details') PackageDetails? packageDetails
});


$PackageDetailsCopyWith<$Res>? get packageDetails;

}
/// @nodoc
class _$CartSkuCopyWithImpl<$Res>
    implements $CartSkuCopyWith<$Res> {
  _$CartSkuCopyWithImpl(this._self, this._then);

  final CartSku _self;
  final $Res Function(CartSku) _then;

/// Create a copy of CartSku
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? spuId = null,Object? name = null,Object? price = null,Object? stock = null,Object? attributes = freezed,Object? packageDetails = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as PackageDetails?,
  ));
}
/// Create a copy of CartSku
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageDetailsCopyWith<$Res>? get packageDetails {
    if (_self.packageDetails == null) {
    return null;
  }

  return $PackageDetailsCopyWith<$Res>(_self.packageDetails!, (value) {
    return _then(_self.copyWith(packageDetails: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartSku].
extension CartSkuPatterns on CartSku {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartSku value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartSku() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartSku value)  $default,){
final _that = this;
switch (_that) {
case _CartSku():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartSku value)?  $default,){
final _that = this;
switch (_that) {
case _CartSku() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'name')  String name,  int price,  int stock,  List<SkuAttribute>? attributes, @JsonKey(name: 'package_details')  PackageDetails? packageDetails)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartSku() when $default != null:
return $default(_that.id,_that.spuId,_that.name,_that.price,_that.stock,_that.attributes,_that.packageDetails);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'name')  String name,  int price,  int stock,  List<SkuAttribute>? attributes, @JsonKey(name: 'package_details')  PackageDetails? packageDetails)  $default,) {final _that = this;
switch (_that) {
case _CartSku():
return $default(_that.id,_that.spuId,_that.name,_that.price,_that.stock,_that.attributes,_that.packageDetails);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'name')  String name,  int price,  int stock,  List<SkuAttribute>? attributes, @JsonKey(name: 'package_details')  PackageDetails? packageDetails)?  $default,) {final _that = this;
switch (_that) {
case _CartSku() when $default != null:
return $default(_that.id,_that.spuId,_that.name,_that.price,_that.stock,_that.attributes,_that.packageDetails);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartSku implements CartSku {
  const _CartSku({required this.id, @JsonKey(name: 'spu_id') required this.spuId, @JsonKey(name: 'name') this.name = '', required this.price, required this.stock, final  List<SkuAttribute>? attributes, @JsonKey(name: 'package_details') this.packageDetails}): _attributes = attributes;
  factory _CartSku.fromJson(Map<String, dynamic> json) => _$CartSkuFromJson(json);

@override final  String id;
@override@JsonKey(name: 'spu_id') final  String spuId;
@override@JsonKey(name: 'name') final  String name;
@override final  int price;
@override final  int stock;
 final  List<SkuAttribute>? _attributes;
@override List<SkuAttribute>? get attributes {
  final value = _attributes;
  if (value == null) return null;
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'package_details') final  PackageDetails? packageDetails;

/// Create a copy of CartSku
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartSkuCopyWith<_CartSku> get copyWith => __$CartSkuCopyWithImpl<_CartSku>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartSkuToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartSku&&(identical(other.id, id) || other.id == id)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.stock, stock) || other.stock == stock)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&(identical(other.packageDetails, packageDetails) || other.packageDetails == packageDetails));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,spuId,name,price,stock,const DeepCollectionEquality().hash(_attributes),packageDetails);

@override
String toString() {
  return 'CartSku(id: $id, spuId: $spuId, name: $name, price: $price, stock: $stock, attributes: $attributes, packageDetails: $packageDetails)';
}


}

/// @nodoc
abstract mixin class _$CartSkuCopyWith<$Res> implements $CartSkuCopyWith<$Res> {
  factory _$CartSkuCopyWith(_CartSku value, $Res Function(_CartSku) _then) = __$CartSkuCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'spu_id') String spuId,@JsonKey(name: 'name') String name, int price, int stock, List<SkuAttribute>? attributes,@JsonKey(name: 'package_details') PackageDetails? packageDetails
});


@override $PackageDetailsCopyWith<$Res>? get packageDetails;

}
/// @nodoc
class __$CartSkuCopyWithImpl<$Res>
    implements _$CartSkuCopyWith<$Res> {
  __$CartSkuCopyWithImpl(this._self, this._then);

  final _CartSku _self;
  final $Res Function(_CartSku) _then;

/// Create a copy of CartSku
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? spuId = null,Object? name = null,Object? price = null,Object? stock = null,Object? attributes = freezed,Object? packageDetails = freezed,}) {
  return _then(_CartSku(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,packageDetails: freezed == packageDetails ? _self.packageDetails : packageDetails // ignore: cast_nullable_to_non_nullable
as PackageDetails?,
  ));
}

/// Create a copy of CartSku
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PackageDetailsCopyWith<$Res>? get packageDetails {
    if (_self.packageDetails == null) {
    return null;
  }

  return $PackageDetailsCopyWith<$Res>(_self.packageDetails!, (value) {
    return _then(_self.copyWith(packageDetails: value));
  });
}
}


/// @nodoc
mixin _$CartItem {

@JsonKey(name: 'spu_id') String get spuId; CartSku get sku; int get quantity; ResourceModel? get resource; String get currency;
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CartItemCopyWith<CartItem> get copyWith => _$CartItemCopyWithImpl<CartItem>(this as CartItem, _$identity);

  /// Serializes this CartItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CartItem&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.resource, resource) || other.resource == resource)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,spuId,sku,quantity,resource,currency);

@override
String toString() {
  return 'CartItem(spuId: $spuId, sku: $sku, quantity: $quantity, resource: $resource, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $CartItemCopyWith<$Res>  {
  factory $CartItemCopyWith(CartItem value, $Res Function(CartItem) _then) = _$CartItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'spu_id') String spuId, CartSku sku, int quantity, ResourceModel? resource, String currency
});


$CartSkuCopyWith<$Res> get sku;$ResourceModelCopyWith<$Res>? get resource;

}
/// @nodoc
class _$CartItemCopyWithImpl<$Res>
    implements $CartItemCopyWith<$Res> {
  _$CartItemCopyWithImpl(this._self, this._then);

  final CartItem _self;
  final $Res Function(CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? spuId = null,Object? sku = null,Object? quantity = null,Object? resource = freezed,Object? currency = null,}) {
  return _then(_self.copyWith(
spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as CartSku,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,resource: freezed == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as ResourceModel?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartSkuCopyWith<$Res> get sku {
  
  return $CartSkuCopyWith<$Res>(_self.sku, (value) {
    return _then(_self.copyWith(sku: value));
  });
}/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceModelCopyWith<$Res>? get resource {
    if (_self.resource == null) {
    return null;
  }

  return $ResourceModelCopyWith<$Res>(_self.resource!, (value) {
    return _then(_self.copyWith(resource: value));
  });
}
}


/// Adds pattern-matching-related methods to [CartItem].
extension CartItemPatterns on CartItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CartItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CartItem value)  $default,){
final _that = this;
switch (_that) {
case _CartItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CartItem value)?  $default,){
final _that = this;
switch (_that) {
case _CartItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'spu_id')  String spuId,  CartSku sku,  int quantity,  ResourceModel? resource,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.spuId,_that.sku,_that.quantity,_that.resource,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'spu_id')  String spuId,  CartSku sku,  int quantity,  ResourceModel? resource,  String currency)  $default,) {final _that = this;
switch (_that) {
case _CartItem():
return $default(_that.spuId,_that.sku,_that.quantity,_that.resource,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'spu_id')  String spuId,  CartSku sku,  int quantity,  ResourceModel? resource,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _CartItem() when $default != null:
return $default(_that.spuId,_that.sku,_that.quantity,_that.resource,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CartItem implements CartItem {
  const _CartItem({@JsonKey(name: 'spu_id') required this.spuId, required this.sku, required this.quantity, this.resource, required this.currency});
  factory _CartItem.fromJson(Map<String, dynamic> json) => _$CartItemFromJson(json);

@override@JsonKey(name: 'spu_id') final  String spuId;
@override final  CartSku sku;
@override final  int quantity;
@override final  ResourceModel? resource;
@override final  String currency;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CartItemCopyWith<_CartItem> get copyWith => __$CartItemCopyWithImpl<_CartItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CartItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CartItem&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.sku, sku) || other.sku == sku)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.resource, resource) || other.resource == resource)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,spuId,sku,quantity,resource,currency);

@override
String toString() {
  return 'CartItem(spuId: $spuId, sku: $sku, quantity: $quantity, resource: $resource, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$CartItemCopyWith<$Res> implements $CartItemCopyWith<$Res> {
  factory _$CartItemCopyWith(_CartItem value, $Res Function(_CartItem) _then) = __$CartItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'spu_id') String spuId, CartSku sku, int quantity, ResourceModel? resource, String currency
});


@override $CartSkuCopyWith<$Res> get sku;@override $ResourceModelCopyWith<$Res>? get resource;

}
/// @nodoc
class __$CartItemCopyWithImpl<$Res>
    implements _$CartItemCopyWith<$Res> {
  __$CartItemCopyWithImpl(this._self, this._then);

  final _CartItem _self;
  final $Res Function(_CartItem) _then;

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? spuId = null,Object? sku = null,Object? quantity = null,Object? resource = freezed,Object? currency = null,}) {
  return _then(_CartItem(
spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,sku: null == sku ? _self.sku : sku // ignore: cast_nullable_to_non_nullable
as CartSku,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,resource: freezed == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as ResourceModel?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CartSkuCopyWith<$Res> get sku {
  
  return $CartSkuCopyWith<$Res>(_self.sku, (value) {
    return _then(_self.copyWith(sku: value));
  });
}/// Create a copy of CartItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceModelCopyWith<$Res>? get resource {
    if (_self.resource == null) {
    return null;
  }

  return $ResourceModelCopyWith<$Res>(_self.resource!, (value) {
    return _then(_self.copyWith(resource: value));
  });
}
}


/// @nodoc
mixin _$UpdateCartRequest {

@JsonKey(name: 'sku_id') String get skuId; int? get quantity;@JsonKey(name: 'delta_quantity') int? get deltaQuantity;
/// Create a copy of UpdateCartRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateCartRequestCopyWith<UpdateCartRequest> get copyWith => _$UpdateCartRequestCopyWithImpl<UpdateCartRequest>(this as UpdateCartRequest, _$identity);

  /// Serializes this UpdateCartRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateCartRequest&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.deltaQuantity, deltaQuantity) || other.deltaQuantity == deltaQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,skuId,quantity,deltaQuantity);

@override
String toString() {
  return 'UpdateCartRequest(skuId: $skuId, quantity: $quantity, deltaQuantity: $deltaQuantity)';
}


}

/// @nodoc
abstract mixin class $UpdateCartRequestCopyWith<$Res>  {
  factory $UpdateCartRequestCopyWith(UpdateCartRequest value, $Res Function(UpdateCartRequest) _then) = _$UpdateCartRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sku_id') String skuId, int? quantity,@JsonKey(name: 'delta_quantity') int? deltaQuantity
});




}
/// @nodoc
class _$UpdateCartRequestCopyWithImpl<$Res>
    implements $UpdateCartRequestCopyWith<$Res> {
  _$UpdateCartRequestCopyWithImpl(this._self, this._then);

  final UpdateCartRequest _self;
  final $Res Function(UpdateCartRequest) _then;

/// Create a copy of UpdateCartRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? skuId = null,Object? quantity = freezed,Object? deltaQuantity = freezed,}) {
  return _then(_self.copyWith(
skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,deltaQuantity: freezed == deltaQuantity ? _self.deltaQuantity : deltaQuantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateCartRequest].
extension UpdateCartRequestPatterns on UpdateCartRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateCartRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateCartRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateCartRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateCartRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateCartRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateCartRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sku_id')  String skuId,  int? quantity, @JsonKey(name: 'delta_quantity')  int? deltaQuantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateCartRequest() when $default != null:
return $default(_that.skuId,_that.quantity,_that.deltaQuantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sku_id')  String skuId,  int? quantity, @JsonKey(name: 'delta_quantity')  int? deltaQuantity)  $default,) {final _that = this;
switch (_that) {
case _UpdateCartRequest():
return $default(_that.skuId,_that.quantity,_that.deltaQuantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sku_id')  String skuId,  int? quantity, @JsonKey(name: 'delta_quantity')  int? deltaQuantity)?  $default,) {final _that = this;
switch (_that) {
case _UpdateCartRequest() when $default != null:
return $default(_that.skuId,_that.quantity,_that.deltaQuantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateCartRequest implements UpdateCartRequest {
  const _UpdateCartRequest({@JsonKey(name: 'sku_id') required this.skuId, this.quantity, @JsonKey(name: 'delta_quantity') this.deltaQuantity});
  factory _UpdateCartRequest.fromJson(Map<String, dynamic> json) => _$UpdateCartRequestFromJson(json);

@override@JsonKey(name: 'sku_id') final  String skuId;
@override final  int? quantity;
@override@JsonKey(name: 'delta_quantity') final  int? deltaQuantity;

/// Create a copy of UpdateCartRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateCartRequestCopyWith<_UpdateCartRequest> get copyWith => __$UpdateCartRequestCopyWithImpl<_UpdateCartRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateCartRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateCartRequest&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.deltaQuantity, deltaQuantity) || other.deltaQuantity == deltaQuantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,skuId,quantity,deltaQuantity);

@override
String toString() {
  return 'UpdateCartRequest(skuId: $skuId, quantity: $quantity, deltaQuantity: $deltaQuantity)';
}


}

/// @nodoc
abstract mixin class _$UpdateCartRequestCopyWith<$Res> implements $UpdateCartRequestCopyWith<$Res> {
  factory _$UpdateCartRequestCopyWith(_UpdateCartRequest value, $Res Function(_UpdateCartRequest) _then) = __$UpdateCartRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sku_id') String skuId, int? quantity,@JsonKey(name: 'delta_quantity') int? deltaQuantity
});




}
/// @nodoc
class __$UpdateCartRequestCopyWithImpl<$Res>
    implements _$UpdateCartRequestCopyWith<$Res> {
  __$UpdateCartRequestCopyWithImpl(this._self, this._then);

  final _UpdateCartRequest _self;
  final $Res Function(_UpdateCartRequest) _then;

/// Create a copy of UpdateCartRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? skuId = null,Object? quantity = freezed,Object? deltaQuantity = freezed,}) {
  return _then(_UpdateCartRequest(
skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,deltaQuantity: freezed == deltaQuantity ? _self.deltaQuantity : deltaQuantity // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
