// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_suggestion_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ListingPhoto {
  String get path => throw _privateConstructorUsedError;
  String? get resourceId => throw _privateConstructorUsedError;
  bool get uploading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ListingPhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListingPhotoCopyWith<ListingPhoto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingPhotoCopyWith<$Res> {
  factory $ListingPhotoCopyWith(
    ListingPhoto value,
    $Res Function(ListingPhoto) then,
  ) = _$ListingPhotoCopyWithImpl<$Res, ListingPhoto>;
  @useResult
  $Res call({
    String path,
    String? resourceId,
    bool uploading,
    String? errorMessage,
  });
}

/// @nodoc
class _$ListingPhotoCopyWithImpl<$Res, $Val extends ListingPhoto>
    implements $ListingPhotoCopyWith<$Res> {
  _$ListingPhotoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListingPhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? resourceId = freezed,
    Object? uploading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            path: null == path
                ? _value.path
                : path // ignore: cast_nullable_to_non_nullable
                      as String,
            resourceId: freezed == resourceId
                ? _value.resourceId
                : resourceId // ignore: cast_nullable_to_non_nullable
                      as String?,
            uploading: null == uploading
                ? _value.uploading
                : uploading // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ListingPhotoImplCopyWith<$Res>
    implements $ListingPhotoCopyWith<$Res> {
  factory _$$ListingPhotoImplCopyWith(
    _$ListingPhotoImpl value,
    $Res Function(_$ListingPhotoImpl) then,
  ) = __$$ListingPhotoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String path,
    String? resourceId,
    bool uploading,
    String? errorMessage,
  });
}

