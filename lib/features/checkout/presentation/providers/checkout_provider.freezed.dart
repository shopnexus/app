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

 CheckoutStep get step; List<Contact> get contacts; Contact? get selectedContact; List<CheckoutItem> get items; List<CartItem> get resolvedItems; bool get buyNow; String get shippingOption; QuoteTransportResponse? get quoteResponse; ShippingQuotes? get shippingQuotes; String get paymentOption; bool get useWallet; List<String> get promotionCodes; CheckoutResponse? get checkoutResponse; CheckoutResult? get checkoutResult; Transaction? get paymentTransaction; CheckoutSummary? get checkoutSummary; bool get isLoading; String? get errorMessage; String get preferredCurrency; Map<String, double> get rates; bool get agreeToTerms;
/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutStateCopyWith<CheckoutState> get copyWith => _$CheckoutStateCopyWithImpl<CheckoutState>(this as CheckoutState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other.contacts, contacts)&&(identical(other.selectedContact, selectedContact) || other.selectedContact == selectedContact)&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.resolvedItems, resolvedItems)&&(identical(other.buyNow, buyNow) || other.buyNow == buyNow)&&(identical(other.shippingOption, shippingOption) || other.shippingOption == shippingOption)&&(identical(other.quoteResponse, quoteResponse) || other.quoteResponse == quoteResponse)&&(identical(other.shippingQuotes, shippingQuotes) || other.shippingQuotes == shippingQuotes)&&(identical(other.paymentOption, paymentOption) || other.paymentOption == paymentOption)&&(identical(other.useWallet, useWallet) || other.useWallet == useWallet)&&const DeepCollectionEquality().equals(other.promotionCodes, promotionCodes)&&(identical(other.checkoutResponse, checkoutResponse) || other.checkoutResponse == checkoutResponse)&&(identical(other.checkoutResult, checkoutResult) || other.checkoutResult == checkoutResult)&&(identical(other.paymentTransaction, paymentTransaction) || other.paymentTransaction == paymentTransaction)&&(identical(other.checkoutSummary, checkoutSummary) || other.checkoutSummary == checkoutSummary)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.preferredCurrency, preferredCurrency) || other.preferredCurrency == preferredCurrency)&&const DeepCollectionEquality().equals(other.rates, rates)&&(identical(other.agreeToTerms, agreeToTerms) || other.agreeToTerms == agreeToTerms));
}


@override
int get hashCode => Object.hashAll([runtimeType,step,const DeepCollectionEquality().hash(contacts),selectedContact,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(resolvedItems),buyNow,shippingOption,quoteResponse,shippingQuotes,paymentOption,useWallet,const DeepCollectionEquality().hash(promotionCodes),checkoutResponse,checkoutResult,paymentTransaction,checkoutSummary,isLoading,errorMessage,preferredCurrency,const DeepCollectionEquality().hash(rates),agreeToTerms]);

@override
String toString() {
  return 'CheckoutState(step: $step, contacts: $contacts, selectedContact: $selectedContact, items: $items, resolvedItems: $resolvedItems, buyNow: $buyNow, shippingOption: $shippingOption, quoteResponse: $quoteResponse, shippingQuotes: $shippingQuotes, paymentOption: $paymentOption, useWallet: $useWallet, promotionCodes: $promotionCodes, checkoutResponse: $checkoutResponse, checkoutResult: $checkoutResult, paymentTransaction: $paymentTransaction, checkoutSummary: $checkoutSummary, isLoading: $isLoading, errorMessage: $errorMessage, preferredCurrency: $preferredCurrency, rates: $rates, agreeToTerms: $agreeToTerms)';
}


}

