// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'listing_suggestion_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListingPhoto {

 String get path; String? get resourceId; bool get uploading; String? get errorMessage;
/// Create a copy of ListingPhoto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingPhotoCopyWith<ListingPhoto> get copyWith => _$ListingPhotoCopyWithImpl<ListingPhoto>(this as ListingPhoto, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingPhoto&&(identical(other.path, path) || other.path == path)&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.uploading, uploading) || other.uploading == uploading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,path,resourceId,uploading,errorMessage);

@override
String toString() {
  return 'ListingPhoto(path: $path, resourceId: $resourceId, uploading: $uploading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListingPhotoCopyWith<$Res>  {
  factory $ListingPhotoCopyWith(ListingPhoto value, $Res Function(ListingPhoto) _then) = _$ListingPhotoCopyWithImpl;
@useResult
$Res call({
 String path, String? resourceId, bool uploading, String? errorMessage
});




}
/// @nodoc
class _$ListingPhotoCopyWithImpl<$Res>
    implements $ListingPhotoCopyWith<$Res> {
  _$ListingPhotoCopyWithImpl(this._self, this._then);

  final ListingPhoto _self;
  final $Res Function(ListingPhoto) _then;

/// Create a copy of ListingPhoto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? path = null,Object? resourceId = freezed,Object? uploading = null,Object? errorMessage = freezed,}) {
  return _then(ListingPhoto(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,resourceId: freezed == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as String?,uploading: null == uploading ? _self.uploading : uploading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListingPhoto].
extension ListingPhotoPatterns on ListingPhoto {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingPhoto value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingPhoto() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingPhoto value)  $default,){
final _that = this;
switch (_that) {
case _ListingPhoto():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingPhoto value)?  $default,){
final _that = this;
switch (_that) {
case _ListingPhoto() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String path,  String? resourceId,  bool uploading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingPhoto() when $default != null:
return $default(_that.path,_that.resourceId,_that.uploading,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String path,  String? resourceId,  bool uploading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListingPhoto():
return $default(_that.path,_that.resourceId,_that.uploading,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String path,  String? resourceId,  bool uploading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListingPhoto() when $default != null:
return $default(_that.path,_that.resourceId,_that.uploading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListingPhoto implements ListingPhoto {
  const _ListingPhoto({required this.path, this.resourceId, this.uploading = true, this.errorMessage});
  

@override final  String path;
@override final  String? resourceId;
@override@JsonKey() final  bool uploading;
@override final  String? errorMessage;

/// Create a copy of ListingPhoto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingPhotoCopyWith<_ListingPhoto> get copyWith => __$ListingPhotoCopyWithImpl<_ListingPhoto>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingPhoto&&(identical(other.path, path) || other.path == path)&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.uploading, uploading) || other.uploading == uploading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,path,resourceId,uploading,errorMessage);

@override
String toString() {
  return 'ListingPhoto(path: $path, resourceId: $resourceId, uploading: $uploading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListingPhotoCopyWith<$Res> implements $ListingPhotoCopyWith<$Res> {
  factory _$ListingPhotoCopyWith(_ListingPhoto value, $Res Function(_ListingPhoto) _then) = __$ListingPhotoCopyWithImpl;
@override @useResult
$Res call({
 String path, String? resourceId, bool uploading, String? errorMessage
});




}
/// @nodoc
class __$ListingPhotoCopyWithImpl<$Res>
    implements _$ListingPhotoCopyWith<$Res> {
  __$ListingPhotoCopyWithImpl(this._self, this._then);

  final _ListingPhoto _self;
  final $Res Function(_ListingPhoto) _then;

/// Create a copy of ListingPhoto
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? path = null,Object? resourceId = freezed,Object? uploading = null,Object? errorMessage = freezed,}) {
  return _then(_ListingPhoto(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,resourceId: freezed == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as String?,uploading: null == uploading ? _self.uploading : uploading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ListingSuggestionState {

 List<ListingPhoto> get photos; bool get suggesting; bool get submitting;/// The model's answer, or null while the seller has not asked for one. The
/// form is editable either way — a seller who skips the AI just fills it in.
 ListingSuggestion? get suggestion; List<Category> get categories; List<Contact> get contacts;/// Set once `POST /listings` landed, so a failed publication does not invite
/// a second press that would post the same item twice.
 String? get createdListingId; bool get published; String? get errorMessage;
/// Create a copy of ListingSuggestionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingSuggestionStateCopyWith<ListingSuggestionState> get copyWith => _$ListingSuggestionStateCopyWithImpl<ListingSuggestionState>(this as ListingSuggestionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingSuggestionState&&const DeepCollectionEquality().equals(other.photos, photos)&&(identical(other.suggesting, suggesting) || other.suggesting == suggesting)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.suggestion, suggestion) || other.suggestion == suggestion)&&const DeepCollectionEquality().equals(other.categories, categories)&&const DeepCollectionEquality().equals(other.contacts, contacts)&&(identical(other.createdListingId, createdListingId) || other.createdListingId == createdListingId)&&(identical(other.published, published) || other.published == published)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(photos),suggesting,submitting,suggestion,const DeepCollectionEquality().hash(categories),const DeepCollectionEquality().hash(contacts),createdListingId,published,errorMessage);

@override
String toString() {
  return 'ListingSuggestionState(photos: $photos, suggesting: $suggesting, submitting: $submitting, suggestion: $suggestion, categories: $categories, contacts: $contacts, createdListingId: $createdListingId, published: $published, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $ListingSuggestionStateCopyWith<$Res>  {
  factory $ListingSuggestionStateCopyWith(ListingSuggestionState value, $Res Function(ListingSuggestionState) _then) = _$ListingSuggestionStateCopyWithImpl;
@useResult
$Res call({
 List<ListingPhoto> photos, bool suggesting, bool submitting, ListingSuggestion? suggestion, List<Category> categories, List<Contact> contacts, String? createdListingId, bool published, String? errorMessage
});




}
/// @nodoc
class _$ListingSuggestionStateCopyWithImpl<$Res>
    implements $ListingSuggestionStateCopyWith<$Res> {
  _$ListingSuggestionStateCopyWithImpl(this._self, this._then);

  final ListingSuggestionState _self;
  final $Res Function(ListingSuggestionState) _then;

/// Create a copy of ListingSuggestionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? photos = null,Object? suggesting = null,Object? submitting = null,Object? suggestion = freezed,Object? categories = null,Object? contacts = null,Object? createdListingId = freezed,Object? published = null,Object? errorMessage = freezed,}) {
  return _then(ListingSuggestionState(
photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as List<ListingPhoto>,suggesting: null == suggesting ? _self.suggesting : suggesting // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,suggestion: freezed == suggestion ? _self.suggestion : suggestion // ignore: cast_nullable_to_non_nullable
as ListingSuggestion?,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<Contact>,createdListingId: freezed == createdListingId ? _self.createdListingId : createdListingId // ignore: cast_nullable_to_non_nullable
as String?,published: null == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ListingSuggestionState].
extension ListingSuggestionStatePatterns on ListingSuggestionState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingSuggestionState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingSuggestionState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingSuggestionState value)  $default,){
final _that = this;
switch (_that) {
case _ListingSuggestionState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingSuggestionState value)?  $default,){
final _that = this;
switch (_that) {
case _ListingSuggestionState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ListingPhoto> photos,  bool suggesting,  bool submitting,  ListingSuggestion? suggestion,  List<Category> categories,  List<Contact> contacts,  String? createdListingId,  bool published,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingSuggestionState() when $default != null:
return $default(_that.photos,_that.suggesting,_that.submitting,_that.suggestion,_that.categories,_that.contacts,_that.createdListingId,_that.published,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ListingPhoto> photos,  bool suggesting,  bool submitting,  ListingSuggestion? suggestion,  List<Category> categories,  List<Contact> contacts,  String? createdListingId,  bool published,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _ListingSuggestionState():
return $default(_that.photos,_that.suggesting,_that.submitting,_that.suggestion,_that.categories,_that.contacts,_that.createdListingId,_that.published,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ListingPhoto> photos,  bool suggesting,  bool submitting,  ListingSuggestion? suggestion,  List<Category> categories,  List<Contact> contacts,  String? createdListingId,  bool published,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _ListingSuggestionState() when $default != null:
return $default(_that.photos,_that.suggesting,_that.submitting,_that.suggestion,_that.categories,_that.contacts,_that.createdListingId,_that.published,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ListingSuggestionState implements ListingSuggestionState {
  const _ListingSuggestionState({ List<ListingPhoto> photos = const [], this.suggesting = false, this.submitting = false, this.suggestion,  List<Category> categories = const [],  List<Contact> contacts = const [], this.createdListingId, this.published = false, this.errorMessage}): _photos = photos,_categories = categories,_contacts = contacts;
  

 final  List<ListingPhoto> _photos;
@override@JsonKey() List<ListingPhoto> get photos {
  if (_photos is EqualUnmodifiableListView) return _photos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photos);
}

@override@JsonKey() final  bool suggesting;
@override@JsonKey() final  bool submitting;
/// The model's answer, or null while the seller has not asked for one. The
/// form is editable either way — a seller who skips the AI just fills it in.
@override final  ListingSuggestion? suggestion;
 final  List<Category> _categories;
@override@JsonKey() List<Category> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}

 final  List<Contact> _contacts;
@override@JsonKey() List<Contact> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}

/// Set once `POST /listings` landed, so a failed publication does not invite
/// a second press that would post the same item twice.
@override final  String? createdListingId;
@override@JsonKey() final  bool published;
@override final  String? errorMessage;

/// Create a copy of ListingSuggestionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingSuggestionStateCopyWith<_ListingSuggestionState> get copyWith => __$ListingSuggestionStateCopyWithImpl<_ListingSuggestionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingSuggestionState&&const DeepCollectionEquality().equals(other._photos, _photos)&&(identical(other.suggesting, suggesting) || other.suggesting == suggesting)&&(identical(other.submitting, submitting) || other.submitting == submitting)&&(identical(other.suggestion, suggestion) || other.suggestion == suggestion)&&const DeepCollectionEquality().equals(other._categories, _categories)&&const DeepCollectionEquality().equals(other._contacts, _contacts)&&(identical(other.createdListingId, createdListingId) || other.createdListingId == createdListingId)&&(identical(other.published, published) || other.published == published)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_photos),suggesting,submitting,suggestion,const DeepCollectionEquality().hash(_categories),const DeepCollectionEquality().hash(_contacts),createdListingId,published,errorMessage);

@override
String toString() {
  return 'ListingSuggestionState(photos: $photos, suggesting: $suggesting, submitting: $submitting, suggestion: $suggestion, categories: $categories, contacts: $contacts, createdListingId: $createdListingId, published: $published, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$ListingSuggestionStateCopyWith<$Res> implements $ListingSuggestionStateCopyWith<$Res> {
  factory _$ListingSuggestionStateCopyWith(_ListingSuggestionState value, $Res Function(_ListingSuggestionState) _then) = __$ListingSuggestionStateCopyWithImpl;
@override @useResult
$Res call({
 List<ListingPhoto> photos, bool suggesting, bool submitting, ListingSuggestion? suggestion, List<Category> categories, List<Contact> contacts, String? createdListingId, bool published, String? errorMessage
});




}
/// @nodoc
class __$ListingSuggestionStateCopyWithImpl<$Res>
    implements _$ListingSuggestionStateCopyWith<$Res> {
  __$ListingSuggestionStateCopyWithImpl(this._self, this._then);

  final _ListingSuggestionState _self;
  final $Res Function(_ListingSuggestionState) _then;

/// Create a copy of ListingSuggestionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? photos = null,Object? suggesting = null,Object? submitting = null,Object? suggestion = freezed,Object? categories = null,Object? contacts = null,Object? createdListingId = freezed,Object? published = null,Object? errorMessage = freezed,}) {
  return _then(_ListingSuggestionState(
photos: null == photos ? _self._photos : photos // ignore: cast_nullable_to_non_nullable
as List<ListingPhoto>,suggesting: null == suggesting ? _self.suggesting : suggesting // ignore: cast_nullable_to_non_nullable
as bool,submitting: null == submitting ? _self.submitting : submitting // ignore: cast_nullable_to_non_nullable
as bool,suggestion: freezed == suggestion ? _self.suggestion : suggestion // ignore: cast_nullable_to_non_nullable
as ListingSuggestion?,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<Category>,contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<Contact>,createdListingId: freezed == createdListingId ? _self.createdListingId : createdListingId // ignore: cast_nullable_to_non_nullable
as String?,published: null == published ? _self.published : published // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
