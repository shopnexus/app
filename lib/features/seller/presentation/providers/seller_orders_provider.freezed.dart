// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_orders_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SellerOrdersState {
  OrderState? get selected => throw _privateConstructorUsedError;
  List<OrderView> get orders => throw _privateConstructorUsedError;

  /// Paid lines the money has not turned into an order yet. Only meaningful
  /// beside the open tab, and nothing here waits on the seller.
  List<OrderLineView> get unsettled => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isActionLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of SellerOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerOrdersStateCopyWith<SellerOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerOrdersStateCopyWith<$Res> {
  factory $SellerOrdersStateCopyWith(
    SellerOrdersState value,
    $Res Function(SellerOrdersState) then,
  ) = _$SellerOrdersStateCopyWithImpl<$Res, SellerOrdersState>;
  @useResult
  $Res call({
    OrderState? selected,
    List<OrderView> orders,
    List<OrderLineView> unsettled,
    bool isLoading,
    bool isActionLoading,
    String? errorMessage,
  });
}

/// @nodoc
class _$SellerOrdersStateCopyWithImpl<$Res, $Val extends SellerOrdersState>
    implements $SellerOrdersStateCopyWith<$Res> {
  _$SellerOrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = freezed,
    Object? orders = null,
    Object? unsettled = null,
    Object? isLoading = null,
    Object? isActionLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            selected: freezed == selected
                ? _value.selected
                : selected // ignore: cast_nullable_to_non_nullable
                      as OrderState?,
            orders: null == orders
                ? _value.orders
                : orders // ignore: cast_nullable_to_non_nullable
                      as List<OrderView>,
            unsettled: null == unsettled
                ? _value.unsettled
                : unsettled // ignore: cast_nullable_to_non_nullable
                      as List<OrderLineView>,
            isLoading: null == isLoading
                ? _value.isLoading
                : isLoading // ignore: cast_nullable_to_non_nullable
                      as bool,
            isActionLoading: null == isActionLoading
                ? _value.isActionLoading
                : isActionLoading // ignore: cast_nullable_to_non_nullable
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
abstract class _$$SellerOrdersStateImplCopyWith<$Res>
    implements $SellerOrdersStateCopyWith<$Res> {
  factory _$$SellerOrdersStateImplCopyWith(
    _$SellerOrdersStateImpl value,
    $Res Function(_$SellerOrdersStateImpl) then,
  ) = __$$SellerOrdersStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    OrderState? selected,
    List<OrderView> orders,
    List<OrderLineView> unsettled,
    bool isLoading,
    bool isActionLoading,
    String? errorMessage,
  });
}

/// @nodoc
class __$$SellerOrdersStateImplCopyWithImpl<$Res>
    extends _$SellerOrdersStateCopyWithImpl<$Res, _$SellerOrdersStateImpl>
    implements _$$SellerOrdersStateImplCopyWith<$Res> {
  __$$SellerOrdersStateImplCopyWithImpl(
    _$SellerOrdersStateImpl _value,
    $Res Function(_$SellerOrdersStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SellerOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selected = freezed,
    Object? orders = null,
    Object? unsettled = null,
    Object? isLoading = null,
    Object? isActionLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$SellerOrdersStateImpl(
        selected: freezed == selected
            ? _value.selected
            : selected // ignore: cast_nullable_to_non_nullable
                  as OrderState?,
        orders: null == orders
            ? _value._orders
            : orders // ignore: cast_nullable_to_non_nullable
                  as List<OrderView>,
        unsettled: null == unsettled
            ? _value._unsettled
            : unsettled // ignore: cast_nullable_to_non_nullable
                  as List<OrderLineView>,
        isLoading: null == isLoading
            ? _value.isLoading
            : isLoading // ignore: cast_nullable_to_non_nullable
                  as bool,
        isActionLoading: null == isActionLoading
            ? _value.isActionLoading
            : isActionLoading // ignore: cast_nullable_to_non_nullable
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

class _$SellerOrdersStateImpl implements _SellerOrdersState {
  const _$SellerOrdersStateImpl({
    this.selected,
    final List<OrderView> orders = const [],
    final List<OrderLineView> unsettled = const [],
    this.isLoading = true,
    this.isActionLoading = false,
    this.errorMessage,
  }) : _orders = orders,
       _unsettled = unsettled;

  @override
  final OrderState? selected;
  final List<OrderView> _orders;
  @override
  @JsonKey()
  List<OrderView> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  /// Paid lines the money has not turned into an order yet. Only meaningful
  /// beside the open tab, and nothing here waits on the seller.
  final List<OrderLineView> _unsettled;

  /// Paid lines the money has not turned into an order yet. Only meaningful
  /// beside the open tab, and nothing here waits on the seller.
  @override
  @JsonKey()
  List<OrderLineView> get unsettled {
    if (_unsettled is EqualUnmodifiableListView) return _unsettled;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unsettled);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isActionLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SellerOrdersState(selected: $selected, orders: $orders, unsettled: $unsettled, isLoading: $isLoading, isActionLoading: $isActionLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerOrdersStateImpl &&
            (identical(other.selected, selected) ||
                other.selected == selected) &&
            const DeepCollectionEquality().equals(other._orders, _orders) &&
            const DeepCollectionEquality().equals(
              other._unsettled,
              _unsettled,
            ) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isActionLoading, isActionLoading) ||
                other.isActionLoading == isActionLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    selected,
    const DeepCollectionEquality().hash(_orders),
    const DeepCollectionEquality().hash(_unsettled),
    isLoading,
    isActionLoading,
    errorMessage,
  );

  /// Create a copy of SellerOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerOrdersStateImplCopyWith<_$SellerOrdersStateImpl> get copyWith =>
      __$$SellerOrdersStateImplCopyWithImpl<_$SellerOrdersStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SellerOrdersState implements SellerOrdersState {
  const factory _SellerOrdersState({
    final OrderState? selected,
    final List<OrderView> orders,
    final List<OrderLineView> unsettled,
    final bool isLoading,
    final bool isActionLoading,
    final String? errorMessage,
  }) = _$SellerOrdersStateImpl;

  @override
  OrderState? get selected;
  @override
  List<OrderView> get orders;

  /// Paid lines the money has not turned into an order yet. Only meaningful
  /// beside the open tab, and nothing here waits on the seller.
  @override
  List<OrderLineView> get unsettled;
  @override
  bool get isLoading;
  @override
  bool get isActionLoading;
  @override
  String? get errorMessage;

  /// Create a copy of SellerOrdersState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerOrdersStateImplCopyWith<_$SellerOrdersStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
