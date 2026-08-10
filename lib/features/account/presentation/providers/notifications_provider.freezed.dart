// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notifications_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NotificationFeed {
  List<Notification> get items => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;
  bool get loadingMore => throw _privateConstructorUsedError;

  /// Create a copy of NotificationFeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationFeedCopyWith<NotificationFeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationFeedCopyWith<$Res> {
  factory $NotificationFeedCopyWith(
    NotificationFeed value,
    $Res Function(NotificationFeed) then,
  ) = _$NotificationFeedCopyWithImpl<$Res, NotificationFeed>;
  @useResult
  $Res call({List<Notification> items, String? nextCursor, bool loadingMore});
}

/// @nodoc
class _$NotificationFeedCopyWithImpl<$Res, $Val extends NotificationFeed>
    implements $NotificationFeedCopyWith<$Res> {
  _$NotificationFeedCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NotificationFeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextCursor = freezed,
    Object? loadingMore = null,
  }) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<Notification>,
            nextCursor: freezed == nextCursor
                ? _value.nextCursor
                : nextCursor // ignore: cast_nullable_to_non_nullable
                      as String?,
            loadingMore: null == loadingMore
                ? _value.loadingMore
                : loadingMore // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NotificationFeedImplCopyWith<$Res>
    implements $NotificationFeedCopyWith<$Res> {
  factory _$$NotificationFeedImplCopyWith(
    _$NotificationFeedImpl value,
    $Res Function(_$NotificationFeedImpl) then,
  ) = __$$NotificationFeedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Notification> items, String? nextCursor, bool loadingMore});
}

/// @nodoc
class __$$NotificationFeedImplCopyWithImpl<$Res>
    extends _$NotificationFeedCopyWithImpl<$Res, _$NotificationFeedImpl>
    implements _$$NotificationFeedImplCopyWith<$Res> {
  __$$NotificationFeedImplCopyWithImpl(
    _$NotificationFeedImpl _value,
    $Res Function(_$NotificationFeedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NotificationFeed
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? nextCursor = freezed,
    Object? loadingMore = null,
  }) {
    return _then(
      _$NotificationFeedImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<Notification>,
        nextCursor: freezed == nextCursor
            ? _value.nextCursor
            : nextCursor // ignore: cast_nullable_to_non_nullable
                  as String?,
        loadingMore: null == loadingMore
            ? _value.loadingMore
            : loadingMore // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$NotificationFeedImpl implements _NotificationFeed {
  const _$NotificationFeedImpl({
    required final List<Notification> items,
    this.nextCursor,
    this.loadingMore = false,
  }) : _items = items;

  final List<Notification> _items;
  @override
  List<Notification> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final String? nextCursor;
  @override
  @JsonKey()
  final bool loadingMore;

  @override
  String toString() {
    return 'NotificationFeed(items: $items, nextCursor: $nextCursor, loadingMore: $loadingMore)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationFeedImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor) &&
            (identical(other.loadingMore, loadingMore) ||
                other.loadingMore == loadingMore));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    nextCursor,
    loadingMore,
  );

  /// Create a copy of NotificationFeed
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationFeedImplCopyWith<_$NotificationFeedImpl> get copyWith =>
      __$$NotificationFeedImplCopyWithImpl<_$NotificationFeedImpl>(
        this,
        _$identity,
      );
}

abstract class _NotificationFeed implements NotificationFeed {
  const factory _NotificationFeed({
    required final List<Notification> items,
    final String? nextCursor,
    final bool loadingMore,
  }) = _$NotificationFeedImpl;

  @override
  List<Notification> get items;
  @override
  String? get nextCursor;
  @override
  bool get loadingMore;

  /// Create a copy of NotificationFeed
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationFeedImplCopyWith<_$NotificationFeedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
