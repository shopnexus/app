// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Counterparty {

 String get id; String get name; Resource? get avatar;
/// Create a copy of Counterparty
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterpartyCopyWith<Counterparty> get copyWith => _$CounterpartyCopyWithImpl<Counterparty>(this as Counterparty, _$identity);

  /// Serializes this Counterparty to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Counterparty&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar);

@override
String toString() {
  return 'Counterparty(id: $id, name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $CounterpartyCopyWith<$Res>  {
  factory $CounterpartyCopyWith(Counterparty value, $Res Function(Counterparty) _then) = _$CounterpartyCopyWithImpl;
@useResult
$Res call({
 String id, String name, Resource? avatar
});


$ResourceCopyWith<$Res>? get avatar;

}
/// @nodoc
class _$CounterpartyCopyWithImpl<$Res>
    implements $CounterpartyCopyWith<$Res> {
  _$CounterpartyCopyWithImpl(this._self, this._then);

  final Counterparty _self;
  final $Res Function(Counterparty) _then;

/// Create a copy of Counterparty
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Resource?,
  ));
}
/// Create a copy of Counterparty
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ResourceCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}


/// Adds pattern-matching-related methods to [Counterparty].
extension CounterpartyPatterns on Counterparty {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Counterparty value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Counterparty() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Counterparty value)  $default,){
final _that = this;
switch (_that) {
case _Counterparty():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Counterparty value)?  $default,){
final _that = this;
switch (_that) {
case _Counterparty() when $default != null:
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
case _Counterparty() when $default != null:
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
case _Counterparty():
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
case _Counterparty() when $default != null:
return $default(_that.id,_that.name,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Counterparty implements Counterparty {
  const _Counterparty({required this.id, required this.name, this.avatar});
  factory _Counterparty.fromJson(Map<String, dynamic> json) => _$CounterpartyFromJson(json);

@override final  String id;
@override final  String name;
@override final  Resource? avatar;

/// Create a copy of Counterparty
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterpartyCopyWith<_Counterparty> get copyWith => __$CounterpartyCopyWithImpl<_Counterparty>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CounterpartyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Counterparty&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar);

@override
String toString() {
  return 'Counterparty(id: $id, name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$CounterpartyCopyWith<$Res> implements $CounterpartyCopyWith<$Res> {
  factory _$CounterpartyCopyWith(_Counterparty value, $Res Function(_Counterparty) _then) = __$CounterpartyCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, Resource? avatar
});


@override $ResourceCopyWith<$Res>? get avatar;

}
/// @nodoc
class __$CounterpartyCopyWithImpl<$Res>
    implements _$CounterpartyCopyWith<$Res> {
  __$CounterpartyCopyWithImpl(this._self, this._then);

  final _Counterparty _self;
  final $Res Function(_Counterparty) _then;

/// Create a copy of Counterparty
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,}) {
  return _then(_Counterparty(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as Resource?,
  ));
}

/// Create a copy of Counterparty
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ResourceCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}


/// @nodoc
mixin _$ChatMessageMetadata {

@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'product_id') String? get productId;@JsonKey(name: 'product_title') String? get productTitle;@JsonKey(name: 'product_image') String? get productImage;@JsonKey(name: 'product_price') double? get productPrice;@JsonKey(name: 'offer_price') double? get offerPrice;@JsonKey(name: 'offer_original_price') double? get offerOriginalPrice;@JsonKey(name: 'quantity') int get quantity;@JsonKey(name: 'offer_note') String? get offerNote;@JsonKey(name: 'offer_status') OfferStatus? get offerStatus;@JsonKey(name: 'custom_data') Map<String, dynamic>? get customData;
/// Create a copy of ChatMessageMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageMetadataCopyWith<ChatMessageMetadata> get copyWith => _$ChatMessageMetadataCopyWithImpl<ChatMessageMetadata>(this as ChatMessageMetadata, _$identity);

  /// Serializes this ChatMessageMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessageMetadata&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.offerPrice, offerPrice) || other.offerPrice == offerPrice)&&(identical(other.offerOriginalPrice, offerOriginalPrice) || other.offerOriginalPrice == offerOriginalPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.offerNote, offerNote) || other.offerNote == offerNote)&&(identical(other.offerStatus, offerStatus) || other.offerStatus == offerStatus)&&const DeepCollectionEquality().equals(other.customData, customData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,productId,productTitle,productImage,productPrice,offerPrice,offerOriginalPrice,quantity,offerNote,offerStatus,const DeepCollectionEquality().hash(customData));

@override
String toString() {
  return 'ChatMessageMetadata(imageUrl: $imageUrl, productId: $productId, productTitle: $productTitle, productImage: $productImage, productPrice: $productPrice, offerPrice: $offerPrice, offerOriginalPrice: $offerOriginalPrice, quantity: $quantity, offerNote: $offerNote, offerStatus: $offerStatus, customData: $customData)';
}


}

