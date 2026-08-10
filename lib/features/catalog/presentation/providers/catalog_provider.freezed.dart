// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$CatalogSearchFilters {
  String? get keyword => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  int? get priceMin => throw _privateConstructorUsedError;
  int? get priceMax => throw _privateConstructorUsedError;
  String? get tag => throw _privateConstructorUsedError;
  String? get sort =>
      throw _privateConstructorUsedError; // Where to look: the listing's own snapshot of the seller's pickup address.
  // Send the narrowest level meant — a ward is already inside its province.
  // There is no district: Vietnam goes province to ward, so a listing's
  // snapshot has no district code for one to be matched against.
  String? get provinceCode => throw _privateConstructorUsedError;
  String? get wardCode =>
      throw _privateConstructorUsedError; // Codes carry no name, so the chip needs the label the user picked.
  String? get areaLabel =>
      throw _privateConstructorUsedError; // Where the buyer is. A saved contact is the usual answer; lat/lon is
  // supported all the way down to the request but no screen sets it, since
  // the app has no geolocation plugin.
  String? get nearContactId => throw _privateConstructorUsedError;
  String? get nearLabel => throw _privateConstructorUsedError;
  double? get lat => throw _privateConstructorUsedError;
  double? get lon => throw _privateConstructorUsedError;
  double? get radiusKm => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;

  /// Create a copy of CatalogSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CatalogSearchFiltersCopyWith<CatalogSearchFilters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogSearchFiltersCopyWith<$Res> {
  factory $CatalogSearchFiltersCopyWith(
    CatalogSearchFilters value,
    $Res Function(CatalogSearchFilters) then,
  ) = _$CatalogSearchFiltersCopyWithImpl<$Res, CatalogSearchFilters>;
  @useResult
  $Res call({
    String? keyword,
    String? categoryId,
    int? priceMin,
    int? priceMax,
    String? tag,
    String? sort,
    String? provinceCode,
    String? wardCode,
    String? areaLabel,
    String? nearContactId,
    String? nearLabel,
    double? lat,
    double? lon,
    double? radiusKm,
    int page,
    int size,
  });
}

/// @nodoc
class _$CatalogSearchFiltersCopyWithImpl<
  $Res,
  $Val extends CatalogSearchFilters
