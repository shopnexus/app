// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_earnings_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellerEarningsState {

/// Null until the platform has credited this account once — a wallet row is
/// created by the first movement, not by signing up.
 Wallet? get wallet; List<WalletTransaction> get ledger; List<Withdrawal> get withdrawals; List<BankAccount> get bankAccounts; bool get isWithdrawing; String? get errorMessage;
/// Create a copy of SellerEarningsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerEarningsStateCopyWith<SellerEarningsState> get copyWith => _$SellerEarningsStateCopyWithImpl<SellerEarningsState>(this as SellerEarningsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerEarningsState&&(identical(other.wallet, wallet) || other.wallet == wallet)&&const DeepCollectionEquality().equals(other.ledger, ledger)&&const DeepCollectionEquality().equals(other.withdrawals, withdrawals)&&const DeepCollectionEquality().equals(other.bankAccounts, bankAccounts)&&(identical(other.isWithdrawing, isWithdrawing) || other.isWithdrawing == isWithdrawing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,wallet,const DeepCollectionEquality().hash(ledger),const DeepCollectionEquality().hash(withdrawals),const DeepCollectionEquality().hash(bankAccounts),isWithdrawing,errorMessage);

@override
String toString() {
  return 'SellerEarningsState(wallet: $wallet, ledger: $ledger, withdrawals: $withdrawals, bankAccounts: $bankAccounts, isWithdrawing: $isWithdrawing, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SellerEarningsStateCopyWith<$Res>  {
  factory $SellerEarningsStateCopyWith(SellerEarningsState value, $Res Function(SellerEarningsState) _then) = _$SellerEarningsStateCopyWithImpl;
@useResult
$Res call({
 Wallet? wallet, List<WalletTransaction> ledger, List<Withdrawal> withdrawals, List<BankAccount> bankAccounts, bool isWithdrawing, String? errorMessage
});




}
/// @nodoc
class _$SellerEarningsStateCopyWithImpl<$Res>
    implements $SellerEarningsStateCopyWith<$Res> {
  _$SellerEarningsStateCopyWithImpl(this._self, this._then);

  final SellerEarningsState _self;
  final $Res Function(SellerEarningsState) _then;

/// Create a copy of SellerEarningsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? wallet = freezed,Object? ledger = null,Object? withdrawals = null,Object? bankAccounts = null,Object? isWithdrawing = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
wallet: freezed == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as Wallet?,ledger: null == ledger ? _self.ledger : ledger // ignore: cast_nullable_to_non_nullable
as List<WalletTransaction>,withdrawals: null == withdrawals ? _self.withdrawals : withdrawals // ignore: cast_nullable_to_non_nullable
as List<Withdrawal>,bankAccounts: null == bankAccounts ? _self.bankAccounts : bankAccounts // ignore: cast_nullable_to_non_nullable
as List<BankAccount>,isWithdrawing: null == isWithdrawing ? _self.isWithdrawing : isWithdrawing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerEarningsState].
extension SellerEarningsStatePatterns on SellerEarningsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerEarningsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerEarningsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerEarningsState value)  $default,){
final _that = this;
switch (_that) {
case _SellerEarningsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerEarningsState value)?  $default,){
final _that = this;
switch (_that) {
case _SellerEarningsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Wallet? wallet,  List<WalletTransaction> ledger,  List<Withdrawal> withdrawals,  List<BankAccount> bankAccounts,  bool isWithdrawing,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerEarningsState() when $default != null:
return $default(_that.wallet,_that.ledger,_that.withdrawals,_that.bankAccounts,_that.isWithdrawing,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Wallet? wallet,  List<WalletTransaction> ledger,  List<Withdrawal> withdrawals,  List<BankAccount> bankAccounts,  bool isWithdrawing,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SellerEarningsState():
return $default(_that.wallet,_that.ledger,_that.withdrawals,_that.bankAccounts,_that.isWithdrawing,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Wallet? wallet,  List<WalletTransaction> ledger,  List<Withdrawal> withdrawals,  List<BankAccount> bankAccounts,  bool isWithdrawing,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SellerEarningsState() when $default != null:
return $default(_that.wallet,_that.ledger,_that.withdrawals,_that.bankAccounts,_that.isWithdrawing,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SellerEarningsState extends SellerEarningsState {
  const _SellerEarningsState({this.wallet, final  List<WalletTransaction> ledger = const [], final  List<Withdrawal> withdrawals = const [], final  List<BankAccount> bankAccounts = const [], this.isWithdrawing = false, this.errorMessage}): _ledger = ledger,_withdrawals = withdrawals,_bankAccounts = bankAccounts,super._();
  

/// Null until the platform has credited this account once — a wallet row is
/// created by the first movement, not by signing up.
@override final  Wallet? wallet;
 final  List<WalletTransaction> _ledger;
@override@JsonKey() List<WalletTransaction> get ledger {
  if (_ledger is EqualUnmodifiableListView) return _ledger;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ledger);
}

 final  List<Withdrawal> _withdrawals;
@override@JsonKey() List<Withdrawal> get withdrawals {
  if (_withdrawals is EqualUnmodifiableListView) return _withdrawals;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_withdrawals);
}

 final  List<BankAccount> _bankAccounts;
@override@JsonKey() List<BankAccount> get bankAccounts {
  if (_bankAccounts is EqualUnmodifiableListView) return _bankAccounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bankAccounts);
}

@override@JsonKey() final  bool isWithdrawing;
@override final  String? errorMessage;

/// Create a copy of SellerEarningsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerEarningsStateCopyWith<_SellerEarningsState> get copyWith => __$SellerEarningsStateCopyWithImpl<_SellerEarningsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerEarningsState&&(identical(other.wallet, wallet) || other.wallet == wallet)&&const DeepCollectionEquality().equals(other._ledger, _ledger)&&const DeepCollectionEquality().equals(other._withdrawals, _withdrawals)&&const DeepCollectionEquality().equals(other._bankAccounts, _bankAccounts)&&(identical(other.isWithdrawing, isWithdrawing) || other.isWithdrawing == isWithdrawing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,wallet,const DeepCollectionEquality().hash(_ledger),const DeepCollectionEquality().hash(_withdrawals),const DeepCollectionEquality().hash(_bankAccounts),isWithdrawing,errorMessage);

@override
String toString() {
  return 'SellerEarningsState(wallet: $wallet, ledger: $ledger, withdrawals: $withdrawals, bankAccounts: $bankAccounts, isWithdrawing: $isWithdrawing, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SellerEarningsStateCopyWith<$Res> implements $SellerEarningsStateCopyWith<$Res> {
  factory _$SellerEarningsStateCopyWith(_SellerEarningsState value, $Res Function(_SellerEarningsState) _then) = __$SellerEarningsStateCopyWithImpl;
@override @useResult
$Res call({
 Wallet? wallet, List<WalletTransaction> ledger, List<Withdrawal> withdrawals, List<BankAccount> bankAccounts, bool isWithdrawing, String? errorMessage
});




}
/// @nodoc
class __$SellerEarningsStateCopyWithImpl<$Res>
    implements _$SellerEarningsStateCopyWith<$Res> {
  __$SellerEarningsStateCopyWithImpl(this._self, this._then);

  final _SellerEarningsState _self;
  final $Res Function(_SellerEarningsState) _then;

/// Create a copy of SellerEarningsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? wallet = freezed,Object? ledger = null,Object? withdrawals = null,Object? bankAccounts = null,Object? isWithdrawing = null,Object? errorMessage = freezed,}) {
  return _then(_SellerEarningsState(
wallet: freezed == wallet ? _self.wallet : wallet // ignore: cast_nullable_to_non_nullable
as Wallet?,ledger: null == ledger ? _self._ledger : ledger // ignore: cast_nullable_to_non_nullable
as List<WalletTransaction>,withdrawals: null == withdrawals ? _self._withdrawals : withdrawals // ignore: cast_nullable_to_non_nullable
as List<Withdrawal>,bankAccounts: null == bankAccounts ? _self._bankAccounts : bankAccounts // ignore: cast_nullable_to_non_nullable
as List<BankAccount>,isWithdrawing: null == isWithdrawing ? _self.isWithdrawing : isWithdrawing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
