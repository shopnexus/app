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
mixin _$CheckoutLine {

@JsonKey(name: 'variant_id') String get variantId; int get quantity;
/// Create a copy of CheckoutLine
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutLineCopyWith<CheckoutLine> get copyWith => _$CheckoutLineCopyWithImpl<CheckoutLine>(this as CheckoutLine, _$identity);

  /// Serializes this CheckoutLine to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutLine&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,quantity);

@override
String toString() {
  return 'CheckoutLine(variantId: $variantId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $CheckoutLineCopyWith<$Res>  {
  factory $CheckoutLineCopyWith(CheckoutLine value, $Res Function(CheckoutLine) _then) = _$CheckoutLineCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'variant_id') String variantId, int quantity
});




}
/// @nodoc
class _$CheckoutLineCopyWithImpl<$Res>
    implements $CheckoutLineCopyWith<$Res> {
  _$CheckoutLineCopyWithImpl(this._self, this._then);

  final CheckoutLine _self;
  final $Res Function(CheckoutLine) _then;

/// Create a copy of CheckoutLine
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutLine].
extension CheckoutLinePatterns on CheckoutLine {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutLine value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutLine() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutLine value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutLine():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutLine value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutLine() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'variant_id')  String variantId,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutLine() when $default != null:
return $default(_that.variantId,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'variant_id')  String variantId,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _CheckoutLine():
return $default(_that.variantId,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'variant_id')  String variantId,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutLine() when $default != null:
return $default(_that.variantId,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutLine implements CheckoutLine {
  const _CheckoutLine({@JsonKey(name: 'variant_id') required this.variantId, required this.quantity});
  factory _CheckoutLine.fromJson(Map<String, dynamic> json) => _$CheckoutLineFromJson(json);

@override@JsonKey(name: 'variant_id') final  String variantId;
@override final  int quantity;

/// Create a copy of CheckoutLine
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutLineCopyWith<_CheckoutLine> get copyWith => __$CheckoutLineCopyWithImpl<_CheckoutLine>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutLineToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutLine&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,quantity);

@override
String toString() {
  return 'CheckoutLine(variantId: $variantId, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$CheckoutLineCopyWith<$Res> implements $CheckoutLineCopyWith<$Res> {
  factory _$CheckoutLineCopyWith(_CheckoutLine value, $Res Function(_CheckoutLine) _then) = __$CheckoutLineCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'variant_id') String variantId, int quantity
});




}
/// @nodoc
class __$CheckoutLineCopyWithImpl<$Res>
    implements _$CheckoutLineCopyWith<$Res> {
  __$CheckoutLineCopyWithImpl(this._self, this._then);

  final _CheckoutLine _self;
  final $Res Function(_CheckoutLine) _then;

/// Create a copy of CheckoutLine
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? quantity = null,}) {
  return _then(_CheckoutLine(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CheckoutRequest {

@JsonKey(name: 'contact_id') String get contactId; String get currency; List<CheckoutLine> get lines; String? get note;@JsonKey(name: 'transport_option') String get transportOption;
/// Create a copy of CheckoutRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutRequestCopyWith<CheckoutRequest> get copyWith => _$CheckoutRequestCopyWithImpl<CheckoutRequest>(this as CheckoutRequest, _$identity);

  /// Serializes this CheckoutRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutRequest&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.lines, lines)&&(identical(other.note, note) || other.note == note)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,currency,const DeepCollectionEquality().hash(lines),note,transportOption);

@override
String toString() {
  return 'CheckoutRequest(contactId: $contactId, currency: $currency, lines: $lines, note: $note, transportOption: $transportOption)';
}


}

/// @nodoc
abstract mixin class $CheckoutRequestCopyWith<$Res>  {
  factory $CheckoutRequestCopyWith(CheckoutRequest value, $Res Function(CheckoutRequest) _then) = _$CheckoutRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'contact_id') String contactId, String currency, List<CheckoutLine> lines, String? note,@JsonKey(name: 'transport_option') String transportOption
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
@pragma('vm:prefer-inline') @override $Res call({Object? contactId = null,Object? currency = null,Object? lines = null,Object? note = freezed,Object? transportOption = null,}) {
  return _then(_self.copyWith(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<CheckoutLine>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,transportOption: null == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'contact_id')  String contactId,  String currency,  List<CheckoutLine> lines,  String? note, @JsonKey(name: 'transport_option')  String transportOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutRequest() when $default != null:
return $default(_that.contactId,_that.currency,_that.lines,_that.note,_that.transportOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'contact_id')  String contactId,  String currency,  List<CheckoutLine> lines,  String? note, @JsonKey(name: 'transport_option')  String transportOption)  $default,) {final _that = this;
switch (_that) {
case _CheckoutRequest():
return $default(_that.contactId,_that.currency,_that.lines,_that.note,_that.transportOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'contact_id')  String contactId,  String currency,  List<CheckoutLine> lines,  String? note, @JsonKey(name: 'transport_option')  String transportOption)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutRequest() when $default != null:
return $default(_that.contactId,_that.currency,_that.lines,_that.note,_that.transportOption);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutRequest implements CheckoutRequest {
  const _CheckoutRequest({@JsonKey(name: 'contact_id') required this.contactId, required this.currency, required final  List<CheckoutLine> lines, this.note, @JsonKey(name: 'transport_option') required this.transportOption}): _lines = lines;
  factory _CheckoutRequest.fromJson(Map<String, dynamic> json) => _$CheckoutRequestFromJson(json);

@override@JsonKey(name: 'contact_id') final  String contactId;
@override final  String currency;
 final  List<CheckoutLine> _lines;
@override List<CheckoutLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override final  String? note;
@override@JsonKey(name: 'transport_option') final  String transportOption;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutRequest&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._lines, _lines)&&(identical(other.note, note) || other.note == note)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,currency,const DeepCollectionEquality().hash(_lines),note,transportOption);

@override
String toString() {
  return 'CheckoutRequest(contactId: $contactId, currency: $currency, lines: $lines, note: $note, transportOption: $transportOption)';
}


}

/// @nodoc
abstract mixin class _$CheckoutRequestCopyWith<$Res> implements $CheckoutRequestCopyWith<$Res> {
  factory _$CheckoutRequestCopyWith(_CheckoutRequest value, $Res Function(_CheckoutRequest) _then) = __$CheckoutRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'contact_id') String contactId, String currency, List<CheckoutLine> lines, String? note,@JsonKey(name: 'transport_option') String transportOption
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
@override @pragma('vm:prefer-inline') $Res call({Object? contactId = null,Object? currency = null,Object? lines = null,Object? note = freezed,Object? transportOption = null,}) {
  return _then(_CheckoutRequest(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<CheckoutLine>,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,transportOption: null == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CheckoutOfferRequest {

@JsonKey(name: 'contact_id') String get contactId; String? get note;@JsonKey(name: 'transport_option') String get transportOption;
/// Create a copy of CheckoutOfferRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutOfferRequestCopyWith<CheckoutOfferRequest> get copyWith => _$CheckoutOfferRequestCopyWithImpl<CheckoutOfferRequest>(this as CheckoutOfferRequest, _$identity);

  /// Serializes this CheckoutOfferRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutOfferRequest&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.note, note) || other.note == note)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,note,transportOption);

@override
String toString() {
  return 'CheckoutOfferRequest(contactId: $contactId, note: $note, transportOption: $transportOption)';
}


}

/// @nodoc
abstract mixin class $CheckoutOfferRequestCopyWith<$Res>  {
  factory $CheckoutOfferRequestCopyWith(CheckoutOfferRequest value, $Res Function(CheckoutOfferRequest) _then) = _$CheckoutOfferRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'contact_id') String contactId, String? note,@JsonKey(name: 'transport_option') String transportOption
});




}
/// @nodoc
class _$CheckoutOfferRequestCopyWithImpl<$Res>
    implements $CheckoutOfferRequestCopyWith<$Res> {
  _$CheckoutOfferRequestCopyWithImpl(this._self, this._then);

  final CheckoutOfferRequest _self;
  final $Res Function(CheckoutOfferRequest) _then;

/// Create a copy of CheckoutOfferRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contactId = null,Object? note = freezed,Object? transportOption = null,}) {
  return _then(_self.copyWith(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,transportOption: null == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutOfferRequest].
extension CheckoutOfferRequestPatterns on CheckoutOfferRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutOfferRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutOfferRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutOfferRequest value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutOfferRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutOfferRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutOfferRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'contact_id')  String contactId,  String? note, @JsonKey(name: 'transport_option')  String transportOption)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutOfferRequest() when $default != null:
return $default(_that.contactId,_that.note,_that.transportOption);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'contact_id')  String contactId,  String? note, @JsonKey(name: 'transport_option')  String transportOption)  $default,) {final _that = this;
switch (_that) {
case _CheckoutOfferRequest():
return $default(_that.contactId,_that.note,_that.transportOption);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'contact_id')  String contactId,  String? note, @JsonKey(name: 'transport_option')  String transportOption)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutOfferRequest() when $default != null:
return $default(_that.contactId,_that.note,_that.transportOption);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutOfferRequest implements CheckoutOfferRequest {
  const _CheckoutOfferRequest({@JsonKey(name: 'contact_id') required this.contactId, this.note, @JsonKey(name: 'transport_option') required this.transportOption});
  factory _CheckoutOfferRequest.fromJson(Map<String, dynamic> json) => _$CheckoutOfferRequestFromJson(json);

@override@JsonKey(name: 'contact_id') final  String contactId;
@override final  String? note;
@override@JsonKey(name: 'transport_option') final  String transportOption;

/// Create a copy of CheckoutOfferRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutOfferRequestCopyWith<_CheckoutOfferRequest> get copyWith => __$CheckoutOfferRequestCopyWithImpl<_CheckoutOfferRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutOfferRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutOfferRequest&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.note, note) || other.note == note)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,note,transportOption);

@override
String toString() {
  return 'CheckoutOfferRequest(contactId: $contactId, note: $note, transportOption: $transportOption)';
}


}