/// @nodoc
abstract mixin class $ChatMessageMetadataCopyWith<$Res>  {
  factory $ChatMessageMetadataCopyWith(ChatMessageMetadata value, $Res Function(ChatMessageMetadata) _then) = _$ChatMessageMetadataCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'product_id') String? productId,@JsonKey(name: 'product_title') String? productTitle,@JsonKey(name: 'product_image') String? productImage,@JsonKey(name: 'product_price') double? productPrice,@JsonKey(name: 'offer_price') double? offerPrice,@JsonKey(name: 'offer_original_price') double? offerOriginalPrice,@JsonKey(name: 'quantity') int quantity,@JsonKey(name: 'offer_note') String? offerNote,@JsonKey(name: 'offer_status') OfferStatus? offerStatus,@JsonKey(name: 'custom_data') Map<String, dynamic>? customData
});




}
/// @nodoc
class _$ChatMessageMetadataCopyWithImpl<$Res>
    implements $ChatMessageMetadataCopyWith<$Res> {
  _$ChatMessageMetadataCopyWithImpl(this._self, this._then);

  final ChatMessageMetadata _self;
  final $Res Function(ChatMessageMetadata) _then;

/// Create a copy of ChatMessageMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imageUrl = freezed,Object? productId = freezed,Object? productTitle = freezed,Object? productImage = freezed,Object? productPrice = freezed,Object? offerPrice = freezed,Object? offerOriginalPrice = freezed,Object? quantity = null,Object? offerNote = freezed,Object? offerStatus = freezed,Object? customData = freezed,}) {
  return _then(_self.copyWith(
imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productTitle: freezed == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String?,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,offerPrice: freezed == offerPrice ? _self.offerPrice : offerPrice // ignore: cast_nullable_to_non_nullable
as double?,offerOriginalPrice: freezed == offerOriginalPrice ? _self.offerOriginalPrice : offerOriginalPrice // ignore: cast_nullable_to_non_nullable
as double?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,offerNote: freezed == offerNote ? _self.offerNote : offerNote // ignore: cast_nullable_to_non_nullable
as String?,offerStatus: freezed == offerStatus ? _self.offerStatus : offerStatus // ignore: cast_nullable_to_non_nullable
as OfferStatus?,customData: freezed == customData ? _self.customData : customData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessageMetadata].
extension ChatMessageMetadataPatterns on ChatMessageMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessageMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessageMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessageMetadata value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessageMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessageMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessageMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_title')  String? productTitle, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'product_price')  double? productPrice, @JsonKey(name: 'offer_price')  double? offerPrice, @JsonKey(name: 'offer_original_price')  double? offerOriginalPrice, @JsonKey(name: 'quantity')  int quantity, @JsonKey(name: 'offer_note')  String? offerNote, @JsonKey(name: 'offer_status')  OfferStatus? offerStatus, @JsonKey(name: 'custom_data')  Map<String, dynamic>? customData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessageMetadata() when $default != null:
return $default(_that.imageUrl,_that.productId,_that.productTitle,_that.productImage,_that.productPrice,_that.offerPrice,_that.offerOriginalPrice,_that.quantity,_that.offerNote,_that.offerStatus,_that.customData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_title')  String? productTitle, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'product_price')  double? productPrice, @JsonKey(name: 'offer_price')  double? offerPrice, @JsonKey(name: 'offer_original_price')  double? offerOriginalPrice, @JsonKey(name: 'quantity')  int quantity, @JsonKey(name: 'offer_note')  String? offerNote, @JsonKey(name: 'offer_status')  OfferStatus? offerStatus, @JsonKey(name: 'custom_data')  Map<String, dynamic>? customData)  $default,) {final _that = this;
switch (_that) {
case _ChatMessageMetadata():
return $default(_that.imageUrl,_that.productId,_that.productTitle,_that.productImage,_that.productPrice,_that.offerPrice,_that.offerOriginalPrice,_that.quantity,_that.offerNote,_that.offerStatus,_that.customData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_title')  String? productTitle, @JsonKey(name: 'product_image')  String? productImage, @JsonKey(name: 'product_price')  double? productPrice, @JsonKey(name: 'offer_price')  double? offerPrice, @JsonKey(name: 'offer_original_price')  double? offerOriginalPrice, @JsonKey(name: 'quantity')  int quantity, @JsonKey(name: 'offer_note')  String? offerNote, @JsonKey(name: 'offer_status')  OfferStatus? offerStatus, @JsonKey(name: 'custom_data')  Map<String, dynamic>? customData)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessageMetadata() when $default != null:
return $default(_that.imageUrl,_that.productId,_that.productTitle,_that.productImage,_that.productPrice,_that.offerPrice,_that.offerOriginalPrice,_that.quantity,_that.offerNote,_that.offerStatus,_that.customData);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessageMetadata implements ChatMessageMetadata {
  const _ChatMessageMetadata({@JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'product_id') this.productId, @JsonKey(name: 'product_title') this.productTitle, @JsonKey(name: 'product_image') this.productImage, @JsonKey(name: 'product_price') this.productPrice, @JsonKey(name: 'offer_price') this.offerPrice, @JsonKey(name: 'offer_original_price') this.offerOriginalPrice, @JsonKey(name: 'quantity') this.quantity = 1, @JsonKey(name: 'offer_note') this.offerNote, @JsonKey(name: 'offer_status') this.offerStatus, @JsonKey(name: 'custom_data') final  Map<String, dynamic>? customData}): _customData = customData;
  factory _ChatMessageMetadata.fromJson(Map<String, dynamic> json) => _$ChatMessageMetadataFromJson(json);

@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'product_id') final  String? productId;
@override@JsonKey(name: 'product_title') final  String? productTitle;
@override@JsonKey(name: 'product_image') final  String? productImage;
@override@JsonKey(name: 'product_price') final  double? productPrice;
@override@JsonKey(name: 'offer_price') final  double? offerPrice;
@override@JsonKey(name: 'offer_original_price') final  double? offerOriginalPrice;
@override@JsonKey(name: 'quantity') final  int quantity;
@override@JsonKey(name: 'offer_note') final  String? offerNote;
@override@JsonKey(name: 'offer_status') final  OfferStatus? offerStatus;
 final  Map<String, dynamic>? _customData;
@override@JsonKey(name: 'custom_data') Map<String, dynamic>? get customData {
  final value = _customData;
  if (value == null) return null;
  if (_customData is EqualUnmodifiableMapView) return _customData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ChatMessageMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageMetadataCopyWith<_ChatMessageMetadata> get copyWith => __$ChatMessageMetadataCopyWithImpl<_ChatMessageMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessageMetadata&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.productPrice, productPrice) || other.productPrice == productPrice)&&(identical(other.offerPrice, offerPrice) || other.offerPrice == offerPrice)&&(identical(other.offerOriginalPrice, offerOriginalPrice) || other.offerOriginalPrice == offerOriginalPrice)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.offerNote, offerNote) || other.offerNote == offerNote)&&(identical(other.offerStatus, offerStatus) || other.offerStatus == offerStatus)&&const DeepCollectionEquality().equals(other._customData, _customData));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,imageUrl,productId,productTitle,productImage,productPrice,offerPrice,offerOriginalPrice,quantity,offerNote,offerStatus,const DeepCollectionEquality().hash(_customData));