>
    implements $CatalogSearchFiltersCopyWith<$Res> {
  _$CatalogSearchFiltersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CatalogSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
    Object? categoryId = freezed,
    Object? priceMin = freezed,
    Object? priceMax = freezed,
    Object? tag = freezed,
    Object? sort = freezed,
    Object? provinceCode = freezed,
    Object? wardCode = freezed,
    Object? areaLabel = freezed,
    Object? nearContactId = freezed,
    Object? nearLabel = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? radiusKm = freezed,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(
      _value.copyWith(
            keyword: freezed == keyword
                ? _value.keyword
                : keyword // ignore: cast_nullable_to_non_nullable
                      as String?,
            categoryId: freezed == categoryId
                ? _value.categoryId
                : categoryId // ignore: cast_nullable_to_non_nullable
                      as String?,
            priceMin: freezed == priceMin
                ? _value.priceMin
                : priceMin // ignore: cast_nullable_to_non_nullable
                      as int?,
            priceMax: freezed == priceMax
                ? _value.priceMax
                : priceMax // ignore: cast_nullable_to_non_nullable
                      as int?,
            tag: freezed == tag
                ? _value.tag
                : tag // ignore: cast_nullable_to_non_nullable
                      as String?,
            sort: freezed == sort
                ? _value.sort
                : sort // ignore: cast_nullable_to_non_nullable
                      as String?,
            provinceCode: freezed == provinceCode
                ? _value.provinceCode
                : provinceCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            wardCode: freezed == wardCode
                ? _value.wardCode
                : wardCode // ignore: cast_nullable_to_non_nullable
                      as String?,
            areaLabel: freezed == areaLabel
                ? _value.areaLabel
                : areaLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            nearContactId: freezed == nearContactId
                ? _value.nearContactId
                : nearContactId // ignore: cast_nullable_to_non_nullable
                      as String?,
            nearLabel: freezed == nearLabel
                ? _value.nearLabel
                : nearLabel // ignore: cast_nullable_to_non_nullable
                      as String?,
            lat: freezed == lat
                ? _value.lat
                : lat // ignore: cast_nullable_to_non_nullable
                      as double?,
            lon: freezed == lon
                ? _value.lon
                : lon // ignore: cast_nullable_to_non_nullable
                      as double?,
            radiusKm: freezed == radiusKm
                ? _value.radiusKm
                : radiusKm // ignore: cast_nullable_to_non_nullable
                      as double?,
            page: null == page
                ? _value.page
                : page // ignore: cast_nullable_to_non_nullable
                      as int,
            size: null == size
                ? _value.size
                : size // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CatalogSearchFiltersImplCopyWith<$Res>
    implements $CatalogSearchFiltersCopyWith<$Res> {
  factory _$$CatalogSearchFiltersImplCopyWith(
    _$CatalogSearchFiltersImpl value,
    $Res Function(_$CatalogSearchFiltersImpl) then,
  ) = __$$CatalogSearchFiltersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? keyword,
    String? categoryId,
    int? priceMin,
    int? priceMax,
    String? tag,
    String? sort,
    String? provinceCode,
    String? wardCode,
    String? areaLabel,
    String? nearContactId,
    String? nearLabel,
    double? lat,
    double? lon,
    double? radiusKm,
    int page,
    int size,
  });
}

/// @nodoc
class __$$CatalogSearchFiltersImplCopyWithImpl<$Res>
    extends _$CatalogSearchFiltersCopyWithImpl<$Res, _$CatalogSearchFiltersImpl>
    implements _$$CatalogSearchFiltersImplCopyWith<$Res> {
  __$$CatalogSearchFiltersImplCopyWithImpl(
    _$CatalogSearchFiltersImpl _value,
    $Res Function(_$CatalogSearchFiltersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CatalogSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
    Object? categoryId = freezed,
    Object? priceMin = freezed,
    Object? priceMax = freezed,
    Object? tag = freezed,
    Object? sort = freezed,
    Object? provinceCode = freezed,
    Object? wardCode = freezed,
    Object? areaLabel = freezed,
    Object? nearContactId = freezed,
    Object? nearLabel = freezed,
    Object? lat = freezed,
    Object? lon = freezed,
    Object? radiusKm = freezed,
    Object? page = null,
    Object? size = null,
  }) {
    return _then(
      _$CatalogSearchFiltersImpl(
        keyword: freezed == keyword
            ? _value.keyword
            : keyword // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryId: freezed == categoryId
            ? _value.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        priceMin: freezed == priceMin
            ? _value.priceMin
            : priceMin // ignore: cast_nullable_to_non_nullable
                  as int?,
        priceMax: freezed == priceMax
            ? _value.priceMax
            : priceMax // ignore: cast_nullable_to_non_nullable
                  as int?,
        tag: freezed == tag
            ? _value.tag
            : tag // ignore: cast_nullable_to_non_nullable
                  as String?,
        sort: freezed == sort
            ? _value.sort
            : sort // ignore: cast_nullable_to_non_nullable
                  as String?,
        provinceCode: freezed == provinceCode
            ? _value.provinceCode
            : provinceCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        wardCode: freezed == wardCode
            ? _value.wardCode
            : wardCode // ignore: cast_nullable_to_non_nullable
                  as String?,
        areaLabel: freezed == areaLabel
            ? _value.areaLabel
            : areaLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        nearContactId: freezed == nearContactId
            ? _value.nearContactId
            : nearContactId // ignore: cast_nullable_to_non_nullable
                  as String?,
        nearLabel: freezed == nearLabel
            ? _value.nearLabel
            : nearLabel // ignore: cast_nullable_to_non_nullable
                  as String?,
        lat: freezed == lat
            ? _value.lat
            : lat // ignore: cast_nullable_to_non_nullable
                  as double?,
        lon: freezed == lon
            ? _value.lon
            : lon // ignore: cast_nullable_to_non_nullable
                  as double?,
        radiusKm: freezed == radiusKm
            ? _value.radiusKm
            : radiusKm // ignore: cast_nullable_to_non_nullable
                  as double?,
        page: null == page
            ? _value.page
            : page // ignore: cast_nullable_to_non_nullable
                  as int,
        size: null == size
            ? _value.size
            : size // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$CatalogSearchFiltersImpl extends _CatalogSearchFilters {
  const _$CatalogSearchFiltersImpl({
    this.keyword,
    this.categoryId,
    this.priceMin,
    this.priceMax,
    this.tag,
    this.sort,
    this.provinceCode,
    this.wardCode,
    this.areaLabel,
    this.nearContactId,
    this.nearLabel,
    this.lat,
    this.lon,
    this.radiusKm,
    this.page = 1,
    this.size = 20,
  }) : super._();

  @override
  final String? keyword;
  @override
  final String? categoryId;
  @override
  final int? priceMin;
  @override
  final int? priceMax;
  @override
  final String? tag;
  @override
  final String? sort;
  // Where to look: the listing's own snapshot of the seller's pickup address.
  // Send the narrowest level meant — a ward is already inside its province.
  // There is no district: Vietnam goes province to ward, so a listing's
  // snapshot has no district code for one to be matched against.
  @override
  final String? provinceCode;
  @override
  final String? wardCode;
  // Codes carry no name, so the chip needs the label the user picked.
  @override
  final String? areaLabel;
  // Where the buyer is. A saved contact is the usual answer; lat/lon is
  // supported all the way down to the request but no screen sets it, since
  // the app has no geolocation plugin.
  @override
  final String? nearContactId;
  @override
  final String? nearLabel;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  final double? radiusKm;
  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int size;

  @override
  String toString() {
    return 'CatalogSearchFilters(keyword: $keyword, categoryId: $categoryId, priceMin: $priceMin, priceMax: $priceMax, tag: $tag, sort: $sort, provinceCode: $provinceCode, wardCode: $wardCode, areaLabel: $areaLabel, nearContactId: $nearContactId, nearLabel: $nearLabel, lat: $lat, lon: $lon, radiusKm: $radiusKm, page: $page, size: $size)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogSearchFiltersImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.priceMin, priceMin) ||
                other.priceMin == priceMin) &&
            (identical(other.priceMax, priceMax) ||
                other.priceMax == priceMax) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.sort, sort) || other.sort == sort) &&
            (identical(other.provinceCode, provinceCode) ||
                other.provinceCode == provinceCode) &&
            (identical(other.wardCode, wardCode) ||
                other.wardCode == wardCode) &&
            (identical(other.areaLabel, areaLabel) ||
                other.areaLabel == areaLabel) &&
            (identical(other.nearContactId, nearContactId) ||
                other.nearContactId == nearContactId) &&
            (identical(other.nearLabel, nearLabel) ||
                other.nearLabel == nearLabel) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lon, lon) || other.lon == lon) &&
            (identical(other.radiusKm, radiusKm) ||
                other.radiusKm == radiusKm) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.size, size) || other.size == size));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    keyword,
    categoryId,
    priceMin,
    priceMax,
    tag,
    sort,
    provinceCode,
    wardCode,
    areaLabel,
    nearContactId,
    nearLabel,
    lat,
    lon,
    radiusKm,
    page,
    size,
  );

  /// Create a copy of CatalogSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogSearchFiltersImplCopyWith<_$CatalogSearchFiltersImpl>
  get copyWith =>
      __$$CatalogSearchFiltersImplCopyWithImpl<_$CatalogSearchFiltersImpl>(
        this,
        _$identity,
      );
}