/// @nodoc
abstract mixin class _$CheckoutOfferRequestCopyWith<$Res> implements $CheckoutOfferRequestCopyWith<$Res> {
  factory _$CheckoutOfferRequestCopyWith(_CheckoutOfferRequest value, $Res Function(_CheckoutOfferRequest) _then) = __$CheckoutOfferRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'contact_id') String contactId, String? note,@JsonKey(name: 'transport_option') String transportOption
});




}
/// @nodoc
class __$CheckoutOfferRequestCopyWithImpl<$Res>
    implements _$CheckoutOfferRequestCopyWith<$Res> {
  __$CheckoutOfferRequestCopyWithImpl(this._self, this._then);

  final _CheckoutOfferRequest _self;
  final $Res Function(_CheckoutOfferRequest) _then;

/// Create a copy of CheckoutOfferRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contactId = null,Object? note = freezed,Object? transportOption = null,}) {
  return _then(_CheckoutOfferRequest(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,transportOption: null == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OrderItem {

 String get id;@JsonKey(name: 'order_id') String? get orderId;@JsonKey(name: 'seller_id') String get sellerId;@JsonKey(name: 'listing_id') String? get listingId;@JsonKey(name: 'variant_id') String get variantId; int get quantity;@JsonKey(name: 'total_amount') int get totalAmount; String get currency;@JsonKey(name: 'transport_option') String get transportOption;@JsonKey(name: 'payment_session_id') String? get paymentSessionId; String? get note;@JsonKey(name: 'cancelled_at') String? get cancelledAt;@JsonKey(name: 'created_at') String get createdAt;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);

  /// Serializes this OrderItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption)&&(identical(other.paymentSessionId, paymentSessionId) || other.paymentSessionId == paymentSessionId)&&(identical(other.note, note) || other.note == note)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,sellerId,listingId,variantId,quantity,totalAmount,currency,transportOption,paymentSessionId,note,cancelledAt,createdAt);

@override
String toString() {
  return 'OrderItem(id: $id, orderId: $orderId, sellerId: $sellerId, listingId: $listingId, variantId: $variantId, quantity: $quantity, totalAmount: $totalAmount, currency: $currency, transportOption: $transportOption, paymentSessionId: $paymentSessionId, note: $note, cancelledAt: $cancelledAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'order_id') String? orderId,@JsonKey(name: 'seller_id') String sellerId,@JsonKey(name: 'listing_id') String? listingId,@JsonKey(name: 'variant_id') String variantId, int quantity,@JsonKey(name: 'total_amount') int totalAmount, String currency,@JsonKey(name: 'transport_option') String transportOption,@JsonKey(name: 'payment_session_id') String? paymentSessionId, String? note,@JsonKey(name: 'cancelled_at') String? cancelledAt,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = freezed,Object? sellerId = null,Object? listingId = freezed,Object? variantId = null,Object? quantity = null,Object? totalAmount = null,Object? currency = null,Object? transportOption = null,Object? paymentSessionId = freezed,Object? note = freezed,Object? cancelledAt = freezed,Object? createdAt = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,listingId: freezed == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String?,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,transportOption: null == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String,paymentSessionId: freezed == paymentSessionId ? _self.paymentSessionId : paymentSessionId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'seller_id')  String sellerId, @JsonKey(name: 'listing_id')  String? listingId, @JsonKey(name: 'variant_id')  String variantId,  int quantity, @JsonKey(name: 'total_amount')  int totalAmount,  String currency, @JsonKey(name: 'transport_option')  String transportOption, @JsonKey(name: 'payment_session_id')  String? paymentSessionId,  String? note, @JsonKey(name: 'cancelled_at')  String? cancelledAt, @JsonKey(name: 'created_at')  String createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.orderId,_that.sellerId,_that.listingId,_that.variantId,_that.quantity,_that.totalAmount,_that.currency,_that.transportOption,_that.paymentSessionId,_that.note,_that.cancelledAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'seller_id')  String sellerId, @JsonKey(name: 'listing_id')  String? listingId, @JsonKey(name: 'variant_id')  String variantId,  int quantity, @JsonKey(name: 'total_amount')  int totalAmount,  String currency, @JsonKey(name: 'transport_option')  String transportOption, @JsonKey(name: 'payment_session_id')  String? paymentSessionId,  String? note, @JsonKey(name: 'cancelled_at')  String? cancelledAt, @JsonKey(name: 'created_at')  String createdAt)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that.id,_that.orderId,_that.sellerId,_that.listingId,_that.variantId,_that.quantity,_that.totalAmount,_that.currency,_that.transportOption,_that.paymentSessionId,_that.note,_that.cancelledAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'order_id')  String? orderId, @JsonKey(name: 'seller_id')  String sellerId, @JsonKey(name: 'listing_id')  String? listingId, @JsonKey(name: 'variant_id')  String variantId,  int quantity, @JsonKey(name: 'total_amount')  int totalAmount,  String currency, @JsonKey(name: 'transport_option')  String transportOption, @JsonKey(name: 'payment_session_id')  String? paymentSessionId,  String? note, @JsonKey(name: 'cancelled_at')  String? cancelledAt, @JsonKey(name: 'created_at')  String createdAt)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.orderId,_that.sellerId,_that.listingId,_that.variantId,_that.quantity,_that.totalAmount,_that.currency,_that.transportOption,_that.paymentSessionId,_that.note,_that.cancelledAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OrderItem implements OrderItem {
  const _OrderItem({required this.id, @JsonKey(name: 'order_id') this.orderId, @JsonKey(name: 'seller_id') required this.sellerId, @JsonKey(name: 'listing_id') this.listingId, @JsonKey(name: 'variant_id') required this.variantId, required this.quantity, @JsonKey(name: 'total_amount') required this.totalAmount, required this.currency, @JsonKey(name: 'transport_option') required this.transportOption, @JsonKey(name: 'payment_session_id') this.paymentSessionId, this.note, @JsonKey(name: 'cancelled_at') this.cancelledAt, @JsonKey(name: 'created_at') required this.createdAt});
  factory _OrderItem.fromJson(Map<String, dynamic> json) => _$OrderItemFromJson(json);

@override final  String id;
@override@JsonKey(name: 'order_id') final  String? orderId;
@override@JsonKey(name: 'seller_id') final  String sellerId;
@override@JsonKey(name: 'listing_id') final  String? listingId;
@override@JsonKey(name: 'variant_id') final  String variantId;
@override final  int quantity;
@override@JsonKey(name: 'total_amount') final  int totalAmount;
@override final  String currency;
@override@JsonKey(name: 'transport_option') final  String transportOption;
@override@JsonKey(name: 'payment_session_id') final  String? paymentSessionId;
@override final  String? note;
@override@JsonKey(name: 'cancelled_at') final  String? cancelledAt;
@override@JsonKey(name: 'created_at') final  String createdAt;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrderItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption)&&(identical(other.paymentSessionId, paymentSessionId) || other.paymentSessionId == paymentSessionId)&&(identical(other.note, note) || other.note == note)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,sellerId,listingId,variantId,quantity,totalAmount,currency,transportOption,paymentSessionId,note,cancelledAt,createdAt);

@override
String toString() {
  return 'OrderItem(id: $id, orderId: $orderId, sellerId: $sellerId, listingId: $listingId, variantId: $variantId, quantity: $quantity, totalAmount: $totalAmount, currency: $currency, transportOption: $transportOption, paymentSessionId: $paymentSessionId, note: $note, cancelledAt: $cancelledAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'order_id') String? orderId,@JsonKey(name: 'seller_id') String sellerId,@JsonKey(name: 'listing_id') String? listingId,@JsonKey(name: 'variant_id') String variantId, int quantity,@JsonKey(name: 'total_amount') int totalAmount, String currency,@JsonKey(name: 'transport_option') String transportOption,@JsonKey(name: 'payment_session_id') String? paymentSessionId, String? note,@JsonKey(name: 'cancelled_at') String? cancelledAt,@JsonKey(name: 'created_at') String createdAt
});




}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = freezed,Object? sellerId = null,Object? listingId = freezed,Object? variantId = null,Object? quantity = null,Object? totalAmount = null,Object? currency = null,Object? transportOption = null,Object? paymentSessionId = freezed,Object? note = freezed,Object? cancelledAt = freezed,Object? createdAt = null,}) {
  return _then(_OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,listingId: freezed == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String?,variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,transportOption: null == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String,paymentSessionId: freezed == paymentSessionId ? _self.paymentSessionId : paymentSessionId // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$CheckoutResult {

 String get currency;@JsonKey(name: 'goods_total') int get goodsTotal; List<OrderItem> get items;@JsonKey(name: 'payment_session_id') String get paymentSessionId;@JsonKey(name: 'shipping_fee') int get shippingFee; int get total;
/// Create a copy of CheckoutResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutResultCopyWith<CheckoutResult> get copyWith => _$CheckoutResultCopyWithImpl<CheckoutResult>(this as CheckoutResult, _$identity);

  /// Serializes this CheckoutResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutResult&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.goodsTotal, goodsTotal) || other.goodsTotal == goodsTotal)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.paymentSessionId, paymentSessionId) || other.paymentSessionId == paymentSessionId)&&(identical(other.shippingFee, shippingFee) || other.shippingFee == shippingFee)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,goodsTotal,const DeepCollectionEquality().hash(items),paymentSessionId,shippingFee,total);

@override
String toString() {
  return 'CheckoutResult(currency: $currency, goodsTotal: $goodsTotal, items: $items, paymentSessionId: $paymentSessionId, shippingFee: $shippingFee, total: $total)';
}


}

/// @nodoc
abstract mixin class $CheckoutResultCopyWith<$Res>  {
  factory $CheckoutResultCopyWith(CheckoutResult value, $Res Function(CheckoutResult) _then) = _$CheckoutResultCopyWithImpl;
@useResult
$Res call({
 String currency,@JsonKey(name: 'goods_total') int goodsTotal, List<OrderItem> items,@JsonKey(name: 'payment_session_id') String paymentSessionId,@JsonKey(name: 'shipping_fee') int shippingFee, int total
});




}
/// @nodoc
class _$CheckoutResultCopyWithImpl<$Res>
    implements $CheckoutResultCopyWith<$Res> {
  _$CheckoutResultCopyWithImpl(this._self, this._then);

  final CheckoutResult _self;
  final $Res Function(CheckoutResult) _then;

/// Create a copy of CheckoutResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currency = null,Object? goodsTotal = null,Object? items = null,Object? paymentSessionId = null,Object? shippingFee = null,Object? total = null,}) {
  return _then(_self.copyWith(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,goodsTotal: null == goodsTotal ? _self.goodsTotal : goodsTotal // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,paymentSessionId: null == paymentSessionId ? _self.paymentSessionId : paymentSessionId // ignore: cast_nullable_to_non_nullable
as String,shippingFee: null == shippingFee ? _self.shippingFee : shippingFee // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckoutResult].
extension CheckoutResultPatterns on CheckoutResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutResult value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutResult value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currency, @JsonKey(name: 'goods_total')  int goodsTotal,  List<OrderItem> items, @JsonKey(name: 'payment_session_id')  String paymentSessionId, @JsonKey(name: 'shipping_fee')  int shippingFee,  int total)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutResult() when $default != null:
return $default(_that.currency,_that.goodsTotal,_that.items,_that.paymentSessionId,_that.shippingFee,_that.total);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currency, @JsonKey(name: 'goods_total')  int goodsTotal,  List<OrderItem> items, @JsonKey(name: 'payment_session_id')  String paymentSessionId, @JsonKey(name: 'shipping_fee')  int shippingFee,  int total)  $default,) {final _that = this;
switch (_that) {
case _CheckoutResult():
return $default(_that.currency,_that.goodsTotal,_that.items,_that.paymentSessionId,_that.shippingFee,_that.total);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currency, @JsonKey(name: 'goods_total')  int goodsTotal,  List<OrderItem> items, @JsonKey(name: 'payment_session_id')  String paymentSessionId, @JsonKey(name: 'shipping_fee')  int shippingFee,  int total)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutResult() when $default != null:
return $default(_that.currency,_that.goodsTotal,_that.items,_that.paymentSessionId,_that.shippingFee,_that.total);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CheckoutResult implements CheckoutResult {
  const _CheckoutResult({required this.currency, @JsonKey(name: 'goods_total') required this.goodsTotal, required final  List<OrderItem> items, @JsonKey(name: 'payment_session_id') required this.paymentSessionId, @JsonKey(name: 'shipping_fee') required this.shippingFee, required this.total}): _items = items;
  factory _CheckoutResult.fromJson(Map<String, dynamic> json) => _$CheckoutResultFromJson(json);

@override final  String currency;
@override@JsonKey(name: 'goods_total') final  int goodsTotal;
 final  List<OrderItem> _items;
@override List<OrderItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey(name: 'payment_session_id') final  String paymentSessionId;
@override@JsonKey(name: 'shipping_fee') final  int shippingFee;
@override final  int total;

/// Create a copy of CheckoutResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutResultCopyWith<_CheckoutResult> get copyWith => __$CheckoutResultCopyWithImpl<_CheckoutResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CheckoutResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutResult&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.goodsTotal, goodsTotal) || other.goodsTotal == goodsTotal)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.paymentSessionId, paymentSessionId) || other.paymentSessionId == paymentSessionId)&&(identical(other.shippingFee, shippingFee) || other.shippingFee == shippingFee)&&(identical(other.total, total) || other.total == total));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,goodsTotal,const DeepCollectionEquality().hash(_items),paymentSessionId,shippingFee,total);

@override
String toString() {
  return 'CheckoutResult(currency: $currency, goodsTotal: $goodsTotal, items: $items, paymentSessionId: $paymentSessionId, shippingFee: $shippingFee, total: $total)';
}


}

/// @nodoc
abstract mixin class _$CheckoutResultCopyWith<$Res> implements $CheckoutResultCopyWith<$Res> {
  factory _$CheckoutResultCopyWith(_CheckoutResult value, $Res Function(_CheckoutResult) _then) = __$CheckoutResultCopyWithImpl;
@override @useResult
$Res call({
 String currency,@JsonKey(name: 'goods_total') int goodsTotal, List<OrderItem> items,@JsonKey(name: 'payment_session_id') String paymentSessionId,@JsonKey(name: 'shipping_fee') int shippingFee, int total
});




}
/// @nodoc
class __$CheckoutResultCopyWithImpl<$Res>
    implements _$CheckoutResultCopyWith<$Res> {
  __$CheckoutResultCopyWithImpl(this._self, this._then);

  final _CheckoutResult _self;
  final $Res Function(_CheckoutResult) _then;

/// Create a copy of CheckoutResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = null,Object? goodsTotal = null,Object? items = null,Object? paymentSessionId = null,Object? shippingFee = null,Object? total = null,}) {
  return _then(_CheckoutResult(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,goodsTotal: null == goodsTotal ? _self.goodsTotal : goodsTotal // ignore: cast_nullable_to_non_nullable
as int,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<OrderItem>,paymentSessionId: null == paymentSessionId ? _self.paymentSessionId : paymentSessionId // ignore: cast_nullable_to_non_nullable
as String,shippingFee: null == shippingFee ? _self.shippingFee : shippingFee // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CreateDraftRequest {

@JsonKey(name: 'listing_id') String get listingId;
/// Create a copy of CreateDraftRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDraftRequestCopyWith<CreateDraftRequest> get copyWith => _$CreateDraftRequestCopyWithImpl<CreateDraftRequest>(this as CreateDraftRequest, _$identity);

  /// Serializes this CreateDraftRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDraftRequest&&(identical(other.listingId, listingId) || other.listingId == listingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,listingId);

@override
String toString() {
  return 'CreateDraftRequest(listingId: $listingId)';
}


}

/// @nodoc
abstract mixin class $CreateDraftRequestCopyWith<$Res>  {
  factory $CreateDraftRequestCopyWith(CreateDraftRequest value, $Res Function(CreateDraftRequest) _then) = _$CreateDraftRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'listing_id') String listingId
});




}
/// @nodoc
class _$CreateDraftRequestCopyWithImpl<$Res>
    implements $CreateDraftRequestCopyWith<$Res> {
  _$CreateDraftRequestCopyWithImpl(this._self, this._then);

  final CreateDraftRequest _self;
  final $Res Function(CreateDraftRequest) _then;

/// Create a copy of CreateDraftRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? listingId = null,}) {
  return _then(_self.copyWith(
listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateDraftRequest].
extension CreateDraftRequestPatterns on CreateDraftRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateDraftRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateDraftRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateDraftRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateDraftRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateDraftRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateDraftRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'listing_id')  String listingId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateDraftRequest() when $default != null:
return $default(_that.listingId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'listing_id')  String listingId)  $default,) {final _that = this;
switch (_that) {
case _CreateDraftRequest():
return $default(_that.listingId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'listing_id')  String listingId)?  $default,) {final _that = this;
switch (_that) {
case _CreateDraftRequest() when $default != null:
return $default(_that.listingId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateDraftRequest implements CreateDraftRequest {
  const _CreateDraftRequest({@JsonKey(name: 'listing_id') required this.listingId});
  factory _CreateDraftRequest.fromJson(Map<String, dynamic> json) => _$CreateDraftRequestFromJson(json);

@override@JsonKey(name: 'listing_id') final  String listingId;

/// Create a copy of CreateDraftRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateDraftRequestCopyWith<_CreateDraftRequest> get copyWith => __$CreateDraftRequestCopyWithImpl<_CreateDraftRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDraftRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateDraftRequest&&(identical(other.listingId, listingId) || other.listingId == listingId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,listingId);

@override
String toString() {
  return 'CreateDraftRequest(listingId: $listingId)';
}


}

/// @nodoc
abstract mixin class _$CreateDraftRequestCopyWith<$Res> implements $CreateDraftRequestCopyWith<$Res> {
  factory _$CreateDraftRequestCopyWith(_CreateDraftRequest value, $Res Function(_CreateDraftRequest) _then) = __$CreateDraftRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'listing_id') String listingId
});




}
/// @nodoc
class __$CreateDraftRequestCopyWithImpl<$Res>
    implements _$CreateDraftRequestCopyWith<$Res> {
  __$CreateDraftRequestCopyWithImpl(this._self, this._then);

  final _CreateDraftRequest _self;
  final $Res Function(_CreateDraftRequest) _then;

/// Create a copy of CreateDraftRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? listingId = null,}) {
  return _then(_CreateDraftRequest(
listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DraftOrderVariant {

@JsonKey(name: 'variant_id') String get variantId; int get price; Map<String, dynamic>? get attributes;
/// Create a copy of DraftOrderVariant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftOrderVariantCopyWith<DraftOrderVariant> get copyWith => _$DraftOrderVariantCopyWithImpl<DraftOrderVariant>(this as DraftOrderVariant, _$identity);

  /// Serializes this DraftOrderVariant to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftOrderVariant&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,price,const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'DraftOrderVariant(variantId: $variantId, price: $price, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $DraftOrderVariantCopyWith<$Res>  {
  factory $DraftOrderVariantCopyWith(DraftOrderVariant value, $Res Function(DraftOrderVariant) _then) = _$DraftOrderVariantCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'variant_id') String variantId, int price, Map<String, dynamic>? attributes
});




}
/// @nodoc
class _$DraftOrderVariantCopyWithImpl<$Res>
    implements $DraftOrderVariantCopyWith<$Res> {
  _$DraftOrderVariantCopyWithImpl(this._self, this._then);

  final DraftOrderVariant _self;
  final $Res Function(DraftOrderVariant) _then;

/// Create a copy of DraftOrderVariant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? variantId = null,Object? price = null,Object? attributes = freezed,}) {
  return _then(_self.copyWith(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DraftOrderVariant].
extension DraftOrderVariantPatterns on DraftOrderVariant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftOrderVariant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftOrderVariant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftOrderVariant value)  $default,){
final _that = this;
switch (_that) {
case _DraftOrderVariant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftOrderVariant value)?  $default,){
final _that = this;
switch (_that) {
case _DraftOrderVariant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'variant_id')  String variantId,  int price,  Map<String, dynamic>? attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftOrderVariant() when $default != null:
return $default(_that.variantId,_that.price,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'variant_id')  String variantId,  int price,  Map<String, dynamic>? attributes)  $default,) {final _that = this;
switch (_that) {
case _DraftOrderVariant():
return $default(_that.variantId,_that.price,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'variant_id')  String variantId,  int price,  Map<String, dynamic>? attributes)?  $default,) {final _that = this;
switch (_that) {
case _DraftOrderVariant() when $default != null:
return $default(_that.variantId,_that.price,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraftOrderVariant implements DraftOrderVariant {
  const _DraftOrderVariant({@JsonKey(name: 'variant_id') required this.variantId, required this.price, final  Map<String, dynamic>? attributes}): _attributes = attributes;
  factory _DraftOrderVariant.fromJson(Map<String, dynamic> json) => _$DraftOrderVariantFromJson(json);

@override@JsonKey(name: 'variant_id') final  String variantId;
@override final  int price;
 final  Map<String, dynamic>? _attributes;
@override Map<String, dynamic>? get attributes {
  final value = _attributes;
  if (value == null) return null;
  if (_attributes is EqualUnmodifiableMapView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of DraftOrderVariant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftOrderVariantCopyWith<_DraftOrderVariant> get copyWith => __$DraftOrderVariantCopyWithImpl<_DraftOrderVariant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DraftOrderVariantToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftOrderVariant&&(identical(other.variantId, variantId) || other.variantId == variantId)&&(identical(other.price, price) || other.price == price)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,variantId,price,const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'DraftOrderVariant(variantId: $variantId, price: $price, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$DraftOrderVariantCopyWith<$Res> implements $DraftOrderVariantCopyWith<$Res> {
  factory _$DraftOrderVariantCopyWith(_DraftOrderVariant value, $Res Function(_DraftOrderVariant) _then) = __$DraftOrderVariantCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'variant_id') String variantId, int price, Map<String, dynamic>? attributes
});




}
/// @nodoc
class __$DraftOrderVariantCopyWithImpl<$Res>
    implements _$DraftOrderVariantCopyWith<$Res> {
  __$DraftOrderVariantCopyWithImpl(this._self, this._then);

  final _DraftOrderVariant _self;
  final $Res Function(_DraftOrderVariant) _then;

/// Create a copy of DraftOrderVariant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? variantId = null,Object? price = null,Object? attributes = freezed,}) {
  return _then(_DraftOrderVariant(
variantId: null == variantId ? _self.variantId : variantId // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$DraftOrder {

 String get id;@JsonKey(name: 'listing_id') String get listingId;@JsonKey(name: 'seller_id') String get sellerId; String get name; String get currency;@JsonKey(name: 'price_mode') String get priceMode;@JsonKey(name: 'valid_until') String get validUntil;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'cancelled_at') String? get cancelledAt; List<DraftOrderVariant> get variants;
/// Create a copy of DraftOrder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DraftOrderCopyWith<DraftOrder> get copyWith => _$DraftOrderCopyWithImpl<DraftOrder>(this as DraftOrder, _$identity);

  /// Serializes this DraftOrder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DraftOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&const DeepCollectionEquality().equals(other.variants, variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,listingId,sellerId,name,currency,priceMode,validUntil,createdAt,cancelledAt,const DeepCollectionEquality().hash(variants));

@override
String toString() {
  return 'DraftOrder(id: $id, listingId: $listingId, sellerId: $sellerId, name: $name, currency: $currency, priceMode: $priceMode, validUntil: $validUntil, createdAt: $createdAt, cancelledAt: $cancelledAt, variants: $variants)';
}


}

/// @nodoc
abstract mixin class $DraftOrderCopyWith<$Res>  {
  factory $DraftOrderCopyWith(DraftOrder value, $Res Function(DraftOrder) _then) = _$DraftOrderCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'listing_id') String listingId,@JsonKey(name: 'seller_id') String sellerId, String name, String currency,@JsonKey(name: 'price_mode') String priceMode,@JsonKey(name: 'valid_until') String validUntil,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'cancelled_at') String? cancelledAt, List<DraftOrderVariant> variants
});




}
/// @nodoc
class _$DraftOrderCopyWithImpl<$Res>
    implements $DraftOrderCopyWith<$Res> {
  _$DraftOrderCopyWithImpl(this._self, this._then);

  final DraftOrder _self;
  final $Res Function(DraftOrder) _then;

/// Create a copy of DraftOrder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? listingId = null,Object? sellerId = null,Object? name = null,Object? currency = null,Object? priceMode = null,Object? validUntil = null,Object? createdAt = null,Object? cancelledAt = freezed,Object? variants = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,priceMode: null == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as String?,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<DraftOrderVariant>,
  ));
}

}