@override
String toString() {
  return 'ChatMessageMetadata(imageUrl: $imageUrl, productId: $productId, productTitle: $productTitle, productImage: $productImage, productPrice: $productPrice, offerPrice: $offerPrice, offerOriginalPrice: $offerOriginalPrice, quantity: $quantity, offerNote: $offerNote, offerStatus: $offerStatus, customData: $customData)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageMetadataCopyWith<$Res> implements $ChatMessageMetadataCopyWith<$Res> {
  factory _$ChatMessageMetadataCopyWith(_ChatMessageMetadata value, $Res Function(_ChatMessageMetadata) _then) = __$ChatMessageMetadataCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'product_id') String? productId,@JsonKey(name: 'product_title') String? productTitle,@JsonKey(name: 'product_image') String? productImage,@JsonKey(name: 'product_price') double? productPrice,@JsonKey(name: 'offer_price') double? offerPrice,@JsonKey(name: 'offer_original_price') double? offerOriginalPrice,@JsonKey(name: 'quantity') int quantity,@JsonKey(name: 'offer_note') String? offerNote,@JsonKey(name: 'offer_status') OfferStatus? offerStatus,@JsonKey(name: 'custom_data') Map<String, dynamic>? customData
});




}
/// @nodoc
class __$ChatMessageMetadataCopyWithImpl<$Res>
    implements _$ChatMessageMetadataCopyWith<$Res> {
  __$ChatMessageMetadataCopyWithImpl(this._self, this._then);

  final _ChatMessageMetadata _self;
  final $Res Function(_ChatMessageMetadata) _then;

/// Create a copy of ChatMessageMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imageUrl = freezed,Object? productId = freezed,Object? productTitle = freezed,Object? productImage = freezed,Object? productPrice = freezed,Object? offerPrice = freezed,Object? offerOriginalPrice = freezed,Object? quantity = null,Object? offerNote = freezed,Object? offerStatus = freezed,Object? customData = freezed,}) {
  return _then(_ChatMessageMetadata(
imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productTitle: freezed == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String?,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,productPrice: freezed == productPrice ? _self.productPrice : productPrice // ignore: cast_nullable_to_non_nullable
as double?,offerPrice: freezed == offerPrice ? _self.offerPrice : offerPrice // ignore: cast_nullable_to_non_nullable
as double?,offerOriginalPrice: freezed == offerOriginalPrice ? _self.offerOriginalPrice : offerOriginalPrice // ignore: cast_nullable_to_non_nullable
as double?,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,offerNote: freezed == offerNote ? _self.offerNote : offerNote // ignore: cast_nullable_to_non_nullable
as String?,offerStatus: freezed == offerStatus ? _self.offerStatus : offerStatus // ignore: cast_nullable_to_non_nullable
as OfferStatus?,customData: freezed == customData ? _self._customData : customData // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$ChatMessage {

 String get id;@JsonKey(name: 'conversation_id') String get conversationId;@JsonKey(name: 'sender_id') dynamic get senderId; MessageType get type; String get body; List<Resource> get attachments; Map<String, dynamic>? get card; Map<String, dynamic>? get refs;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'edited_at') String? get editedAt;@JsonKey(name: 'deleted_at') String? get deletedAt;// Fields compatibility with UI
@JsonKey(name: 'sender_name') String? get senderName;@JsonKey(name: 'sender_avatar') String? get senderAvatar;@JsonKey(name: 'recipient_id') String? get recipientId;@JsonKey(name: 'is_me') bool get isMe; MessageStatus get status;
/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<ChatMessage> get copyWith => _$ChatMessageCopyWithImpl<ChatMessage>(this as ChatMessage, _$identity);

  /// Serializes this ChatMessage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&const DeepCollectionEquality().equals(other.senderId, senderId)&&(identical(other.type, type) || other.type == type)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&const DeepCollectionEquality().equals(other.card, card)&&const DeepCollectionEquality().equals(other.refs, refs)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.senderAvatar, senderAvatar) || other.senderAvatar == senderAvatar)&&(identical(other.recipientId, recipientId) || other.recipientId == recipientId)&&(identical(other.isMe, isMe) || other.isMe == isMe)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,const DeepCollectionEquality().hash(senderId),type,body,const DeepCollectionEquality().hash(attachments),const DeepCollectionEquality().hash(card),const DeepCollectionEquality().hash(refs),createdAt,editedAt,deletedAt,senderName,senderAvatar,recipientId,isMe,status);

@override
String toString() {
  return 'ChatMessage(id: $id, conversationId: $conversationId, senderId: $senderId, type: $type, body: $body, attachments: $attachments, card: $card, refs: $refs, createdAt: $createdAt, editedAt: $editedAt, deletedAt: $deletedAt, senderName: $senderName, senderAvatar: $senderAvatar, recipientId: $recipientId, isMe: $isMe, status: $status)';
}


}

/// @nodoc
abstract mixin class $ChatMessageCopyWith<$Res>  {
  factory $ChatMessageCopyWith(ChatMessage value, $Res Function(ChatMessage) _then) = _$ChatMessageCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'conversation_id') String conversationId,@JsonKey(name: 'sender_id') dynamic senderId, MessageType type, String body, List<Resource> attachments, Map<String, dynamic>? card, Map<String, dynamic>? refs,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'edited_at') String? editedAt,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'sender_name') String? senderName,@JsonKey(name: 'sender_avatar') String? senderAvatar,@JsonKey(name: 'recipient_id') String? recipientId,@JsonKey(name: 'is_me') bool isMe, MessageStatus status
});




}
/// @nodoc
class _$ChatMessageCopyWithImpl<$Res>
    implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._self, this._then);

  final ChatMessage _self;
  final $Res Function(ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? conversationId = null,Object? senderId = freezed,Object? type = null,Object? body = null,Object? attachments = null,Object? card = freezed,Object? refs = freezed,Object? createdAt = null,Object? editedAt = freezed,Object? deletedAt = freezed,Object? senderName = freezed,Object? senderAvatar = freezed,Object? recipientId = freezed,Object? isMe = null,Object? status = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as dynamic,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageType,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<Resource>,card: freezed == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,refs: freezed == refs ? _self.refs : refs // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,senderName: freezed == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String?,senderAvatar: freezed == senderAvatar ? _self.senderAvatar : senderAvatar // ignore: cast_nullable_to_non_nullable
as String?,recipientId: freezed == recipientId ? _self.recipientId : recipientId // ignore: cast_nullable_to_non_nullable
as String?,isMe: null == isMe ? _self.isMe : isMe // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MessageStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessage].
extension ChatMessagePatterns on ChatMessage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessage value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessage value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'sender_id')  dynamic senderId,  MessageType type,  String body,  List<Resource> attachments,  Map<String, dynamic>? card,  Map<String, dynamic>? refs, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'edited_at')  String? editedAt, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'sender_name')  String? senderName, @JsonKey(name: 'sender_avatar')  String? senderAvatar, @JsonKey(name: 'recipient_id')  String? recipientId, @JsonKey(name: 'is_me')  bool isMe,  MessageStatus status)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.conversationId,_that.senderId,_that.type,_that.body,_that.attachments,_that.card,_that.refs,_that.createdAt,_that.editedAt,_that.deletedAt,_that.senderName,_that.senderAvatar,_that.recipientId,_that.isMe,_that.status);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'sender_id')  dynamic senderId,  MessageType type,  String body,  List<Resource> attachments,  Map<String, dynamic>? card,  Map<String, dynamic>? refs, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'edited_at')  String? editedAt, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'sender_name')  String? senderName, @JsonKey(name: 'sender_avatar')  String? senderAvatar, @JsonKey(name: 'recipient_id')  String? recipientId, @JsonKey(name: 'is_me')  bool isMe,  MessageStatus status)  $default,) {final _that = this;
switch (_that) {
case _ChatMessage():
return $default(_that.id,_that.conversationId,_that.senderId,_that.type,_that.body,_that.attachments,_that.card,_that.refs,_that.createdAt,_that.editedAt,_that.deletedAt,_that.senderName,_that.senderAvatar,_that.recipientId,_that.isMe,_that.status);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'conversation_id')  String conversationId, @JsonKey(name: 'sender_id')  dynamic senderId,  MessageType type,  String body,  List<Resource> attachments,  Map<String, dynamic>? card,  Map<String, dynamic>? refs, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'edited_at')  String? editedAt, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'sender_name')  String? senderName, @JsonKey(name: 'sender_avatar')  String? senderAvatar, @JsonKey(name: 'recipient_id')  String? recipientId, @JsonKey(name: 'is_me')  bool isMe,  MessageStatus status)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessage() when $default != null:
return $default(_that.id,_that.conversationId,_that.senderId,_that.type,_that.body,_that.attachments,_that.card,_that.refs,_that.createdAt,_that.editedAt,_that.deletedAt,_that.senderName,_that.senderAvatar,_that.recipientId,_that.isMe,_that.status);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessage extends ChatMessage {
  const _ChatMessage({required this.id, @JsonKey(name: 'conversation_id') required this.conversationId, @JsonKey(name: 'sender_id') this.senderId, this.type = MessageType.user, required this.body, final  List<Resource> attachments = const [], final  Map<String, dynamic>? card, final  Map<String, dynamic>? refs, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'edited_at') this.editedAt, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'sender_name') this.senderName, @JsonKey(name: 'sender_avatar') this.senderAvatar, @JsonKey(name: 'recipient_id') this.recipientId, @JsonKey(name: 'is_me') this.isMe = false, this.status = MessageStatus.sent}): _attachments = attachments,_card = card,_refs = refs,super._();
  factory _ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);

