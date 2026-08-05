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

 CheckoutStep get step; List<Contact> get contacts; Contact? get selectedContact; List<PurchaseLine> get lines; ShippingQuotes? get shippingQuotes;/// The carrier slug the buyer is buying, always one `POST /shipping-quotes`
/// answered — never a label. Null until a quote has been asked for.
 String? get transportOption; CheckoutResult? get checkoutResult; Transaction? get paymentTransaction; PaymentSession? get paymentSession; bool get isLoading; String? get errorMessage; bool get agreeToTerms;
/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckoutStateCopyWith<CheckoutState> get copyWith => _$CheckoutStateCopyWithImpl<CheckoutState>(this as CheckoutState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckoutState&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other.contacts, contacts)&&(identical(other.selectedContact, selectedContact) || other.selectedContact == selectedContact)&&const DeepCollectionEquality().equals(other.lines, lines)&&(identical(other.shippingQuotes, shippingQuotes) || other.shippingQuotes == shippingQuotes)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption)&&(identical(other.checkoutResult, checkoutResult) || other.checkoutResult == checkoutResult)&&(identical(other.paymentTransaction, paymentTransaction) || other.paymentTransaction == paymentTransaction)&&(identical(other.paymentSession, paymentSession) || other.paymentSession == paymentSession)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.agreeToTerms, agreeToTerms) || other.agreeToTerms == agreeToTerms));
}


@override
int get hashCode => Object.hash(runtimeType,step,const DeepCollectionEquality().hash(contacts),selectedContact,const DeepCollectionEquality().hash(lines),shippingQuotes,transportOption,checkoutResult,paymentTransaction,paymentSession,isLoading,errorMessage,agreeToTerms);

@override
String toString() {
  return 'CheckoutState(step: $step, contacts: $contacts, selectedContact: $selectedContact, lines: $lines, shippingQuotes: $shippingQuotes, transportOption: $transportOption, checkoutResult: $checkoutResult, paymentTransaction: $paymentTransaction, paymentSession: $paymentSession, isLoading: $isLoading, errorMessage: $errorMessage, agreeToTerms: $agreeToTerms)';
}


}