/// Adds pattern-matching-related methods to [DraftOrder].
extension DraftOrderPatterns on DraftOrder {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DraftOrder value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DraftOrder() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DraftOrder value)  $default,){
final _that = this;
switch (_that) {
case _DraftOrder():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DraftOrder value)?  $default,){
final _that = this;
switch (_that) {
case _DraftOrder() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'listing_id')  String listingId, @JsonKey(name: 'seller_id')  String sellerId,  String name,  String currency, @JsonKey(name: 'price_mode')  String priceMode, @JsonKey(name: 'valid_until')  String validUntil, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'cancelled_at')  String? cancelledAt,  List<DraftOrderVariant> variants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DraftOrder() when $default != null:
return $default(_that.id,_that.listingId,_that.sellerId,_that.name,_that.currency,_that.priceMode,_that.validUntil,_that.createdAt,_that.cancelledAt,_that.variants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'listing_id')  String listingId, @JsonKey(name: 'seller_id')  String sellerId,  String name,  String currency, @JsonKey(name: 'price_mode')  String priceMode, @JsonKey(name: 'valid_until')  String validUntil, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'cancelled_at')  String? cancelledAt,  List<DraftOrderVariant> variants)  $default,) {final _that = this;
switch (_that) {
case _DraftOrder():
return $default(_that.id,_that.listingId,_that.sellerId,_that.name,_that.currency,_that.priceMode,_that.validUntil,_that.createdAt,_that.cancelledAt,_that.variants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'listing_id')  String listingId, @JsonKey(name: 'seller_id')  String sellerId,  String name,  String currency, @JsonKey(name: 'price_mode')  String priceMode, @JsonKey(name: 'valid_until')  String validUntil, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'cancelled_at')  String? cancelledAt,  List<DraftOrderVariant> variants)?  $default,) {final _that = this;
switch (_that) {
case _DraftOrder() when $default != null:
return $default(_that.id,_that.listingId,_that.sellerId,_that.name,_that.currency,_that.priceMode,_that.validUntil,_that.createdAt,_that.cancelledAt,_that.variants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DraftOrder implements DraftOrder {
  const _DraftOrder({required this.id, @JsonKey(name: 'listing_id') required this.listingId, @JsonKey(name: 'seller_id') required this.sellerId, required this.name, required this.currency, @JsonKey(name: 'price_mode') required this.priceMode, @JsonKey(name: 'valid_until') required this.validUntil, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'cancelled_at') this.cancelledAt, required final  List<DraftOrderVariant> variants}): _variants = variants;
  factory _DraftOrder.fromJson(Map<String, dynamic> json) => _$DraftOrderFromJson(json);

@override final  String id;
@override@JsonKey(name: 'listing_id') final  String listingId;
@override@JsonKey(name: 'seller_id') final  String sellerId;
@override final  String name;
@override final  String currency;
@override@JsonKey(name: 'price_mode') final  String priceMode;
@override@JsonKey(name: 'valid_until') final  String validUntil;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'cancelled_at') final  String? cancelledAt;
 final  List<DraftOrderVariant> _variants;
@override List<DraftOrderVariant> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}


/// Create a copy of DraftOrder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DraftOrderCopyWith<_DraftOrder> get copyWith => __$DraftOrderCopyWithImpl<_DraftOrder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DraftOrderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DraftOrder&&(identical(other.id, id) || other.id == id)&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.validUntil, validUntil) || other.validUntil == validUntil)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&const DeepCollectionEquality().equals(other._variants, _variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,listingId,sellerId,name,currency,priceMode,validUntil,createdAt,cancelledAt,const DeepCollectionEquality().hash(_variants));

@override
String toString() {
  return 'DraftOrder(id: $id, listingId: $listingId, sellerId: $sellerId, name: $name, currency: $currency, priceMode: $priceMode, validUntil: $validUntil, createdAt: $createdAt, cancelledAt: $cancelledAt, variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$DraftOrderCopyWith<$Res> implements $DraftOrderCopyWith<$Res> {
  factory _$DraftOrderCopyWith(_DraftOrder value, $Res Function(_DraftOrder) _then) = __$DraftOrderCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'listing_id') String listingId,@JsonKey(name: 'seller_id') String sellerId, String name, String currency,@JsonKey(name: 'price_mode') String priceMode,@JsonKey(name: 'valid_until') String validUntil,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'cancelled_at') String? cancelledAt, List<DraftOrderVariant> variants
});




}
/// @nodoc
class __$DraftOrderCopyWithImpl<$Res>
    implements _$DraftOrderCopyWith<$Res> {
  __$DraftOrderCopyWithImpl(this._self, this._then);

  final _DraftOrder _self;
  final $Res Function(_DraftOrder) _then;

/// Create a copy of DraftOrder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? listingId = null,Object? sellerId = null,Object? name = null,Object? currency = null,Object? priceMode = null,Object? validUntil = null,Object? createdAt = null,Object? cancelledAt = freezed,Object? variants = null,}) {
  return _then(_DraftOrder(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listingId: null == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String,sellerId: null == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,priceMode: null == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String,validUntil: null == validUntil ? _self.validUntil : validUntil // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as String?,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<DraftOrderVariant>,
  ));
}


}


