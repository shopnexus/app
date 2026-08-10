// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_products_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SellerProductsState {
  /// Null is every status, which is also the only listing a non-owner may see.
  ListingStatus? get status => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;
  List<Listing> get listings => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of SellerProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SellerProductsStateCopyWith<SellerProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SellerProductsStateCopyWith<$Res> {
  factory $SellerProductsStateCopyWith(
    SellerProductsState value,
    $Res Function(SellerProductsState) then,
  ) = _$SellerProductsStateCopyWithImpl<$Res, SellerProductsState>;
  @useResult
  $Res call({
    ListingStatus? status,
    String searchQuery,
    List<Listing> listings,
    bool isLoading,
    String? errorMessage,
  });
}

/// @nodoc
class _$SellerProductsStateCopyWithImpl<$Res, $Val extends SellerProductsState>
    implements $SellerProductsStateCopyWith<$Res> {
  _$SellerProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SellerProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? searchQuery = null,
    Object? listings = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as ListingStatus?,
            searchQuery: null == searchQuery
                ? _value.searchQuery
                : searchQuery // ignore: cast_nullable_to_non_nullable
                      as String,
            listings: null == listings
                ? _value.listings
                : listings // ignore: cast_nullable_to_non_nullable
                      as List<Listing>,
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
abstract class _$$SellerProductsStateImplCopyWith<$Res>
    implements $SellerProductsStateCopyWith<$Res> {
  factory _$$SellerProductsStateImplCopyWith(
    _$SellerProductsStateImpl value,
    $Res Function(_$SellerProductsStateImpl) then,
  ) = __$$SellerProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    ListingStatus? status,
    String searchQuery,
    List<Listing> listings,
    bool isLoading,
    String? errorMessage,
  });
}

/// @nodoc
class __$$SellerProductsStateImplCopyWithImpl<$Res>
    extends _$SellerProductsStateCopyWithImpl<$Res, _$SellerProductsStateImpl>
    implements _$$SellerProductsStateImplCopyWith<$Res> {
  __$$SellerProductsStateImplCopyWithImpl(
    _$SellerProductsStateImpl _value,
    $Res Function(_$SellerProductsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SellerProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? searchQuery = null,
    Object? listings = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$SellerProductsStateImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as ListingStatus?,
        searchQuery: null == searchQuery
            ? _value.searchQuery
            : searchQuery // ignore: cast_nullable_to_non_nullable
                  as String,
        listings: null == listings
            ? _value._listings
            : listings // ignore: cast_nullable_to_non_nullable
                  as List<Listing>,
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

class _$SellerProductsStateImpl implements _SellerProductsState {
  const _$SellerProductsStateImpl({
    this.status,
    this.searchQuery = '',
    final List<Listing> listings = const [],
    this.isLoading = true,
    this.errorMessage,
  }) : _listings = listings;

  /// Null is every status, which is also the only listing a non-owner may see.
  @override
  final ListingStatus? status;
  @override
  @JsonKey()
  final String searchQuery;
  final List<Listing> _listings;
  @override
  @JsonKey()
  List<Listing> get listings {
    if (_listings is EqualUnmodifiableListView) return _listings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listings);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'SellerProductsState(status: $status, searchQuery: $searchQuery, listings: $listings, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SellerProductsStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery) &&
            const DeepCollectionEquality().equals(other._listings, _listings) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    searchQuery,
    const DeepCollectionEquality().hash(_listings),
    isLoading,
    errorMessage,
  );

  /// Create a copy of SellerProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SellerProductsStateImplCopyWith<_$SellerProductsStateImpl> get copyWith =>
      __$$SellerProductsStateImplCopyWithImpl<_$SellerProductsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SellerProductsState implements SellerProductsState {
  const factory _SellerProductsState({
    final ListingStatus? status,
    final String searchQuery,
    final List<Listing> listings,
    final bool isLoading,
    final String? errorMessage,
  }) = _$SellerProductsStateImpl;

  /// Null is every status, which is also the only listing a non-owner may see.
  @override
  ListingStatus? get status;
  @override
  String get searchQuery;
  @override
  List<Listing> get listings;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of SellerProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SellerProductsStateImplCopyWith<_$SellerProductsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