@override final  String id;
@override@JsonKey(name: 'conversation_id') final  String conversationId;
@override@JsonKey(name: 'sender_id') final  dynamic senderId;
@override@JsonKey() final  MessageType type;
@override final  String body;
 final  List<Resource> _attachments;
@override@JsonKey() List<Resource> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

 final  Map<String, dynamic>? _card;
@override Map<String, dynamic>? get card {
  final value = _card;
  if (value == null) return null;
  if (_card is EqualUnmodifiableMapView) return _card;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _refs;
@override Map<String, dynamic>? get refs {
  final value = _refs;
  if (value == null) return null;
  if (_refs is EqualUnmodifiableMapView) return _refs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'edited_at') final  String? editedAt;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
// Fields compatibility with UI
@override@JsonKey(name: 'sender_name') final  String? senderName;
@override@JsonKey(name: 'sender_avatar') final  String? senderAvatar;
@override@JsonKey(name: 'recipient_id') final  String? recipientId;
@override@JsonKey(name: 'is_me') final  bool isMe;
@override@JsonKey() final  MessageStatus status;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageCopyWith<_ChatMessage> get copyWith => __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessage&&(identical(other.id, id) || other.id == id)&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&const DeepCollectionEquality().equals(other.senderId, senderId)&&(identical(other.type, type) || other.type == type)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&const DeepCollectionEquality().equals(other._card, _card)&&const DeepCollectionEquality().equals(other._refs, _refs)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.editedAt, editedAt) || other.editedAt == editedAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.senderAvatar, senderAvatar) || other.senderAvatar == senderAvatar)&&(identical(other.recipientId, recipientId) || other.recipientId == recipientId)&&(identical(other.isMe, isMe) || other.isMe == isMe)&&(identical(other.status, status) || other.status == status));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,conversationId,const DeepCollectionEquality().hash(senderId),type,body,const DeepCollectionEquality().hash(_attachments),const DeepCollectionEquality().hash(_card),const DeepCollectionEquality().hash(_refs),createdAt,editedAt,deletedAt,senderName,senderAvatar,recipientId,isMe,status);

@override
String toString() {
  return 'ChatMessage(id: $id, conversationId: $conversationId, senderId: $senderId, type: $type, body: $body, attachments: $attachments, card: $card, refs: $refs, createdAt: $createdAt, editedAt: $editedAt, deletedAt: $deletedAt, senderName: $senderName, senderAvatar: $senderAvatar, recipientId: $recipientId, isMe: $isMe, status: $status)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageCopyWith<$Res> implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(_ChatMessage value, $Res Function(_ChatMessage) _then) = __$ChatMessageCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'conversation_id') String conversationId,@JsonKey(name: 'sender_id') dynamic senderId, MessageType type, String body, List<Resource> attachments, Map<String, dynamic>? card, Map<String, dynamic>? refs,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'edited_at') String? editedAt,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'sender_name') String? senderName,@JsonKey(name: 'sender_avatar') String? senderAvatar,@JsonKey(name: 'recipient_id') String? recipientId,@JsonKey(name: 'is_me') bool isMe, MessageStatus status
});




}
/// @nodoc
class __$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(this._self, this._then);

  final _ChatMessage _self;
  final $Res Function(_ChatMessage) _then;

/// Create a copy of ChatMessage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? conversationId = null,Object? senderId = freezed,Object? type = null,Object? body = null,Object? attachments = null,Object? card = freezed,Object? refs = freezed,Object? createdAt = null,Object? editedAt = freezed,Object? deletedAt = freezed,Object? senderName = freezed,Object? senderAvatar = freezed,Object? recipientId = freezed,Object? isMe = null,Object? status = null,}) {
  return _then(_ChatMessage(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,senderId: freezed == senderId ? _self.senderId : senderId // ignore: cast_nullable_to_non_nullable
as dynamic,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as MessageType,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<Resource>,card: freezed == card ? _self._card : card // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,refs: freezed == refs ? _self._refs : refs // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,editedAt: freezed == editedAt ? _self.editedAt : editedAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,senderName: freezed == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String?,senderAvatar: freezed == senderAvatar ? _self.senderAvatar : senderAvatar // ignore: cast_nullable_to_non_nullable
as String?,recipientId: freezed == recipientId ? _self.recipientId : recipientId // ignore: cast_nullable_to_non_nullable
as String?,isMe: null == isMe ? _self.isMe : isMe // ignore: cast_nullable_to_non_nullable
as bool,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MessageStatus,
  ));
}


}


/// @nodoc
mixin _$ChatConversation {

 String get id;@JsonKey(name: 'created_at') String get createdAt; Counterparty get counterparty;@JsonKey(name: 'last_message') ChatMessage? get lastMessage;@JsonKey(name: 'last_message_at') String get lastMessageAt;@JsonKey(name: 'read_at') String? get readAt;@JsonKey(name: 'counterparty_read_at') String? get counterpartyReadAt; int get unread;// Fields compatibility with UI
@JsonKey(name: 'product_id') String? get productId;@JsonKey(name: 'product_title') String? get productTitle;@JsonKey(name: 'product_image') String? get productImage; bool get isOnline;
/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatConversationCopyWith<ChatConversation> get copyWith => _$ChatConversationCopyWithImpl<ChatConversation>(this as ChatConversation, _$identity);

  /// Serializes this ChatConversation to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatConversation&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.counterparty, counterparty) || other.counterparty == counterparty)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.counterpartyReadAt, counterpartyReadAt) || other.counterpartyReadAt == counterpartyReadAt)&&(identical(other.unread, unread) || other.unread == unread)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,counterparty,lastMessage,lastMessageAt,readAt,counterpartyReadAt,unread,productId,productTitle,productImage,isOnline);

@override
String toString() {
  return 'ChatConversation(id: $id, createdAt: $createdAt, counterparty: $counterparty, lastMessage: $lastMessage, lastMessageAt: $lastMessageAt, readAt: $readAt, counterpartyReadAt: $counterpartyReadAt, unread: $unread, productId: $productId, productTitle: $productTitle, productImage: $productImage, isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class $ChatConversationCopyWith<$Res>  {
  factory $ChatConversationCopyWith(ChatConversation value, $Res Function(ChatConversation) _then) = _$ChatConversationCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'created_at') String createdAt, Counterparty counterparty,@JsonKey(name: 'last_message') ChatMessage? lastMessage,@JsonKey(name: 'last_message_at') String lastMessageAt,@JsonKey(name: 'read_at') String? readAt,@JsonKey(name: 'counterparty_read_at') String? counterpartyReadAt, int unread,@JsonKey(name: 'product_id') String? productId,@JsonKey(name: 'product_title') String? productTitle,@JsonKey(name: 'product_image') String? productImage, bool isOnline
});