/// @nodoc
mixin _$StartPaymentRequest {

@JsonKey(name: 'payment_option') String get paymentOption; int? get amount;@JsonKey(name: 'return_url') String? get returnUrl;
/// Create a copy of StartPaymentRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartPaymentRequestCopyWith<StartPaymentRequest> get copyWith => _$StartPaymentRequestCopyWithImpl<StartPaymentRequest>(this as StartPaymentRequest, _$identity);

  /// Serializes this StartPaymentRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartPaymentRequest&&(identical(other.paymentOption, paymentOption) || other.paymentOption == paymentOption)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentOption,amount,returnUrl);

@override
String toString() {
  return 'StartPaymentRequest(paymentOption: $paymentOption, amount: $amount, returnUrl: $returnUrl)';
}


}

/// @nodoc
abstract mixin class $StartPaymentRequestCopyWith<$Res>  {
  factory $StartPaymentRequestCopyWith(StartPaymentRequest value, $Res Function(StartPaymentRequest) _then) = _$StartPaymentRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'payment_option') String paymentOption, int? amount,@JsonKey(name: 'return_url') String? returnUrl
});




}
/// @nodoc
class _$StartPaymentRequestCopyWithImpl<$Res>
    implements $StartPaymentRequestCopyWith<$Res> {
  _$StartPaymentRequestCopyWithImpl(this._self, this._then);

  final StartPaymentRequest _self;
  final $Res Function(StartPaymentRequest) _then;

/// Create a copy of StartPaymentRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentOption = null,Object? amount = freezed,Object? returnUrl = freezed,}) {
  return _then(_self.copyWith(
paymentOption: null == paymentOption ? _self.paymentOption : paymentOption // ignore: cast_nullable_to_non_nullable
as String,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [StartPaymentRequest].
extension StartPaymentRequestPatterns on StartPaymentRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StartPaymentRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartPaymentRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StartPaymentRequest value)  $default,){
final _that = this;
switch (_that) {
case _StartPaymentRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StartPaymentRequest value)?  $default,){
final _that = this;
switch (_that) {
case _StartPaymentRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'payment_option')  String paymentOption,  int? amount, @JsonKey(name: 'return_url')  String? returnUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartPaymentRequest() when $default != null:
return $default(_that.paymentOption,_that.amount,_that.returnUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'payment_option')  String paymentOption,  int? amount, @JsonKey(name: 'return_url')  String? returnUrl)  $default,) {final _that = this;
switch (_that) {
case _StartPaymentRequest():
return $default(_that.paymentOption,_that.amount,_that.returnUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'payment_option')  String paymentOption,  int? amount, @JsonKey(name: 'return_url')  String? returnUrl)?  $default,) {final _that = this;
switch (_that) {
case _StartPaymentRequest() when $default != null:
return $default(_that.paymentOption,_that.amount,_that.returnUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StartPaymentRequest implements StartPaymentRequest {
  const _StartPaymentRequest({@JsonKey(name: 'payment_option') required this.paymentOption, this.amount, @JsonKey(name: 'return_url') this.returnUrl});
  factory _StartPaymentRequest.fromJson(Map<String, dynamic> json) => _$StartPaymentRequestFromJson(json);

@override@JsonKey(name: 'payment_option') final  String paymentOption;
@override final  int? amount;
@override@JsonKey(name: 'return_url') final  String? returnUrl;

/// Create a copy of StartPaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartPaymentRequestCopyWith<_StartPaymentRequest> get copyWith => __$StartPaymentRequestCopyWithImpl<_StartPaymentRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StartPaymentRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartPaymentRequest&&(identical(other.paymentOption, paymentOption) || other.paymentOption == paymentOption)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.returnUrl, returnUrl) || other.returnUrl == returnUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentOption,amount,returnUrl);

@override
String toString() {
  return 'StartPaymentRequest(paymentOption: $paymentOption, amount: $amount, returnUrl: $returnUrl)';
}


}

/// @nodoc
abstract mixin class _$StartPaymentRequestCopyWith<$Res> implements $StartPaymentRequestCopyWith<$Res> {
  factory _$StartPaymentRequestCopyWith(_StartPaymentRequest value, $Res Function(_StartPaymentRequest) _then) = __$StartPaymentRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'payment_option') String paymentOption, int? amount,@JsonKey(name: 'return_url') String? returnUrl
});




}
/// @nodoc
class __$StartPaymentRequestCopyWithImpl<$Res>
    implements _$StartPaymentRequestCopyWith<$Res> {
  __$StartPaymentRequestCopyWithImpl(this._self, this._then);

  final _StartPaymentRequest _self;
  final $Res Function(_StartPaymentRequest) _then;

/// Create a copy of StartPaymentRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentOption = null,Object? amount = freezed,Object? returnUrl = freezed,}) {
  return _then(_StartPaymentRequest(
paymentOption: null == paymentOption ? _self.paymentOption : paymentOption // ignore: cast_nullable_to_non_nullable
as String,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int?,returnUrl: freezed == returnUrl ? _self.returnUrl : returnUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Transaction {

 String get id;@JsonKey(name: 'session_id') String get sessionId;@JsonKey(name: 'payment_option') String get paymentOption; int get amount;@JsonKey(name: 'checkout_url') String? get checkoutUrl; String get status; String? get error;@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'expired_at') String? get expiredAt;@JsonKey(name: 'settled_at') String? get settledAt;
/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionCopyWith<Transaction> get copyWith => _$TransactionCopyWithImpl<Transaction>(this as Transaction, _$identity);

  /// Serializes this Transaction to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.paymentOption, paymentOption) || other.paymentOption == paymentOption)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.settledAt, settledAt) || other.settledAt == settledAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,paymentOption,amount,checkoutUrl,status,error,createdAt,expiredAt,settledAt);

@override
String toString() {
  return 'Transaction(id: $id, sessionId: $sessionId, paymentOption: $paymentOption, amount: $amount, checkoutUrl: $checkoutUrl, status: $status, error: $error, createdAt: $createdAt, expiredAt: $expiredAt, settledAt: $settledAt)';
}


}

/// @nodoc
abstract mixin class $TransactionCopyWith<$Res>  {
  factory $TransactionCopyWith(Transaction value, $Res Function(Transaction) _then) = _$TransactionCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'payment_option') String paymentOption, int amount,@JsonKey(name: 'checkout_url') String? checkoutUrl, String status, String? error,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'expired_at') String? expiredAt,@JsonKey(name: 'settled_at') String? settledAt
});




}
/// @nodoc
class _$TransactionCopyWithImpl<$Res>
    implements $TransactionCopyWith<$Res> {
  _$TransactionCopyWithImpl(this._self, this._then);

  final Transaction _self;
  final $Res Function(Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sessionId = null,Object? paymentOption = null,Object? amount = null,Object? checkoutUrl = freezed,Object? status = null,Object? error = freezed,Object? createdAt = null,Object? expiredAt = freezed,Object? settledAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,paymentOption: null == paymentOption ? _self.paymentOption : paymentOption // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,checkoutUrl: freezed == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as String?,settledAt: freezed == settledAt ? _self.settledAt : settledAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Transaction].
extension TransactionPatterns on Transaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Transaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Transaction value)  $default,){
final _that = this;
switch (_that) {
case _Transaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Transaction value)?  $default,){
final _that = this;
switch (_that) {
case _Transaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'payment_option')  String paymentOption,  int amount, @JsonKey(name: 'checkout_url')  String? checkoutUrl,  String status,  String? error, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'expired_at')  String? expiredAt, @JsonKey(name: 'settled_at')  String? settledAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.sessionId,_that.paymentOption,_that.amount,_that.checkoutUrl,_that.status,_that.error,_that.createdAt,_that.expiredAt,_that.settledAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'payment_option')  String paymentOption,  int amount, @JsonKey(name: 'checkout_url')  String? checkoutUrl,  String status,  String? error, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'expired_at')  String? expiredAt, @JsonKey(name: 'settled_at')  String? settledAt)  $default,) {final _that = this;
switch (_that) {
case _Transaction():
return $default(_that.id,_that.sessionId,_that.paymentOption,_that.amount,_that.checkoutUrl,_that.status,_that.error,_that.createdAt,_that.expiredAt,_that.settledAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'payment_option')  String paymentOption,  int amount, @JsonKey(name: 'checkout_url')  String? checkoutUrl,  String status,  String? error, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'expired_at')  String? expiredAt, @JsonKey(name: 'settled_at')  String? settledAt)?  $default,) {final _that = this;
switch (_that) {
case _Transaction() when $default != null:
return $default(_that.id,_that.sessionId,_that.paymentOption,_that.amount,_that.checkoutUrl,_that.status,_that.error,_that.createdAt,_that.expiredAt,_that.settledAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Transaction implements Transaction {
  const _Transaction({required this.id, @JsonKey(name: 'session_id') required this.sessionId, @JsonKey(name: 'payment_option') required this.paymentOption, required this.amount, @JsonKey(name: 'checkout_url') this.checkoutUrl, required this.status, this.error, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'expired_at') this.expiredAt, @JsonKey(name: 'settled_at') this.settledAt});
  factory _Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);

@override final  String id;
@override@JsonKey(name: 'session_id') final  String sessionId;
@override@JsonKey(name: 'payment_option') final  String paymentOption;
@override final  int amount;
@override@JsonKey(name: 'checkout_url') final  String? checkoutUrl;
@override final  String status;
@override final  String? error;
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'expired_at') final  String? expiredAt;
@override@JsonKey(name: 'settled_at') final  String? settledAt;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionCopyWith<_Transaction> get copyWith => __$TransactionCopyWithImpl<_Transaction>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Transaction&&(identical(other.id, id) || other.id == id)&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.paymentOption, paymentOption) || other.paymentOption == paymentOption)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.error, error) || other.error == error)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt)&&(identical(other.settledAt, settledAt) || other.settledAt == settledAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sessionId,paymentOption,amount,checkoutUrl,status,error,createdAt,expiredAt,settledAt);

