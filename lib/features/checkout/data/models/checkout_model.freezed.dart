// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$QuoteTransportItem {

@JsonKey(name: 'sku_id') String get skuId; int get quantity;@JsonKey(name: 'transport_option') String get transportOption;
/// Create a copy of QuoteTransportItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteTransportItemCopyWith<QuoteTransportItem> get copyWith => _$QuoteTransportItemCopyWithImpl<QuoteTransportItem>(this as QuoteTransportItem, _$identity);

  /// Serializes this QuoteTransportItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteTransportItem&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,skuId,quantity,transportOption);

@override
String toString() {
  return 'QuoteTransportItem(skuId: $skuId, quantity: $quantity, transportOption: $transportOption)';
}


}

/// @nodoc
abstract mixin class $QuoteTransportItemCopyWith<$Res>  {
  factory $QuoteTransportItemCopyWith(QuoteTransportItem value, $Res Function(QuoteTransportItem) _then) = _$QuoteTransportItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sku_id') String skuId, int quantity,@JsonKey(name: 'transport_option') String transportOption
});




}
/// @nodoc
class _$QuoteTransportItemCopyWithImpl<$Res>
    implements $QuoteTransportItemCopyWith<$Res> {
  _$QuoteTransportItemCopyWithImpl(this._self, this._then);

  final QuoteTransportItem _self;
  final $Res Function(QuoteTransportItem) _then;

/// Create a copy of QuoteTransportItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? skuId = null,Object? quantity = null,Object? transportOption = null,}) {
  return _then(_self.copyWith(
skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,transportOption: null == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteTransportItem].
extension QuoteTransportItemPatterns on QuoteTransportItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteTransportItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteTransportItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteTransportItem value)  $default,){
final _that = this;
switch (_that) {
case _QuoteTransportItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteTransportItem value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteTransportItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sku_id')  String skuId,  int quantity, @JsonKey(name: 'transport_option')  String transportOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteTransportItem() when $default != null:
return $default(_that.skuId,_that.quantity,_that.transportOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sku_id')  String skuId,  int quantity, @JsonKey(name: 'transport_option')  String transportOption)  $default,) {final _that = this;
switch (_that) {
case _QuoteTransportItem():
return $default(_that.skuId,_that.quantity,_that.transportOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sku_id')  String skuId,  int quantity, @JsonKey(name: 'transport_option')  String transportOption)?  $default,) {final _that = this;
switch (_that) {
case _QuoteTransportItem() when $default != null:
return $default(_that.skuId,_that.quantity,_that.transportOption);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuoteTransportItem implements QuoteTransportItem {
  const _QuoteTransportItem({@JsonKey(name: 'sku_id') required this.skuId, required this.quantity, @JsonKey(name: 'transport_option') required this.transportOption});
  factory _QuoteTransportItem.fromJson(Map<String, dynamic> json) => _$QuoteTransportItemFromJson(json);

@override@JsonKey(name: 'sku_id') final  String skuId;
@override final  int quantity;
@override@JsonKey(name: 'transport_option') final  String transportOption;

/// Create a copy of QuoteTransportItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteTransportItemCopyWith<_QuoteTransportItem> get copyWith => __$QuoteTransportItemCopyWithImpl<_QuoteTransportItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteTransportItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteTransportItem&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,skuId,quantity,transportOption);

@override
String toString() {
  return 'QuoteTransportItem(skuId: $skuId, quantity: $quantity, transportOption: $transportOption)';
}


}

/// @nodoc
abstract mixin class _$QuoteTransportItemCopyWith<$Res> implements $QuoteTransportItemCopyWith<$Res> {
  factory _$QuoteTransportItemCopyWith(_QuoteTransportItem value, $Res Function(_QuoteTransportItem) _then) = __$QuoteTransportItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sku_id') String skuId, int quantity,@JsonKey(name: 'transport_option') String transportOption
});




}
/// @nodoc
class __$QuoteTransportItemCopyWithImpl<$Res>
    implements _$QuoteTransportItemCopyWith<$Res> {
  __$QuoteTransportItemCopyWithImpl(this._self, this._then);

  final _QuoteTransportItem _self;
  final $Res Function(_QuoteTransportItem) _then;

/// Create a copy of QuoteTransportItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? skuId = null,Object? quantity = null,Object? transportOption = null,}) {
  return _then(_QuoteTransportItem(
skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,transportOption: null == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$QuoteTransportRequest {

 String get address; List<QuoteTransportItem> get items;
/// Create a copy of QuoteTransportRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteTransportRequestCopyWith<QuoteTransportRequest> get copyWith => _$QuoteTransportRequestCopyWithImpl<QuoteTransportRequest>(this as QuoteTransportRequest, _$identity);

  /// Serializes this QuoteTransportRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteTransportRequest&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'QuoteTransportRequest(address: $address, items: $items)';
}


}

/// @nodoc
abstract mixin class $QuoteTransportRequestCopyWith<$Res>  {
  factory $QuoteTransportRequestCopyWith(QuoteTransportRequest value, $Res Function(QuoteTransportRequest) _then) = _$QuoteTransportRequestCopyWithImpl;
@useResult
$Res call({
 String address, List<QuoteTransportItem> items
});




}
/// @nodoc
class _$QuoteTransportRequestCopyWithImpl<$Res>
    implements $QuoteTransportRequestCopyWith<$Res> {
  _$QuoteTransportRequestCopyWithImpl(this._self, this._then);

  final QuoteTransportRequest _self;
  final $Res Function(QuoteTransportRequest) _then;

/// Create a copy of QuoteTransportRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? address = null,Object? items = null,}) {
  return _then(_self.copyWith(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<QuoteTransportItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteTransportRequest].
extension QuoteTransportRequestPatterns on QuoteTransportRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteTransportRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteTransportRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteTransportRequest value)  $default,){
final _that = this;
switch (_that) {
case _QuoteTransportRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteTransportRequest value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteTransportRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String address,  List<QuoteTransportItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteTransportRequest() when $default != null:
return $default(_that.address,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String address,  List<QuoteTransportItem> items)  $default,) {final _that = this;
switch (_that) {
case _QuoteTransportRequest():
return $default(_that.address,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String address,  List<QuoteTransportItem> items)?  $default,) {final _that = this;
switch (_that) {
case _QuoteTransportRequest() when $default != null:
return $default(_that.address,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuoteTransportRequest implements QuoteTransportRequest {
  const _QuoteTransportRequest({required this.address, required final  List<QuoteTransportItem> items}): _items = items;
  factory _QuoteTransportRequest.fromJson(Map<String, dynamic> json) => _$QuoteTransportRequestFromJson(json);

@override final  String address;
 final  List<QuoteTransportItem> _items;
@override List<QuoteTransportItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of QuoteTransportRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteTransportRequestCopyWith<_QuoteTransportRequest> get copyWith => __$QuoteTransportRequestCopyWithImpl<_QuoteTransportRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteTransportRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteTransportRequest&&(identical(other.address, address) || other.address == address)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,address,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'QuoteTransportRequest(address: $address, items: $items)';
}


}

/// @nodoc
abstract mixin class _$QuoteTransportRequestCopyWith<$Res> implements $QuoteTransportRequestCopyWith<$Res> {
  factory _$QuoteTransportRequestCopyWith(_QuoteTransportRequest value, $Res Function(_QuoteTransportRequest) _then) = __$QuoteTransportRequestCopyWithImpl;
@override @useResult
$Res call({
 String address, List<QuoteTransportItem> items
});




}
/// @nodoc
class __$QuoteTransportRequestCopyWithImpl<$Res>
    implements _$QuoteTransportRequestCopyWith<$Res> {
  __$QuoteTransportRequestCopyWithImpl(this._self, this._then);

  final _QuoteTransportRequest _self;
  final $Res Function(_QuoteTransportRequest) _then;

/// Create a copy of QuoteTransportRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? address = null,Object? items = null,}) {
  return _then(_QuoteTransportRequest(
address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<QuoteTransportItem>,
  ));
}


}


/// @nodoc
mixin _$QuoteTransportResult {

@JsonKey(name: 'sku_id') String get skuId;@JsonKey(name: 'transport_option') String get transportOption; int get cost; String get currency;
/// Create a copy of QuoteTransportResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteTransportResultCopyWith<QuoteTransportResult> get copyWith => _$QuoteTransportResultCopyWithImpl<QuoteTransportResult>(this as QuoteTransportResult, _$identity);

  /// Serializes this QuoteTransportResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteTransportResult&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,skuId,transportOption,cost,currency);

@override
String toString() {
  return 'QuoteTransportResult(skuId: $skuId, transportOption: $transportOption, cost: $cost, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $QuoteTransportResultCopyWith<$Res>  {
  factory $QuoteTransportResultCopyWith(QuoteTransportResult value, $Res Function(QuoteTransportResult) _then) = _$QuoteTransportResultCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sku_id') String skuId,@JsonKey(name: 'transport_option') String transportOption, int cost, String currency
});




}
/// @nodoc
class _$QuoteTransportResultCopyWithImpl<$Res>
    implements $QuoteTransportResultCopyWith<$Res> {
  _$QuoteTransportResultCopyWithImpl(this._self, this._then);

  final QuoteTransportResult _self;
  final $Res Function(QuoteTransportResult) _then;

/// Create a copy of QuoteTransportResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? skuId = null,Object? transportOption = null,Object? cost = null,Object? currency = null,}) {
  return _then(_self.copyWith(
skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,transportOption: null == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteTransportResult].
extension QuoteTransportResultPatterns on QuoteTransportResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteTransportResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteTransportResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteTransportResult value)  $default,){
final _that = this;
switch (_that) {
case _QuoteTransportResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteTransportResult value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteTransportResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sku_id')  String skuId, @JsonKey(name: 'transport_option')  String transportOption,  int cost,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteTransportResult() when $default != null:
return $default(_that.skuId,_that.transportOption,_that.cost,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sku_id')  String skuId, @JsonKey(name: 'transport_option')  String transportOption,  int cost,  String currency)  $default,) {final _that = this;
switch (_that) {
case _QuoteTransportResult():
return $default(_that.skuId,_that.transportOption,_that.cost,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sku_id')  String skuId, @JsonKey(name: 'transport_option')  String transportOption,  int cost,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _QuoteTransportResult() when $default != null:
return $default(_that.skuId,_that.transportOption,_that.cost,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuoteTransportResult implements QuoteTransportResult {
  const _QuoteTransportResult({@JsonKey(name: 'sku_id') required this.skuId, @JsonKey(name: 'transport_option') required this.transportOption, required this.cost, required this.currency});
  factory _QuoteTransportResult.fromJson(Map<String, dynamic> json) => _$QuoteTransportResultFromJson(json);

@override@JsonKey(name: 'sku_id') final  String skuId;
@override@JsonKey(name: 'transport_option') final  String transportOption;
@override final  int cost;
@override final  String currency;

/// Create a copy of QuoteTransportResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteTransportResultCopyWith<_QuoteTransportResult> get copyWith => __$QuoteTransportResultCopyWithImpl<_QuoteTransportResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteTransportResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteTransportResult&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption)&&(identical(other.cost, cost) || other.cost == cost)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,skuId,transportOption,cost,currency);

@override
String toString() {
  return 'QuoteTransportResult(skuId: $skuId, transportOption: $transportOption, cost: $cost, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$QuoteTransportResultCopyWith<$Res> implements $QuoteTransportResultCopyWith<$Res> {
  factory _$QuoteTransportResultCopyWith(_QuoteTransportResult value, $Res Function(_QuoteTransportResult) _then) = __$QuoteTransportResultCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sku_id') String skuId,@JsonKey(name: 'transport_option') String transportOption, int cost, String currency
});




}
/// @nodoc
class __$QuoteTransportResultCopyWithImpl<$Res>
    implements _$QuoteTransportResultCopyWith<$Res> {
  __$QuoteTransportResultCopyWithImpl(this._self, this._then);

  final _QuoteTransportResult _self;
  final $Res Function(_QuoteTransportResult) _then;

/// Create a copy of QuoteTransportResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? skuId = null,Object? transportOption = null,Object? cost = null,Object? currency = null,}) {
  return _then(_QuoteTransportResult(
skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,transportOption: null == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String,cost: null == cost ? _self.cost : cost // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$QuoteTransportResponse {

 List<QuoteTransportResult> get items;
/// Create a copy of QuoteTransportResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuoteTransportResponseCopyWith<QuoteTransportResponse> get copyWith => _$QuoteTransportResponseCopyWithImpl<QuoteTransportResponse>(this as QuoteTransportResponse, _$identity);

  /// Serializes this QuoteTransportResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuoteTransportResponse&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'QuoteTransportResponse(items: $items)';
}


}

/// @nodoc
abstract mixin class $QuoteTransportResponseCopyWith<$Res>  {
  factory $QuoteTransportResponseCopyWith(QuoteTransportResponse value, $Res Function(QuoteTransportResponse) _then) = _$QuoteTransportResponseCopyWithImpl;
@useResult
$Res call({
 List<QuoteTransportResult> items
});




}
/// @nodoc
class _$QuoteTransportResponseCopyWithImpl<$Res>
    implements $QuoteTransportResponseCopyWith<$Res> {
  _$QuoteTransportResponseCopyWithImpl(this._self, this._then);

  final QuoteTransportResponse _self;
  final $Res Function(QuoteTransportResponse) _then;

/// Create a copy of QuoteTransportResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<QuoteTransportResult>,
  ));
}

}


/// Adds pattern-matching-related methods to [QuoteTransportResponse].
extension QuoteTransportResponsePatterns on QuoteTransportResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _QuoteTransportResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _QuoteTransportResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _QuoteTransportResponse value)  $default,){
final _that = this;
switch (_that) {
case _QuoteTransportResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _QuoteTransportResponse value)?  $default,){
final _that = this;
switch (_that) {
case _QuoteTransportResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<QuoteTransportResult> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _QuoteTransportResponse() when $default != null:
return $default(_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<QuoteTransportResult> items)  $default,) {final _that = this;
switch (_that) {
case _QuoteTransportResponse():
return $default(_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<QuoteTransportResult> items)?  $default,) {final _that = this;
switch (_that) {
case _QuoteTransportResponse() when $default != null:
return $default(_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _QuoteTransportResponse implements QuoteTransportResponse {
  const _QuoteTransportResponse({required final  List<QuoteTransportResult> items}): _items = items;
  factory _QuoteTransportResponse.fromJson(Map<String, dynamic> json) => _$QuoteTransportResponseFromJson(json);

 final  List<QuoteTransportResult> _items;
@override List<QuoteTransportResult> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of QuoteTransportResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$QuoteTransportResponseCopyWith<_QuoteTransportResponse> get copyWith => __$QuoteTransportResponseCopyWithImpl<_QuoteTransportResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$QuoteTransportResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _QuoteTransportResponse&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'QuoteTransportResponse(items: $items)';
}


}

/// @nodoc
abstract mixin class _$QuoteTransportResponseCopyWith<$Res> implements $QuoteTransportResponseCopyWith<$Res> {
  factory _$QuoteTransportResponseCopyWith(_QuoteTransportResponse value, $Res Function(_QuoteTransportResponse) _then) = __$QuoteTransportResponseCopyWithImpl;
@override @useResult
$Res call({
 List<QuoteTransportResult> items
});




}
/// @nodoc
class __$QuoteTransportResponseCopyWithImpl<$Res>
    implements _$QuoteTransportResponseCopyWith<$Res> {
  __$QuoteTransportResponseCopyWithImpl(this._self, this._then);

  final _QuoteTransportResponse _self;
  final $Res Function(_QuoteTransportResponse) _then;

/// Create a copy of QuoteTransportResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,}) {
  return _then(_QuoteTransportResponse(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<QuoteTransportResult>,
  ));
}


}


/// @nodoc
mixin _$CheckoutItem {

@JsonKey(name: 'sku_id') String get skuId; int get quantity;@JsonKey(name: 'transport_option') String get transportOption; String? get note;
/// Create a copy of CheckoutItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutItemCopyWith<CheckoutItem> get copyWith => _$CheckoutItemCopyWithImpl<CheckoutItem>(this as CheckoutItem, _$identity);

  /// Serializes this CheckoutItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutItem&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,skuId,quantity,transportOption,note);

@override
String toString() {
  return 'CheckoutItem(skuId: $skuId, quantity: $quantity, transportOption: $transportOption, note: $note)';
}


}

/// @nodoc
abstract mixin class $CheckoutItemCopyWith<$Res>  {
  factory $CheckoutItemCopyWith(CheckoutItem value, $Res Function(CheckoutItem) _then) = _$CheckoutItemCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'sku_id') String skuId, int quantity,@JsonKey(name: 'transport_option') String transportOption, String? note
});




}
/// @nodoc
class _$CheckoutItemCopyWithImpl<$Res>
    implements $CheckoutItemCopyWith<$Res> {
  _$CheckoutItemCopyWithImpl(this._self, this._then);

  final CheckoutItem _self;
  final $Res Function(CheckoutItem) _then;

/// Create a copy of CheckoutItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? skuId = null,Object? quantity = null,Object? transportOption = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,transportOption: null == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutItem].
extension CheckoutItemPatterns on CheckoutItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutItem value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutItem value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'sku_id')  String skuId,  int quantity, @JsonKey(name: 'transport_option')  String transportOption,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutItem() when $default != null:
return $default(_that.skuId,_that.quantity,_that.transportOption,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'sku_id')  String skuId,  int quantity, @JsonKey(name: 'transport_option')  String transportOption,  String? note)  $default,) {final _that = this;
switch (_that) {
case _CheckoutItem():
return $default(_that.skuId,_that.quantity,_that.transportOption,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'sku_id')  String skuId,  int quantity, @JsonKey(name: 'transport_option')  String transportOption,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutItem() when $default != null:
return $default(_that.skuId,_that.quantity,_that.transportOption,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutItem implements CheckoutItem {
  const _CheckoutItem({@JsonKey(name: 'sku_id') required this.skuId, required this.quantity, @JsonKey(name: 'transport_option') required this.transportOption, this.note});
  factory _CheckoutItem.fromJson(Map<String, dynamic> json) => _$CheckoutItemFromJson(json);

@override@JsonKey(name: 'sku_id') final  String skuId;
@override final  int quantity;
@override@JsonKey(name: 'transport_option') final  String transportOption;
@override final  String? note;

/// Create a copy of CheckoutItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutItemCopyWith<_CheckoutItem> get copyWith => __$CheckoutItemCopyWithImpl<_CheckoutItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutItem&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,skuId,quantity,transportOption,note);

@override
String toString() {
  return 'CheckoutItem(skuId: $skuId, quantity: $quantity, transportOption: $transportOption, note: $note)';
}


}

/// @nodoc
abstract mixin class _$CheckoutItemCopyWith<$Res> implements $CheckoutItemCopyWith<$Res> {
  factory _$CheckoutItemCopyWith(_CheckoutItem value, $Res Function(_CheckoutItem) _then) = __$CheckoutItemCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'sku_id') String skuId, int quantity,@JsonKey(name: 'transport_option') String transportOption, String? note
});




}
/// @nodoc
class __$CheckoutItemCopyWithImpl<$Res>
    implements _$CheckoutItemCopyWith<$Res> {
  __$CheckoutItemCopyWithImpl(this._self, this._then);

  final _CheckoutItem _self;
  final $Res Function(_CheckoutItem) _then;

/// Create a copy of CheckoutItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? skuId = null,Object? quantity = null,Object? transportOption = null,Object? note = freezed,}) {
  return _then(_CheckoutItem(
skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,transportOption: null == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CheckoutRequest {

@JsonKey(name: 'buy_now') bool get buyNow; String get address;@JsonKey(name: 'payment_option') String get paymentOption;@JsonKey(name: 'use_wallet') bool get useWallet;@JsonKey(name: 'promotion_codes') List<String>? get promotionCodes; List<CheckoutItem> get items;
/// Create a copy of CheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutRequestCopyWith<CheckoutRequest> get copyWith => _$CheckoutRequestCopyWithImpl<CheckoutRequest>(this as CheckoutRequest, _$identity);

  /// Serializes this CheckoutRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutRequest&&(identical(other.buyNow, buyNow) || other.buyNow == buyNow)&&(identical(other.address, address) || other.address == address)&&(identical(other.paymentOption, paymentOption) || other.paymentOption == paymentOption)&&(identical(other.useWallet, useWallet) || other.useWallet == useWallet)&&const DeepCollectionEquality().equals(other.promotionCodes, promotionCodes)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buyNow,address,paymentOption,useWallet,const DeepCollectionEquality().hash(promotionCodes),const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CheckoutRequest(buyNow: $buyNow, address: $address, paymentOption: $paymentOption, useWallet: $useWallet, promotionCodes: $promotionCodes, items: $items)';
}


}

/// @nodoc
abstract mixin class $CheckoutRequestCopyWith<$Res>  {
  factory $CheckoutRequestCopyWith(CheckoutRequest value, $Res Function(CheckoutRequest) _then) = _$CheckoutRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'buy_now') bool buyNow, String address,@JsonKey(name: 'payment_option') String paymentOption,@JsonKey(name: 'use_wallet') bool useWallet,@JsonKey(name: 'promotion_codes') List<String>? promotionCodes, List<CheckoutItem> items
});




}
/// @nodoc
class _$CheckoutRequestCopyWithImpl<$Res>
    implements $CheckoutRequestCopyWith<$Res> {
  _$CheckoutRequestCopyWithImpl(this._self, this._then);

  final CheckoutRequest _self;
  final $Res Function(CheckoutRequest) _then;

/// Create a copy of CheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buyNow = null,Object? address = null,Object? paymentOption = null,Object? useWallet = null,Object? promotionCodes = freezed,Object? items = null,}) {
  return _then(_self.copyWith(
buyNow: null == buyNow ? _self.buyNow : buyNow // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,paymentOption: null == paymentOption ? _self.paymentOption : paymentOption // ignore: cast_nullable_to_non_nullable
as String,useWallet: null == useWallet ? _self.useWallet : useWallet // ignore: cast_nullable_to_non_nullable
as bool,promotionCodes: freezed == promotionCodes ? _self.promotionCodes : promotionCodes // ignore: cast_nullable_to_non_nullable
as List<String>?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CheckoutItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutRequest].
extension CheckoutRequestPatterns on CheckoutRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutRequest value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'buy_now')  bool buyNow,  String address, @JsonKey(name: 'payment_option')  String paymentOption, @JsonKey(name: 'use_wallet')  bool useWallet, @JsonKey(name: 'promotion_codes')  List<String>? promotionCodes,  List<CheckoutItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutRequest() when $default != null:
return $default(_that.buyNow,_that.address,_that.paymentOption,_that.useWallet,_that.promotionCodes,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'buy_now')  bool buyNow,  String address, @JsonKey(name: 'payment_option')  String paymentOption, @JsonKey(name: 'use_wallet')  bool useWallet, @JsonKey(name: 'promotion_codes')  List<String>? promotionCodes,  List<CheckoutItem> items)  $default,) {final _that = this;
switch (_that) {
case _CheckoutRequest():
return $default(_that.buyNow,_that.address,_that.paymentOption,_that.useWallet,_that.promotionCodes,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'buy_now')  bool buyNow,  String address, @JsonKey(name: 'payment_option')  String paymentOption, @JsonKey(name: 'use_wallet')  bool useWallet, @JsonKey(name: 'promotion_codes')  List<String>? promotionCodes,  List<CheckoutItem> items)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutRequest() when $default != null:
return $default(_that.buyNow,_that.address,_that.paymentOption,_that.useWallet,_that.promotionCodes,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutRequest implements CheckoutRequest {
  const _CheckoutRequest({@JsonKey(name: 'buy_now') required this.buyNow, required this.address, @JsonKey(name: 'payment_option') required this.paymentOption, @JsonKey(name: 'use_wallet') required this.useWallet, @JsonKey(name: 'promotion_codes') final  List<String>? promotionCodes, required final  List<CheckoutItem> items}): _promotionCodes = promotionCodes,_items = items;
  factory _CheckoutRequest.fromJson(Map<String, dynamic> json) => _$CheckoutRequestFromJson(json);

@override@JsonKey(name: 'buy_now') final  bool buyNow;
@override final  String address;
@override@JsonKey(name: 'payment_option') final  String paymentOption;
@override@JsonKey(name: 'use_wallet') final  bool useWallet;
 final  List<String>? _promotionCodes;
@override@JsonKey(name: 'promotion_codes') List<String>? get promotionCodes {
  final value = _promotionCodes;
  if (value == null) return null;
  if (_promotionCodes is EqualUnmodifiableListView) return _promotionCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<CheckoutItem> _items;
@override List<CheckoutItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutRequestCopyWith<_CheckoutRequest> get copyWith => __$CheckoutRequestCopyWithImpl<_CheckoutRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutRequest&&(identical(other.buyNow, buyNow) || other.buyNow == buyNow)&&(identical(other.address, address) || other.address == address)&&(identical(other.paymentOption, paymentOption) || other.paymentOption == paymentOption)&&(identical(other.useWallet, useWallet) || other.useWallet == useWallet)&&const DeepCollectionEquality().equals(other._promotionCodes, _promotionCodes)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buyNow,address,paymentOption,useWallet,const DeepCollectionEquality().hash(_promotionCodes),const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CheckoutRequest(buyNow: $buyNow, address: $address, paymentOption: $paymentOption, useWallet: $useWallet, promotionCodes: $promotionCodes, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CheckoutRequestCopyWith<$Res> implements $CheckoutRequestCopyWith<$Res> {
  factory _$CheckoutRequestCopyWith(_CheckoutRequest value, $Res Function(_CheckoutRequest) _then) = __$CheckoutRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'buy_now') bool buyNow, String address,@JsonKey(name: 'payment_option') String paymentOption,@JsonKey(name: 'use_wallet') bool useWallet,@JsonKey(name: 'promotion_codes') List<String>? promotionCodes, List<CheckoutItem> items
});




}
/// @nodoc
class __$CheckoutRequestCopyWithImpl<$Res>
    implements _$CheckoutRequestCopyWith<$Res> {
  __$CheckoutRequestCopyWithImpl(this._self, this._then);

  final _CheckoutRequest _self;
  final $Res Function(_CheckoutRequest) _then;

/// Create a copy of CheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buyNow = null,Object? address = null,Object? paymentOption = null,Object? useWallet = null,Object? promotionCodes = freezed,Object? items = null,}) {
  return _then(_CheckoutRequest(
buyNow: null == buyNow ? _self.buyNow : buyNow // ignore: cast_nullable_to_non_nullable
as bool,address: null == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String,paymentOption: null == paymentOption ? _self.paymentOption : paymentOption // ignore: cast_nullable_to_non_nullable
as String,useWallet: null == useWallet ? _self.useWallet : useWallet // ignore: cast_nullable_to_non_nullable
as bool,promotionCodes: freezed == promotionCodes ? _self._promotionCodes : promotionCodes // ignore: cast_nullable_to_non_nullable
as List<String>?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CheckoutItem>,
  ));
}


}


/// @nodoc
mixin _$CheckoutResponse {

@JsonKey(name: 'checkout_session_id') String get checkoutSessionId;@JsonKey(name: 'payment_url') String? get paymentUrl;
/// Create a copy of CheckoutResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutResponseCopyWith<CheckoutResponse> get copyWith => _$CheckoutResponseCopyWithImpl<CheckoutResponse>(this as CheckoutResponse, _$identity);

  /// Serializes this CheckoutResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutResponse&&(identical(other.checkoutSessionId, checkoutSessionId) || other.checkoutSessionId == checkoutSessionId)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checkoutSessionId,paymentUrl);

@override
String toString() {
  return 'CheckoutResponse(checkoutSessionId: $checkoutSessionId, paymentUrl: $paymentUrl)';
}


}

/// @nodoc
abstract mixin class $CheckoutResponseCopyWith<$Res>  {
  factory $CheckoutResponseCopyWith(CheckoutResponse value, $Res Function(CheckoutResponse) _then) = _$CheckoutResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'checkout_session_id') String checkoutSessionId,@JsonKey(name: 'payment_url') String? paymentUrl
});




}
/// @nodoc
class _$CheckoutResponseCopyWithImpl<$Res>
    implements $CheckoutResponseCopyWith<$Res> {
  _$CheckoutResponseCopyWithImpl(this._self, this._then);

  final CheckoutResponse _self;
  final $Res Function(CheckoutResponse) _then;

/// Create a copy of CheckoutResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? checkoutSessionId = null,Object? paymentUrl = freezed,}) {
  return _then(_self.copyWith(
checkoutSessionId: null == checkoutSessionId ? _self.checkoutSessionId : checkoutSessionId // ignore: cast_nullable_to_non_nullable
as String,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutResponse].
extension CheckoutResponsePatterns on CheckoutResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutResponse value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'checkout_session_id')  String checkoutSessionId, @JsonKey(name: 'payment_url')  String? paymentUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutResponse() when $default != null:
return $default(_that.checkoutSessionId,_that.paymentUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'checkout_session_id')  String checkoutSessionId, @JsonKey(name: 'payment_url')  String? paymentUrl)  $default,) {final _that = this;
switch (_that) {
case _CheckoutResponse():
return $default(_that.checkoutSessionId,_that.paymentUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'checkout_session_id')  String checkoutSessionId, @JsonKey(name: 'payment_url')  String? paymentUrl)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutResponse() when $default != null:
return $default(_that.checkoutSessionId,_that.paymentUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutResponse implements CheckoutResponse {
  const _CheckoutResponse({@JsonKey(name: 'checkout_session_id') required this.checkoutSessionId, @JsonKey(name: 'payment_url') this.paymentUrl});
  factory _CheckoutResponse.fromJson(Map<String, dynamic> json) => _$CheckoutResponseFromJson(json);

@override@JsonKey(name: 'checkout_session_id') final  String checkoutSessionId;
@override@JsonKey(name: 'payment_url') final  String? paymentUrl;

/// Create a copy of CheckoutResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutResponseCopyWith<_CheckoutResponse> get copyWith => __$CheckoutResponseCopyWithImpl<_CheckoutResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutResponse&&(identical(other.checkoutSessionId, checkoutSessionId) || other.checkoutSessionId == checkoutSessionId)&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,checkoutSessionId,paymentUrl);

@override
String toString() {
  return 'CheckoutResponse(checkoutSessionId: $checkoutSessionId, paymentUrl: $paymentUrl)';
}


}

/// @nodoc
abstract mixin class _$CheckoutResponseCopyWith<$Res> implements $CheckoutResponseCopyWith<$Res> {
  factory _$CheckoutResponseCopyWith(_CheckoutResponse value, $Res Function(_CheckoutResponse) _then) = __$CheckoutResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'checkout_session_id') String checkoutSessionId,@JsonKey(name: 'payment_url') String? paymentUrl
});




}
/// @nodoc
class __$CheckoutResponseCopyWithImpl<$Res>
    implements _$CheckoutResponseCopyWith<$Res> {
  __$CheckoutResponseCopyWithImpl(this._self, this._then);

  final _CheckoutResponse _self;
  final $Res Function(_CheckoutResponse) _then;

/// Create a copy of CheckoutResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? checkoutSessionId = null,Object? paymentUrl = freezed,}) {
  return _then(_CheckoutResponse(
checkoutSessionId: null == checkoutSessionId ? _self.checkoutSessionId : checkoutSessionId // ignore: cast_nullable_to_non_nullable
as String,paymentUrl: freezed == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PaymentUrlResponse {

@JsonKey(name: 'payment_url') String get paymentUrl;
/// Create a copy of PaymentUrlResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentUrlResponseCopyWith<PaymentUrlResponse> get copyWith => _$PaymentUrlResponseCopyWithImpl<PaymentUrlResponse>(this as PaymentUrlResponse, _$identity);

  /// Serializes this PaymentUrlResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentUrlResponse&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentUrl);

@override
String toString() {
  return 'PaymentUrlResponse(paymentUrl: $paymentUrl)';
}


}

/// @nodoc
abstract mixin class $PaymentUrlResponseCopyWith<$Res>  {
  factory $PaymentUrlResponseCopyWith(PaymentUrlResponse value, $Res Function(PaymentUrlResponse) _then) = _$PaymentUrlResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'payment_url') String paymentUrl
});




}
/// @nodoc
class _$PaymentUrlResponseCopyWithImpl<$Res>
    implements $PaymentUrlResponseCopyWith<$Res> {
  _$PaymentUrlResponseCopyWithImpl(this._self, this._then);

  final PaymentUrlResponse _self;
  final $Res Function(PaymentUrlResponse) _then;

/// Create a copy of PaymentUrlResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentUrl = null,}) {
  return _then(_self.copyWith(
paymentUrl: null == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentUrlResponse].
extension PaymentUrlResponsePatterns on PaymentUrlResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentUrlResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentUrlResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentUrlResponse value)  $default,){
final _that = this;
switch (_that) {
case _PaymentUrlResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentUrlResponse value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentUrlResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'payment_url')  String paymentUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentUrlResponse() when $default != null:
return $default(_that.paymentUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'payment_url')  String paymentUrl)  $default,) {final _that = this;
switch (_that) {
case _PaymentUrlResponse():
return $default(_that.paymentUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'payment_url')  String paymentUrl)?  $default,) {final _that = this;
switch (_that) {
case _PaymentUrlResponse() when $default != null:
return $default(_that.paymentUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentUrlResponse implements PaymentUrlResponse {
  const _PaymentUrlResponse({@JsonKey(name: 'payment_url') required this.paymentUrl});
  factory _PaymentUrlResponse.fromJson(Map<String, dynamic> json) => _$PaymentUrlResponseFromJson(json);

@override@JsonKey(name: 'payment_url') final  String paymentUrl;

/// Create a copy of PaymentUrlResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentUrlResponseCopyWith<_PaymentUrlResponse> get copyWith => __$PaymentUrlResponseCopyWithImpl<_PaymentUrlResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentUrlResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentUrlResponse&&(identical(other.paymentUrl, paymentUrl) || other.paymentUrl == paymentUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentUrl);

@override
String toString() {
  return 'PaymentUrlResponse(paymentUrl: $paymentUrl)';
}


}

/// @nodoc
abstract mixin class _$PaymentUrlResponseCopyWith<$Res> implements $PaymentUrlResponseCopyWith<$Res> {
  factory _$PaymentUrlResponseCopyWith(_PaymentUrlResponse value, $Res Function(_PaymentUrlResponse) _then) = __$PaymentUrlResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'payment_url') String paymentUrl
});




}
/// @nodoc
class __$PaymentUrlResponseCopyWithImpl<$Res>
    implements _$PaymentUrlResponseCopyWith<$Res> {
  __$PaymentUrlResponseCopyWithImpl(this._self, this._then);

  final _PaymentUrlResponse _self;
  final $Res Function(_PaymentUrlResponse) _then;

/// Create a copy of PaymentUrlResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentUrl = null,}) {
  return _then(_PaymentUrlResponse(
paymentUrl: null == paymentUrl ? _self.paymentUrl : paymentUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CheckoutSession {

 int get id; String get kind; String get status; String? get note; String get currency;@JsonKey(name: 'total_amount') int get totalAmount;@JsonKey(name: 'date_created') String get dateCreated;@JsonKey(name: 'date_paid') String? get datePaid;
/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutSessionCopyWith<CheckoutSession> get copyWith => _$CheckoutSessionCopyWithImpl<CheckoutSession>(this as CheckoutSession, _$identity);

  /// Serializes this CheckoutSession to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutSession&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.datePaid, datePaid) || other.datePaid == datePaid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,status,note,currency,totalAmount,dateCreated,datePaid);

@override
String toString() {
  return 'CheckoutSession(id: $id, kind: $kind, status: $status, note: $note, currency: $currency, totalAmount: $totalAmount, dateCreated: $dateCreated, datePaid: $datePaid)';
}


}

/// @nodoc
abstract mixin class $CheckoutSessionCopyWith<$Res>  {
  factory $CheckoutSessionCopyWith(CheckoutSession value, $Res Function(CheckoutSession) _then) = _$CheckoutSessionCopyWithImpl;
@useResult
$Res call({
 int id, String kind, String status, String? note, String currency,@JsonKey(name: 'total_amount') int totalAmount,@JsonKey(name: 'date_created') String dateCreated,@JsonKey(name: 'date_paid') String? datePaid
});




}
/// @nodoc
class _$CheckoutSessionCopyWithImpl<$Res>
    implements $CheckoutSessionCopyWith<$Res> {
  _$CheckoutSessionCopyWithImpl(this._self, this._then);

  final CheckoutSession _self;
  final $Res Function(CheckoutSession) _then;

/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? status = null,Object? note = freezed,Object? currency = null,Object? totalAmount = null,Object? dateCreated = null,Object? datePaid = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,datePaid: freezed == datePaid ? _self.datePaid : datePaid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutSession].
extension CheckoutSessionPatterns on CheckoutSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutSession value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutSession value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String kind,  String status,  String? note,  String currency, @JsonKey(name: 'total_amount')  int totalAmount, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'date_paid')  String? datePaid)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutSession() when $default != null:
return $default(_that.id,_that.kind,_that.status,_that.note,_that.currency,_that.totalAmount,_that.dateCreated,_that.datePaid);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String kind,  String status,  String? note,  String currency, @JsonKey(name: 'total_amount')  int totalAmount, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'date_paid')  String? datePaid)  $default,) {final _that = this;
switch (_that) {
case _CheckoutSession():
return $default(_that.id,_that.kind,_that.status,_that.note,_that.currency,_that.totalAmount,_that.dateCreated,_that.datePaid);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String kind,  String status,  String? note,  String currency, @JsonKey(name: 'total_amount')  int totalAmount, @JsonKey(name: 'date_created')  String dateCreated, @JsonKey(name: 'date_paid')  String? datePaid)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutSession() when $default != null:
return $default(_that.id,_that.kind,_that.status,_that.note,_that.currency,_that.totalAmount,_that.dateCreated,_that.datePaid);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutSession implements CheckoutSession {
  const _CheckoutSession({required this.id, required this.kind, required this.status, this.note, required this.currency, @JsonKey(name: 'total_amount') required this.totalAmount, @JsonKey(name: 'date_created') required this.dateCreated, @JsonKey(name: 'date_paid') this.datePaid});
  factory _CheckoutSession.fromJson(Map<String, dynamic> json) => _$CheckoutSessionFromJson(json);

@override final  int id;
@override final  String kind;
@override final  String status;
@override final  String? note;
@override final  String currency;
@override@JsonKey(name: 'total_amount') final  int totalAmount;
@override@JsonKey(name: 'date_created') final  String dateCreated;
@override@JsonKey(name: 'date_paid') final  String? datePaid;

/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutSessionCopyWith<_CheckoutSession> get copyWith => __$CheckoutSessionCopyWithImpl<_CheckoutSession>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutSessionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutSession&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.datePaid, datePaid) || other.datePaid == datePaid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,kind,status,note,currency,totalAmount,dateCreated,datePaid);