$CounterpartyCopyWith<$Res> get counterparty;$ChatMessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class _$ChatConversationCopyWithImpl<$Res>
    implements $ChatConversationCopyWith<$Res> {
  _$ChatConversationCopyWithImpl(this._self, this._then);

  final ChatConversation _self;
  final $Res Function(ChatConversation) _then;

/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? createdAt = null,Object? counterparty = null,Object? lastMessage = freezed,Object? lastMessageAt = null,Object? readAt = freezed,Object? counterpartyReadAt = freezed,Object? unread = null,Object? productId = freezed,Object? productTitle = freezed,Object? productImage = freezed,Object? isOnline = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,counterparty: null == counterparty ? _self.counterparty : counterparty // ignore: cast_nullable_to_non_nullable
as Counterparty,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as ChatMessage?,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as String,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as String?,counterpartyReadAt: freezed == counterpartyReadAt ? _self.counterpartyReadAt : counterpartyReadAt // ignore: cast_nullable_to_non_nullable
as String?,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productTitle: freezed == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String?,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CounterpartyCopyWith<$Res> get counterparty {
  
  return $CounterpartyCopyWith<$Res>(_self.counterparty, (value) {
    return _then(_self.copyWith(counterparty: value));
  });
}/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $ChatMessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatConversation].
extension ChatConversationPatterns on ChatConversation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatConversation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatConversation() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatConversation value)  $default,){
final _that = this;
switch (_that) {
case _ChatConversation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatConversation value)?  $default,){
final _that = this;
switch (_that) {
case _ChatConversation() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'created_at')  String createdAt,  Counterparty counterparty, @JsonKey(name: 'last_message')  ChatMessage? lastMessage, @JsonKey(name: 'last_message_at')  String lastMessageAt, @JsonKey(name: 'read_at')  String? readAt, @JsonKey(name: 'counterparty_read_at')  String? counterpartyReadAt,  int unread, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_title')  String? productTitle, @JsonKey(name: 'product_image')  String? productImage,  bool isOnline)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatConversation() when $default != null:
return $default(_that.id,_that.createdAt,_that.counterparty,_that.lastMessage,_that.lastMessageAt,_that.readAt,_that.counterpartyReadAt,_that.unread,_that.productId,_that.productTitle,_that.productImage,_that.isOnline);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'created_at')  String createdAt,  Counterparty counterparty, @JsonKey(name: 'last_message')  ChatMessage? lastMessage, @JsonKey(name: 'last_message_at')  String lastMessageAt, @JsonKey(name: 'read_at')  String? readAt, @JsonKey(name: 'counterparty_read_at')  String? counterpartyReadAt,  int unread, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_title')  String? productTitle, @JsonKey(name: 'product_image')  String? productImage,  bool isOnline)  $default,) {final _that = this;
switch (_that) {
case _ChatConversation():
return $default(_that.id,_that.createdAt,_that.counterparty,_that.lastMessage,_that.lastMessageAt,_that.readAt,_that.counterpartyReadAt,_that.unread,_that.productId,_that.productTitle,_that.productImage,_that.isOnline);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'created_at')  String createdAt,  Counterparty counterparty, @JsonKey(name: 'last_message')  ChatMessage? lastMessage, @JsonKey(name: 'last_message_at')  String lastMessageAt, @JsonKey(name: 'read_at')  String? readAt, @JsonKey(name: 'counterparty_read_at')  String? counterpartyReadAt,  int unread, @JsonKey(name: 'product_id')  String? productId, @JsonKey(name: 'product_title')  String? productTitle, @JsonKey(name: 'product_image')  String? productImage,  bool isOnline)?  $default,) {final _that = this;
switch (_that) {
case _ChatConversation() when $default != null:
return $default(_that.id,_that.createdAt,_that.counterparty,_that.lastMessage,_that.lastMessageAt,_that.readAt,_that.counterpartyReadAt,_that.unread,_that.productId,_that.productTitle,_that.productImage,_that.isOnline);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatConversation extends ChatConversation {
  const _ChatConversation({required this.id, @JsonKey(name: 'created_at') required this.createdAt, required this.counterparty, @JsonKey(name: 'last_message') this.lastMessage, @JsonKey(name: 'last_message_at') required this.lastMessageAt, @JsonKey(name: 'read_at') this.readAt, @JsonKey(name: 'counterparty_read_at') this.counterpartyReadAt, this.unread = 0, @JsonKey(name: 'product_id') this.productId, @JsonKey(name: 'product_title') this.productTitle, @JsonKey(name: 'product_image') this.productImage, this.isOnline = false}): super._();
  factory _ChatConversation.fromJson(Map<String, dynamic> json) => _$ChatConversationFromJson(json);

@override final  String id;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override final  Counterparty counterparty;
@override@JsonKey(name: 'last_message') final  ChatMessage? lastMessage;
@override@JsonKey(name: 'last_message_at') final  String lastMessageAt;
@override@JsonKey(name: 'read_at') final  String? readAt;
@override@JsonKey(name: 'counterparty_read_at') final  String? counterpartyReadAt;
@override@JsonKey() final  int unread;
// Fields compatibility with UI
@override@JsonKey(name: 'product_id') final  String? productId;
@override@JsonKey(name: 'product_title') final  String? productTitle;
@override@JsonKey(name: 'product_image') final  String? productImage;
@override@JsonKey() final  bool isOnline;

/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatConversationCopyWith<_ChatConversation> get copyWith => __$ChatConversationCopyWithImpl<_ChatConversation>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatConversationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatConversation&&(identical(other.id, id) || other.id == id)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.counterparty, counterparty) || other.counterparty == counterparty)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&(identical(other.lastMessageAt, lastMessageAt) || other.lastMessageAt == lastMessageAt)&&(identical(other.readAt, readAt) || other.readAt == readAt)&&(identical(other.counterpartyReadAt, counterpartyReadAt) || other.counterpartyReadAt == counterpartyReadAt)&&(identical(other.unread, unread) || other.unread == unread)&&(identical(other.productId, productId) || other.productId == productId)&&(identical(other.productTitle, productTitle) || other.productTitle == productTitle)&&(identical(other.productImage, productImage) || other.productImage == productImage)&&(identical(other.isOnline, isOnline) || other.isOnline == isOnline));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,createdAt,counterparty,lastMessage,lastMessageAt,readAt,counterpartyReadAt,unread,productId,productTitle,productImage,isOnline);

@override
String toString() {
  return 'ChatConversation(id: $id, createdAt: $createdAt, counterparty: $counterparty, lastMessage: $lastMessage, lastMessageAt: $lastMessageAt, readAt: $readAt, counterpartyReadAt: $counterpartyReadAt, unread: $unread, productId: $productId, productTitle: $productTitle, productImage: $productImage, isOnline: $isOnline)';
}


}

/// @nodoc
abstract mixin class _$ChatConversationCopyWith<$Res> implements $ChatConversationCopyWith<$Res> {
  factory _$ChatConversationCopyWith(_ChatConversation value, $Res Function(_ChatConversation) _then) = __$ChatConversationCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'created_at') String createdAt, Counterparty counterparty,@JsonKey(name: 'last_message') ChatMessage? lastMessage,@JsonKey(name: 'last_message_at') String lastMessageAt,@JsonKey(name: 'read_at') String? readAt,@JsonKey(name: 'counterparty_read_at') String? counterpartyReadAt, int unread,@JsonKey(name: 'product_id') String? productId,@JsonKey(name: 'product_title') String? productTitle,@JsonKey(name: 'product_image') String? productImage, bool isOnline
});