/// @nodoc
abstract mixin class $CheckoutStateCopyWith<$Res>  {
  factory $CheckoutStateCopyWith(CheckoutState value, $Res Function(CheckoutState) _then) = _$CheckoutStateCopyWithImpl;
@useResult
$Res call({
 CheckoutStep step, List<Contact> contacts, Contact? selectedContact, List<PurchaseLine> lines, ShippingQuotes? shippingQuotes, String? transportOption, CheckoutResult? checkoutResult, Transaction? paymentTransaction, PaymentSession? paymentSession, bool isLoading, String? errorMessage, bool agreeToTerms
});




}
/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._self, this._then);

  final CheckoutState _self;
  final $Res Function(CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? contacts = null,Object? selectedContact = freezed,Object? lines = null,Object? shippingQuotes = freezed,Object? transportOption = freezed,Object? checkoutResult = freezed,Object? paymentTransaction = freezed,Object? paymentSession = freezed,Object? isLoading = null,Object? errorMessage = freezed,Object? agreeToTerms = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as CheckoutStep,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<Contact>,selectedContact: freezed == selectedContact ? _self.selectedContact : selectedContact // ignore: cast_nullable_to_non_nullable
as Contact?,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<PurchaseLine>,shippingQuotes: freezed == shippingQuotes ? _self.shippingQuotes : shippingQuotes // ignore: cast_nullable_to_non_nullable
as ShippingQuotes?,transportOption: freezed == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String?,checkoutResult: freezed == checkoutResult ? _self.checkoutResult : checkoutResult // ignore: cast_nullable_to_non_nullable
as CheckoutResult?,paymentTransaction: freezed == paymentTransaction ? _self.paymentTransaction : paymentTransaction // ignore: cast_nullable_to_non_nullable
as Transaction?,paymentSession: freezed == paymentSession ? _self.paymentSession : paymentSession // ignore: cast_nullable_to_non_nullable
as PaymentSession?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,agreeToTerms: null == agreeToTerms ? _self.agreeToTerms : agreeToTerms // ignore: cast_nullable_to_non_nullable
as bool,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CheckoutStep step,  List<Contact> contacts,  Contact? selectedContact,  List<PurchaseLine> lines,  ShippingQuotes? shippingQuotes,  String? transportOption,  CheckoutResult? checkoutResult,  Transaction? paymentTransaction,  PaymentSession? paymentSession,  bool isLoading,  String? errorMessage,  bool agreeToTerms)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.step,_that.contacts,_that.selectedContact,_that.lines,_that.shippingQuotes,_that.transportOption,_that.checkoutResult,_that.paymentTransaction,_that.paymentSession,_that.isLoading,_that.errorMessage,_that.agreeToTerms);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CheckoutStep step,  List<Contact> contacts,  Contact? selectedContact,  List<PurchaseLine> lines,  ShippingQuotes? shippingQuotes,  String? transportOption,  CheckoutResult? checkoutResult,  Transaction? paymentTransaction,  PaymentSession? paymentSession,  bool isLoading,  String? errorMessage,  bool agreeToTerms)  $default,) {final _that = this;
switch (_that) {
case _CheckoutState():
return $default(_that.step,_that.contacts,_that.selectedContact,_that.lines,_that.shippingQuotes,_that.transportOption,_that.checkoutResult,_that.paymentTransaction,_that.paymentSession,_that.isLoading,_that.errorMessage,_that.agreeToTerms);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CheckoutStep step,  List<Contact> contacts,  Contact? selectedContact,  List<PurchaseLine> lines,  ShippingQuotes? shippingQuotes,  String? transportOption,  CheckoutResult? checkoutResult,  Transaction? paymentTransaction,  PaymentSession? paymentSession,  bool isLoading,  String? errorMessage,  bool agreeToTerms)?  $default,) {final _that = this;
switch (_that) {
case _CheckoutState() when $default != null:
return $default(_that.step,_that.contacts,_that.selectedContact,_that.lines,_that.shippingQuotes,_that.transportOption,_that.checkoutResult,_that.paymentTransaction,_that.paymentSession,_that.isLoading,_that.errorMessage,_that.agreeToTerms);case _:
  return null;

}
}

}

/// @nodoc


class _CheckoutState extends CheckoutState {
  const _CheckoutState({this.step = CheckoutStep.address, final  List<Contact> contacts = const [], this.selectedContact, final  List<PurchaseLine> lines = const [], this.shippingQuotes, this.transportOption, this.checkoutResult, this.paymentTransaction, this.paymentSession, this.isLoading = false, this.errorMessage, this.agreeToTerms = true}): _contacts = contacts,_lines = lines,super._();
  

@override@JsonKey() final  CheckoutStep step;
 final  List<Contact> _contacts;
@override@JsonKey() List<Contact> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}

@override final  Contact? selectedContact;
 final  List<PurchaseLine> _lines;
@override@JsonKey() List<PurchaseLine> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

@override final  ShippingQuotes? shippingQuotes;
/// The carrier slug the buyer is buying, always one `POST /shipping-quotes`
/// answered — never a label. Null until a quote has been asked for.
@override final  String? transportOption;
@override final  CheckoutResult? checkoutResult;
@override final  Transaction? paymentTransaction;
@override final  PaymentSession? paymentSession;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
@override@JsonKey() final  bool agreeToTerms;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckoutStateCopyWith<_CheckoutState> get copyWith => __$CheckoutStateCopyWithImpl<_CheckoutState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckoutState&&(identical(other.step, step) || other.step == step)&&const DeepCollectionEquality().equals(other._contacts, _contacts)&&(identical(other.selectedContact, selectedContact) || other.selectedContact == selectedContact)&&const DeepCollectionEquality().equals(other._lines, _lines)&&(identical(other.shippingQuotes, shippingQuotes) || other.shippingQuotes == shippingQuotes)&&(identical(other.transportOption, transportOption) || other.transportOption == transportOption)&&(identical(other.checkoutResult, checkoutResult) || other.checkoutResult == checkoutResult)&&(identical(other.paymentTransaction, paymentTransaction) || other.paymentTransaction == paymentTransaction)&&(identical(other.paymentSession, paymentSession) || other.paymentSession == paymentSession)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.agreeToTerms, agreeToTerms) || other.agreeToTerms == agreeToTerms));
}