abstract class _CatalogSearchFilters extends CatalogSearchFilters {
  const factory _CatalogSearchFilters({
    final String? keyword,
    final String? categoryId,
    final int? priceMin,
    final int? priceMax,
    final String? tag,
    final String? sort,
    final String? provinceCode,
    final String? wardCode,
    final String? areaLabel,
    final String? nearContactId,
    final String? nearLabel,
    final double? lat,
    final double? lon,
    final double? radiusKm,
    final int page,
    final int size,
  }) = _$CatalogSearchFiltersImpl;
  const _CatalogSearchFilters._() : super._();

  @override
  String? get keyword;
  @override
  String? get categoryId;
  @override
  int? get priceMin;
  @override
  int? get priceMax;
  @override
  String? get tag;
  @override
  String? get sort; // Where to look: the listing's own snapshot of the seller's pickup address.
  // Send the narrowest level meant — a ward is already inside its province.
  // There is no district: Vietnam goes province to ward, so a listing's
  // snapshot has no district code for one to be matched against.
  @override
  String? get provinceCode;
  @override
  String? get wardCode; // Codes carry no name, so the chip needs the label the user picked.
  @override
  String? get areaLabel; // Where the buyer is. A saved contact is the usual answer; lat/lon is
  // supported all the way down to the request but no screen sets it, since
  // the app has no geolocation plugin.
  @override
  String? get nearContactId;
  @override
  String? get nearLabel;
  @override
  double? get lat;
  @override
  double? get lon;
  @override
  double? get radiusKm;
  @override
  int get page;
  @override
  int get size;