@override
String toString() {
  return 'Transaction(id: $id, sessionId: $sessionId, paymentOption: $paymentOption, amount: $amount, checkoutUrl: $checkoutUrl, status: $status, error: $error, createdAt: $createdAt, expiredAt: $expiredAt, settledAt: $settledAt)';
}


}

/// @nodoc
abstract mixin class _$TransactionCopyWith<$Res> implements $TransactionCopyWith<$Res> {
  factory _$TransactionCopyWith(_Transaction value, $Res Function(_Transaction) _then) = __$TransactionCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'payment_option') String paymentOption, int amount,@JsonKey(name: 'checkout_url') String? checkoutUrl, String status, String? error,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'expired_at') String? expiredAt,@JsonKey(name: 'settled_at') String? settledAt
});




}
/// @nodoc
class __$TransactionCopyWithImpl<$Res>
    implements _$TransactionCopyWith<$Res> {
  __$TransactionCopyWithImpl(this._self, this._then);

  final _Transaction _self;
  final $Res Function(_Transaction) _then;

/// Create a copy of Transaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sessionId = null,Object? paymentOption = null,Object? amount = null,Object? checkoutUrl = freezed,Object? status = null,Object? error = freezed,Object? createdAt = null,Object? expiredAt = freezed,Object? settledAt = freezed,}) {
  return _then(_Transaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,paymentOption: null == paymentOption ? _self.paymentOption : paymentOption // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as int,checkoutUrl: freezed == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,expiredAt: freezed == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as String?,settledAt: freezed == settledAt ? _self.settledAt : settledAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ShippingOption {

@JsonKey(name: 'option') String get option;@JsonKey(name: 'name') String get name;@JsonKey(name: 'fee') int get fee;
/// Create a copy of ShippingOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingOptionCopyWith<ShippingOption> get copyWith => _$ShippingOptionCopyWithImpl<ShippingOption>(this as ShippingOption, _$identity);

  /// Serializes this ShippingOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingOption&&(identical(other.option, option) || other.option == option)&&(identical(other.name, name) || other.name == name)&&(identical(other.fee, fee) || other.fee == fee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,option,name,fee);

@override
String toString() {
  return 'ShippingOption(option: $option, name: $name, fee: $fee)';
}


}

/// @nodoc
abstract mixin class $ShippingOptionCopyWith<$Res>  {
  factory $ShippingOptionCopyWith(ShippingOption value, $Res Function(ShippingOption) _then) = _$ShippingOptionCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'option') String option,@JsonKey(name: 'name') String name,@JsonKey(name: 'fee') int fee
});




}
/// @nodoc
class _$ShippingOptionCopyWithImpl<$Res>
    implements $ShippingOptionCopyWith<$Res> {
  _$ShippingOptionCopyWithImpl(this._self, this._then);

  final ShippingOption _self;
  final $Res Function(ShippingOption) _then;

/// Create a copy of ShippingOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? option = null,Object? name = null,Object? fee = null,}) {
  return _then(_self.copyWith(
option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ShippingOption].
extension ShippingOptionPatterns on ShippingOption {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingOption() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingOption value)  $default,){
final _that = this;
switch (_that) {
case _ShippingOption():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingOption value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingOption() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'option')  String option, @JsonKey(name: 'name')  String name, @JsonKey(name: 'fee')  int fee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingOption() when $default != null:
return $default(_that.option,_that.name,_that.fee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'option')  String option, @JsonKey(name: 'name')  String name, @JsonKey(name: 'fee')  int fee)  $default,) {final _that = this;
switch (_that) {
case _ShippingOption():
return $default(_that.option,_that.name,_that.fee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'option')  String option, @JsonKey(name: 'name')  String name, @JsonKey(name: 'fee')  int fee)?  $default,) {final _that = this;
switch (_that) {
case _ShippingOption() when $default != null:
return $default(_that.option,_that.name,_that.fee);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShippingOption implements ShippingOption {
  const _ShippingOption({@JsonKey(name: 'option') required this.option, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'fee') required this.fee});
  factory _ShippingOption.fromJson(Map<String, dynamic> json) => _$ShippingOptionFromJson(json);

@override@JsonKey(name: 'option') final  String option;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'fee') final  int fee;

/// Create a copy of ShippingOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingOptionCopyWith<_ShippingOption> get copyWith => __$ShippingOptionCopyWithImpl<_ShippingOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingOption&&(identical(other.option, option) || other.option == option)&&(identical(other.name, name) || other.name == name)&&(identical(other.fee, fee) || other.fee == fee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,option,name,fee);

@override
String toString() {
  return 'ShippingOption(option: $option, name: $name, fee: $fee)';
}


}

