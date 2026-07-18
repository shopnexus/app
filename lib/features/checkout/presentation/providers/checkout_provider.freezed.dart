// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckoutState {

 CheckoutStep get step; List<Contact> get contacts; Contact? get selectedContact; List<CheckoutItem> get items; bool get buyNow; String get shippingOption; QuoteTransportResponse? get quoteResponse; String get paymentOption; bool get useWallet; List<String> get promotionCodes; CheckoutResponse? get checkoutResponse; CheckoutSummary? get checkoutSummary; bool get isLoading; String? get errorMessage;
/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutStateCopyWith<CheckoutState> get copyWith => _$CheckoutStateCopyWithImpl<CheckoutState>(this as CheckoutState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other.contacts, contacts)&&(identical(other.selectedContact, selectedContact) || other.selectedContact == selectedContact)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.buyNow, buyNow) || other.buyNow == buyNow)&&(identical(other.shippingOption, shippingOption) || other.shippingOption == shippingOption)&&(identical(other.quoteResponse, quoteResponse) || other.quoteResponse == quoteResponse)&&(identical(other.paymentOption, paymentOption) || other.paymentOption == paymentOption)&&(identical(other.useWallet, useWallet) || other.useWallet == useWallet)&&const DeepCollectionEquality().equals(other.promotionCodes, promotionCodes)&&(identical(other.checkoutResponse, checkoutResponse) || other.checkoutResponse == checkoutResponse)&&(identical(other.checkoutSummary, checkoutSummary) || other.checkoutSummary == checkoutSummary)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,step,const DeepCollectionEquality().hash(contacts),selectedContact,const DeepCollectionEquality().hash(items),buyNow,shippingOption,quoteResponse,paymentOption,useWallet,const DeepCollectionEquality().hash(promotionCodes),checkoutResponse,checkoutSummary,isLoading,errorMessage);