@override
int get hashCode => Object.hash(runtimeType,step,const DeepCollectionEquality().hash(_contacts),selectedContact,const DeepCollectionEquality().hash(_lines),shippingQuotes,transportOption,checkoutResult,paymentTransaction,paymentSession,isLoading,errorMessage,agreeToTerms);

@override
String toString() {
  return 'CheckoutState(step: $step, contacts: $contacts, selectedContact: $selectedContact, lines: $lines, shippingQuotes: $shippingQuotes, transportOption: $transportOption, checkoutResult: $checkoutResult, paymentTransaction: $paymentTransaction, paymentSession: $paymentSession, isLoading: $isLoading, errorMessage: $errorMessage, agreeToTerms: $agreeToTerms)';
}


}

/// @nodoc
abstract mixin class _$CheckoutStateCopyWith<$Res> implements $CheckoutStateCopyWith<$Res> {
  factory _$CheckoutStateCopyWith(_CheckoutState value, $Res Function(_CheckoutState) _then) = __$CheckoutStateCopyWithImpl;
@override @useResult
$Res call({
 CheckoutStep step, List<Contact> contacts, Contact? selectedContact, List<PurchaseLine> lines, ShippingQuotes? shippingQuotes, String? transportOption, CheckoutResult? checkoutResult, Transaction? paymentTransaction, PaymentSession? paymentSession, bool isLoading, String? errorMessage, bool agreeToTerms
});




}
/// @nodoc
class __$CheckoutStateCopyWithImpl<$Res>
    implements _$CheckoutStateCopyWith<$Res> {
  __$CheckoutStateCopyWithImpl(this._self, this._then);

  final _CheckoutState _self;
  final $Res Function(_CheckoutState) _then;

/// Create a copy of CheckoutState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? contacts = null,Object? selectedContact = freezed,Object? lines = null,Object? shippingQuotes = freezed,Object? transportOption = freezed,Object? checkoutResult = freezed,Object? paymentTransaction = freezed,Object? paymentSession = freezed,Object? isLoading = null,Object? errorMessage = freezed,Object? agreeToTerms = null,}) {
  return _then(_CheckoutState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as CheckoutStep,contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<Contact>,selectedContact: freezed == selectedContact ? _self.selectedContact : selectedContact // ignore: cast_nullable_to_non_nullable
as Contact?,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<PurchaseLine>,shippingQuotes: freezed == shippingQuotes ? _self.shippingQuotes : shippingQuotes // ignore: cast_nullable_to_non_nullable
as ShippingQuotes?,transportOption: freezed == transportOption ? _self.transportOption : transportOption // ignore: cast_nullable_to_non_nullable
as String?,checkoutResult: freezed == checkoutResult ? _self.checkoutResult : checkoutResult // ignore: cast_nullable_to_non_nullable
as CheckoutResult?,paymentTransaction: freezed == paymentTransaction ? _self.paymentTransaction : paymentTransaction // ignore: cast_nullable_to_non_nullable
as Transaction?,paymentSession: freezed == paymentSession ? _self.paymentSession : paymentSession // ignore: cast_nullable_to_non_nullable
as PaymentSession?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,agreeToTerms: null == agreeToTerms ? _self.agreeToTerms : agreeToTerms // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