  /// Create a copy of CatalogSearchFilters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CatalogSearchFiltersImplCopyWith<_$CatalogSearchFiltersImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CatalogProductsState {
  List<Listing> get products => throw _privateConstructorUsedError;
  bool get hasMore => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  CatalogSearchFilters get filters => throw _privateConstructorUsedError;

  /// Create a copy of CatalogProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CatalogProductsStateCopyWith<CatalogProductsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CatalogProductsStateCopyWith<$Res> {
  factory $CatalogProductsStateCopyWith(
    CatalogProductsState value,
    $Res Function(CatalogProductsState) then,
  ) = _$CatalogProductsStateCopyWithImpl<$Res, CatalogProductsState>;
  @useResult
  $Res call({
    List<Listing> products,
    bool hasMore,
    bool isLoadingMore,
    CatalogSearchFilters filters,
  });

  $CatalogSearchFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class _$CatalogProductsStateCopyWithImpl<
  $Res,
  $Val extends CatalogProductsState
>
    implements $CatalogProductsStateCopyWith<$Res> {
  _$CatalogProductsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CatalogProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? hasMore = null,
    Object? isLoadingMore = null,
    Object? filters = null,
  }) {
    return _then(
      _value.copyWith(
            products: null == products
                ? _value.products
                : products // ignore: cast_nullable_to_non_nullable
                      as List<Listing>,
            hasMore: null == hasMore
                ? _value.hasMore
                : hasMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
            filters: null == filters
                ? _value.filters
                : filters // ignore: cast_nullable_to_non_nullable
                      as CatalogSearchFilters,
          )
          as $Val,
    );
  }

  /// Create a copy of CatalogProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CatalogSearchFiltersCopyWith<$Res> get filters {
    return $CatalogSearchFiltersCopyWith<$Res>(_value.filters, (value) {
      return _then(_value.copyWith(filters: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CatalogProductsStateImplCopyWith<$Res>
    implements $CatalogProductsStateCopyWith<$Res> {
  factory _$$CatalogProductsStateImplCopyWith(
    _$CatalogProductsStateImpl value,
    $Res Function(_$CatalogProductsStateImpl) then,
  ) = __$$CatalogProductsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<Listing> products,
    bool hasMore,
    bool isLoadingMore,
    CatalogSearchFilters filters,
  });

  @override
  $CatalogSearchFiltersCopyWith<$Res> get filters;
}

/// @nodoc
class __$$CatalogProductsStateImplCopyWithImpl<$Res>
    extends _$CatalogProductsStateCopyWithImpl<$Res, _$CatalogProductsStateImpl>
    implements _$$CatalogProductsStateImplCopyWith<$Res> {
  __$$CatalogProductsStateImplCopyWithImpl(
    _$CatalogProductsStateImpl _value,
    $Res Function(_$CatalogProductsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of CatalogProductsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? hasMore = null,
    Object? isLoadingMore = null,
    Object? filters = null,
  }) {
    return _then(
      _$CatalogProductsStateImpl(
        products: null == products
            ? _value._products
            : products // ignore: cast_nullable_to_non_nullable
                  as List<Listing>,
        hasMore: null == hasMore
            ? _value.hasMore
            : hasMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
        filters: null == filters
            ? _value.filters
            : filters // ignore: cast_nullable_to_non_nullable
                  as CatalogSearchFilters,
      ),
    );
  }
}

/// @nodoc

class _$CatalogProductsStateImpl implements _CatalogProductsState {
  const _$CatalogProductsStateImpl({
    required final List<Listing> products,
    required this.hasMore,
    required this.isLoadingMore,
    required this.filters,
  }) : _products = products;

  final List<Listing> _products;
  @override
  List<Listing> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final bool hasMore;
  @override
  final bool isLoadingMore;
  @override
  final CatalogSearchFilters filters;

  @override
  String toString() {
    return 'CatalogProductsState(products: $products, hasMore: $hasMore, isLoadingMore: $isLoadingMore, filters: $filters)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CatalogProductsStateImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.filters, filters) || other.filters == filters));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_products),
    hasMore,
    isLoadingMore,
    filters,
  );

  /// Create a copy of CatalogProductsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CatalogProductsStateImplCopyWith<_$CatalogProductsStateImpl>
  get copyWith =>
      __$$CatalogProductsStateImplCopyWithImpl<_$CatalogProductsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _CatalogProductsState implements CatalogProductsState {
  const factory _CatalogProductsState({
    required final List<Listing> products,
    required final bool hasMore,
    required final bool isLoadingMore,
    required final CatalogSearchFilters filters,
  }) = _$CatalogProductsStateImpl;

  @override
  List<Listing> get products;
  @override
  bool get hasMore;
  @override
  bool get isLoadingMore;
  @override
  CatalogSearchFilters get filters;

  /// Create a copy of CatalogProductsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CatalogProductsStateImplCopyWith<_$CatalogProductsStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductReviewsState {
  List<Review> get reviews => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;

  /// Create a copy of ProductReviewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductReviewsStateCopyWith<ProductReviewsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductReviewsStateCopyWith<$Res> {
  factory $ProductReviewsStateCopyWith(
    ProductReviewsState value,
    $Res Function(ProductReviewsState) then,
  ) = _$ProductReviewsStateCopyWithImpl<$Res, ProductReviewsState>;
  @useResult
  $Res call({List<Review> reviews, String? nextCursor, bool isLoadingMore});
}

/// @nodoc
class _$ProductReviewsStateCopyWithImpl<$Res, $Val extends ProductReviewsState>
    implements $ProductReviewsStateCopyWith<$Res> {
  _$ProductReviewsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductReviewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? nextCursor = freezed,
    Object? isLoadingMore = null,
  }) {
    return _then(
      _value.copyWith(
            reviews: null == reviews
                ? _value.reviews
                : reviews // ignore: cast_nullable_to_non_nullable
                      as List<Review>,
            nextCursor: freezed == nextCursor
                ? _value.nextCursor
                : nextCursor // ignore: cast_nullable_to_non_nullable
                      as String?,
            isLoadingMore: null == isLoadingMore
                ? _value.isLoadingMore
                : isLoadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProductReviewsStateImplCopyWith<$Res>
    implements $ProductReviewsStateCopyWith<$Res> {
  factory _$$ProductReviewsStateImplCopyWith(
    _$ProductReviewsStateImpl value,
    $Res Function(_$ProductReviewsStateImpl) then,
  ) = __$$ProductReviewsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Review> reviews, String? nextCursor, bool isLoadingMore});
}

/// @nodoc
class __$$ProductReviewsStateImplCopyWithImpl<$Res>
    extends _$ProductReviewsStateCopyWithImpl<$Res, _$ProductReviewsStateImpl>
    implements _$$ProductReviewsStateImplCopyWith<$Res> {
  __$$ProductReviewsStateImplCopyWithImpl(
    _$ProductReviewsStateImpl _value,
    $Res Function(_$ProductReviewsStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ProductReviewsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? reviews = null,
    Object? nextCursor = freezed,
    Object? isLoadingMore = null,
  }) {
    return _then(
      _$ProductReviewsStateImpl(
        reviews: null == reviews
            ? _value._reviews
            : reviews // ignore: cast_nullable_to_non_nullable
                  as List<Review>,
        nextCursor: freezed == nextCursor
            ? _value.nextCursor
            : nextCursor // ignore: cast_nullable_to_non_nullable
                  as String?,
        isLoadingMore: null == isLoadingMore
            ? _value.isLoadingMore
            : isLoadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$ProductReviewsStateImpl extends _ProductReviewsState {
  const _$ProductReviewsStateImpl({
    required final List<Review> reviews,
    this.nextCursor,
    this.isLoadingMore = false,
  }) : _reviews = reviews,
       super._();

  final List<Review> _reviews;
  @override
  List<Review> get reviews {
    if (_reviews is EqualUnmodifiableListView) return _reviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reviews);
  }

  @override
  final String? nextCursor;
  @override
  @JsonKey()
  final bool isLoadingMore;

  @override
  String toString() {
    return 'ProductReviewsState(reviews: $reviews, nextCursor: $nextCursor, isLoadingMore: $isLoadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductReviewsStateImpl &&
            const DeepCollectionEquality().equals(other._reviews, _reviews) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_reviews),
    nextCursor,
    isLoadingMore,
  );

  /// Create a copy of ProductReviewsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductReviewsStateImplCopyWith<_$ProductReviewsStateImpl> get copyWith =>
      __$$ProductReviewsStateImplCopyWithImpl<_$ProductReviewsStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ProductReviewsState extends ProductReviewsState {
  const factory _ProductReviewsState({
    required final List<Review> reviews,
    final String? nextCursor,
    final bool isLoadingMore,
  }) = _$ProductReviewsStateImpl;
  const _ProductReviewsState._() : super._();

  @override
  List<Review> get reviews;
  @override
  String? get nextCursor;
  @override
  bool get isLoadingMore;

  /// Create a copy of ProductReviewsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductReviewsStateImplCopyWith<_$ProductReviewsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
