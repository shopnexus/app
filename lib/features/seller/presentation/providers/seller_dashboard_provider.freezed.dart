// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_dashboard_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SellerDashboard {
  OrderSummary get summary => throw _privateConstructorUsedError;
  Map<ListingStatus, int> get listings => throw _privateConstructorUsedError;

  /// Create a copy of SellerDashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerDashboardCopyWith<SellerDashboard> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerDashboardCopyWith<$Res> {
  factory $SellerDashboardCopyWith(
    SellerDashboard value,
    $Res Function(SellerDashboard) then,
  ) = _$SellerDashboardCopyWithImpl<$Res, SellerDashboard>;
  @useResult
  $Res call({OrderSummary summary, Map<ListingStatus, int> listings});
}

/// @nodoc
class _$SellerDashboardCopyWithImpl<$Res, $Val extends SellerDashboard>
    implements $SellerDashboardCopyWith<$Res> {
  _$SellerDashboardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerDashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? summary = null, Object? listings = null}) {
    return _then(
      _value.copyWith(
            summary: null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                      as OrderSummary,
            listings: null == listings
                ? _value.listings
                : listings // ignore: cast_nullable_to_non_nullable
                      as Map<ListingStatus, int>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SellerDashboardImplCopyWith<$Res>
    implements $SellerDashboardCopyWith<$Res> {
  factory _$$SellerDashboardImplCopyWith(
    _$SellerDashboardImpl value,
    $Res Function(_$SellerDashboardImpl) then,
  ) = __$$SellerDashboardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({OrderSummary summary, Map<ListingStatus, int> listings});
}

/// @nodoc
class __$$SellerDashboardImplCopyWithImpl<$Res>
    extends _$SellerDashboardCopyWithImpl<$Res, _$SellerDashboardImpl>
    implements _$$SellerDashboardImplCopyWith<$Res> {
  __$$SellerDashboardImplCopyWithImpl(
    _$SellerDashboardImpl _value,
    $Res Function(_$SellerDashboardImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SellerDashboard
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? summary = null, Object? listings = null}) {
    return _then(
      _$SellerDashboardImpl(
        summary: null == summary
            ? _value.summary
            : summary // ignore: cast_nullable_to_non_nullable
                  as OrderSummary,
        listings: null == listings
            ? _value._listings
            : listings // ignore: cast_nullable_to_non_nullable
                  as Map<ListingStatus, int>,
      ),
    );
  }
}

/// @nodoc

class _$SellerDashboardImpl extends _SellerDashboard {
  const _$SellerDashboardImpl({
    required this.summary,
    required final Map<ListingStatus, int> listings,
  }) : _listings = listings,
       super._();

  @override
  final OrderSummary summary;
  final Map<ListingStatus, int> _listings;
  @override
  Map<ListingStatus, int> get listings {
    if (_listings is EqualUnmodifiableMapView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_listings);
  }

  @override
  String toString() {
    return 'SellerDashboard(summary: $summary, listings: $listings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerDashboardImpl &&
            (identical(other.summary, summary) || other.summary == summary) &&
            const DeepCollectionEquality().equals(other._listings, _listings));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    summary,
    const DeepCollectionEquality().hash(_listings),
  );

  /// Create a copy of SellerDashboard
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerDashboardImplCopyWith<_$SellerDashboardImpl> get copyWith =>
      __$$SellerDashboardImplCopyWithImpl<_$SellerDashboardImpl>(
        this,
        _$identity,
      );
}

abstract class _SellerDashboard extends SellerDashboard {
  const factory _SellerDashboard({
    required final OrderSummary summary,
    required final Map<ListingStatus, int> listings,
  }) = _$SellerDashboardImpl;
  const _SellerDashboard._() : super._();

  @override
  OrderSummary get summary;
  @override
  Map<ListingStatus, int> get listings;

  /// Create a copy of SellerDashboard
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerDashboardImplCopyWith<_$SellerDashboardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