@override
String toString() {
  return 'CheckoutState(step: $step, contacts: $contacts, selectedContact: $selectedContact, items: $items, buyNow: $buyNow, shippingOption: $shippingOption, quoteResponse: $quoteResponse, paymentOption: $paymentOption, useWallet: $useWallet, promotionCodes: $promotionCodes, checkoutResponse: $checkoutResponse, checkoutSummary: $checkoutSummary, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $CheckoutStateCopyWith<$Res>  {
  factory $CheckoutStateCopyWith(CheckoutState value, $Res Function(CheckoutState) _then) = _$CheckoutStateCopyWithImpl;
@useResult
$Res call({
 CheckoutStep step, List<Contact> contacts, Contact? selectedContact, List<CheckoutItem> items, bool buyNow, String shippingOption, QuoteTransportResponse? quoteResponse, String paymentOption, bool useWallet, List<String> promotionCodes, CheckoutResponse? checkoutResponse, CheckoutSummary? checkoutSummary, bool isLoading, String? errorMessage
});


$ContactCopyWith<$Res>? get selectedContact;$QuoteTransportResponseCopyWith<$Res>? get quoteResponse;$CheckoutResponseCopyWith<$Res>? get checkoutResponse;$CheckoutSummaryCopyWith<$Res>? get checkoutSummary;

}
/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._self, this._then);

  final CheckoutState _self;
  final $Res Function(CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? contacts = null,Object? selectedContact = freezed,Object? items = null,Object? buyNow = null,Object? shippingOption = null,Object? quoteResponse = freezed,Object? paymentOption = null,Object? useWallet = null,Object? promotionCodes = null,Object? checkoutResponse = freezed,Object? checkoutSummary = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as CheckoutStep,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<Contact>,selectedContact: freezed == selectedContact ? _self.selectedContact : selectedContact // ignore: cast_nullable_to_non_nullable
as Contact?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CheckoutItem>,buyNow: null == buyNow ? _self.buyNow : buyNow // ignore: cast_nullable_to_non_nullable
as bool,shippingOption: null == shippingOption ? _self.shippingOption : shippingOption // ignore: cast_nullable_to_non_nullable
as String,quoteResponse: freezed == quoteResponse ? _self.quoteResponse : quoteResponse // ignore: cast_nullable_to_non_nullable
as QuoteTransportResponse?,paymentOption: null == paymentOption ? _self.paymentOption : paymentOption // ignore: cast_nullable_to_non_nullable
as String,useWallet: null == useWallet ? _self.useWallet : useWallet // ignore: cast_nullable_to_non_nullable
as bool,promotionCodes: null == promotionCodes ? _self.promotionCodes : promotionCodes // ignore: cast_nullable_to_non_nullable
as List<String>,checkoutResponse: freezed == checkoutResponse ? _self.checkoutResponse : checkoutResponse // ignore: cast_nullable_to_non_nullable
as CheckoutResponse?,checkoutSummary: freezed == checkoutSummary ? _self.checkoutSummary : checkoutSummary // ignore: cast_nullable_to_non_nullable
as CheckoutSummary?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactCopyWith<$Res>? get selectedContact {
    if (_self.selectedContact == null) {
    return null;
  }

  return $ContactCopyWith<$Res>(_self.selectedContact!, (value) {
    return _then(_self.copyWith(selectedContact: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteTransportResponseCopyWith<$Res>? get quoteResponse {
    if (_self.quoteResponse == null) {
    return null;
  }

  return $QuoteTransportResponseCopyWith<$Res>(_self.quoteResponse!, (value) {
    return _then(_self.copyWith(quoteResponse: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutResponseCopyWith<$Res>? get checkoutResponse {
    if (_self.checkoutResponse == null) {
    return null;
  }

  return $CheckoutResponseCopyWith<$Res>(_self.checkoutResponse!, (value) {
    return _then(_self.copyWith(checkoutResponse: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutSummaryCopyWith<$Res>? get checkoutSummary {
    if (_self.checkoutSummary == null) {
    return null;
  }

  return $CheckoutSummaryCopyWith<$Res>(_self.checkoutSummary!, (value) {
    return _then(_self.copyWith(checkoutSummary: value));
  });
}
}


/// Adds pattern-matching-related methods to [CheckoutState].
extension CheckoutStatePatterns on CheckoutState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckoutState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckoutState value)  $default,){
final _that = this;
switch (_that) {
case _CheckoutState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckoutState value)?  $default,){
final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CheckoutStep step,  List<Contact> contacts,  Contact? selectedContact,  List<CheckoutItem> items,  bool buyNow,  String shippingOption,  QuoteTransportResponse? quoteResponse,  String paymentOption,  bool useWallet,  List<String> promotionCodes,  CheckoutResponse? checkoutResponse,  CheckoutSummary? checkoutSummary,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.step,_that.contacts,_that.selectedContact,_that.items,_that.buyNow,_that.shippingOption,_that.quoteResponse,_that.paymentOption,_that.useWallet,_that.promotionCodes,_that.checkoutResponse,_that.checkoutSummary,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CheckoutStep step,  List<Contact> contacts,  Contact? selectedContact,  List<CheckoutItem> items,  bool buyNow,  String shippingOption,  QuoteTransportResponse? quoteResponse,  String paymentOption,  bool useWallet,  List<String> promotionCodes,  CheckoutResponse? checkoutResponse,  CheckoutSummary? checkoutSummary,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _CheckoutState():
return $default(_that.step,_that.contacts,_that.selectedContact,_that.items,_that.buyNow,_that.shippingOption,_that.quoteResponse,_that.paymentOption,_that.useWallet,_that.promotionCodes,_that.checkoutResponse,_that.checkoutSummary,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CheckoutStep step,  List<Contact> contacts,  Contact? selectedContact,  List<CheckoutItem> items,  bool buyNow,  String shippingOption,  QuoteTransportResponse? quoteResponse,  String paymentOption,  bool useWallet,  List<String> promotionCodes,  CheckoutResponse? checkoutResponse,  CheckoutSummary? checkoutSummary,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.step,_that.contacts,_that.selectedContact,_that.items,_that.buyNow,_that.shippingOption,_that.quoteResponse,_that.paymentOption,_that.useWallet,_that.promotionCodes,_that.checkoutResponse,_that.checkoutSummary,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CheckoutState extends CheckoutState {
  const _CheckoutState({this.step = CheckoutStep.address, final  List<Contact> contacts = const [], this.selectedContact, final  List<CheckoutItem> items = const [], this.buyNow = false, this.shippingOption = 'Standard', this.quoteResponse, this.paymentOption = 'Stripe', this.useWallet = false, final  List<String> promotionCodes = const [], this.checkoutResponse, this.checkoutSummary, this.isLoading = false, this.errorMessage}): _contacts = contacts,_items = items,_promotionCodes = promotionCodes,super._();
  

@override@JsonKey() final  CheckoutStep step;
 final  List<Contact> _contacts;
@override@JsonKey() List<Contact> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}

@override final  Contact? selectedContact;
 final  List<CheckoutItem> _items;
@override@JsonKey() List<CheckoutItem> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  bool buyNow;
@override@JsonKey() final  String shippingOption;
@override final  QuoteTransportResponse? quoteResponse;
@override@JsonKey() final  String paymentOption;
@override@JsonKey() final  bool useWallet;
 final  List<String> _promotionCodes;
@override@JsonKey() List<String> get promotionCodes {
  if (_promotionCodes is EqualUnmodifiableListView) return _promotionCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_promotionCodes);
}

@override final  CheckoutResponse? checkoutResponse;
@override final  CheckoutSummary? checkoutSummary;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutStateCopyWith<_CheckoutState> get copyWith => __$CheckoutStateCopyWithImpl<_CheckoutState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutState&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other._contacts, _contacts)&&(identical(other.selectedContact, selectedContact) || other.selectedContact == selectedContact)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.buyNow, buyNow) || other.buyNow == buyNow)&&(identical(other.shippingOption, shippingOption) || other.shippingOption == shippingOption)&&(identical(other.quoteResponse, quoteResponse) || other.quoteResponse == quoteResponse)&&(identical(other.paymentOption, paymentOption) || other.paymentOption == paymentOption)&&(identical(other.useWallet, useWallet) || other.useWallet == useWallet)&&const DeepCollectionEquality().equals(other._promotionCodes, _promotionCodes)&&(identical(other.checkoutResponse, checkoutResponse) || other.checkoutResponse == checkoutResponse)&&(identical(other.checkoutSummary, checkoutSummary) || other.checkoutSummary == checkoutSummary)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,step,const DeepCollectionEquality().hash(_contacts),selectedContact,const DeepCollectionEquality().hash(_items),buyNow,shippingOption,quoteResponse,paymentOption,useWallet,const DeepCollectionEquality().hash(_promotionCodes),checkoutResponse,checkoutSummary,isLoading,errorMessage);

@override
String toString() {
  return 'CheckoutState(step: $step, contacts: $contacts, selectedContact: $selectedContact, items: $items, buyNow: $buyNow, shippingOption: $shippingOption, quoteResponse: $quoteResponse, paymentOption: $paymentOption, useWallet: $useWallet, promotionCodes: $promotionCodes, checkoutResponse: $checkoutResponse, checkoutSummary: $checkoutSummary, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$CheckoutStateCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$CheckoutStateCopyWith(_CheckoutState value, $Res Function(_CheckoutState) _then) = __$CheckoutStateCopyWithImpl;
@override @useResult
$Res call({
 CheckoutStep step, List<Contact> contacts, Contact? selectedContact, List<CheckoutItem> items, bool buyNow, String shippingOption, QuoteTransportResponse? quoteResponse, String paymentOption, bool useWallet, List<String> promotionCodes, CheckoutResponse? checkoutResponse, CheckoutSummary? checkoutSummary, bool isLoading, String? errorMessage
});


@override $ContactCopyWith<$Res>? get selectedContact;@override $QuoteTransportResponseCopyWith<$Res>? get quoteResponse;@override $CheckoutResponseCopyWith<$Res>? get checkoutResponse;@override $CheckoutSummaryCopyWith<$Res>? get checkoutSummary;

}
/// @nodoc
class __$CheckoutStateCopyWithImpl<$Res>
    implements _$CheckoutStateCopyWith<$Res> {
  __$CheckoutStateCopyWithImpl(this._self, this._then);

  final _CheckoutState _self;
  final $Res Function(_CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? contacts = null,Object? selectedContact = freezed,Object? items = null,Object? buyNow = null,Object? shippingOption = null,Object? quoteResponse = freezed,Object? paymentOption = null,Object? useWallet = null,Object? promotionCodes = null,Object? checkoutResponse = freezed,Object? checkoutSummary = freezed,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_CheckoutState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as CheckoutStep,contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<Contact>,selectedContact: freezed == selectedContact ? _self.selectedContact : selectedContact // ignore: cast_nullable_to_non_nullable
as Contact?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CheckoutItem>,buyNow: null == buyNow ? _self.buyNow : buyNow // ignore: cast_nullable_to_non_nullable
as bool,shippingOption: null == shippingOption ? _self.shippingOption : shippingOption // ignore: cast_nullable_to_non_nullable
as String,quoteResponse: freezed == quoteResponse ? _self.quoteResponse : quoteResponse // ignore: cast_nullable_to_non_nullable
as QuoteTransportResponse?,paymentOption: null == paymentOption ? _self.paymentOption : paymentOption // ignore: cast_nullable_to_non_nullable
as String,useWallet: null == useWallet ? _self.useWallet : useWallet // ignore: cast_nullable_to_non_nullable
as bool,promotionCodes: null == promotionCodes ? _self._promotionCodes : promotionCodes // ignore: cast_nullable_to_non_nullable
as List<String>,checkoutResponse: freezed == checkoutResponse ? _self.checkoutResponse : checkoutResponse // ignore: cast_nullable_to_non_nullable
as CheckoutResponse?,checkoutSummary: freezed == checkoutSummary ? _self.checkoutSummary : checkoutSummary // ignore: cast_nullable_to_non_nullable
as CheckoutSummary?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ContactCopyWith<$Res>? get selectedContact {
    if (_self.selectedContact == null) {
    return null;
  }

  return $ContactCopyWith<$Res>(_self.selectedContact!, (value) {
    return _then(_self.copyWith(selectedContact: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$QuoteTransportResponseCopyWith<$Res>? get quoteResponse {
    if (_self.quoteResponse == null) {
    return null;
  }

  return $QuoteTransportResponseCopyWith<$Res>(_self.quoteResponse!, (value) {
    return _then(_self.copyWith(quoteResponse: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutResponseCopyWith<$Res>? get checkoutResponse {
    if (_self.checkoutResponse == null) {
    return null;
  }

  return $CheckoutResponseCopyWith<$Res>(_self.checkoutResponse!, (value) {
    return _then(_self.copyWith(checkoutResponse: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CheckoutSummaryCopyWith<$Res>? get checkoutSummary {
    if (_self.checkoutSummary == null) {
    return null;
  }

  return $CheckoutSummaryCopyWith<$Res>(_self.checkoutSummary!, (value) {
    return _then(_self.copyWith(checkoutSummary: value));
  });
}
}

// dart format on
