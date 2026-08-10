// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_earnings_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SellerEarningsState {
  /// Null until the platform has credited this account once — a wallet row is
  /// created by the first movement, not by signing up.
  Wallet? get wallet => throw _privateConstructorUsedError;
  List<WalletTransaction> get ledger => throw _privateConstructorUsedError;
  List<Withdrawal> get withdrawals => throw _privateConstructorUsedError;
  List<BankAccount> get bankAccounts => throw _privateConstructorUsedError;
  bool get isWithdrawing => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of SellerEarningsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerEarningsStateCopyWith<SellerEarningsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerEarningsStateCopyWith<$Res> {
  factory $SellerEarningsStateCopyWith(
    SellerEarningsState value,
    $Res Function(SellerEarningsState) then,
  ) = _$SellerEarningsStateCopyWithImpl<$Res, SellerEarningsState>;
  @useResult
  $Res call({
    Wallet? wallet,
    List<WalletTransaction> ledger,
    List<Withdrawal> withdrawals,
    List<BankAccount> bankAccounts,
    bool isWithdrawing,
    String? errorMessage,
  });
}

/// @nodoc
class _$SellerEarningsStateCopyWithImpl<$Res, $Val extends SellerEarningsState>
    implements $SellerEarningsStateCopyWith<$Res> {
  _$SellerEarningsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerEarningsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = freezed,
    Object? ledger = null,
    Object? withdrawals = null,
    Object? bankAccounts = null,
    Object? isWithdrawing = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            wallet: freezed == wallet
                ? _value.wallet
                : wallet // ignore: cast_nullable_to_non_nullable
                      as Wallet?,
            ledger: null == ledger
                ? _value.ledger
                : ledger // ignore: cast_nullable_to_non_nullable
                      as List<WalletTransaction>,
            withdrawals: null == withdrawals
                ? _value.withdrawals
                : withdrawals // ignore: cast_nullable_to_non_nullable
                      as List<Withdrawal>,
            bankAccounts: null == bankAccounts
                ? _value.bankAccounts
                : bankAccounts // ignore: cast_nullable_to_non_nullable
                      as List<BankAccount>,
            isWithdrawing: null == isWithdrawing
                ? _value.isWithdrawing
                : isWithdrawing // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SellerEarningsStateImplCopyWith<$Res>
    implements $SellerEarningsStateCopyWith<$Res> {
  factory _$$SellerEarningsStateImplCopyWith(
    _$SellerEarningsStateImpl value,
    $Res Function(_$SellerEarningsStateImpl) then,
  ) = __$$SellerEarningsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Wallet? wallet,
    List<WalletTransaction> ledger,
    List<Withdrawal> withdrawals,
    List<BankAccount> bankAccounts,
    bool isWithdrawing,
    String? errorMessage,
  });
}

/// @nodoc
class __$$SellerEarningsStateImplCopyWithImpl<$Res>
    extends _$SellerEarningsStateCopyWithImpl<$Res, _$SellerEarningsStateImpl>
    implements _$$SellerEarningsStateImplCopyWith<$Res> {
  __$$SellerEarningsStateImplCopyWithImpl(
    _$SellerEarningsStateImpl _value,
    $Res Function(_$SellerEarningsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SellerEarningsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wallet = freezed,
    Object? ledger = null,
    Object? withdrawals = null,
    Object? bankAccounts = null,
    Object? isWithdrawing = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$SellerEarningsStateImpl(
        wallet: freezed == wallet
            ? _value.wallet
            : wallet // ignore: cast_nullable_to_non_nullable
                  as Wallet?,
        ledger: null == ledger
            ? _value._ledger
            : ledger // ignore: cast_nullable_to_non_nullable
                  as List<WalletTransaction>,
        withdrawals: null == withdrawals
            ? _value._withdrawals
            : withdrawals // ignore: cast_nullable_to_non_nullable
                  as List<Withdrawal>,
        bankAccounts: null == bankAccounts
            ? _value._bankAccounts
            : bankAccounts // ignore: cast_nullable_to_non_nullable
                  as List<BankAccount>,
        isWithdrawing: null == isWithdrawing
            ? _value.isWithdrawing
            : isWithdrawing // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc

class _$SellerEarningsStateImpl extends _SellerEarningsState {
  const _$SellerEarningsStateImpl({
    this.wallet,
    final List<WalletTransaction> ledger = const [],
    final List<Withdrawal> withdrawals = const [],
    final List<BankAccount> bankAccounts = const [],
    this.isWithdrawing = false,
    this.errorMessage,
  }) : _ledger = ledger,
       _withdrawals = withdrawals,
       _bankAccounts = bankAccounts,
       super._();

  /// Null until the platform has credited this account once — a wallet row is
  /// created by the first movement, not by signing up.
  @override
  final Wallet? wallet;
  final List<WalletTransaction> _ledger;
  @override
  @JsonKey()
  List<WalletTransaction> get ledger {
    if (_ledger is EqualUnmodifiableListView) return _ledger;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ledger);
  }

  final List<Withdrawal> _withdrawals;
  @override
  @JsonKey()
  List<Withdrawal> get withdrawals {
    if (_withdrawals is EqualUnmodifiableListView) return _withdrawals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_withdrawals);
  }

  final List<BankAccount> _bankAccounts;
  @override
  @JsonKey()
  List<BankAccount> get bankAccounts {
    if (_bankAccounts is EqualUnmodifiableListView) return _bankAccounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_bankAccounts);
  }

  @override
  @JsonKey()
  final bool isWithdrawing;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SellerEarningsState(wallet: $wallet, ledger: $ledger, withdrawals: $withdrawals, bankAccounts: $bankAccounts, isWithdrawing: $isWithdrawing, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerEarningsStateImpl &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            const DeepCollectionEquality().equals(other._ledger, _ledger) &&
            const DeepCollectionEquality().equals(
              other._withdrawals,
              _withdrawals,
            ) &&
            const DeepCollectionEquality().equals(
              other._bankAccounts,
              _bankAccounts,
            ) &&
            (identical(other.isWithdrawing, isWithdrawing) ||
                other.isWithdrawing == isWithdrawing) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    wallet,
    const DeepCollectionEquality().hash(_ledger),
    const DeepCollectionEquality().hash(_withdrawals),
    const DeepCollectionEquality().hash(_bankAccounts),
    isWithdrawing,
    errorMessage,
  );

  /// Create a copy of SellerEarningsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerEarningsStateImplCopyWith<_$SellerEarningsStateImpl> get copyWith =>
      __$$SellerEarningsStateImplCopyWithImpl<_$SellerEarningsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SellerEarningsState extends SellerEarningsState {
  const factory _SellerEarningsState({
    final Wallet? wallet,
    final List<WalletTransaction> ledger,
    final List<Withdrawal> withdrawals,
    final List<BankAccount> bankAccounts,
    final bool isWithdrawing,
    final String? errorMessage,
  }) = _$SellerEarningsStateImpl;
  const _SellerEarningsState._() : super._();

  /// Null until the platform has credited this account once — a wallet row is
  /// created by the first movement, not by signing up.
  @override
  Wallet? get wallet;
  @override
  List<WalletTransaction> get ledger;
  @override
  List<Withdrawal> get withdrawals;
  @override
  List<BankAccount> get bankAccounts;
  @override
  bool get isWithdrawing;
  @override
  String? get errorMessage;

  /// Create a copy of SellerEarningsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerEarningsStateImplCopyWith<_$SellerEarningsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