/// @nodoc
class __$$ListingPhotoImplCopyWithImpl<$Res>
    extends _$ListingPhotoCopyWithImpl<$Res, _$ListingPhotoImpl>
    implements _$$ListingPhotoImplCopyWith<$Res> {
  __$$ListingPhotoImplCopyWithImpl(
    _$ListingPhotoImpl _value,
    $Res Function(_$ListingPhotoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListingPhoto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
    Object? resourceId = freezed,
    Object? uploading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$ListingPhotoImpl(
        path: null == path
            ? _value.path
            : path // ignore: cast_nullable_to_non_nullable
                  as String,
        resourceId: freezed == resourceId
            ? _value.resourceId
            : resourceId // ignore: cast_nullable_to_non_nullable
                  as String?,
        uploading: null == uploading
            ? _value.uploading
            : uploading // ignore: cast_nullable_to_non_nullable
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

class _$ListingPhotoImpl implements _ListingPhoto {
  const _$ListingPhotoImpl({
    required this.path,
    this.resourceId,
    this.uploading = true,
    this.errorMessage,
  });

  @override
  final String path;
  @override
  final String? resourceId;
  @override
  @JsonKey()
  final bool uploading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ListingPhoto(path: $path, resourceId: $resourceId, uploading: $uploading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingPhotoImpl &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.resourceId, resourceId) ||
                other.resourceId == resourceId) &&
            (identical(other.uploading, uploading) ||
                other.uploading == uploading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, path, resourceId, uploading, errorMessage);

  /// Create a copy of ListingPhoto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingPhotoImplCopyWith<_$ListingPhotoImpl> get copyWith =>
      __$$ListingPhotoImplCopyWithImpl<_$ListingPhotoImpl>(this, _$identity);
}

abstract class _ListingPhoto implements ListingPhoto {
  const factory _ListingPhoto({
    required final String path,
    final String? resourceId,
    final bool uploading,
    final String? errorMessage,
  }) = _$ListingPhotoImpl;

  @override
  String get path;
  @override
  String? get resourceId;
  @override
  bool get uploading;
  @override
  String? get errorMessage;

  /// Create a copy of ListingPhoto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListingPhotoImplCopyWith<_$ListingPhotoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ListingSuggestionState {
  List<ListingPhoto> get photos => throw _privateConstructorUsedError;
  bool get suggesting => throw _privateConstructorUsedError;
  bool get submitting => throw _privateConstructorUsedError;

  /// The model's answer, or null while the seller has not asked for one. The
  /// form is editable either way — a seller who skips the AI just fills it in.
  ListingSuggestion? get suggestion => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  List<Contact> get contacts => throw _privateConstructorUsedError;

  /// Set once `POST /listings` landed, so a failed publication does not invite
  /// a second press that would post the same item twice.
  String? get createdListingId => throw _privateConstructorUsedError;
  bool get published => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of ListingSuggestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ListingSuggestionStateCopyWith<ListingSuggestionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ListingSuggestionStateCopyWith<$Res> {
  factory $ListingSuggestionStateCopyWith(
    ListingSuggestionState value,
    $Res Function(ListingSuggestionState) then,
  ) = _$ListingSuggestionStateCopyWithImpl<$Res, ListingSuggestionState>;
  @useResult
  $Res call({
    List<ListingPhoto> photos,
    bool suggesting,
    bool submitting,
    ListingSuggestion? suggestion,
    List<Category> categories,
    List<Contact> contacts,
    String? createdListingId,
    bool published,
    String? errorMessage,
  });
}

/// @nodoc
class _$ListingSuggestionStateCopyWithImpl<
  $Res,
  $Val extends ListingSuggestionState
>
    implements $ListingSuggestionStateCopyWith<$Res> {
  _$ListingSuggestionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ListingSuggestionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photos = null,
    Object? suggesting = null,
    Object? submitting = null,
    Object? suggestion = freezed,
    Object? categories = null,
    Object? contacts = null,
    Object? createdListingId = freezed,
    Object? published = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _value.copyWith(
            photos: null == photos
                ? _value.photos
                : photos // ignore: cast_nullable_to_non_nullable
                      as List<ListingPhoto>,
            suggesting: null == suggesting
                ? _value.suggesting
                : suggesting // ignore: cast_nullable_to_non_nullable
                      as bool,
            submitting: null == submitting
                ? _value.submitting
                : submitting // ignore: cast_nullable_to_non_nullable
                      as bool,
            suggestion: freezed == suggestion
                ? _value.suggestion
                : suggestion // ignore: cast_nullable_to_non_nullable
                      as ListingSuggestion?,
            categories: null == categories
                ? _value.categories
                : categories // ignore: cast_nullable_to_non_nullable
                      as List<Category>,
            contacts: null == contacts
                ? _value.contacts
                : contacts // ignore: cast_nullable_to_non_nullable
                      as List<Contact>,
            createdListingId: freezed == createdListingId
                ? _value.createdListingId
                : createdListingId // ignore: cast_nullable_to_non_nullable
                      as String?,
            published: null == published
                ? _value.published
                : published // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ListingSuggestionStateImplCopyWith<$Res>
    implements $ListingSuggestionStateCopyWith<$Res> {
  factory _$$ListingSuggestionStateImplCopyWith(
    _$ListingSuggestionStateImpl value,
    $Res Function(_$ListingSuggestionStateImpl) then,
  ) = __$$ListingSuggestionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<ListingPhoto> photos,
    bool suggesting,
    bool submitting,
    ListingSuggestion? suggestion,
    List<Category> categories,
    List<Contact> contacts,
    String? createdListingId,
    bool published,
    String? errorMessage,
  });
}

/// @nodoc
class __$$ListingSuggestionStateImplCopyWithImpl<$Res>
    extends
        _$ListingSuggestionStateCopyWithImpl<$Res, _$ListingSuggestionStateImpl>
    implements _$$ListingSuggestionStateImplCopyWith<$Res> {
  __$$ListingSuggestionStateImplCopyWithImpl(
    _$ListingSuggestionStateImpl _value,
    $Res Function(_$ListingSuggestionStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ListingSuggestionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? photos = null,
    Object? suggesting = null,
    Object? submitting = null,
    Object? suggestion = freezed,
    Object? categories = null,
    Object? contacts = null,
    Object? createdListingId = freezed,
    Object? published = null,
    Object? errorMessage = freezed,
  }) {
    return _then(
      _$ListingSuggestionStateImpl(
        photos: null == photos
            ? _value._photos
            : photos // ignore: cast_nullable_to_non_nullable
                  as List<ListingPhoto>,
        suggesting: null == suggesting
            ? _value.suggesting
            : suggesting // ignore: cast_nullable_to_non_nullable
                  as bool,
        submitting: null == submitting
            ? _value.submitting
            : submitting // ignore: cast_nullable_to_non_nullable
                  as bool,
        suggestion: freezed == suggestion
            ? _value.suggestion
            : suggestion // ignore: cast_nullable_to_non_nullable
                  as ListingSuggestion?,
        categories: null == categories
            ? _value._categories
            : categories // ignore: cast_nullable_to_non_nullable
                  as List<Category>,
        contacts: null == contacts
            ? _value._contacts
            : contacts // ignore: cast_nullable_to_non_nullable
                  as List<Contact>,
        createdListingId: freezed == createdListingId
            ? _value.createdListingId
            : createdListingId // ignore: cast_nullable_to_non_nullable
                  as String?,
        published: null == published
            ? _value.published
            : published // ignore: cast_nullable_to_non_nullable
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

class _$ListingSuggestionStateImpl implements _ListingSuggestionState {
  const _$ListingSuggestionStateImpl({
    final List<ListingPhoto> photos = const [],
    this.suggesting = false,
    this.submitting = false,
    this.suggestion,
    final List<Category> categories = const [],
    final List<Contact> contacts = const [],
    this.createdListingId,
    this.published = false,
    this.errorMessage,
  }) : _photos = photos,
       _categories = categories,
       _contacts = contacts;

  final List<ListingPhoto> _photos;
  @override
  @JsonKey()
  List<ListingPhoto> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  @JsonKey()
  final bool suggesting;
  @override
  @JsonKey()
  final bool submitting;

  /// The model's answer, or null while the seller has not asked for one. The
  /// form is editable either way — a seller who skips the AI just fills it in.
  @override
  final ListingSuggestion? suggestion;
  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Contact> _contacts;
  @override
  @JsonKey()
  List<Contact> get contacts {
    if (_contacts is EqualUnmodifiableListView) return _contacts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contacts);
  }

  /// Set once `POST /listings` landed, so a failed publication does not invite
  /// a second press that would post the same item twice.
  @override
  final String? createdListingId;
  @override
  @JsonKey()
  final bool published;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'ListingSuggestionState(photos: $photos, suggesting: $suggesting, submitting: $submitting, suggestion: $suggestion, categories: $categories, contacts: $contacts, createdListingId: $createdListingId, published: $published, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ListingSuggestionStateImpl &&
            const DeepCollectionEquality().equals(other._photos, _photos) &&
            (identical(other.suggesting, suggesting) ||
                other.suggesting == suggesting) &&
            (identical(other.submitting, submitting) ||
                other.submitting == submitting) &&
            (identical(other.suggestion, suggestion) ||
                other.suggestion == suggestion) &&
            const DeepCollectionEquality().equals(
              other._categories,
              _categories,
            ) &&
            const DeepCollectionEquality().equals(other._contacts, _contacts) &&
            (identical(other.createdListingId, createdListingId) ||
                other.createdListingId == createdListingId) &&
            (identical(other.published, published) ||
                other.published == published) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_photos),
    suggesting,
    submitting,
    suggestion,
    const DeepCollectionEquality().hash(_categories),
    const DeepCollectionEquality().hash(_contacts),
    createdListingId,
    published,
    errorMessage,
  );

  /// Create a copy of ListingSuggestionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ListingSuggestionStateImplCopyWith<_$ListingSuggestionStateImpl>
  get copyWith =>
      __$$ListingSuggestionStateImplCopyWithImpl<_$ListingSuggestionStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ListingSuggestionState implements ListingSuggestionState {
  const factory _ListingSuggestionState({
    final List<ListingPhoto> photos,
    final bool suggesting,
    final bool submitting,
    final ListingSuggestion? suggestion,
    final List<Category> categories,
    final List<Contact> contacts,
    final String? createdListingId,
    final bool published,
    final String? errorMessage,
  }) = _$ListingSuggestionStateImpl;

  @override
  List<ListingPhoto> get photos;
  @override
  bool get suggesting;
  @override
  bool get submitting;

  /// The model's answer, or null while the seller has not asked for one. The
  /// form is editable either way — a seller who skips the AI just fills it in.
  @override
  ListingSuggestion? get suggestion;
  @override
  List<Category> get categories;
  @override
  List<Contact> get contacts;

  /// Set once `POST /listings` landed, so a failed publication does not invite
  /// a second press that would post the same item twice.
  @override
  String? get createdListingId;
  @override
  bool get published;
  @override
  String? get errorMessage;

  /// Create a copy of ListingSuggestionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ListingSuggestionStateImplCopyWith<_$ListingSuggestionStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}
