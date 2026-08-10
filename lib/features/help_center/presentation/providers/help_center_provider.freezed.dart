// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'help_center_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HelpCenterState {
  List<Ticket> get tickets => throw _privateConstructorUsedError;
  List<FaqItem> get faqs => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of HelpCenterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HelpCenterStateCopyWith<HelpCenterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HelpCenterStateCopyWith<$Res> {
  factory $HelpCenterStateCopyWith(
    HelpCenterState value,
    $Res Function(HelpCenterState) then,
  ) = _$HelpCenterStateCopyWithImpl<$Res, HelpCenterState>;
  @useResult
  $Res call({
    List<Ticket> tickets,
    List<FaqItem> faqs,
    bool isLoading,
    String? errorMessage,
  });
}

/// @nodoc
class _$HelpCenterStateCopyWithImpl<$Res, $Val extends HelpCenterState>
    implements $HelpCenterStateCopyWith<$Res> {
  _$HelpCenterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HelpCenterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? faqs = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            tickets: null == tickets
                ? _value.tickets
                : tickets // ignore: cast_nullable_to_non_nullable
                      as List<Ticket>,
            faqs: null == faqs
                ? _value.faqs
                : faqs // ignore: cast_nullable_to_non_nullable
                      as List<FaqItem>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
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
abstract class _$$HelpCenterStateImplCopyWith<$Res>
    implements $HelpCenterStateCopyWith<$Res> {
  factory _$$HelpCenterStateImplCopyWith(
    _$HelpCenterStateImpl value,
    $Res Function(_$HelpCenterStateImpl) then,
  ) = __$$HelpCenterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Ticket> tickets,
    List<FaqItem> faqs,
    bool isLoading,
    String? errorMessage,
  });
}

/// @nodoc
class __$$HelpCenterStateImplCopyWithImpl<$Res>
    extends _$HelpCenterStateCopyWithImpl<$Res, _$HelpCenterStateImpl>
    implements _$$HelpCenterStateImplCopyWith<$Res> {
  __$$HelpCenterStateImplCopyWithImpl(
    _$HelpCenterStateImpl _value,
    $Res Function(_$HelpCenterStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HelpCenterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tickets = null,
    Object? faqs = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$HelpCenterStateImpl(
        tickets: null == tickets
            ? _value._tickets
            : tickets // ignore: cast_nullable_to_non_nullable
                  as List<Ticket>,
        faqs: null == faqs
            ? _value._faqs
            : faqs // ignore: cast_nullable_to_non_nullable
                  as List<FaqItem>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
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

class _$HelpCenterStateImpl extends _HelpCenterState {
  const _$HelpCenterStateImpl({
    final List<Ticket> tickets = const [],
    final List<FaqItem> faqs = const [],
    this.isLoading = false,
    this.errorMessage,
  }) : _tickets = tickets,
       _faqs = faqs,
       super._();

  final List<Ticket> _tickets;
  @override
  @JsonKey()
  List<Ticket> get tickets {
    if (_tickets is EqualUnmodifiableListView) return _tickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickets);
  }

  final List<FaqItem> _faqs;
  @override
  @JsonKey()
  List<FaqItem> get faqs {
    if (_faqs is EqualUnmodifiableListView) return _faqs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_faqs);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'HelpCenterState(tickets: $tickets, faqs: $faqs, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HelpCenterStateImpl &&
            const DeepCollectionEquality().equals(other._tickets, _tickets) &&
            const DeepCollectionEquality().equals(other._faqs, _faqs) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_tickets),
    const DeepCollectionEquality().hash(_faqs),
    isLoading,
    errorMessage,
  );

  /// Create a copy of HelpCenterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HelpCenterStateImplCopyWith<_$HelpCenterStateImpl> get copyWith =>
      __$$HelpCenterStateImplCopyWithImpl<_$HelpCenterStateImpl>(
        this,
        _$identity,
      );
}

abstract class _HelpCenterState extends HelpCenterState {
  const factory _HelpCenterState({
    final List<Ticket> tickets,
    final List<FaqItem> faqs,
    final bool isLoading,
    final String? errorMessage,
  }) = _$HelpCenterStateImpl;
  const _HelpCenterState._() : super._();

  @override
  List<Ticket> get tickets;
  @override
  List<FaqItem> get faqs;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of HelpCenterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HelpCenterStateImplCopyWith<_$HelpCenterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