/// @nodoc
abstract mixin class _$ShippingOptionCopyWith<$Res> implements $ShippingOptionCopyWith<$Res> {
  factory _$ShippingOptionCopyWith(_ShippingOption value, $Res Function(_ShippingOption) _then) = __$ShippingOptionCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'option') String option,@JsonKey(name: 'name') String name,@JsonKey(name: 'fee') int fee
});




}
/// @nodoc
class __$ShippingOptionCopyWithImpl<$Res>
    implements _$ShippingOptionCopyWith<$Res> {
  __$ShippingOptionCopyWithImpl(this._self, this._then);

  final _ShippingOption _self;
  final $Res Function(_ShippingOption) _then;

/// Create a copy of ShippingOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? option = null,Object? name = null,Object? fee = null,}) {
  return _then(_ShippingOption(
option: null == option ? _self.option : option // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,fee: null == fee ? _self.fee : fee // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ShippingQuotes {

 String get currency; List<ShippingOption> get options;
/// Create a copy of ShippingQuotes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingQuotesCopyWith<ShippingQuotes> get copyWith => _$ShippingQuotesCopyWithImpl<ShippingQuotes>(this as ShippingQuotes, _$identity);

  /// Serializes this ShippingQuotes to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingQuotes&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'ShippingQuotes(currency: $currency, options: $options)';
}


}

/// @nodoc
abstract mixin class $ShippingQuotesCopyWith<$Res>  {
  factory $ShippingQuotesCopyWith(ShippingQuotes value, $Res Function(ShippingQuotes) _then) = _$ShippingQuotesCopyWithImpl;
@useResult
$Res call({
 String currency, List<ShippingOption> options
});




}
/// @nodoc
class _$ShippingQuotesCopyWithImpl<$Res>
    implements $ShippingQuotesCopyWith<$Res> {
  _$ShippingQuotesCopyWithImpl(this._self, this._then);

  final ShippingQuotes _self;
  final $Res Function(ShippingQuotes) _then;

/// Create a copy of ShippingQuotes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? currency = null,Object? options = null,}) {
  return _then(_self.copyWith(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as List<ShippingOption>,
  ));
}

}