/// @nodoc
abstract mixin class $CheckoutStateCopyWith<$Res>  {
  factory $CheckoutStateCopyWith(CheckoutState value, $Res Function(CheckoutState) _then) = _$CheckoutStateCopyWithImpl;
@useResult
$Res call({
 CheckoutStep step, List<Contact> contacts, Contact? selectedContact, List<CheckoutItem> items, List<CartItem> resolvedItems, bool buyNow, String shippingOption, QuoteTransportResponse? quoteResponse, ShippingQuotes? shippingQuotes, String paymentOption, bool useWallet, List<String> promotionCodes, CheckoutResponse? checkoutResponse, CheckoutResult? checkoutResult, Transaction? paymentTransaction, CheckoutSummary? checkoutSummary, bool isLoading, String? errorMessage, String preferredCurrency, Map<String, double> rates, bool agreeToTerms
});


$ContactCopyWith<$Res>? get selectedContact;$QuoteTransportResponseCopyWith<$Res>? get quoteResponse;$ShippingQuotesCopyWith<$Res>? get shippingQuotes;$CheckoutResponseCopyWith<$Res>? get checkoutResponse;$CheckoutResultCopyWith<$Res>? get checkoutResult;$TransactionCopyWith<$Res>? get paymentTransaction;$CheckoutSummaryCopyWith<$Res>? get checkoutSummary;

}
/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._self, this._then);

  final CheckoutState _self;
  final $Res Function(CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? contacts = null,Object? selectedContact = freezed,Object? items = null,Object? resolvedItems = null,Object? buyNow = null,Object? shippingOption = null,Object? quoteResponse = freezed,Object? shippingQuotes = freezed,Object? paymentOption = null,Object? useWallet = null,Object? promotionCodes = null,Object? checkoutResponse = freezed,Object? checkoutResult = freezed,Object? paymentTransaction = freezed,Object? checkoutSummary = freezed,Object? isLoading = null,Object? errorMessage = freezed,Object? preferredCurrency = null,Object? rates = null,Object? agreeToTerms = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as CheckoutStep,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<Contact>,selectedContact: freezed == selectedContact ? _self.selectedContact : selectedContact // ignore: cast_nullable_to_non_nullable
as Contact?,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CheckoutItem>,resolvedItems: null == resolvedItems ? _self.resolvedItems : resolvedItems // ignore: cast_nullable_to_non_nullable
as List<CartItem>,buyNow: null == buyNow ? _self.buyNow : buyNow // ignore: cast_nullable_to_non_nullable
as bool,shippingOption: null == shippingOption ? _self.shippingOption : shippingOption // ignore: cast_nullable_to_non_nullable
as String,quoteResponse: freezed == quoteResponse ? _self.quoteResponse : quoteResponse // ignore: cast_nullable_to_non_nullable
as QuoteTransportResponse?,shippingQuotes: freezed == shippingQuotes ? _self.shippingQuotes : shippingQuotes // ignore: cast_nullable_to_non_nullable
as ShippingQuotes?,paymentOption: null == paymentOption ? _self.paymentOption : paymentOption // ignore: cast_nullable_to_non_nullable
as String,useWallet: null == useWallet ? _self.useWallet : useWallet // ignore: cast_nullable_to_non_nullable
as bool,promotionCodes: null == promotionCodes ? _self.promotionCodes : promotionCodes // ignore: cast_nullable_to_non_nullable
as List<String>,checkoutResponse: freezed == checkoutResponse ? _self.checkoutResponse : checkoutResponse // ignore: cast_nullable_to_non_nullable
as CheckoutResponse?,checkoutResult: freezed == checkoutResult ? _self.checkoutResult : checkoutResult // ignore: cast_nullable_to_non_nullable
as CheckoutResult?,paymentTransaction: freezed == paymentTransaction ? _self.paymentTransaction : paymentTransaction // ignore: cast_nullable_to_non_nullable
as Transaction?,checkoutSummary: freezed == checkoutSummary ? _self.checkoutSummary : checkoutSummary // ignore: cast_nullable_to_non_nullable
as CheckoutSummary?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,preferredCurrency: null == preferredCurrency ? _self.preferredCurrency : preferredCurrency // ignore: cast_nullable_to_non_nullable
as String,rates: null == rates ? _self.rates : rates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,agreeToTerms: null == agreeToTerms ? _self.agreeToTerms : agreeToTerms // ignore: cast_nullable_to_non_nullable
as bool,
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
$ShippingQuotesCopyWith<$Res>? get shippingQuotes {
    if (_self.shippingQuotes == null) {
    return null;
  }

  return $ShippingQuotesCopyWith<$Res>(_self.shippingQuotes!, (value) {
    return _then(_self.copyWith(shippingQuotes: value));
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
$CheckoutResultCopyWith<$Res>? get checkoutResult {
    if (_self.checkoutResult == null) {
    return null;
  }

  return $CheckoutResultCopyWith<$Res>(_self.checkoutResult!, (value) {
    return _then(_self.copyWith(checkoutResult: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionCopyWith<$Res>? get paymentTransaction {
    if (_self.paymentTransaction == null) {
    return null;
  }

  return $TransactionCopyWith<$Res>(_self.paymentTransaction!, (value) {
    return _then(_self.copyWith(paymentTransaction: value));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CheckoutStep step,  List<Contact> contacts,  Contact? selectedContact,  List<CheckoutItem> items,  List<CartItem> resolvedItems,  bool buyNow,  String shippingOption,  QuoteTransportResponse? quoteResponse,  ShippingQuotes? shippingQuotes,  String paymentOption,  bool useWallet,  List<String> promotionCodes,  CheckoutResponse? checkoutResponse,  CheckoutResult? checkoutResult,  Transaction? paymentTransaction,  CheckoutSummary? checkoutSummary,  bool isLoading,  String? errorMessage,  String preferredCurrency,  Map<String, double> rates,  bool agreeToTerms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.step,_that.contacts,_that.selectedContact,_that.items,_that.resolvedItems,_that.buyNow,_that.shippingOption,_that.quoteResponse,_that.shippingQuotes,_that.paymentOption,_that.useWallet,_that.promotionCodes,_that.checkoutResponse,_that.checkoutResult,_that.paymentTransaction,_that.checkoutSummary,_that.isLoading,_that.errorMessage,_that.preferredCurrency,_that.rates,_that.agreeToTerms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CheckoutStep step,  List<Contact> contacts,  Contact? selectedContact,  List<CheckoutItem> items,  List<CartItem> resolvedItems,  bool buyNow,  String shippingOption,  QuoteTransportResponse? quoteResponse,  ShippingQuotes? shippingQuotes,  String paymentOption,  bool useWallet,  List<String> promotionCodes,  CheckoutResponse? checkoutResponse,  CheckoutResult? checkoutResult,  Transaction? paymentTransaction,  CheckoutSummary? checkoutSummary,  bool isLoading,  String? errorMessage,  String preferredCurrency,  Map<String, double> rates,  bool agreeToTerms)  $default,) {final _that = this;
switch (_that) {
case _CheckoutState():
return $default(_that.step,_that.contacts,_that.selectedContact,_that.items,_that.resolvedItems,_that.buyNow,_that.shippingOption,_that.quoteResponse,_that.shippingQuotes,_that.paymentOption,_that.useWallet,_that.promotionCodes,_that.checkoutResponse,_that.checkoutResult,_that.paymentTransaction,_that.checkoutSummary,_that.isLoading,_that.errorMessage,_that.preferredCurrency,_that.rates,_that.agreeToTerms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CheckoutStep step,  List<Contact> contacts,  Contact? selectedContact,  List<CheckoutItem> items,  List<CartItem> resolvedItems,  bool buyNow,  String shippingOption,  QuoteTransportResponse? quoteResponse,  ShippingQuotes? shippingQuotes,  String paymentOption,  bool useWallet,  List<String> promotionCodes,  CheckoutResponse? checkoutResponse,  CheckoutResult? checkoutResult,  Transaction? paymentTransaction,  CheckoutSummary? checkoutSummary,  bool isLoading,  String? errorMessage,  String preferredCurrency,  Map<String, double> rates,  bool agreeToTerms)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.step,_that.contacts,_that.selectedContact,_that.items,_that.resolvedItems,_that.buyNow,_that.shippingOption,_that.quoteResponse,_that.shippingQuotes,_that.paymentOption,_that.useWallet,_that.promotionCodes,_that.checkoutResponse,_that.checkoutResult,_that.paymentTransaction,_that.checkoutSummary,_that.isLoading,_that.errorMessage,_that.preferredCurrency,_that.rates,_that.agreeToTerms);case _:
  return null;

}
}

}

/// @nodoc


class _CheckoutState extends CheckoutState {
  const _CheckoutState({this.step = CheckoutStep.address, final  List<Contact> contacts = const [], this.selectedContact, final  List<CheckoutItem> items = const [], final  List<CartItem> resolvedItems = const [], this.buyNow = false, this.shippingOption = 'Standard', this.quoteResponse, this.shippingQuotes, this.paymentOption = 'Stripe', this.useWallet = false, final  List<String> promotionCodes = const [], this.checkoutResponse, this.checkoutResult, this.paymentTransaction, this.checkoutSummary, this.isLoading = false, this.errorMessage, this.preferredCurrency = 'USD', final  Map<String, double> rates = const {}, this.agreeToTerms = true}): _contacts = contacts,_items = items,_resolvedItems = resolvedItems,_promotionCodes = promotionCodes,_rates = rates,super._();
  

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

 final  List<CartItem> _resolvedItems;
@override@JsonKey() List<CartItem> get resolvedItems {
  if (_resolvedItems is EqualUnmodifiableListView) return _resolvedItems;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_resolvedItems);
}

@override@JsonKey() final  bool buyNow;
@override@JsonKey() final  String shippingOption;
@override final  QuoteTransportResponse? quoteResponse;
@override final  ShippingQuotes? shippingQuotes;
@override@JsonKey() final  String paymentOption;
@override@JsonKey() final  bool useWallet;
 final  List<String> _promotionCodes;
@override@JsonKey() List<String> get promotionCodes {
  if (_promotionCodes is EqualUnmodifiableListView) return _promotionCodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_promotionCodes);
}

@override final  CheckoutResponse? checkoutResponse;
@override final  CheckoutResult? checkoutResult;
@override final  Transaction? paymentTransaction;
@override final  CheckoutSummary? checkoutSummary;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override@JsonKey() final  String preferredCurrency;
 final  Map<String, double> _rates;
@override@JsonKey() Map<String, double> get rates {
  if (_rates is EqualUnmodifiableMapView) return _rates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_rates);
}

@override@JsonKey() final  bool agreeToTerms;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutStateCopyWith<_CheckoutState> get copyWith => __$CheckoutStateCopyWithImpl<_CheckoutState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutState&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other._contacts, _contacts)&&(identical(other.selectedContact, selectedContact) || other.selectedContact == selectedContact)&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._resolvedItems, _resolvedItems)&&(identical(other.buyNow, buyNow) || other.buyNow == buyNow)&&(identical(other.shippingOption, shippingOption) || other.shippingOption == shippingOption)&&(identical(other.quoteResponse, quoteResponse) || other.quoteResponse == quoteResponse)&&(identical(other.shippingQuotes, shippingQuotes) || other.shippingQuotes == shippingQuotes)&&(identical(other.paymentOption, paymentOption) || other.paymentOption == paymentOption)&&(identical(other.useWallet, useWallet) || other.useWallet == useWallet)&&const DeepCollectionEquality().equals(other._promotionCodes, _promotionCodes)&&(identical(other.checkoutResponse, checkoutResponse) || other.checkoutResponse == checkoutResponse)&&(identical(other.checkoutResult, checkoutResult) || other.checkoutResult == checkoutResult)&&(identical(other.paymentTransaction, paymentTransaction) || other.paymentTransaction == paymentTransaction)&&(identical(other.checkoutSummary, checkoutSummary) || other.checkoutSummary == checkoutSummary)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.preferredCurrency, preferredCurrency) || other.preferredCurrency == preferredCurrency)&&const DeepCollectionEquality().equals(other._rates, _rates)&&(identical(other.agreeToTerms, agreeToTerms) || other.agreeToTerms == agreeToTerms));
}