@override
String toString() {
  return 'CheckoutSession(id: $id, kind: $kind, status: $status, note: $note, currency: $currency, totalAmount: $totalAmount, dateCreated: $dateCreated, datePaid: $datePaid)';
}


}

/// @nodoc
abstract mixin class _$CheckoutSessionCopyWith<$Res> implements $CheckoutSessionCopyWith<$Res> {
  factory _$CheckoutSessionCopyWith(_CheckoutSession value, $Res Function(_CheckoutSession) _then) = __$CheckoutSessionCopyWithImpl;
@override @useResult
$Res call({
 int id, String kind, String status, String? note, String currency,@JsonKey(name: 'total_amount') int totalAmount,@JsonKey(name: 'date_created') String dateCreated,@JsonKey(name: 'date_paid') String? datePaid
});




}
/// @nodoc
class __$CheckoutSessionCopyWithImpl<$Res>
    implements _$CheckoutSessionCopyWith<$Res> {
  __$CheckoutSessionCopyWithImpl(this._self, this._then);

  final _CheckoutSession _self;
  final $Res Function(_CheckoutSession) _then;

/// Create a copy of CheckoutSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? status = null,Object? note = freezed,Object? currency = null,Object? totalAmount = null,Object? dateCreated = null,Object? datePaid = freezed,}) {
  return _then(_CheckoutSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,dateCreated: null == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String,datePaid: freezed == datePaid ? _self.datePaid : datePaid // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CheckoutSummaryItem {

 int get id;@JsonKey(name: 'sku_id') String get skuId;@JsonKey(name: 'spu_id') String get spuId; String get slug;@JsonKey(name: 'sku_name') String get skuName; int get quantity;@JsonKey(name: 'total_amount') int get totalAmount; String get currency;@JsonKey(name: 'image_url') String? get imageUrl;
/// Create a copy of CheckoutSummaryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutSummaryItemCopyWith<CheckoutSummaryItem> get copyWith => _$CheckoutSummaryItemCopyWithImpl<CheckoutSummaryItem>(this as CheckoutSummaryItem, _$identity);

  /// Serializes this CheckoutSummaryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutSummaryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.skuName, skuName) || other.skuName == skuName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,skuId,spuId,slug,skuName,quantity,totalAmount,currency,imageUrl);

@override
String toString() {
  return 'CheckoutSummaryItem(id: $id, skuId: $skuId, spuId: $spuId, slug: $slug, skuName: $skuName, quantity: $quantity, totalAmount: $totalAmount, currency: $currency, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $CheckoutSummaryItemCopyWith<$Res>  {
  factory $CheckoutSummaryItemCopyWith(CheckoutSummaryItem value, $Res Function(CheckoutSummaryItem) _then) = _$CheckoutSummaryItemCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'sku_id') String skuId,@JsonKey(name: 'spu_id') String spuId, String slug,@JsonKey(name: 'sku_name') String skuName, int quantity,@JsonKey(name: 'total_amount') int totalAmount, String currency,@JsonKey(name: 'image_url') String? imageUrl
});




}
/// @nodoc
class _$CheckoutSummaryItemCopyWithImpl<$Res>
    implements $CheckoutSummaryItemCopyWith<$Res> {
  _$CheckoutSummaryItemCopyWithImpl(this._self, this._then);

  final CheckoutSummaryItem _self;
  final $Res Function(CheckoutSummaryItem) _then;

/// Create a copy of CheckoutSummaryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? skuId = null,Object? spuId = null,Object? slug = null,Object? skuName = null,Object? quantity = null,Object? totalAmount = null,Object? currency = null,Object? imageUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,skuName: null == skuName ? _self.skuName : skuName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutSummaryItem].
extension CheckoutSummaryItemPatterns on CheckoutSummaryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutSummaryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutSummaryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutSummaryItem value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutSummaryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutSummaryItem value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutSummaryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'sku_id')  String skuId, @JsonKey(name: 'spu_id')  String spuId,  String slug, @JsonKey(name: 'sku_name')  String skuName,  int quantity, @JsonKey(name: 'total_amount')  int totalAmount,  String currency, @JsonKey(name: 'image_url')  String? imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutSummaryItem() when $default != null:
return $default(_that.id,_that.skuId,_that.spuId,_that.slug,_that.skuName,_that.quantity,_that.totalAmount,_that.currency,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'sku_id')  String skuId, @JsonKey(name: 'spu_id')  String spuId,  String slug, @JsonKey(name: 'sku_name')  String skuName,  int quantity, @JsonKey(name: 'total_amount')  int totalAmount,  String currency, @JsonKey(name: 'image_url')  String? imageUrl)  $default,) {final _that = this;
switch (_that) {
case _CheckoutSummaryItem():
return $default(_that.id,_that.skuId,_that.spuId,_that.slug,_that.skuName,_that.quantity,_that.totalAmount,_that.currency,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'sku_id')  String skuId, @JsonKey(name: 'spu_id')  String spuId,  String slug, @JsonKey(name: 'sku_name')  String skuName,  int quantity, @JsonKey(name: 'total_amount')  int totalAmount,  String currency, @JsonKey(name: 'image_url')  String? imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutSummaryItem() when $default != null:
return $default(_that.id,_that.skuId,_that.spuId,_that.slug,_that.skuName,_that.quantity,_that.totalAmount,_that.currency,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutSummaryItem implements CheckoutSummaryItem {
  const _CheckoutSummaryItem({required this.id, @JsonKey(name: 'sku_id') required this.skuId, @JsonKey(name: 'spu_id') required this.spuId, required this.slug, @JsonKey(name: 'sku_name') required this.skuName, required this.quantity, @JsonKey(name: 'total_amount') required this.totalAmount, required this.currency, @JsonKey(name: 'image_url') this.imageUrl});
  factory _CheckoutSummaryItem.fromJson(Map<String, dynamic> json) => _$CheckoutSummaryItemFromJson(json);

@override final  int id;
@override@JsonKey(name: 'sku_id') final  String skuId;
@override@JsonKey(name: 'spu_id') final  String spuId;
@override final  String slug;
@override@JsonKey(name: 'sku_name') final  String skuName;
@override final  int quantity;
@override@JsonKey(name: 'total_amount') final  int totalAmount;
@override final  String currency;
@override@JsonKey(name: 'image_url') final  String? imageUrl;

/// Create a copy of CheckoutSummaryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutSummaryItemCopyWith<_CheckoutSummaryItem> get copyWith => __$CheckoutSummaryItemCopyWithImpl<_CheckoutSummaryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutSummaryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutSummaryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.skuId, skuId) || other.skuId == skuId)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.skuName, skuName) || other.skuName == skuName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,skuId,spuId,slug,skuName,quantity,totalAmount,currency,imageUrl);

@override
String toString() {
  return 'CheckoutSummaryItem(id: $id, skuId: $skuId, spuId: $spuId, slug: $slug, skuName: $skuName, quantity: $quantity, totalAmount: $totalAmount, currency: $currency, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$CheckoutSummaryItemCopyWith<$Res> implements $CheckoutSummaryItemCopyWith<$Res> {
  factory _$CheckoutSummaryItemCopyWith(_CheckoutSummaryItem value, $Res Function(_CheckoutSummaryItem) _then) = __$CheckoutSummaryItemCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'sku_id') String skuId,@JsonKey(name: 'spu_id') String spuId, String slug,@JsonKey(name: 'sku_name') String skuName, int quantity,@JsonKey(name: 'total_amount') int totalAmount, String currency,@JsonKey(name: 'image_url') String? imageUrl
});




}
/// @nodoc
class __$CheckoutSummaryItemCopyWithImpl<$Res>
    implements _$CheckoutSummaryItemCopyWith<$Res> {
  __$CheckoutSummaryItemCopyWithImpl(this._self, this._then);

  final _CheckoutSummaryItem _self;
  final $Res Function(_CheckoutSummaryItem) _then;

/// Create a copy of CheckoutSummaryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? skuId = null,Object? spuId = null,Object? slug = null,Object? skuName = null,Object? quantity = null,Object? totalAmount = null,Object? currency = null,Object? imageUrl = freezed,}) {
  return _then(_CheckoutSummaryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,skuId: null == skuId ? _self.skuId : skuId // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,skuName: null == skuName ? _self.skuName : skuName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CheckoutSummary {

 CheckoutSession get session; List<CheckoutSummaryItem> get items;
/// Create a copy of CheckoutSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutSummaryCopyWith<CheckoutSummary> get copyWith => _$CheckoutSummaryCopyWithImpl<CheckoutSummary>(this as CheckoutSummary, _$identity);

  /// Serializes this CheckoutSummary to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutSummary&&(identical(other.session, session) || other.session == session)&&const DeepCollectionEquality().equals(other.items, items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,const DeepCollectionEquality().hash(items));

@override
String toString() {
  return 'CheckoutSummary(session: $session, items: $items)';
}


}

/// @nodoc
abstract mixin class $CheckoutSummaryCopyWith<$Res>  {
  factory $CheckoutSummaryCopyWith(CheckoutSummary value, $Res Function(CheckoutSummary) _then) = _$CheckoutSummaryCopyWithImpl;
@useResult
$Res call({
 CheckoutSession session, List<CheckoutSummaryItem> items
});


$CheckoutSessionCopyWith<$Res> get session;

}
/// @nodoc
class _$CheckoutSummaryCopyWithImpl<$Res>
    implements $CheckoutSummaryCopyWith<$Res> {
  _$CheckoutSummaryCopyWithImpl(this._self, this._then);

  final CheckoutSummary _self;
  final $Res Function(CheckoutSummary) _then;

/// Create a copy of CheckoutSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? session = null,Object? items = null,}) {
  return _then(_self.copyWith(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as CheckoutSession,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CheckoutSummaryItem>,
  ));
}
/// Create a copy of CheckoutSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutSessionCopyWith<$Res> get session {
  
  return $CheckoutSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckoutSummary].
extension CheckoutSummaryPatterns on CheckoutSummary {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutSummary() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutSummary value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutSummary():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutSummary value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutSummary() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CheckoutSession session,  List<CheckoutSummaryItem> items)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutSummary() when $default != null:
return $default(_that.session,_that.items);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CheckoutSession session,  List<CheckoutSummaryItem> items)  $default,) {final _that = this;
switch (_that) {
case _CheckoutSummary():
return $default(_that.session,_that.items);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CheckoutSession session,  List<CheckoutSummaryItem> items)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutSummary() when $default != null:
return $default(_that.session,_that.items);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutSummary implements CheckoutSummary {
  const _CheckoutSummary({required this.session, required final  List<CheckoutSummaryItem> items}): _items = items;
  factory _CheckoutSummary.fromJson(Map<String, dynamic> json) => _$CheckoutSummaryFromJson(json);

@override final  CheckoutSession session;
 final  List<CheckoutSummaryItem> _items;
@override List<CheckoutSummaryItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}


/// Create a copy of CheckoutSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutSummaryCopyWith<_CheckoutSummary> get copyWith => __$CheckoutSummaryCopyWithImpl<_CheckoutSummary>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutSummaryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutSummary&&(identical(other.session, session) || other.session == session)&&const DeepCollectionEquality().equals(other._items, _items));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,session,const DeepCollectionEquality().hash(_items));

@override
String toString() {
  return 'CheckoutSummary(session: $session, items: $items)';
}


}

/// @nodoc
abstract mixin class _$CheckoutSummaryCopyWith<$Res> implements $CheckoutSummaryCopyWith<$Res> {
  factory _$CheckoutSummaryCopyWith(_CheckoutSummary value, $Res Function(_CheckoutSummary) _then) = __$CheckoutSummaryCopyWithImpl;
@override @useResult
$Res call({
 CheckoutSession session, List<CheckoutSummaryItem> items
});


@override $CheckoutSessionCopyWith<$Res> get session;

}
/// @nodoc
class __$CheckoutSummaryCopyWithImpl<$Res>
    implements _$CheckoutSummaryCopyWith<$Res> {
  __$CheckoutSummaryCopyWithImpl(this._self, this._then);

  final _CheckoutSummary _self;
  final $Res Function(_CheckoutSummary) _then;

/// Create a copy of CheckoutSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? session = null,Object? items = null,}) {
  return _then(_CheckoutSummary(
session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as CheckoutSession,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CheckoutSummaryItem>,
  ));
}

/// Create a copy of CheckoutSummary
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutSessionCopyWith<$Res> get session {
  
  return $CheckoutSessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
