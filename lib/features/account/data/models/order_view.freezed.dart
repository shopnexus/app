// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$OrderLineView {
  OrderItem get item => throw _privateConstructorUsedError;
  Listing? get listing => throw _privateConstructorUsedError;

  /// Create a copy of OrderLineView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderLineViewCopyWith<OrderLineView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderLineViewCopyWith<$Res> {
  factory $OrderLineViewCopyWith(
    OrderLineView value,
    $Res Function(OrderLineView) then,
  ) = _$OrderLineViewCopyWithImpl<$Res, OrderLineView>;
  @useResult
  $Res call({OrderItem item, Listing? listing});
}

/// @nodoc
class _$OrderLineViewCopyWithImpl<$Res, $Val extends OrderLineView>
    implements $OrderLineViewCopyWith<$Res> {
  _$OrderLineViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderLineView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = null, Object? listing = freezed}) {
    return _then(
      _value.copyWith(
            item: null == item
                ? _value.item
                : item // ignore: cast_nullable_to_non_nullable
                      as OrderItem,
            listing: freezed == listing
                ? _value.listing
                : listing // ignore: cast_nullable_to_non_nullable
                      as Listing?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderLineViewImplCopyWith<$Res>
    implements $OrderLineViewCopyWith<$Res> {
  factory _$$OrderLineViewImplCopyWith(
    _$OrderLineViewImpl value,
    $Res Function(_$OrderLineViewImpl) then,
  ) = __$$OrderLineViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderItem item, Listing? listing});
}

/// @nodoc
class __$$OrderLineViewImplCopyWithImpl<$Res>
    extends _$OrderLineViewCopyWithImpl<$Res, _$OrderLineViewImpl>
    implements _$$OrderLineViewImplCopyWith<$Res> {
  __$$OrderLineViewImplCopyWithImpl(
    _$OrderLineViewImpl _value,
    $Res Function(_$OrderLineViewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderLineView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? item = null, Object? listing = freezed}) {
    return _then(
      _$OrderLineViewImpl(
        item: null == item
            ? _value.item
            : item // ignore: cast_nullable_to_non_nullable
                  as OrderItem,
        listing: freezed == listing
            ? _value.listing
            : listing // ignore: cast_nullable_to_non_nullable
                  as Listing?,
      ),
    );
  }
}

/// @nodoc

class _$OrderLineViewImpl extends _OrderLineView {
  const _$OrderLineViewImpl({required this.item, this.listing}) : super._();

  @override
  final OrderItem item;
  @override
  final Listing? listing;

  @override
  String toString() {
    return 'OrderLineView(item: $item, listing: $listing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderLineViewImpl &&
            (identical(other.item, item) || other.item == item) &&
            (identical(other.listing, listing) || other.listing == listing));
  }

  @override
  int get hashCode => Object.hash(runtimeType, item, listing);

  /// Create a copy of OrderLineView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderLineViewImplCopyWith<_$OrderLineViewImpl> get copyWith =>
      __$$OrderLineViewImplCopyWithImpl<_$OrderLineViewImpl>(this, _$identity);
}

abstract class _OrderLineView extends OrderLineView {
  const factory _OrderLineView({
    required final OrderItem item,
    final Listing? listing,
  }) = _$OrderLineViewImpl;
  const _OrderLineView._() : super._();

  @override
  OrderItem get item;
  @override
  Listing? get listing;

  /// Create a copy of OrderLineView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderLineViewImplCopyWith<_$OrderLineViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrderView {
  Order get order => throw _privateConstructorUsedError;
  List<OrderLineView> get lines => throw _privateConstructorUsedError;

  /// Create a copy of OrderView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OrderViewCopyWith<OrderView> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderViewCopyWith<$Res> {
  factory $OrderViewCopyWith(OrderView value, $Res Function(OrderView) then) =
      _$OrderViewCopyWithImpl<$Res, OrderView>;
  @useResult
  $Res call({Order order, List<OrderLineView> lines});
}

/// @nodoc
class _$OrderViewCopyWithImpl<$Res, $Val extends OrderView>
    implements $OrderViewCopyWith<$Res> {
  _$OrderViewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OrderView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? order = null, Object? lines = null}) {
    return _then(
      _value.copyWith(
            order: null == order
                ? _value.order
                : order // ignore: cast_nullable_to_non_nullable
                      as Order,
            lines: null == lines
                ? _value.lines
                : lines // ignore: cast_nullable_to_non_nullable
                      as List<OrderLineView>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$OrderViewImplCopyWith<$Res>
    implements $OrderViewCopyWith<$Res> {
  factory _$$OrderViewImplCopyWith(
    _$OrderViewImpl value,
    $Res Function(_$OrderViewImpl) then,
  ) = __$$OrderViewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Order order, List<OrderLineView> lines});
}

/// @nodoc
class __$$OrderViewImplCopyWithImpl<$Res>
    extends _$OrderViewCopyWithImpl<$Res, _$OrderViewImpl>
    implements _$$OrderViewImplCopyWith<$Res> {
  __$$OrderViewImplCopyWithImpl(
    _$OrderViewImpl _value,
    $Res Function(_$OrderViewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of OrderView
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? order = null, Object? lines = null}) {
    return _then(
      _$OrderViewImpl(
        order: null == order
            ? _value.order
            : order // ignore: cast_nullable_to_non_nullable
                  as Order,
        lines: null == lines
            ? _value._lines
            : lines // ignore: cast_nullable_to_non_nullable
                  as List<OrderLineView>,
      ),
    );
  }
}

/// @nodoc

class _$OrderViewImpl extends _OrderView {
  const _$OrderViewImpl({
    required this.order,
    required final List<OrderLineView> lines,
  }) : _lines = lines,
       super._();

  @override
  final Order order;
  final List<OrderLineView> _lines;
  @override
  List<OrderLineView> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  @override
  String toString() {
    return 'OrderView(order: $order, lines: $lines)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderViewImpl &&
            (identical(other.order, order) || other.order == order) &&
            const DeepCollectionEquality().equals(other._lines, _lines));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    order,
    const DeepCollectionEquality().hash(_lines),
  );

  /// Create a copy of OrderView
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderViewImplCopyWith<_$OrderViewImpl> get copyWith =>
      __$$OrderViewImplCopyWithImpl<_$OrderViewImpl>(this, _$identity);
}

abstract class _OrderView extends OrderView {
  const factory _OrderView({
    required final Order order,
    required final List<OrderLineView> lines,
  }) = _$OrderViewImpl;
  const _OrderView._() : super._();

  @override
  Order get order;
  @override
  List<OrderLineView> get lines;

  /// Create a copy of OrderView
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OrderViewImplCopyWith<_$OrderViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