@override $CounterpartyCopyWith<$Res> get counterparty;@override $ChatMessageCopyWith<$Res>? get lastMessage;

}
/// @nodoc
class __$ChatConversationCopyWithImpl<$Res>
    implements _$ChatConversationCopyWith<$Res> {
  __$ChatConversationCopyWithImpl(this._self, this._then);

  final _ChatConversation _self;
  final $Res Function(_ChatConversation) _then;

/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? createdAt = null,Object? counterparty = null,Object? lastMessage = freezed,Object? lastMessageAt = null,Object? readAt = freezed,Object? counterpartyReadAt = freezed,Object? unread = null,Object? productId = freezed,Object? productTitle = freezed,Object? productImage = freezed,Object? isOnline = null,}) {
  return _then(_ChatConversation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,counterparty: null == counterparty ? _self.counterparty : counterparty // ignore: cast_nullable_to_non_nullable
as Counterparty,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as ChatMessage?,lastMessageAt: null == lastMessageAt ? _self.lastMessageAt : lastMessageAt // ignore: cast_nullable_to_non_nullable
as String,readAt: freezed == readAt ? _self.readAt : readAt // ignore: cast_nullable_to_non_nullable
as String?,counterpartyReadAt: freezed == counterpartyReadAt ? _self.counterpartyReadAt : counterpartyReadAt // ignore: cast_nullable_to_non_nullable
as String?,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,productId: freezed == productId ? _self.productId : productId // ignore: cast_nullable_to_non_nullable
as String?,productTitle: freezed == productTitle ? _self.productTitle : productTitle // ignore: cast_nullable_to_non_nullable
as String?,productImage: freezed == productImage ? _self.productImage : productImage // ignore: cast_nullable_to_non_nullable
as String?,isOnline: null == isOnline ? _self.isOnline : isOnline // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CounterpartyCopyWith<$Res> get counterparty {
  
  return $CounterpartyCopyWith<$Res>(_self.counterparty, (value) {
    return _then(_self.copyWith(counterparty: value));
  });
}/// Create a copy of ChatConversation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatMessageCopyWith<$Res>? get lastMessage {
    if (_self.lastMessage == null) {
    return null;
  }

  return $ChatMessageCopyWith<$Res>(_self.lastMessage!, (value) {
    return _then(_self.copyWith(lastMessage: value));
  });
}
}


