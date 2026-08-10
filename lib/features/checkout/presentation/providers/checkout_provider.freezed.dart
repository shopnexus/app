// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CheckoutState {
  CheckoutStep get step => throw _privateConstructorUsedError;
  List<Contact> get contacts => throw _privateConstructorUsedError;
  Contact? get selectedContact => throw _privateConstructorUsedError;
  List<PurchaseLine> get lines => throw _privateConstructorUsedError;

  /// Phiên mua đã mở cho tin đăng này. Nó phải tồn tại **trước** khi hỏi phí vận
  /// chuyển: `POST /shipping-quotes` bắt phải nêu đúng một nguồn — một variant,
  /// một draft, hay một offer — và trang thanh toán có nhiều dòng nên nguồn của
  /// nó là draft. Thiếu nó thì route trả 400 `quote_source_invalid`, và màn hình
  /// chỉ thấy một danh sách rỗng nên nói nhầm thành "chưa có báo giá cho địa chỉ
  /// này".
  DraftOrder? get draft => throw _privateConstructorUsedError;
  ShippingQuotes? get shippingQuotes => throw _privateConstructorUsedError;

  /// The carrier slug the buyer is buying, always one `POST /shipping-quotes`
  /// answered — never a label. Null until a quote has been asked for.
  String? get transportOption => throw _privateConstructorUsedError;

  /// The rails this deployment can charge on, and the one the buyer picked. Read from
  /// `GET /options?category=payment` rather than named here: a hardcoded slug is a
  /// checkout that breaks the day an operator retires that rail.
  List<Option> get paymentOptions => throw _privateConstructorUsedError;
  String? get paymentOption => throw _privateConstructorUsedError;
  CheckoutResult? get checkoutResult => throw _privateConstructorUsedError;
  Transaction? get paymentTransaction => throw _privateConstructorUsedError;
  PaymentSession? get paymentSession => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool get agreeToTerms => throw _privateConstructorUsedError;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CheckoutStateCopyWith<CheckoutState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckoutStateCopyWith<$Res> {
  factory $CheckoutStateCopyWith(
    CheckoutState value,
    $Res Function(CheckoutState) then,
  ) = _$CheckoutStateCopyWithImpl<$Res, CheckoutState>;
  @useResult
  $Res call({
    CheckoutStep step,
    List<Contact> contacts,
    Contact? selectedContact,
    List<PurchaseLine> lines,
    DraftOrder? draft,
    ShippingQuotes? shippingQuotes,
    String? transportOption,
    List<Option> paymentOptions,
    String? paymentOption,
    CheckoutResult? checkoutResult,
    Transaction? paymentTransaction,
    PaymentSession? paymentSession,
    bool isLoading,
    String? errorMessage,
    bool agreeToTerms,
  });
}