@override
int get hashCode => Object.hashAll([runtimeType,step,const DeepCollectionEquality().hash(_contacts),selectedContact,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_resolvedItems),buyNow,shippingOption,quoteResponse,shippingQuotes,paymentOption,useWallet,const DeepCollectionEquality().hash(_promotionCodes),checkoutResponse,checkoutResult,paymentTransaction,checkoutSummary,isLoading,errorMessage,preferredCurrency,const DeepCollectionEquality().hash(_rates),agreeToTerms]);

@override
String toString() {
  return 'CheckoutState(step: $step, contacts: $contacts, selectedContact: $selectedContact, items: $items, resolvedItems: $resolvedItems, buyNow: $buyNow, shippingOption: $shippingOption, quoteResponse: $quoteResponse, shippingQuotes: $shippingQuotes, paymentOption: $paymentOption, useWallet: $useWallet, promotionCodes: $promotionCodes, checkoutResponse: $checkoutResponse, checkoutResult: $checkoutResult, paymentTransaction: $paymentTransaction, checkoutSummary: $checkoutSummary, isLoading: $isLoading, errorMessage: $errorMessage, preferredCurrency: $preferredCurrency, rates: $rates, agreeToTerms: $agreeToTerms)';
}


}

/// @nodoc
abstract mixin class _$CheckoutStateCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$CheckoutStateCopyWith(_CheckoutState value, $Res Function(_CheckoutState) _then) = __$CheckoutStateCopyWithImpl;
@override @useResult
$Res call({
 CheckoutStep step, List<Contact> contacts, Contact? selectedContact, List<CheckoutItem> items, List<CartItem> resolvedItems, bool buyNow, String shippingOption, QuoteTransportResponse? quoteResponse, ShippingQuotes? shippingQuotes, String paymentOption, bool useWallet, List<String> promotionCodes, CheckoutResponse? checkoutResponse, CheckoutResult? checkoutResult, Transaction? paymentTransaction, CheckoutSummary? checkoutSummary, bool isLoading, String? errorMessage, String preferredCurrency, Map<String, double> rates, bool agreeToTerms
});


