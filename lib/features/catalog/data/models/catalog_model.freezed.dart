// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

RecentListing _$RecentListingFromJson(Map<String, dynamic> json) {
  return _RecentListing.fromJson(json);
}

/// @nodoc
mixin _$RecentListing {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'cover_url')
  String? get coverUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'seller_name')
  String? get sellerName => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;
  bool get negotiable => throw _privateConstructorUsedError;

  /// Serializes this RecentListing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RecentListing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecentListingCopyWith<RecentListing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentListingCopyWith<$Res> {
  factory $RecentListingCopyWith(
    RecentListing value,
    $Res Function(RecentListing) then,
  ) = _$RecentListingCopyWithImpl<$Res, RecentListing>;
  @useResult
  $Res call({
    String id,
    String name,
    int price,
    @JsonKey(name: 'cover_url') String? coverUrl,
    @JsonKey(name: 'seller_name') String? sellerName,
    double rating,
    bool negotiable,
  });
}

/// @nodoc
class _$RecentListingCopyWithImpl<$Res, $Val extends RecentListing>
    implements $RecentListingCopyWith<$Res> {
  _$RecentListingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RecentListing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? coverUrl = freezed,
    Object? sellerName = freezed,
    Object? rating = null,
    Object? negotiable = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            price: null == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as int,
            coverUrl: freezed == coverUrl
                ? _value.coverUrl
                : coverUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            sellerName: freezed == sellerName
                ? _value.sellerName
                : sellerName // ignore: cast_nullable_to_non_nullable
                      as String?,
            rating: null == rating
                ? _value.rating
                : rating // ignore: cast_nullable_to_non_nullable
                      as double,
            negotiable: null == negotiable
                ? _value.negotiable
                : negotiable // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$RecentListingImplCopyWith<$Res>
    implements $RecentListingCopyWith<$Res> {
  factory _$$RecentListingImplCopyWith(
    _$RecentListingImpl value,
    $Res Function(_$RecentListingImpl) then,
  ) = __$$RecentListingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String id,
    String name,
    int price,
    @JsonKey(name: 'cover_url') String? coverUrl,
    @JsonKey(name: 'seller_name') String? sellerName,
    double rating,
    bool negotiable,
  });
}

/// @nodoc
class __$$RecentListingImplCopyWithImpl<$Res>
    extends _$RecentListingCopyWithImpl<$Res, _$RecentListingImpl>
    implements _$$RecentListingImplCopyWith<$Res> {
  __$$RecentListingImplCopyWithImpl(
    _$RecentListingImpl _value,
    $Res Function(_$RecentListingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of RecentListing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? coverUrl = freezed,
    Object? sellerName = freezed,
    Object? rating = null,
    Object? negotiable = null,
  }) {
    return _then(
      _$RecentListingImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        price: null == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as int,
        coverUrl: freezed == coverUrl
            ? _value.coverUrl
            : coverUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        sellerName: freezed == sellerName
            ? _value.sellerName
            : sellerName // ignore: cast_nullable_to_non_nullable
                  as String?,
        rating: null == rating
            ? _value.rating
            : rating // ignore: cast_nullable_to_non_nullable
                  as double,
        negotiable: null == negotiable
            ? _value.negotiable
            : negotiable // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentListingImpl extends _RecentListing {
  const _$RecentListingImpl({
    required this.id,
    required this.name,
    required this.price,
    @JsonKey(name: 'cover_url') this.coverUrl,
    @JsonKey(name: 'seller_name') this.sellerName,
    this.rating = 0.0,
    this.negotiable = false,
  }) : super._();

  factory _$RecentListingImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentListingImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final int price;
  @override
  @JsonKey(name: 'cover_url')
  final String? coverUrl;
  @override
  @JsonKey(name: 'seller_name')
  final String? sellerName;
  @override
  @JsonKey()
  final double rating;
  @override
  @JsonKey()
  final bool negotiable;

  @override
  String toString() {
    return 'RecentListing(id: $id, name: $name, price: $price, coverUrl: $coverUrl, sellerName: $sellerName, rating: $rating, negotiable: $negotiable)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentListingImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.coverUrl, coverUrl) ||
                other.coverUrl == coverUrl) &&
            (identical(other.sellerName, sellerName) ||
                other.sellerName == sellerName) &&
            (identical(other.rating, rating) || other.rating == rating) &&
            (identical(other.negotiable, negotiable) ||
                other.negotiable == negotiable));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    name,
    price,
    coverUrl,
    sellerName,
    rating,
    negotiable,
  );

  /// Create a copy of RecentListing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentListingImplCopyWith<_$RecentListingImpl> get copyWith =>
      __$$RecentListingImplCopyWithImpl<_$RecentListingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentListingImplToJson(this);
  }
}

abstract class _RecentListing extends RecentListing {
  const factory _RecentListing({
    required final String id,
    required final String name,
    required final int price,
    @JsonKey(name: 'cover_url') final String? coverUrl,
    @JsonKey(name: 'seller_name') final String? sellerName,
    final double rating,
    final bool negotiable,
  }) = _$RecentListingImpl;
  const _RecentListing._() : super._();

  factory _RecentListing.fromJson(Map<String, dynamic> json) =
      _$RecentListingImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  int get price;
  @override
  @JsonKey(name: 'cover_url')
  String? get coverUrl;
  @override
  @JsonKey(name: 'seller_name')
  String? get sellerName;
  @override
  double get rating;
  @override
  bool get negotiable;

  /// Create a copy of RecentListing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecentListingImplCopyWith<_$RecentListingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