/// Adds pattern-matching-related methods to [ShippingQuotes].
extension ShippingQuotesPatterns on ShippingQuotes {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingQuotes value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingQuotes() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingQuotes value)  $default,){
final _that = this;
switch (_that) {
case _ShippingQuotes():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingQuotes value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingQuotes() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String currency,  List<ShippingOption> options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingQuotes() when $default != null:
return $default(_that.currency,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String currency,  List<ShippingOption> options)  $default,) {final _that = this;
switch (_that) {
case _ShippingQuotes():
return $default(_that.currency,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String currency,  List<ShippingOption> options)?  $default,) {final _that = this;
switch (_that) {
case _ShippingQuotes() when $default != null:
return $default(_that.currency,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShippingQuotes implements ShippingQuotes {
  const _ShippingQuotes({required this.currency, required final  List<ShippingOption> options}): _options = options;
  factory _ShippingQuotes.fromJson(Map<String, dynamic> json) => _$ShippingQuotesFromJson(json);

@override final  String currency;
 final  List<ShippingOption> _options;
@override List<ShippingOption> get options {
  if (_options is EqualUnmodifiableListView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_options);
}


/// Create a copy of ShippingQuotes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingQuotesCopyWith<_ShippingQuotes> get copyWith => __$ShippingQuotesCopyWithImpl<_ShippingQuotes>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingQuotesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingQuotes&&(identical(other.currency, currency) || other.currency == currency)&&const DeepCollectionEquality().equals(other._options, _options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,currency,const DeepCollectionEquality().hash(_options));

@override
String toString() {
  return 'ShippingQuotes(currency: $currency, options: $options)';
}


}

/// @nodoc
abstract mixin class _$ShippingQuotesCopyWith<$Res> implements $ShippingQuotesCopyWith<$Res> {
  factory _$ShippingQuotesCopyWith(_ShippingQuotes value, $Res Function(_ShippingQuotes) _then) = __$ShippingQuotesCopyWithImpl;
@override @useResult
$Res call({
 String currency, List<ShippingOption> options
});




}
/// @nodoc
class __$ShippingQuotesCopyWithImpl<$Res>
    implements _$ShippingQuotesCopyWith<$Res> {
  __$ShippingQuotesCopyWithImpl(this._self, this._then);

  final _ShippingQuotes _self;
  final $Res Function(_ShippingQuotes) _then;

/// Create a copy of ShippingQuotes
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? currency = null,Object? options = null,}) {
  return _then(_ShippingQuotes(
currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,options: null == options ? _self._options : options // ignore: cast_nullable_to_non_nullable
as List<ShippingOption>,
  ));
}


}


/// @nodoc
mixin _$ShippingQuotesRequest {

@JsonKey(name: 'contact_id') String get contactId;@JsonKey(name: 'draft_id') String? get draftId;@JsonKey(name: 'offer_id') String? get offerId; List<CheckoutLine>? get lines;
/// Create a copy of ShippingQuotesRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ShippingQuotesRequestCopyWith<ShippingQuotesRequest> get copyWith => _$ShippingQuotesRequestCopyWithImpl<ShippingQuotesRequest>(this as ShippingQuotesRequest, _$identity);

  /// Serializes this ShippingQuotesRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ShippingQuotesRequest&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.draftId, draftId) || other.draftId == draftId)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&const DeepCollectionEquality().equals(other.lines, lines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,draftId,offerId,const DeepCollectionEquality().hash(lines));

@override
String toString() {
  return 'ShippingQuotesRequest(contactId: $contactId, draftId: $draftId, offerId: $offerId, lines: $lines)';
}


}

/// @nodoc
abstract mixin class $ShippingQuotesRequestCopyWith<$Res>  {
  factory $ShippingQuotesRequestCopyWith(ShippingQuotesRequest value, $Res Function(ShippingQuotesRequest) _then) = _$ShippingQuotesRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'contact_id') String contactId,@JsonKey(name: 'draft_id') String? draftId,@JsonKey(name: 'offer_id') String? offerId, List<CheckoutLine>? lines
});




}
/// @nodoc
class _$ShippingQuotesRequestCopyWithImpl<$Res>
    implements $ShippingQuotesRequestCopyWith<$Res> {
  _$ShippingQuotesRequestCopyWithImpl(this._self, this._then);

  final ShippingQuotesRequest _self;
  final $Res Function(ShippingQuotesRequest) _then;

/// Create a copy of ShippingQuotesRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contactId = null,Object? draftId = freezed,Object? offerId = freezed,Object? lines = freezed,}) {
  return _then(_self.copyWith(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,draftId: freezed == draftId ? _self.draftId : draftId // ignore: cast_nullable_to_non_nullable
as String?,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,lines: freezed == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<CheckoutLine>?,
  ));
}

}