/// @nodoc
class _$CheckoutStateCopyWithImpl<$Res, $Val extends CheckoutState>
    implements $CheckoutStateCopyWith<$Res> {
  _$CheckoutStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? contacts = null,
    Object? selectedContact = freezed,
    Object? lines = null,
    Object? draft = freezed,
    Object? shippingQuotes = freezed,
    Object? transportOption = freezed,
    Object? paymentOptions = null,
    Object? paymentOption = freezed,
    Object? checkoutResult = freezed,
    Object? paymentTransaction = freezed,
    Object? paymentSession = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? agreeToTerms = null,
  }) {
    return _then(
      _value.copyWith(
            step: null == step
                ? _value.step
                : step // ignore: cast_nullable_to_non_nullable
                      as CheckoutStep,
            contacts: null == contacts
                ? _value.contacts
                : contacts // ignore: cast_nullable_to_non_nullable
                      as List<Contact>,
            selectedContact: freezed == selectedContact
                ? _value.selectedContact
                : selectedContact // ignore: cast_nullable_to_non_nullable
                      as Contact?,
            lines: null == lines
                ? _value.lines
                : lines // ignore: cast_nullable_to_non_nullable
                      as List<PurchaseLine>,
            draft: freezed == draft
                ? _value.draft
                : draft // ignore: cast_nullable_to_non_nullable
                      as DraftOrder?,
            shippingQuotes: freezed == shippingQuotes
                ? _value.shippingQuotes
                : shippingQuotes // ignore: cast_nullable_to_non_nullable
                      as ShippingQuotes?,
            transportOption: freezed == transportOption
                ? _value.transportOption
                : transportOption // ignore: cast_nullable_to_non_nullable
                      as String?,
            paymentOptions: null == paymentOptions
                ? _value.paymentOptions
                : paymentOptions // ignore: cast_nullable_to_non_nullable
                      as List<Option>,
            paymentOption: freezed == paymentOption
                ? _value.paymentOption
                : paymentOption // ignore: cast_nullable_to_non_nullable
                      as String?,
            checkoutResult: freezed == checkoutResult
                ? _value.checkoutResult
                : checkoutResult // ignore: cast_nullable_to_non_nullable
                      as CheckoutResult?,
            paymentTransaction: freezed == paymentTransaction
                ? _value.paymentTransaction
                : paymentTransaction // ignore: cast_nullable_to_non_nullable
                      as Transaction?,
            paymentSession: freezed == paymentSession
                ? _value.paymentSession
                : paymentSession // ignore: cast_nullable_to_non_nullable
                      as PaymentSession?,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            errorMessage: freezed == errorMessage
                ? _value.errorMessage
                : errorMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            agreeToTerms: null == agreeToTerms
                ? _value.agreeToTerms
                : agreeToTerms // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CheckoutStateImplCopyWith<$Res>
    implements $CheckoutStateCopyWith<$Res> {
  factory _$$CheckoutStateImplCopyWith(
    _$CheckoutStateImpl value,
    $Res Function(_$CheckoutStateImpl) then,
  ) = __$$CheckoutStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CheckoutStep step,
    List<Contact> contacts,
    Contact? selectedContact,
    List<PurchaseLine> lines,
    DraftOrder? draft,
    ShippingQuotes? shippingQuotes,
    String? transportOption,
    List<Option> paymentOptions,
    String? paymentOption,
    CheckoutResult? checkoutResult,
    Transaction? paymentTransaction,
    PaymentSession? paymentSession,
    bool isLoading,
    String? errorMessage,
    bool agreeToTerms,
  });
}

/// @nodoc
class __$$CheckoutStateImplCopyWithImpl<$Res>
    extends _$CheckoutStateCopyWithImpl<$Res, _$CheckoutStateImpl>
    implements _$$CheckoutStateImplCopyWith<$Res> {
  __$$CheckoutStateImplCopyWithImpl(
    _$CheckoutStateImpl _value,
    $Res Function(_$CheckoutStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? step = null,
    Object? contacts = null,
    Object? selectedContact = freezed,
    Object? lines = null,
    Object? draft = freezed,
    Object? shippingQuotes = freezed,
    Object? transportOption = freezed,
    Object? paymentOptions = null,
    Object? paymentOption = freezed,
    Object? checkoutResult = freezed,
    Object? paymentTransaction = freezed,
    Object? paymentSession = freezed,
    Object? isLoading = null,
    Object? errorMessage = freezed,
    Object? agreeToTerms = null,
  }) {
    return _then(
      _$CheckoutStateImpl(
        step: null == step
            ? _value.step
            : step // ignore: cast_nullable_to_non_nullable
                  as CheckoutStep,
        contacts: null == contacts
            ? _value._contacts
            : contacts // ignore: cast_nullable_to_non_nullable
                  as List<Contact>,
        selectedContact: freezed == selectedContact
            ? _value.selectedContact
            : selectedContact // ignore: cast_nullable_to_non_nullable
                  as Contact?,
        lines: null == lines
            ? _value._lines
            : lines // ignore: cast_nullable_to_non_nullable
                  as List<PurchaseLine>,
        draft: freezed == draft
            ? _value.draft
            : draft // ignore: cast_nullable_to_non_nullable
                  as DraftOrder?,
        shippingQuotes: freezed == shippingQuotes
            ? _value.shippingQuotes
            : shippingQuotes // ignore: cast_nullable_to_non_nullable
                  as ShippingQuotes?,
        transportOption: freezed == transportOption
            ? _value.transportOption
            : transportOption // ignore: cast_nullable_to_non_nullable
                  as String?,
        paymentOptions: null == paymentOptions
            ? _value._paymentOptions
            : paymentOptions // ignore: cast_nullable_to_non_nullable
                  as List<Option>,
        paymentOption: freezed == paymentOption
            ? _value.paymentOption
            : paymentOption // ignore: cast_nullable_to_non_nullable
                  as String?,
        checkoutResult: freezed == checkoutResult
            ? _value.checkoutResult
            : checkoutResult // ignore: cast_nullable_to_non_nullable
                  as CheckoutResult?,
        paymentTransaction: freezed == paymentTransaction
            ? _value.paymentTransaction
            : paymentTransaction // ignore: cast_nullable_to_non_nullable
                  as Transaction?,
        paymentSession: freezed == paymentSession
            ? _value.paymentSession
            : paymentSession // ignore: cast_nullable_to_non_nullable
                  as PaymentSession?,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        errorMessage: freezed == errorMessage
            ? _value.errorMessage
            : errorMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        agreeToTerms: null == agreeToTerms
            ? _value.agreeToTerms
            : agreeToTerms // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$CheckoutStateImpl extends _CheckoutState {
  const _$CheckoutStateImpl({
    this.step = CheckoutStep.address,
    final List<Contact> contacts = const [],
    this.selectedContact,
    final List<PurchaseLine> lines = const [],
    this.draft,
    this.shippingQuotes,
    this.transportOption,
    final List<Option> paymentOptions = const [],
    this.paymentOption,
    this.checkoutResult,
    this.paymentTransaction,
    this.paymentSession,
    this.isLoading = false,
    this.errorMessage,
    this.agreeToTerms = true,
  }) : _contacts = contacts,
       _lines = lines,
       _paymentOptions = paymentOptions,
       super._();

  @override
  @JsonKey()
  final CheckoutStep step;
  final List<Contact> _contacts;
  @override
  @JsonKey()
  List<Contact> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  @override
  final Contact? selectedContact;
  final List<PurchaseLine> _lines;
  @override
  @JsonKey()
  List<PurchaseLine> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  /// Phiên mua đã mở cho tin đăng này. Nó phải tồn tại **trước** khi hỏi phí vận
  /// chuyển: `POST /shipping-quotes` bắt phải nêu đúng một nguồn — một variant,
  /// một draft, hay một offer — và trang thanh toán có nhiều dòng nên nguồn của
  /// nó là draft. Thiếu nó thì route trả 400 `quote_source_invalid`, và màn hình
  /// chỉ thấy một danh sách rỗng nên nói nhầm thành "chưa có báo giá cho địa chỉ
  /// này".
  @override
  final DraftOrder? draft;
  @override
  final ShippingQuotes? shippingQuotes;

  /// The carrier slug the buyer is buying, always one `POST /shipping-quotes`
  /// answered — never a label. Null until a quote has been asked for.
  @override
  final String? transportOption;

  /// The rails this deployment can charge on, and the one the buyer picked. Read from
  /// `GET /options?category=payment` rather than named here: a hardcoded slug is a
  /// checkout that breaks the day an operator retires that rail.
  final List<Option> _paymentOptions;

  /// The rails this deployment can charge on, and the one the buyer picked. Read from
  /// `GET /options?category=payment` rather than named here: a hardcoded slug is a
  /// checkout that breaks the day an operator retires that rail.
  @override
  @JsonKey()
  List<Option> get paymentOptions {
    if (_paymentOptions is EqualUnmodifiableListView) return _paymentOptions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentOptions);
  }

  @override
  final String? paymentOption;
  @override
  final CheckoutResult? checkoutResult;
  @override
  final Transaction? paymentTransaction;
  @override
  final PaymentSession? paymentSession;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;
  @override
  @JsonKey()
  final bool agreeToTerms;

  @override
  String toString() {
    return 'CheckoutState(step: $step, contacts: $contacts, selectedContact: $selectedContact, lines: $lines, draft: $draft, shippingQuotes: $shippingQuotes, transportOption: $transportOption, paymentOptions: $paymentOptions, paymentOption: $paymentOption, checkoutResult: $checkoutResult, paymentTransaction: $paymentTransaction, paymentSession: $paymentSession, isLoading: $isLoading, errorMessage: $errorMessage, agreeToTerms: $agreeToTerms)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckoutStateImpl &&
            (identical(other.step, step) || other.step == step) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.selectedContact, selectedContact) ||
                other.selectedContact == selectedContact) &&
            const DeepCollectionEquality().equals(other._lines, _lines) &&
            (identical(other.draft, draft) || other.draft == draft) &&
            (identical(other.shippingQuotes, shippingQuotes) ||
                other.shippingQuotes == shippingQuotes) &&
            (identical(other.transportOption, transportOption) ||
                other.transportOption == transportOption) &&
            const DeepCollectionEquality().equals(
              other._paymentOptions,
              _paymentOptions,
            ) &&
            (identical(other.paymentOption, paymentOption) ||
                other.paymentOption == paymentOption) &&
            (identical(other.checkoutResult, checkoutResult) ||
                other.checkoutResult == checkoutResult) &&
            (identical(other.paymentTransaction, paymentTransaction) ||
                other.paymentTransaction == paymentTransaction) &&
            (identical(other.paymentSession, paymentSession) ||
                other.paymentSession == paymentSession) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.agreeToTerms, agreeToTerms) ||
                other.agreeToTerms == agreeToTerms));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    step,
    const DeepCollectionEquality().hash(_contacts),
    selectedContact,
    const DeepCollectionEquality().hash(_lines),
    draft,
    shippingQuotes,
    transportOption,
    const DeepCollectionEquality().hash(_paymentOptions),
    paymentOption,
    checkoutResult,
    paymentTransaction,
    paymentSession,
    isLoading,
    errorMessage,
    agreeToTerms,
  );

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      __$$CheckoutStateImplCopyWithImpl<_$CheckoutStateImpl>(this, _$identity);
}