@override $ContactCopyWith<$Res>? get selectedContact;@override $QuoteTransportResponseCopyWith<$Res>? get quoteResponse;@override $ShippingQuotesCopyWith<$Res>? get shippingQuotes;@override $CheckoutResponseCopyWith<$Res>? get checkoutResponse;@override $CheckoutResultCopyWith<$Res>? get checkoutResult;@override $TransactionCopyWith<$Res>? get paymentTransaction;@override $CheckoutSummaryCopyWith<$Res>? get checkoutSummary;

}
/// @nodoc
class __$CheckoutStateCopyWithImpl<$Res>
    implements _$CheckoutStateCopyWith<$Res> {
  __$CheckoutStateCopyWithImpl(this._self, this._then);

  final _CheckoutState _self;
  final $Res Function(_CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? contacts = null,Object? selectedContact = freezed,Object? items = null,Object? resolvedItems = null,Object? buyNow = null,Object? shippingOption = null,Object? quoteResponse = freezed,Object? shippingQuotes = freezed,Object? paymentOption = null,Object? useWallet = null,Object? promotionCodes = null,Object? checkoutResponse = freezed,Object? checkoutResult = freezed,Object? paymentTransaction = freezed,Object? checkoutSummary = freezed,Object? isLoading = null,Object? errorMessage = freezed,Object? preferredCurrency = null,Object? rates = null,Object? agreeToTerms = null,}) {
  return _then(_CheckoutState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as CheckoutStep,contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<Contact>,selectedContact: freezed == selectedContact ? _self.selectedContact : selectedContact // ignore: cast_nullable_to_non_nullable
as Contact?,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CheckoutItem>,resolvedItems: null == resolvedItems ? _self._resolvedItems : resolvedItems // ignore: cast_nullable_to_non_nullable
as List<CartItem>,buyNow: null == buyNow ? _self.buyNow : buyNow // ignore: cast_nullable_to_non_nullable
as bool,shippingOption: null == shippingOption ? _self.shippingOption : shippingOption // ignore: cast_nullable_to_non_nullable
as String,quoteResponse: freezed == quoteResponse ? _self.quoteResponse : quoteResponse // ignore: cast_nullable_to_non_nullable
as QuoteTransportResponse?,shippingQuotes: freezed == shippingQuotes ? _self.shippingQuotes : shippingQuotes // ignore: cast_nullable_to_non_nullable
as ShippingQuotes?,paymentOption: null == paymentOption ? _self.paymentOption : paymentOption // ignore: cast_nullable_to_non_nullable
as String,useWallet: null == useWallet ? _self.useWallet : useWallet // ignore: cast_nullable_to_non_nullable
as bool,promotionCodes: null == promotionCodes ? _self._promotionCodes : promotionCodes // ignore: cast_nullable_to_non_nullable
as List<String>,checkoutResponse: freezed == checkoutResponse ? _self.checkoutResponse : checkoutResponse // ignore: cast_nullable_to_non_nullable
as CheckoutResponse?,checkoutResult: freezed == checkoutResult ? _self.checkoutResult : checkoutResult // ignore: cast_nullable_to_non_nullable
as CheckoutResult?,paymentTransaction: freezed == paymentTransaction ? _self.paymentTransaction : paymentTransaction // ignore: cast_nullable_to_non_nullable
as Transaction?,checkoutSummary: freezed == checkoutSummary ? _self.checkoutSummary : checkoutSummary // ignore: cast_nullable_to_non_nullable
as CheckoutSummary?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,preferredCurrency: null == preferredCurrency ? _self.preferredCurrency : preferredCurrency // ignore: cast_nullable_to_non_nullable
as String,rates: null == rates ? _self._rates : rates // ignore: cast_nullable_to_non_nullable
as Map<String, double>,agreeToTerms: null == agreeToTerms ? _self.agreeToTerms : agreeToTerms // ignore: cast_nullable_to_non_nullable
as bool,
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
$ShippingQuotesCopyWith<$Res>? get shippingQuotes {
    if (_self.shippingQuotes == null) {
    return null;
  }

  return $ShippingQuotesCopyWith<$Res>(_self.shippingQuotes!, (value) {
    return _then(_self.copyWith(shippingQuotes: value));
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
$CheckoutResultCopyWith<$Res>? get checkoutResult {
    if (_self.checkoutResult == null) {
    return null;
  }

  return $CheckoutResultCopyWith<$Res>(_self.checkoutResult!, (value) {
    return _then(_self.copyWith(checkoutResult: value));
  });
}/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TransactionCopyWith<$Res>? get paymentTransaction {
    if (_self.paymentTransaction == null) {
    return null;
  }

  return $TransactionCopyWith<$Res>(_self.paymentTransaction!, (value) {
    return _then(_self.copyWith(paymentTransaction: value));
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