/// Adds pattern-matching-related methods to [ShippingQuotesRequest].
extension ShippingQuotesRequestPatterns on ShippingQuotesRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ShippingQuotesRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShippingQuotesRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ShippingQuotesRequest value)  $default,){
final _that = this;
switch (_that) {
case _ShippingQuotesRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ShippingQuotesRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ShippingQuotesRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'contact_id')  String contactId, @JsonKey(name: 'draft_id')  String? draftId, @JsonKey(name: 'offer_id')  String? offerId,  List<CheckoutLine>? lines)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShippingQuotesRequest() when $default != null:
return $default(_that.contactId,_that.draftId,_that.offerId,_that.lines);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'contact_id')  String contactId, @JsonKey(name: 'draft_id')  String? draftId, @JsonKey(name: 'offer_id')  String? offerId,  List<CheckoutLine>? lines)  $default,) {final _that = this;
switch (_that) {
case _ShippingQuotesRequest():
return $default(_that.contactId,_that.draftId,_that.offerId,_that.lines);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'contact_id')  String contactId, @JsonKey(name: 'draft_id')  String? draftId, @JsonKey(name: 'offer_id')  String? offerId,  List<CheckoutLine>? lines)?  $default,) {final _that = this;
switch (_that) {
case _ShippingQuotesRequest() when $default != null:
return $default(_that.contactId,_that.draftId,_that.offerId,_that.lines);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ShippingQuotesRequest implements ShippingQuotesRequest {
  const _ShippingQuotesRequest({@JsonKey(name: 'contact_id') required this.contactId, @JsonKey(name: 'draft_id') this.draftId, @JsonKey(name: 'offer_id') this.offerId, final  List<CheckoutLine>? lines}): _lines = lines;
  factory _ShippingQuotesRequest.fromJson(Map<String, dynamic> json) => _$ShippingQuotesRequestFromJson(json);

@override@JsonKey(name: 'contact_id') final  String contactId;
@override@JsonKey(name: 'draft_id') final  String? draftId;
@override@JsonKey(name: 'offer_id') final  String? offerId;
 final  List<CheckoutLine>? _lines;
@override List<CheckoutLine>? get lines {
  final value = _lines;
  if (value == null) return null;
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ShippingQuotesRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShippingQuotesRequestCopyWith<_ShippingQuotesRequest> get copyWith => __$ShippingQuotesRequestCopyWithImpl<_ShippingQuotesRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ShippingQuotesRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShippingQuotesRequest&&(identical(other.contactId, contactId) || other.contactId == contactId)&&(identical(other.draftId, draftId) || other.draftId == draftId)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&const DeepCollectionEquality().equals(other._lines, _lines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contactId,draftId,offerId,const DeepCollectionEquality().hash(_lines));

@override
String toString() {
  return 'ShippingQuotesRequest(contactId: $contactId, draftId: $draftId, offerId: $offerId, lines: $lines)';
}


}

/// @nodoc
abstract mixin class _$ShippingQuotesRequestCopyWith<$Res> implements $ShippingQuotesRequestCopyWith<$Res> {
  factory _$ShippingQuotesRequestCopyWith(_ShippingQuotesRequest value, $Res Function(_ShippingQuotesRequest) _then) = __$ShippingQuotesRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'contact_id') String contactId,@JsonKey(name: 'draft_id') String? draftId,@JsonKey(name: 'offer_id') String? offerId, List<CheckoutLine>? lines
});




}
/// @nodoc
class __$ShippingQuotesRequestCopyWithImpl<$Res>
    implements _$ShippingQuotesRequestCopyWith<$Res> {
  __$ShippingQuotesRequestCopyWithImpl(this._self, this._then);

  final _ShippingQuotesRequest _self;
  final $Res Function(_ShippingQuotesRequest) _then;

/// Create a copy of ShippingQuotesRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contactId = null,Object? draftId = freezed,Object? offerId = freezed,Object? lines = freezed,}) {
  return _then(_ShippingQuotesRequest(
contactId: null == contactId ? _self.contactId : contactId // ignore: cast_nullable_to_non_nullable
as String,draftId: freezed == draftId ? _self.draftId : draftId // ignore: cast_nullable_to_non_nullable
as String?,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,lines: freezed == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<CheckoutLine>?,
  ));
}


}


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

// dart format on