abstract class _CheckoutState extends CheckoutState {
  const factory _CheckoutState({
    final CheckoutStep step,
    final List<Contact> contacts,
    final Contact? selectedContact,
    final List<PurchaseLine> lines,
    final DraftOrder? draft,
    final ShippingQuotes? shippingQuotes,
    final String? transportOption,
    final List<Option> paymentOptions,
    final String? paymentOption,
    final CheckoutResult? checkoutResult,
    final Transaction? paymentTransaction,
    final PaymentSession? paymentSession,
    final bool isLoading,
    final String? errorMessage,
    final bool agreeToTerms,
  }) = _$CheckoutStateImpl;
  const _CheckoutState._() : super._();

  @override
  CheckoutStep get step;
  @override
  List<Contact> get contacts;
  @override
  Contact? get selectedContact;
  @override
  List<PurchaseLine> get lines;

  /// Phiên mua đã mở cho tin đăng này. Nó phải tồn tại **trước** khi hỏi phí vận
  /// chuyển: `POST /shipping-quotes` bắt phải nêu đúng một nguồn — một variant,
  /// một draft, hay một offer — và trang thanh toán có nhiều dòng nên nguồn của
  /// nó là draft. Thiếu nó thì route trả 400 `quote_source_invalid`, và màn hình
  /// chỉ thấy một danh sách rỗng nên nói nhầm thành "chưa có báo giá cho địa chỉ
  /// này".
  @override
  DraftOrder? get draft;
  @override
  ShippingQuotes? get shippingQuotes;

  /// The carrier slug the buyer is buying, always one `POST /shipping-quotes`
  /// answered — never a label. Null until a quote has been asked for.
  @override
  String? get transportOption;

  /// The rails this deployment can charge on, and the one the buyer picked. Read from
  /// `GET /options?category=payment` rather than named here: a hardcoded slug is a
  /// checkout that breaks the day an operator retires that rail.
  @override
  List<Option> get paymentOptions;
  @override
  String? get paymentOption;
  @override
  CheckoutResult? get checkoutResult;
  @override
  Transaction? get paymentTransaction;
  @override
  PaymentSession? get paymentSession;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;
  @override
  bool get agreeToTerms;

  /// Create a copy of CheckoutState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CheckoutStateImplCopyWith<_$CheckoutStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