/// @nodoc
mixin _$StartConversationRequest {

@JsonKey(name: 'account_id') String get accountId;
/// Create a copy of StartConversationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartConversationRequestCopyWith<StartConversationRequest> get copyWith => _$StartConversationRequestCopyWithImpl<StartConversationRequest>(this as StartConversationRequest, _$identity);

  /// Serializes this StartConversationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartConversationRequest&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId);

@override
String toString() {
  return 'StartConversationRequest(accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class $StartConversationRequestCopyWith<$Res>  {
  factory $StartConversationRequestCopyWith(StartConversationRequest value, $Res Function(StartConversationRequest) _then) = _$StartConversationRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'account_id') String accountId
});




}
/// @nodoc
class _$StartConversationRequestCopyWithImpl<$Res>
    implements $StartConversationRequestCopyWith<$Res> {
  _$StartConversationRequestCopyWithImpl(this._self, this._then);

  final StartConversationRequest _self;
  final $Res Function(StartConversationRequest) _then;

/// Create a copy of StartConversationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountId = null,}) {
  return _then(_self.copyWith(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StartConversationRequest].
extension StartConversationRequestPatterns on StartConversationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StartConversationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartConversationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StartConversationRequest value)  $default,){
final _that = this;
switch (_that) {
case _StartConversationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StartConversationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _StartConversationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'account_id')  String accountId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartConversationRequest() when $default != null:
return $default(_that.accountId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'account_id')  String accountId)  $default,) {final _that = this;
switch (_that) {
case _StartConversationRequest():
return $default(_that.accountId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'account_id')  String accountId)?  $default,) {final _that = this;
switch (_that) {
case _StartConversationRequest() when $default != null:
return $default(_that.accountId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StartConversationRequest implements StartConversationRequest {
  const _StartConversationRequest({@JsonKey(name: 'account_id') required this.accountId});
  factory _StartConversationRequest.fromJson(Map<String, dynamic> json) => _$StartConversationRequestFromJson(json);

@override@JsonKey(name: 'account_id') final  String accountId;

/// Create a copy of StartConversationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartConversationRequestCopyWith<_StartConversationRequest> get copyWith => __$StartConversationRequestCopyWithImpl<_StartConversationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StartConversationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartConversationRequest&&(identical(other.accountId, accountId) || other.accountId == accountId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountId);

@override
String toString() {
  return 'StartConversationRequest(accountId: $accountId)';
}


}

/// @nodoc
abstract mixin class _$StartConversationRequestCopyWith<$Res> implements $StartConversationRequestCopyWith<$Res> {
  factory _$StartConversationRequestCopyWith(_StartConversationRequest value, $Res Function(_StartConversationRequest) _then) = __$StartConversationRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'account_id') String accountId
});




}
/// @nodoc
class __$StartConversationRequestCopyWithImpl<$Res>
    implements _$StartConversationRequestCopyWith<$Res> {
  __$StartConversationRequestCopyWithImpl(this._self, this._then);

  final _StartConversationRequest _self;
  final $Res Function(_StartConversationRequest) _then;

/// Create a copy of StartConversationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountId = null,}) {
  return _then(_StartConversationRequest(
accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SendMessageRequest {

 String? get body; List<String>? get attachments; Map<String, dynamic>? get card; Map<String, dynamic>? get refs;
/// Create a copy of SendMessageRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendMessageRequestCopyWith<SendMessageRequest> get copyWith => _$SendMessageRequestCopyWithImpl<SendMessageRequest>(this as SendMessageRequest, _$identity);

  /// Serializes this SendMessageRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendMessageRequest&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&const DeepCollectionEquality().equals(other.card, card)&&const DeepCollectionEquality().equals(other.refs, refs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,body,const DeepCollectionEquality().hash(attachments),const DeepCollectionEquality().hash(card),const DeepCollectionEquality().hash(refs));

@override
String toString() {
  return 'SendMessageRequest(body: $body, attachments: $attachments, card: $card, refs: $refs)';
}


}

/// @nodoc
abstract mixin class $SendMessageRequestCopyWith<$Res>  {
  factory $SendMessageRequestCopyWith(SendMessageRequest value, $Res Function(SendMessageRequest) _then) = _$SendMessageRequestCopyWithImpl;
@useResult
$Res call({
 String? body, List<String>? attachments, Map<String, dynamic>? card, Map<String, dynamic>? refs
});




}
/// @nodoc
class _$SendMessageRequestCopyWithImpl<$Res>
    implements $SendMessageRequestCopyWith<$Res> {
  _$SendMessageRequestCopyWithImpl(this._self, this._then);

  final SendMessageRequest _self;
  final $Res Function(SendMessageRequest) _then;

/// Create a copy of SendMessageRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? body = freezed,Object? attachments = freezed,Object? card = freezed,Object? refs = freezed,}) {
  return _then(_self.copyWith(
body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,card: freezed == card ? _self.card : card // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,refs: freezed == refs ? _self.refs : refs // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SendMessageRequest].
extension SendMessageRequestPatterns on SendMessageRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendMessageRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendMessageRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendMessageRequest value)  $default,){
final _that = this;
switch (_that) {
case _SendMessageRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendMessageRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SendMessageRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? body,  List<String>? attachments,  Map<String, dynamic>? card,  Map<String, dynamic>? refs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendMessageRequest() when $default != null:
return $default(_that.body,_that.attachments,_that.card,_that.refs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? body,  List<String>? attachments,  Map<String, dynamic>? card,  Map<String, dynamic>? refs)  $default,) {final _that = this;
switch (_that) {
case _SendMessageRequest():
return $default(_that.body,_that.attachments,_that.card,_that.refs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? body,  List<String>? attachments,  Map<String, dynamic>? card,  Map<String, dynamic>? refs)?  $default,) {final _that = this;
switch (_that) {
case _SendMessageRequest() when $default != null:
return $default(_that.body,_that.attachments,_that.card,_that.refs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendMessageRequest implements SendMessageRequest {
  const _SendMessageRequest({this.body, final  List<String>? attachments, final  Map<String, dynamic>? card, final  Map<String, dynamic>? refs}): _attachments = attachments,_card = card,_refs = refs;
  factory _SendMessageRequest.fromJson(Map<String, dynamic> json) => _$SendMessageRequestFromJson(json);

@override final  String? body;
 final  List<String>? _attachments;
@override List<String>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _card;
@override Map<String, dynamic>? get card {
  final value = _card;
  if (value == null) return null;
  if (_card is EqualUnmodifiableMapView) return _card;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _refs;
@override Map<String, dynamic>? get refs {
  final value = _refs;
  if (value == null) return null;
  if (_refs is EqualUnmodifiableMapView) return _refs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of SendMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendMessageRequestCopyWith<_SendMessageRequest> get copyWith => __$SendMessageRequestCopyWithImpl<_SendMessageRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendMessageRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendMessageRequest&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&const DeepCollectionEquality().equals(other._card, _card)&&const DeepCollectionEquality().equals(other._refs, _refs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,body,const DeepCollectionEquality().hash(_attachments),const DeepCollectionEquality().hash(_card),const DeepCollectionEquality().hash(_refs));

@override
String toString() {
  return 'SendMessageRequest(body: $body, attachments: $attachments, card: $card, refs: $refs)';
}


}

/// @nodoc
abstract mixin class _$SendMessageRequestCopyWith<$Res> implements $SendMessageRequestCopyWith<$Res> {
  factory _$SendMessageRequestCopyWith(_SendMessageRequest value, $Res Function(_SendMessageRequest) _then) = __$SendMessageRequestCopyWithImpl;
@override @useResult
$Res call({
 String? body, List<String>? attachments, Map<String, dynamic>? card, Map<String, dynamic>? refs
});




}
/// @nodoc
class __$SendMessageRequestCopyWithImpl<$Res>
    implements _$SendMessageRequestCopyWith<$Res> {
  __$SendMessageRequestCopyWithImpl(this._self, this._then);

  final _SendMessageRequest _self;
  final $Res Function(_SendMessageRequest) _then;

/// Create a copy of SendMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? body = freezed,Object? attachments = freezed,Object? card = freezed,Object? refs = freezed,}) {
  return _then(_SendMessageRequest(
body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,card: freezed == card ? _self._card : card // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,refs: freezed == refs ? _self._refs : refs // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$MarkConversationReadRequest {

 String get before;
/// Create a copy of MarkConversationReadRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MarkConversationReadRequestCopyWith<MarkConversationReadRequest> get copyWith => _$MarkConversationReadRequestCopyWithImpl<MarkConversationReadRequest>(this as MarkConversationReadRequest, _$identity);

  /// Serializes this MarkConversationReadRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MarkConversationReadRequest&&(identical(other.before, before) || other.before == before));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,before);

@override
String toString() {
  return 'MarkConversationReadRequest(before: $before)';
}


}

/// @nodoc
abstract mixin class $MarkConversationReadRequestCopyWith<$Res>  {
  factory $MarkConversationReadRequestCopyWith(MarkConversationReadRequest value, $Res Function(MarkConversationReadRequest) _then) = _$MarkConversationReadRequestCopyWithImpl;
@useResult
$Res call({
 String before
});




}
/// @nodoc
class _$MarkConversationReadRequestCopyWithImpl<$Res>
    implements $MarkConversationReadRequestCopyWith<$Res> {
  _$MarkConversationReadRequestCopyWithImpl(this._self, this._then);

  final MarkConversationReadRequest _self;
  final $Res Function(MarkConversationReadRequest) _then;

/// Create a copy of MarkConversationReadRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? before = null,}) {
  return _then(_self.copyWith(
before: null == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MarkConversationReadRequest].
extension MarkConversationReadRequestPatterns on MarkConversationReadRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MarkConversationReadRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MarkConversationReadRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MarkConversationReadRequest value)  $default,){
final _that = this;
switch (_that) {
case _MarkConversationReadRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MarkConversationReadRequest value)?  $default,){
final _that = this;
switch (_that) {
case _MarkConversationReadRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String before)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MarkConversationReadRequest() when $default != null:
return $default(_that.before);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String before)  $default,) {final _that = this;
switch (_that) {
case _MarkConversationReadRequest():
return $default(_that.before);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String before)?  $default,) {final _that = this;
switch (_that) {
case _MarkConversationReadRequest() when $default != null:
return $default(_that.before);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MarkConversationReadRequest implements MarkConversationReadRequest {
  const _MarkConversationReadRequest({required this.before});
  factory _MarkConversationReadRequest.fromJson(Map<String, dynamic> json) => _$MarkConversationReadRequestFromJson(json);

@override final  String before;

/// Create a copy of MarkConversationReadRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MarkConversationReadRequestCopyWith<_MarkConversationReadRequest> get copyWith => __$MarkConversationReadRequestCopyWithImpl<_MarkConversationReadRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MarkConversationReadRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MarkConversationReadRequest&&(identical(other.before, before) || other.before == before));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,before);

@override
String toString() {
  return 'MarkConversationReadRequest(before: $before)';
}


}

/// @nodoc
abstract mixin class _$MarkConversationReadRequestCopyWith<$Res> implements $MarkConversationReadRequestCopyWith<$Res> {
  factory _$MarkConversationReadRequestCopyWith(_MarkConversationReadRequest value, $Res Function(_MarkConversationReadRequest) _then) = __$MarkConversationReadRequestCopyWithImpl;
@override @useResult
$Res call({
 String before
});




}
/// @nodoc
class __$MarkConversationReadRequestCopyWithImpl<$Res>
    implements _$MarkConversationReadRequestCopyWith<$Res> {
  __$MarkConversationReadRequestCopyWithImpl(this._self, this._then);

  final _MarkConversationReadRequest _self;
  final $Res Function(_MarkConversationReadRequest) _then;

/// Create a copy of MarkConversationReadRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? before = null,}) {
  return _then(_MarkConversationReadRequest(
before: null == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdateMessageRequest {

 String get body;
/// Create a copy of UpdateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateMessageRequestCopyWith<UpdateMessageRequest> get copyWith => _$UpdateMessageRequestCopyWithImpl<UpdateMessageRequest>(this as UpdateMessageRequest, _$identity);

  /// Serializes this UpdateMessageRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateMessageRequest&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,body);

@override
String toString() {
  return 'UpdateMessageRequest(body: $body)';
}


}

/// @nodoc
abstract mixin class $UpdateMessageRequestCopyWith<$Res>  {
  factory $UpdateMessageRequestCopyWith(UpdateMessageRequest value, $Res Function(UpdateMessageRequest) _then) = _$UpdateMessageRequestCopyWithImpl;
@useResult
$Res call({
 String body
});




}
/// @nodoc
class _$UpdateMessageRequestCopyWithImpl<$Res>
    implements $UpdateMessageRequestCopyWith<$Res> {
  _$UpdateMessageRequestCopyWithImpl(this._self, this._then);

  final UpdateMessageRequest _self;
  final $Res Function(UpdateMessageRequest) _then;

/// Create a copy of UpdateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? body = null,}) {
  return _then(_self.copyWith(
body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateMessageRequest].
extension UpdateMessageRequestPatterns on UpdateMessageRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateMessageRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateMessageRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateMessageRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateMessageRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateMessageRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateMessageRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String body)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateMessageRequest() when $default != null:
return $default(_that.body);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String body)  $default,) {final _that = this;
switch (_that) {
case _UpdateMessageRequest():
return $default(_that.body);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String body)?  $default,) {final _that = this;
switch (_that) {
case _UpdateMessageRequest() when $default != null:
return $default(_that.body);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateMessageRequest implements UpdateMessageRequest {
  const _UpdateMessageRequest({required this.body});
  factory _UpdateMessageRequest.fromJson(Map<String, dynamic> json) => _$UpdateMessageRequestFromJson(json);

@override final  String body;

/// Create a copy of UpdateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateMessageRequestCopyWith<_UpdateMessageRequest> get copyWith => __$UpdateMessageRequestCopyWithImpl<_UpdateMessageRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateMessageRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateMessageRequest&&(identical(other.body, body) || other.body == body));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,body);

@override
String toString() {
  return 'UpdateMessageRequest(body: $body)';
}


}

/// @nodoc
abstract mixin class _$UpdateMessageRequestCopyWith<$Res> implements $UpdateMessageRequestCopyWith<$Res> {
  factory _$UpdateMessageRequestCopyWith(_UpdateMessageRequest value, $Res Function(_UpdateMessageRequest) _then) = __$UpdateMessageRequestCopyWithImpl;
@override @useResult
$Res call({
 String body
});




}
/// @nodoc
class __$UpdateMessageRequestCopyWithImpl<$Res>
    implements _$UpdateMessageRequestCopyWith<$Res> {
  __$UpdateMessageRequestCopyWithImpl(this._self, this._then);

  final _UpdateMessageRequest _self;
  final $Res Function(_UpdateMessageRequest) _then;

/// Create a copy of UpdateMessageRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? body = null,}) {
  return _then(_UpdateMessageRequest(
body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ChatUnreadCount {

 int get conversations; int get unread;
/// Create a copy of ChatUnreadCount
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatUnreadCountCopyWith<ChatUnreadCount> get copyWith => _$ChatUnreadCountCopyWithImpl<ChatUnreadCount>(this as ChatUnreadCount, _$identity);

  /// Serializes this ChatUnreadCount to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatUnreadCount&&(identical(other.conversations, conversations) || other.conversations == conversations)&&(identical(other.unread, unread) || other.unread == unread));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversations,unread);

@override
String toString() {
  return 'ChatUnreadCount(conversations: $conversations, unread: $unread)';
}


}

/// @nodoc
abstract mixin class $ChatUnreadCountCopyWith<$Res>  {
  factory $ChatUnreadCountCopyWith(ChatUnreadCount value, $Res Function(ChatUnreadCount) _then) = _$ChatUnreadCountCopyWithImpl;
@useResult
$Res call({
 int conversations, int unread
});




}
/// @nodoc
class _$ChatUnreadCountCopyWithImpl<$Res>
    implements $ChatUnreadCountCopyWith<$Res> {
  _$ChatUnreadCountCopyWithImpl(this._self, this._then);

  final ChatUnreadCount _self;
  final $Res Function(ChatUnreadCount) _then;

/// Create a copy of ChatUnreadCount
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversations = null,Object? unread = null,}) {
  return _then(_self.copyWith(
conversations: null == conversations ? _self.conversations : conversations // ignore: cast_nullable_to_non_nullable
as int,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatUnreadCount].
extension ChatUnreadCountPatterns on ChatUnreadCount {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatUnreadCount value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatUnreadCount() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatUnreadCount value)  $default,){
final _that = this;
switch (_that) {
case _ChatUnreadCount():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatUnreadCount value)?  $default,){
final _that = this;
switch (_that) {
case _ChatUnreadCount() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int conversations,  int unread)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatUnreadCount() when $default != null:
return $default(_that.conversations,_that.unread);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int conversations,  int unread)  $default,) {final _that = this;
switch (_that) {
case _ChatUnreadCount():
return $default(_that.conversations,_that.unread);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int conversations,  int unread)?  $default,) {final _that = this;
switch (_that) {
case _ChatUnreadCount() when $default != null:
return $default(_that.conversations,_that.unread);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatUnreadCount implements ChatUnreadCount {
  const _ChatUnreadCount({required this.conversations, required this.unread});
  factory _ChatUnreadCount.fromJson(Map<String, dynamic> json) => _$ChatUnreadCountFromJson(json);

@override final  int conversations;
@override final  int unread;

/// Create a copy of ChatUnreadCount
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatUnreadCountCopyWith<_ChatUnreadCount> get copyWith => __$ChatUnreadCountCopyWithImpl<_ChatUnreadCount>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatUnreadCountToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatUnreadCount&&(identical(other.conversations, conversations) || other.conversations == conversations)&&(identical(other.unread, unread) || other.unread == unread));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,conversations,unread);

@override
String toString() {
  return 'ChatUnreadCount(conversations: $conversations, unread: $unread)';
}


}

/// @nodoc
abstract mixin class _$ChatUnreadCountCopyWith<$Res> implements $ChatUnreadCountCopyWith<$Res> {
  factory _$ChatUnreadCountCopyWith(_ChatUnreadCount value, $Res Function(_ChatUnreadCount) _then) = __$ChatUnreadCountCopyWithImpl;
@override @useResult
$Res call({
 int conversations, int unread
});




}
/// @nodoc
class __$ChatUnreadCountCopyWithImpl<$Res>
    implements _$ChatUnreadCountCopyWith<$Res> {
  __$ChatUnreadCountCopyWithImpl(this._self, this._then);

  final _ChatUnreadCount _self;
  final $Res Function(_ChatUnreadCount) _then;

/// Create a copy of ChatUnreadCount
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversations = null,Object? unread = null,}) {
  return _then(_ChatUnreadCount(
conversations: null == conversations ? _self.conversations : conversations // ignore: cast_nullable_to_non_nullable
as int,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
