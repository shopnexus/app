// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Category {

 String get id; String get name; String get description;@JsonKey(name: 'parent_id') String? get parentId; double? get score; String? get slug; String? get icon;
/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryCopyWith<Category> get copyWith => _$CategoryCopyWithImpl<Category>(this as Category, _$identity);

  /// Serializes this Category to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.score, score) || other.score == score)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,parentId,score,slug,icon);

@override
String toString() {
  return 'Category(id: $id, name: $name, description: $description, parentId: $parentId, score: $score, slug: $slug, icon: $icon)';
}


}

/// @nodoc
abstract mixin class $CategoryCopyWith<$Res>  {
  factory $CategoryCopyWith(Category value, $Res Function(Category) _then) = _$CategoryCopyWithImpl;
@useResult
$Res call({
 String id, String name, String description,@JsonKey(name: 'parent_id') String? parentId, double? score, String? slug, String? icon
});




}
/// @nodoc
class _$CategoryCopyWithImpl<$Res>
    implements $CategoryCopyWith<$Res> {
  _$CategoryCopyWithImpl(this._self, this._then);

  final Category _self;
  final $Res Function(Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = null,Object? parentId = freezed,Object? score = freezed,Object? slug = freezed,Object? icon = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Category].
extension CategoryPatterns on Category {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Category value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Category value)  $default,){
final _that = this;
switch (_that) {
case _Category():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Category value)?  $default,){
final _that = this;
switch (_that) {
case _Category() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String description, @JsonKey(name: 'parent_id')  String? parentId,  double? score,  String? slug,  String? icon)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parentId,_that.score,_that.slug,_that.icon);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String description, @JsonKey(name: 'parent_id')  String? parentId,  double? score,  String? slug,  String? icon)  $default,) {final _that = this;
switch (_that) {
case _Category():
return $default(_that.id,_that.name,_that.description,_that.parentId,_that.score,_that.slug,_that.icon);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String description, @JsonKey(name: 'parent_id')  String? parentId,  double? score,  String? slug,  String? icon)?  $default,) {final _that = this;
switch (_that) {
case _Category() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.parentId,_that.score,_that.slug,_that.icon);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Category extends Category {
  const _Category({required this.id, required this.name, this.description = '', @JsonKey(name: 'parent_id') this.parentId, this.score, this.slug, this.icon}): super._();
  factory _Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String description;
@override@JsonKey(name: 'parent_id') final  String? parentId;
@override final  double? score;
@override final  String? slug;
@override final  String? icon;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryCopyWith<_Category> get copyWith => __$CategoryCopyWithImpl<_Category>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Category&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.parentId, parentId) || other.parentId == parentId)&&(identical(other.score, score) || other.score == score)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.icon, icon) || other.icon == icon));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,parentId,score,slug,icon);

@override
String toString() {
  return 'Category(id: $id, name: $name, description: $description, parentId: $parentId, score: $score, slug: $slug, icon: $icon)';
}


}

/// @nodoc
abstract mixin class _$CategoryCopyWith<$Res> implements $CategoryCopyWith<$Res> {
  factory _$CategoryCopyWith(_Category value, $Res Function(_Category) _then) = __$CategoryCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String description,@JsonKey(name: 'parent_id') String? parentId, double? score, String? slug, String? icon
});




}
/// @nodoc
class __$CategoryCopyWithImpl<$Res>
    implements _$CategoryCopyWith<$Res> {
  __$CategoryCopyWithImpl(this._self, this._then);

  final _Category _self;
  final $Res Function(_Category) _then;

/// Create a copy of Category
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = null,Object? parentId = freezed,Object? score = freezed,Object? slug = freezed,Object? icon = freezed,}) {
  return _then(_Category(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,parentId: freezed == parentId ? _self.parentId : parentId // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,slug: freezed == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String?,icon: freezed == icon ? _self.icon : icon // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Tag {

 String get slug; String? get description; double? get score;
/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TagCopyWith<Tag> get copyWith => _$TagCopyWithImpl<Tag>(this as Tag, _$identity);

  /// Serializes this Tag to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Tag&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,description,score);

@override
String toString() {
  return 'Tag(slug: $slug, description: $description, score: $score)';
}


}

/// @nodoc
abstract mixin class $TagCopyWith<$Res>  {
  factory $TagCopyWith(Tag value, $Res Function(Tag) _then) = _$TagCopyWithImpl;
@useResult
$Res call({
 String slug, String? description, double? score
});




}
/// @nodoc
class _$TagCopyWithImpl<$Res>
    implements $TagCopyWith<$Res> {
  _$TagCopyWithImpl(this._self, this._then);

  final Tag _self;
  final $Res Function(Tag) _then;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? slug = null,Object? description = freezed,Object? score = freezed,}) {
  return _then(_self.copyWith(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [Tag].
extension TagPatterns on Tag {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Tag value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Tag() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Tag value)  $default,){
final _that = this;
switch (_that) {
case _Tag():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Tag value)?  $default,){
final _that = this;
switch (_that) {
case _Tag() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String slug,  String? description,  double? score)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Tag() when $default != null:
return $default(_that.slug,_that.description,_that.score);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String slug,  String? description,  double? score)  $default,) {final _that = this;
switch (_that) {
case _Tag():
return $default(_that.slug,_that.description,_that.score);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String slug,  String? description,  double? score)?  $default,) {final _that = this;
switch (_that) {
case _Tag() when $default != null:
return $default(_that.slug,_that.description,_that.score);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Tag implements Tag {
  const _Tag({required this.slug, this.description, this.score});
  factory _Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

@override final  String slug;
@override final  String? description;
@override final  double? score;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TagCopyWith<_Tag> get copyWith => __$TagCopyWithImpl<_Tag>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TagToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Tag&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.score, score) || other.score == score));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,slug,description,score);

@override
String toString() {
  return 'Tag(slug: $slug, description: $description, score: $score)';
}


}

/// @nodoc
abstract mixin class _$TagCopyWith<$Res> implements $TagCopyWith<$Res> {
  factory _$TagCopyWith(_Tag value, $Res Function(_Tag) _then) = __$TagCopyWithImpl;
@override @useResult
$Res call({
 String slug, String? description, double? score
});




}
/// @nodoc
class __$TagCopyWithImpl<$Res>
    implements _$TagCopyWith<$Res> {
  __$TagCopyWithImpl(this._self, this._then);

  final _Tag _self;
  final $Res Function(_Tag) _then;

/// Create a copy of Tag
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? slug = null,Object? description = freezed,Object? score = freezed,}) {
  return _then(_Tag(
slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}


/// @nodoc
mixin _$ListingSeller {

 String get id; String get name; ResourceModel? get avatar;
/// Create a copy of ListingSeller
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListingSellerCopyWith<ListingSeller> get copyWith => _$ListingSellerCopyWithImpl<ListingSeller>(this as ListingSeller, _$identity);

  /// Serializes this ListingSeller to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListingSeller&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar);

@override
String toString() {
  return 'ListingSeller(id: $id, name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $ListingSellerCopyWith<$Res>  {
  factory $ListingSellerCopyWith(ListingSeller value, $Res Function(ListingSeller) _then) = _$ListingSellerCopyWithImpl;
@useResult
$Res call({
 String id, String name, ResourceModel? avatar
});


$ResourceModelCopyWith<$Res>? get avatar;

}
/// @nodoc
class _$ListingSellerCopyWithImpl<$Res>
    implements $ListingSellerCopyWith<$Res> {
  _$ListingSellerCopyWithImpl(this._self, this._then);

  final ListingSeller _self;
  final $Res Function(ListingSeller) _then;

/// Create a copy of ListingSeller
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as ResourceModel?,
  ));
}
/// Create a copy of ListingSeller
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceModelCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ResourceModelCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}


/// Adds pattern-matching-related methods to [ListingSeller].
extension ListingSellerPatterns on ListingSeller {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ListingSeller value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ListingSeller() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ListingSeller value)  $default,){
final _that = this;
switch (_that) {
case _ListingSeller():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ListingSeller value)?  $default,){
final _that = this;
switch (_that) {
case _ListingSeller() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ResourceModel? avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ListingSeller() when $default != null:
return $default(_that.id,_that.name,_that.avatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ResourceModel? avatar)  $default,) {final _that = this;
switch (_that) {
case _ListingSeller():
return $default(_that.id,_that.name,_that.avatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ResourceModel? avatar)?  $default,) {final _that = this;
switch (_that) {
case _ListingSeller() when $default != null:
return $default(_that.id,_that.name,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ListingSeller implements ListingSeller {
  const _ListingSeller({required this.id, required this.name, this.avatar});
  factory _ListingSeller.fromJson(Map<String, dynamic> json) => _$ListingSellerFromJson(json);

@override final  String id;
@override final  String name;
@override final  ResourceModel? avatar;

/// Create a copy of ListingSeller
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ListingSellerCopyWith<_ListingSeller> get copyWith => __$ListingSellerCopyWithImpl<_ListingSeller>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ListingSellerToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ListingSeller&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar);

@override
String toString() {
  return 'ListingSeller(id: $id, name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$ListingSellerCopyWith<$Res> implements $ListingSellerCopyWith<$Res> {
  factory _$ListingSellerCopyWith(_ListingSeller value, $Res Function(_ListingSeller) _then) = __$ListingSellerCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ResourceModel? avatar
});


@override $ResourceModelCopyWith<$Res>? get avatar;

}
/// @nodoc
class __$ListingSellerCopyWithImpl<$Res>
    implements _$ListingSellerCopyWith<$Res> {
  __$ListingSellerCopyWithImpl(this._self, this._then);

  final _ListingSeller _self;
  final $Res Function(_ListingSeller) _then;

/// Create a copy of ListingSeller
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,}) {
  return _then(_ListingSeller(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as ResourceModel?,
  ));
}

/// Create a copy of ListingSeller
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceModelCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ResourceModelCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}


/// @nodoc
mixin _$TProductCard {

 String get id; String get name; String get slug; int get price;@JsonKey(name: 'price_mode') String? get priceMode; String? get currency;@JsonKey(name: 'category_id') String? get categoryId; String? get condition; ResourceModel? get cover; double get rating;@JsonKey(name: 'review_count') int get reviewCount; int get sold; String? get status; bool get favorited; ListingSeller? get seller;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'deleted_at') String? get deletedAt; double? get score;// Backward-compatibility legacy fields
 String? get thumbnail;@JsonKey(name: 'original_price') int? get originalPrice;@JsonKey(name: 'discount_rate') double? get discountRate; RatingModel? get ratingModel;@JsonKey(name: 'sold_count') int? get soldCount; List<String>? get tags;@JsonKey(name: 'vendor_id') String? get vendorId;@JsonKey(name: 'vendor_name') String? get vendorName;@JsonKey(name: 'is_negotiable') bool get isNegotiable;
/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TProductCardCopyWith<TProductCard> get copyWith => _$TProductCardCopyWithImpl<TProductCard>(this as TProductCard, _$identity);

  /// Serializes this TProductCard to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TProductCard&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.sold, sold) || other.sold == sold)&&(identical(other.status, status) || other.status == status)&&(identical(other.favorited, favorited) || other.favorited == favorited)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.score, score) || other.score == score)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.ratingModel, ratingModel) || other.ratingModel == ratingModel)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,price,priceMode,currency,categoryId,condition,cover,rating,reviewCount,sold,status,favorited,seller,createdAt,deletedAt,score,thumbnail,originalPrice,discountRate,ratingModel,soldCount,const DeepCollectionEquality().hash(tags),vendorId,vendorName,isNegotiable]);

@override
String toString() {
  return 'TProductCard(id: $id, name: $name, slug: $slug, price: $price, priceMode: $priceMode, currency: $currency, categoryId: $categoryId, condition: $condition, cover: $cover, rating: $rating, reviewCount: $reviewCount, sold: $sold, status: $status, favorited: $favorited, seller: $seller, createdAt: $createdAt, deletedAt: $deletedAt, score: $score, thumbnail: $thumbnail, originalPrice: $originalPrice, discountRate: $discountRate, ratingModel: $ratingModel, soldCount: $soldCount, tags: $tags, vendorId: $vendorId, vendorName: $vendorName, isNegotiable: $isNegotiable)';
}


}

/// @nodoc
abstract mixin class $TProductCardCopyWith<$Res>  {
  factory $TProductCardCopyWith(TProductCard value, $Res Function(TProductCard) _then) = _$TProductCardCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, int price,@JsonKey(name: 'price_mode') String? priceMode, String? currency,@JsonKey(name: 'category_id') String? categoryId, String? condition, ResourceModel? cover, double rating,@JsonKey(name: 'review_count') int reviewCount, int sold, String? status, bool favorited, ListingSeller? seller,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deleted_at') String? deletedAt, double? score, String? thumbnail,@JsonKey(name: 'original_price') int? originalPrice,@JsonKey(name: 'discount_rate') double? discountRate, RatingModel? ratingModel,@JsonKey(name: 'sold_count') int? soldCount, List<String>? tags,@JsonKey(name: 'vendor_id') String? vendorId,@JsonKey(name: 'vendor_name') String? vendorName,@JsonKey(name: 'is_negotiable') bool isNegotiable
});


$ResourceModelCopyWith<$Res>? get cover;$ListingSellerCopyWith<$Res>? get seller;$RatingModelCopyWith<$Res>? get ratingModel;

}
/// @nodoc
class _$TProductCardCopyWithImpl<$Res>
    implements $TProductCardCopyWith<$Res> {
  _$TProductCardCopyWithImpl(this._self, this._then);

  final TProductCard _self;
  final $Res Function(TProductCard) _then;

/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? price = null,Object? priceMode = freezed,Object? currency = freezed,Object? categoryId = freezed,Object? condition = freezed,Object? cover = freezed,Object? rating = null,Object? reviewCount = null,Object? sold = null,Object? status = freezed,Object? favorited = null,Object? seller = freezed,Object? createdAt = freezed,Object? deletedAt = freezed,Object? score = freezed,Object? thumbnail = freezed,Object? originalPrice = freezed,Object? discountRate = freezed,Object? ratingModel = freezed,Object? soldCount = freezed,Object? tags = freezed,Object? vendorId = freezed,Object? vendorName = freezed,Object? isNegotiable = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,priceMode: freezed == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as ResourceModel?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,favorited: null == favorited ? _self.favorited : favorited // ignore: cast_nullable_to_non_nullable
as bool,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as ListingSeller?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,discountRate: freezed == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as double?,ratingModel: freezed == ratingModel ? _self.ratingModel : ratingModel // ignore: cast_nullable_to_non_nullable
as RatingModel?,soldCount: freezed == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String?,vendorName: freezed == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String?,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceModelCopyWith<$Res>? get cover {
    if (_self.cover == null) {
    return null;
  }

  return $ResourceModelCopyWith<$Res>(_self.cover!, (value) {
    return _then(_self.copyWith(cover: value));
  });
}/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingSellerCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $ListingSellerCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RatingModelCopyWith<$Res>? get ratingModel {
    if (_self.ratingModel == null) {
    return null;
  }

  return $RatingModelCopyWith<$Res>(_self.ratingModel!, (value) {
    return _then(_self.copyWith(ratingModel: value));
  });
}
}


/// Adds pattern-matching-related methods to [TProductCard].
extension TProductCardPatterns on TProductCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TProductCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TProductCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TProductCard value)  $default,){
final _that = this;
switch (_that) {
case _TProductCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TProductCard value)?  $default,){
final _that = this;
switch (_that) {
case _TProductCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  int price, @JsonKey(name: 'price_mode')  String? priceMode,  String? currency, @JsonKey(name: 'category_id')  String? categoryId,  String? condition,  ResourceModel? cover,  double rating, @JsonKey(name: 'review_count')  int reviewCount,  int sold,  String? status,  bool favorited,  ListingSeller? seller, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt,  double? score,  String? thumbnail, @JsonKey(name: 'original_price')  int? originalPrice, @JsonKey(name: 'discount_rate')  double? discountRate,  RatingModel? ratingModel, @JsonKey(name: 'sold_count')  int? soldCount,  List<String>? tags, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'is_negotiable')  bool isNegotiable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TProductCard() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.price,_that.priceMode,_that.currency,_that.categoryId,_that.condition,_that.cover,_that.rating,_that.reviewCount,_that.sold,_that.status,_that.favorited,_that.seller,_that.createdAt,_that.deletedAt,_that.score,_that.thumbnail,_that.originalPrice,_that.discountRate,_that.ratingModel,_that.soldCount,_that.tags,_that.vendorId,_that.vendorName,_that.isNegotiable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  int price, @JsonKey(name: 'price_mode')  String? priceMode,  String? currency, @JsonKey(name: 'category_id')  String? categoryId,  String? condition,  ResourceModel? cover,  double rating, @JsonKey(name: 'review_count')  int reviewCount,  int sold,  String? status,  bool favorited,  ListingSeller? seller, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt,  double? score,  String? thumbnail, @JsonKey(name: 'original_price')  int? originalPrice, @JsonKey(name: 'discount_rate')  double? discountRate,  RatingModel? ratingModel, @JsonKey(name: 'sold_count')  int? soldCount,  List<String>? tags, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'is_negotiable')  bool isNegotiable)  $default,) {final _that = this;
switch (_that) {
case _TProductCard():
return $default(_that.id,_that.name,_that.slug,_that.price,_that.priceMode,_that.currency,_that.categoryId,_that.condition,_that.cover,_that.rating,_that.reviewCount,_that.sold,_that.status,_that.favorited,_that.seller,_that.createdAt,_that.deletedAt,_that.score,_that.thumbnail,_that.originalPrice,_that.discountRate,_that.ratingModel,_that.soldCount,_that.tags,_that.vendorId,_that.vendorName,_that.isNegotiable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  int price, @JsonKey(name: 'price_mode')  String? priceMode,  String? currency, @JsonKey(name: 'category_id')  String? categoryId,  String? condition,  ResourceModel? cover,  double rating, @JsonKey(name: 'review_count')  int reviewCount,  int sold,  String? status,  bool favorited,  ListingSeller? seller, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt,  double? score,  String? thumbnail, @JsonKey(name: 'original_price')  int? originalPrice, @JsonKey(name: 'discount_rate')  double? discountRate,  RatingModel? ratingModel, @JsonKey(name: 'sold_count')  int? soldCount,  List<String>? tags, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'is_negotiable')  bool isNegotiable)?  $default,) {final _that = this;
switch (_that) {
case _TProductCard() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.price,_that.priceMode,_that.currency,_that.categoryId,_that.condition,_that.cover,_that.rating,_that.reviewCount,_that.sold,_that.status,_that.favorited,_that.seller,_that.createdAt,_that.deletedAt,_that.score,_that.thumbnail,_that.originalPrice,_that.discountRate,_that.ratingModel,_that.soldCount,_that.tags,_that.vendorId,_that.vendorName,_that.isNegotiable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TProductCard extends TProductCard {
  const _TProductCard({required this.id, required this.name, this.slug = '', this.price = 0, @JsonKey(name: 'price_mode') this.priceMode, this.currency, @JsonKey(name: 'category_id') this.categoryId, this.condition, this.cover, this.rating = 0.0, @JsonKey(name: 'review_count') this.reviewCount = 0, this.sold = 0, this.status, this.favorited = false, this.seller, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'deleted_at') this.deletedAt, this.score, this.thumbnail, @JsonKey(name: 'original_price') this.originalPrice, @JsonKey(name: 'discount_rate') this.discountRate, this.ratingModel, @JsonKey(name: 'sold_count') this.soldCount, final  List<String>? tags, @JsonKey(name: 'vendor_id') this.vendorId, @JsonKey(name: 'vendor_name') this.vendorName, @JsonKey(name: 'is_negotiable') this.isNegotiable = false}): _tags = tags,super._();
  factory _TProductCard.fromJson(Map<String, dynamic> json) => _$TProductCardFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String slug;
@override@JsonKey() final  int price;
@override@JsonKey(name: 'price_mode') final  String? priceMode;
@override final  String? currency;
@override@JsonKey(name: 'category_id') final  String? categoryId;
@override final  String? condition;
@override final  ResourceModel? cover;
@override@JsonKey() final  double rating;
@override@JsonKey(name: 'review_count') final  int reviewCount;
@override@JsonKey() final  int sold;
@override final  String? status;
@override@JsonKey() final  bool favorited;
@override final  ListingSeller? seller;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override final  double? score;
// Backward-compatibility legacy fields
@override final  String? thumbnail;
@override@JsonKey(name: 'original_price') final  int? originalPrice;
@override@JsonKey(name: 'discount_rate') final  double? discountRate;
@override final  RatingModel? ratingModel;
@override@JsonKey(name: 'sold_count') final  int? soldCount;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'vendor_id') final  String? vendorId;
@override@JsonKey(name: 'vendor_name') final  String? vendorName;
@override@JsonKey(name: 'is_negotiable') final  bool isNegotiable;

/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TProductCardCopyWith<_TProductCard> get copyWith => __$TProductCardCopyWithImpl<_TProductCard>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TProductCardToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TProductCard&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.cover, cover) || other.cover == cover)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.sold, sold) || other.sold == sold)&&(identical(other.status, status) || other.status == status)&&(identical(other.favorited, favorited) || other.favorited == favorited)&&(identical(other.seller, seller) || other.seller == seller)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.score, score) || other.score == score)&&(identical(other.thumbnail, thumbnail) || other.thumbnail == thumbnail)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.discountRate, discountRate) || other.discountRate == discountRate)&&(identical(other.ratingModel, ratingModel) || other.ratingModel == ratingModel)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,price,priceMode,currency,categoryId,condition,cover,rating,reviewCount,sold,status,favorited,seller,createdAt,deletedAt,score,thumbnail,originalPrice,discountRate,ratingModel,soldCount,const DeepCollectionEquality().hash(_tags),vendorId,vendorName,isNegotiable]);

@override
String toString() {
  return 'TProductCard(id: $id, name: $name, slug: $slug, price: $price, priceMode: $priceMode, currency: $currency, categoryId: $categoryId, condition: $condition, cover: $cover, rating: $rating, reviewCount: $reviewCount, sold: $sold, status: $status, favorited: $favorited, seller: $seller, createdAt: $createdAt, deletedAt: $deletedAt, score: $score, thumbnail: $thumbnail, originalPrice: $originalPrice, discountRate: $discountRate, ratingModel: $ratingModel, soldCount: $soldCount, tags: $tags, vendorId: $vendorId, vendorName: $vendorName, isNegotiable: $isNegotiable)';
}


}

/// @nodoc
abstract mixin class _$TProductCardCopyWith<$Res> implements $TProductCardCopyWith<$Res> {
  factory _$TProductCardCopyWith(_TProductCard value, $Res Function(_TProductCard) _then) = __$TProductCardCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, int price,@JsonKey(name: 'price_mode') String? priceMode, String? currency,@JsonKey(name: 'category_id') String? categoryId, String? condition, ResourceModel? cover, double rating,@JsonKey(name: 'review_count') int reviewCount, int sold, String? status, bool favorited, ListingSeller? seller,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deleted_at') String? deletedAt, double? score, String? thumbnail,@JsonKey(name: 'original_price') int? originalPrice,@JsonKey(name: 'discount_rate') double? discountRate, RatingModel? ratingModel,@JsonKey(name: 'sold_count') int? soldCount, List<String>? tags,@JsonKey(name: 'vendor_id') String? vendorId,@JsonKey(name: 'vendor_name') String? vendorName,@JsonKey(name: 'is_negotiable') bool isNegotiable
});


@override $ResourceModelCopyWith<$Res>? get cover;@override $ListingSellerCopyWith<$Res>? get seller;@override $RatingModelCopyWith<$Res>? get ratingModel;

}
/// @nodoc
class __$TProductCardCopyWithImpl<$Res>
    implements _$TProductCardCopyWith<$Res> {
  __$TProductCardCopyWithImpl(this._self, this._then);

  final _TProductCard _self;
  final $Res Function(_TProductCard) _then;

/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? price = null,Object? priceMode = freezed,Object? currency = freezed,Object? categoryId = freezed,Object? condition = freezed,Object? cover = freezed,Object? rating = null,Object? reviewCount = null,Object? sold = null,Object? status = freezed,Object? favorited = null,Object? seller = freezed,Object? createdAt = freezed,Object? deletedAt = freezed,Object? score = freezed,Object? thumbnail = freezed,Object? originalPrice = freezed,Object? discountRate = freezed,Object? ratingModel = freezed,Object? soldCount = freezed,Object? tags = freezed,Object? vendorId = freezed,Object? vendorName = freezed,Object? isNegotiable = null,}) {
  return _then(_TProductCard(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,priceMode: freezed == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,cover: freezed == cover ? _self.cover : cover // ignore: cast_nullable_to_non_nullable
as ResourceModel?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,favorited: null == favorited ? _self.favorited : favorited // ignore: cast_nullable_to_non_nullable
as bool,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as ListingSeller?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,thumbnail: freezed == thumbnail ? _self.thumbnail : thumbnail // ignore: cast_nullable_to_non_nullable
as String?,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,discountRate: freezed == discountRate ? _self.discountRate : discountRate // ignore: cast_nullable_to_non_nullable
as double?,ratingModel: freezed == ratingModel ? _self.ratingModel : ratingModel // ignore: cast_nullable_to_non_nullable
as RatingModel?,soldCount: freezed == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String?,vendorName: freezed == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String?,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceModelCopyWith<$Res>? get cover {
    if (_self.cover == null) {
    return null;
  }

  return $ResourceModelCopyWith<$Res>(_self.cover!, (value) {
    return _then(_self.copyWith(cover: value));
  });
}/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingSellerCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $ListingSellerCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}/// Create a copy of TProductCard
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RatingModelCopyWith<$Res>? get ratingModel {
    if (_self.ratingModel == null) {
    return null;
  }

  return $RatingModelCopyWith<$Res>(_self.ratingModel!, (value) {
    return _then(_self.copyWith(ratingModel: value));
  });
}
}


/// @nodoc
mixin _$ProductSpecification {

@JsonKey(name: 'name') String get key; String get value;
/// Create a copy of ProductSpecification
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSpecificationCopyWith<ProductSpecification> get copyWith => _$ProductSpecificationCopyWithImpl<ProductSpecification>(this as ProductSpecification, _$identity);

  /// Serializes this ProductSpecification to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSpecification&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'ProductSpecification(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $ProductSpecificationCopyWith<$Res>  {
  factory $ProductSpecificationCopyWith(ProductSpecification value, $Res Function(ProductSpecification) _then) = _$ProductSpecificationCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String key, String value
});




}
/// @nodoc
class _$ProductSpecificationCopyWithImpl<$Res>
    implements $ProductSpecificationCopyWith<$Res> {
  _$ProductSpecificationCopyWithImpl(this._self, this._then);

  final ProductSpecification _self;
  final $Res Function(ProductSpecification) _then;

/// Create a copy of ProductSpecification
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? value = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ProductSpecification].
extension ProductSpecificationPatterns on ProductSpecification {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSpecification value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSpecification() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSpecification value)  $default,){
final _that = this;
switch (_that) {
case _ProductSpecification():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSpecification value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSpecification() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String key,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSpecification() when $default != null:
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String key,  String value)  $default,) {final _that = this;
switch (_that) {
case _ProductSpecification():
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'name')  String key,  String value)?  $default,) {final _that = this;
switch (_that) {
case _ProductSpecification() when $default != null:
return $default(_that.key,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSpecification implements ProductSpecification {
  const _ProductSpecification({@JsonKey(name: 'name') required this.key, required this.value});
  factory _ProductSpecification.fromJson(Map<String, dynamic> json) => _$ProductSpecificationFromJson(json);

@override@JsonKey(name: 'name') final  String key;
@override final  String value;

/// Create a copy of ProductSpecification
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSpecificationCopyWith<_ProductSpecification> get copyWith => __$ProductSpecificationCopyWithImpl<_ProductSpecification>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSpecificationToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSpecification&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'ProductSpecification(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$ProductSpecificationCopyWith<$Res> implements $ProductSpecificationCopyWith<$Res> {
  factory _$ProductSpecificationCopyWith(_ProductSpecification value, $Res Function(_ProductSpecification) _then) = __$ProductSpecificationCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String key, String value
});




}
/// @nodoc
class __$ProductSpecificationCopyWithImpl<$Res>
    implements _$ProductSpecificationCopyWith<$Res> {
  __$ProductSpecificationCopyWithImpl(this._self, this._then);

  final _ProductSpecification _self;
  final $Res Function(_ProductSpecification) _then;

/// Create a copy of ProductSpecification
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = null,}) {
  return _then(_ProductSpecification(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SkuAttribute {

@JsonKey(name: 'name') String get key; String get value;
/// Create a copy of SkuAttribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SkuAttributeCopyWith<SkuAttribute> get copyWith => _$SkuAttributeCopyWithImpl<SkuAttribute>(this as SkuAttribute, _$identity);

  /// Serializes this SkuAttribute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkuAttribute&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'SkuAttribute(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class $SkuAttributeCopyWith<$Res>  {
  factory $SkuAttributeCopyWith(SkuAttribute value, $Res Function(SkuAttribute) _then) = _$SkuAttributeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String key, String value
});




}
/// @nodoc
class _$SkuAttributeCopyWithImpl<$Res>
    implements $SkuAttributeCopyWith<$Res> {
  _$SkuAttributeCopyWithImpl(this._self, this._then);

  final SkuAttribute _self;
  final $Res Function(SkuAttribute) _then;

/// Create a copy of SkuAttribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? value = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SkuAttribute].
extension SkuAttributePatterns on SkuAttribute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SkuAttribute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SkuAttribute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SkuAttribute value)  $default,){
final _that = this;
switch (_that) {
case _SkuAttribute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SkuAttribute value)?  $default,){
final _that = this;
switch (_that) {
case _SkuAttribute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String key,  String value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SkuAttribute() when $default != null:
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String key,  String value)  $default,) {final _that = this;
switch (_that) {
case _SkuAttribute():
return $default(_that.key,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'name')  String key,  String value)?  $default,) {final _that = this;
switch (_that) {
case _SkuAttribute() when $default != null:
return $default(_that.key,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SkuAttribute implements SkuAttribute {
  const _SkuAttribute({@JsonKey(name: 'name') required this.key, required this.value});
  factory _SkuAttribute.fromJson(Map<String, dynamic> json) => _$SkuAttributeFromJson(json);

@override@JsonKey(name: 'name') final  String key;
@override final  String value;

/// Create a copy of SkuAttribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SkuAttributeCopyWith<_SkuAttribute> get copyWith => __$SkuAttributeCopyWithImpl<_SkuAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SkuAttributeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SkuAttribute&&(identical(other.key, key) || other.key == key)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,value);

@override
String toString() {
  return 'SkuAttribute(key: $key, value: $value)';
}


}

/// @nodoc
abstract mixin class _$SkuAttributeCopyWith<$Res> implements $SkuAttributeCopyWith<$Res> {
  factory _$SkuAttributeCopyWith(_SkuAttribute value, $Res Function(_SkuAttribute) _then) = __$SkuAttributeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String key, String value
});




}
/// @nodoc
class __$SkuAttributeCopyWithImpl<$Res>
    implements _$SkuAttributeCopyWith<$Res> {
  __$SkuAttributeCopyWithImpl(this._self, this._then);

  final _SkuAttribute _self;
  final $Res Function(_SkuAttribute) _then;

/// Create a copy of SkuAttribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? value = null,}) {
  return _then(_SkuAttribute(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$VariantStock {

 int get available; int get quantity; int get reserved; int get sold;
/// Create a copy of VariantStock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VariantStockCopyWith<VariantStock> get copyWith => _$VariantStockCopyWithImpl<VariantStock>(this as VariantStock, _$identity);

  /// Serializes this VariantStock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VariantStock&&(identical(other.available, available) || other.available == available)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.reserved, reserved) || other.reserved == reserved)&&(identical(other.sold, sold) || other.sold == sold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,available,quantity,reserved,sold);

@override
String toString() {
  return 'VariantStock(available: $available, quantity: $quantity, reserved: $reserved, sold: $sold)';
}


}

/// @nodoc
abstract mixin class $VariantStockCopyWith<$Res>  {
  factory $VariantStockCopyWith(VariantStock value, $Res Function(VariantStock) _then) = _$VariantStockCopyWithImpl;
@useResult
$Res call({
 int available, int quantity, int reserved, int sold
});




}
/// @nodoc
class _$VariantStockCopyWithImpl<$Res>
    implements $VariantStockCopyWith<$Res> {
  _$VariantStockCopyWithImpl(this._self, this._then);

  final VariantStock _self;
  final $Res Function(VariantStock) _then;

/// Create a copy of VariantStock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? available = null,Object? quantity = null,Object? reserved = null,Object? sold = null,}) {
  return _then(_self.copyWith(
available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as int,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VariantStock].
extension VariantStockPatterns on VariantStock {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VariantStock value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VariantStock() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VariantStock value)  $default,){
final _that = this;
switch (_that) {
case _VariantStock():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VariantStock value)?  $default,){
final _that = this;
switch (_that) {
case _VariantStock() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int available,  int quantity,  int reserved,  int sold)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VariantStock() when $default != null:
return $default(_that.available,_that.quantity,_that.reserved,_that.sold);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int available,  int quantity,  int reserved,  int sold)  $default,) {final _that = this;
switch (_that) {
case _VariantStock():
return $default(_that.available,_that.quantity,_that.reserved,_that.sold);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int available,  int quantity,  int reserved,  int sold)?  $default,) {final _that = this;
switch (_that) {
case _VariantStock() when $default != null:
return $default(_that.available,_that.quantity,_that.reserved,_that.sold);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VariantStock implements VariantStock {
  const _VariantStock({this.available = 0, this.quantity = 0, this.reserved = 0, this.sold = 0});
  factory _VariantStock.fromJson(Map<String, dynamic> json) => _$VariantStockFromJson(json);

@override@JsonKey() final  int available;
@override@JsonKey() final  int quantity;
@override@JsonKey() final  int reserved;
@override@JsonKey() final  int sold;

/// Create a copy of VariantStock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VariantStockCopyWith<_VariantStock> get copyWith => __$VariantStockCopyWithImpl<_VariantStock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VariantStockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VariantStock&&(identical(other.available, available) || other.available == available)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.reserved, reserved) || other.reserved == reserved)&&(identical(other.sold, sold) || other.sold == sold));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,available,quantity,reserved,sold);

@override
String toString() {
  return 'VariantStock(available: $available, quantity: $quantity, reserved: $reserved, sold: $sold)';
}


}

/// @nodoc
abstract mixin class _$VariantStockCopyWith<$Res> implements $VariantStockCopyWith<$Res> {
  factory _$VariantStockCopyWith(_VariantStock value, $Res Function(_VariantStock) _then) = __$VariantStockCopyWithImpl;
@override @useResult
$Res call({
 int available, int quantity, int reserved, int sold
});




}
/// @nodoc
class __$VariantStockCopyWithImpl<$Res>
    implements _$VariantStockCopyWith<$Res> {
  __$VariantStockCopyWithImpl(this._self, this._then);

  final _VariantStock _self;
  final $Res Function(_VariantStock) _then;

/// Create a copy of VariantStock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? available = null,Object? quantity = null,Object? reserved = null,Object? sold = null,}) {
  return _then(_VariantStock(
available: null == available ? _self.available : available // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,reserved: null == reserved ? _self.reserved : reserved // ignore: cast_nullable_to_non_nullable
as int,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$ProductSku {

 String get id;@JsonKey(name: 'spu_id') String get spuId;@JsonKey(name: 'name') String get name; int get price;@JsonKey(name: 'original_price') int? get originalPrice; int get stock; VariantStock? get stockInfo;@JsonKey(name: 'is_featured') bool get isFeatured;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'resources') List<ResourceModel>? get images; List<SkuAttribute>? get attributes;
/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductSkuCopyWith<ProductSku> get copyWith => _$ProductSkuCopyWithImpl<ProductSku>(this as ProductSku, _$identity);

  /// Serializes this ProductSku to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductSku&&(identical(other.id, id) || other.id == id)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.stockInfo, stockInfo) || other.stockInfo == stockInfo)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,spuId,name,price,originalPrice,stock,stockInfo,isFeatured,createdAt,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(attributes));

@override
String toString() {
  return 'ProductSku(id: $id, spuId: $spuId, name: $name, price: $price, originalPrice: $originalPrice, stock: $stock, stockInfo: $stockInfo, isFeatured: $isFeatured, createdAt: $createdAt, images: $images, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $ProductSkuCopyWith<$Res>  {
  factory $ProductSkuCopyWith(ProductSku value, $Res Function(ProductSku) _then) = _$ProductSkuCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'spu_id') String spuId,@JsonKey(name: 'name') String name, int price,@JsonKey(name: 'original_price') int? originalPrice, int stock, VariantStock? stockInfo,@JsonKey(name: 'is_featured') bool isFeatured,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'resources') List<ResourceModel>? images, List<SkuAttribute>? attributes
});


$VariantStockCopyWith<$Res>? get stockInfo;

}
/// @nodoc
class _$ProductSkuCopyWithImpl<$Res>
    implements $ProductSkuCopyWith<$Res> {
  _$ProductSkuCopyWithImpl(this._self, this._then);

  final ProductSku _self;
  final $Res Function(ProductSku) _then;

/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? spuId = null,Object? name = null,Object? price = null,Object? originalPrice = freezed,Object? stock = null,Object? stockInfo = freezed,Object? isFeatured = null,Object? createdAt = freezed,Object? images = freezed,Object? attributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,stockInfo: freezed == stockInfo ? _self.stockInfo : stockInfo // ignore: cast_nullable_to_non_nullable
as VariantStock?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>?,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,
  ));
}
/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VariantStockCopyWith<$Res>? get stockInfo {
    if (_self.stockInfo == null) {
    return null;
  }

  return $VariantStockCopyWith<$Res>(_self.stockInfo!, (value) {
    return _then(_self.copyWith(stockInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductSku].
extension ProductSkuPatterns on ProductSku {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductSku value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductSku() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductSku value)  $default,){
final _that = this;
switch (_that) {
case _ProductSku():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductSku value)?  $default,){
final _that = this;
switch (_that) {
case _ProductSku() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'name')  String name,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  int stock,  VariantStock? stockInfo, @JsonKey(name: 'is_featured')  bool isFeatured, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'resources')  List<ResourceModel>? images,  List<SkuAttribute>? attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductSku() when $default != null:
return $default(_that.id,_that.spuId,_that.name,_that.price,_that.originalPrice,_that.stock,_that.stockInfo,_that.isFeatured,_that.createdAt,_that.images,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'name')  String name,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  int stock,  VariantStock? stockInfo, @JsonKey(name: 'is_featured')  bool isFeatured, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'resources')  List<ResourceModel>? images,  List<SkuAttribute>? attributes)  $default,) {final _that = this;
switch (_that) {
case _ProductSku():
return $default(_that.id,_that.spuId,_that.name,_that.price,_that.originalPrice,_that.stock,_that.stockInfo,_that.isFeatured,_that.createdAt,_that.images,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'spu_id')  String spuId, @JsonKey(name: 'name')  String name,  int price, @JsonKey(name: 'original_price')  int? originalPrice,  int stock,  VariantStock? stockInfo, @JsonKey(name: 'is_featured')  bool isFeatured, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'resources')  List<ResourceModel>? images,  List<SkuAttribute>? attributes)?  $default,) {final _that = this;
switch (_that) {
case _ProductSku() when $default != null:
return $default(_that.id,_that.spuId,_that.name,_that.price,_that.originalPrice,_that.stock,_that.stockInfo,_that.isFeatured,_that.createdAt,_that.images,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductSku extends ProductSku {
  const _ProductSku({required this.id, @JsonKey(name: 'spu_id') this.spuId = '', @JsonKey(name: 'name') this.name = '', this.price = 0, @JsonKey(name: 'original_price') this.originalPrice, this.stock = 0, this.stockInfo, @JsonKey(name: 'is_featured') this.isFeatured = false, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'resources') final  List<ResourceModel>? images, final  List<SkuAttribute>? attributes}): _images = images,_attributes = attributes,super._();
  factory _ProductSku.fromJson(Map<String, dynamic> json) => _$ProductSkuFromJson(json);

@override final  String id;
@override@JsonKey(name: 'spu_id') final  String spuId;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey() final  int price;
@override@JsonKey(name: 'original_price') final  int? originalPrice;
@override@JsonKey() final  int stock;
@override final  VariantStock? stockInfo;
@override@JsonKey(name: 'is_featured') final  bool isFeatured;
@override@JsonKey(name: 'created_at') final  String? createdAt;
 final  List<ResourceModel>? _images;
@override@JsonKey(name: 'resources') List<ResourceModel>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SkuAttribute>? _attributes;
@override List<SkuAttribute>? get attributes {
  final value = _attributes;
  if (value == null) return null;
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductSkuCopyWith<_ProductSku> get copyWith => __$ProductSkuCopyWithImpl<_ProductSku>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductSkuToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductSku&&(identical(other.id, id) || other.id == id)&&(identical(other.spuId, spuId) || other.spuId == spuId)&&(identical(other.name, name) || other.name == name)&&(identical(other.price, price) || other.price == price)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.stock, stock) || other.stock == stock)&&(identical(other.stockInfo, stockInfo) || other.stockInfo == stockInfo)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,spuId,name,price,originalPrice,stock,stockInfo,isFeatured,createdAt,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_attributes));

@override
String toString() {
  return 'ProductSku(id: $id, spuId: $spuId, name: $name, price: $price, originalPrice: $originalPrice, stock: $stock, stockInfo: $stockInfo, isFeatured: $isFeatured, createdAt: $createdAt, images: $images, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$ProductSkuCopyWith<$Res> implements $ProductSkuCopyWith<$Res> {
  factory _$ProductSkuCopyWith(_ProductSku value, $Res Function(_ProductSku) _then) = __$ProductSkuCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'spu_id') String spuId,@JsonKey(name: 'name') String name, int price,@JsonKey(name: 'original_price') int? originalPrice, int stock, VariantStock? stockInfo,@JsonKey(name: 'is_featured') bool isFeatured,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'resources') List<ResourceModel>? images, List<SkuAttribute>? attributes
});


@override $VariantStockCopyWith<$Res>? get stockInfo;

}
/// @nodoc
class __$ProductSkuCopyWithImpl<$Res>
    implements _$ProductSkuCopyWith<$Res> {
  __$ProductSkuCopyWithImpl(this._self, this._then);

  final _ProductSku _self;
  final $Res Function(_ProductSku) _then;

/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? spuId = null,Object? name = null,Object? price = null,Object? originalPrice = freezed,Object? stock = null,Object? stockInfo = freezed,Object? isFeatured = null,Object? createdAt = freezed,Object? images = freezed,Object? attributes = freezed,}) {
  return _then(_ProductSku(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,spuId: null == spuId ? _self.spuId : spuId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,stock: null == stock ? _self.stock : stock // ignore: cast_nullable_to_non_nullable
as int,stockInfo: freezed == stockInfo ? _self.stockInfo : stockInfo // ignore: cast_nullable_to_non_nullable
as VariantStock?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>?,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,
  ));
}

/// Create a copy of ProductSku
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VariantStockCopyWith<$Res>? get stockInfo {
    if (_self.stockInfo == null) {
    return null;
  }

  return $VariantStockCopyWith<$Res>(_self.stockInfo!, (value) {
    return _then(_self.copyWith(stockInfo: value));
  });
}
}


/// @nodoc
mixin _$TProductDetail {

 String get id; String get name; String get slug; String? get description; int get price;@JsonKey(name: 'price_mode') String? get priceMode; String? get currency; String? get condition; String? get status;@JsonKey(name: 'original_price') int? get originalPrice; double get rating;@JsonKey(name: 'review_count') int get reviewCount;@JsonKey(name: 'favorite_count') int get favoriteCount; bool get favorited; int get sold;@JsonKey(name: 'sold_count') int? get soldCount; Category? get category; ListingSeller? get seller;@JsonKey(name: 'resources') List<ResourceModel>? get images; List<ProductSpecification>? get specifications; List<ProductSku>? get skus; List<ProductSku>? get variants; List<String>? get tags;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'deleted_at') String? get deletedAt;@JsonKey(name: 'vendor_id') String? get vendorId;@JsonKey(name: 'vendor_name') String? get vendorName;@JsonKey(name: 'vendor_avatar') String? get vendorAvatar;@JsonKey(name: 'category_id') String? get categoryId;@JsonKey(name: 'is_negotiable') bool get isNegotiable;@JsonKey(name: 'min_negotiable_price') int? get minNegotiablePrice;@JsonKey(name: 'max_negotiable_price') int? get maxNegotiablePrice;
/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TProductDetailCopyWith<TProductDetail> get copyWith => _$TProductDetailCopyWithImpl<TProductDetail>(this as TProductDetail, _$identity);

  /// Serializes this TProductDetail to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TProductDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.status, status) || other.status == status)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.favoriteCount, favoriteCount) || other.favoriteCount == favoriteCount)&&(identical(other.favorited, favorited) || other.favorited == favorited)&&(identical(other.sold, sold) || other.sold == sold)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&(identical(other.category, category) || other.category == category)&&(identical(other.seller, seller) || other.seller == seller)&&const DeepCollectionEquality().equals(other.images, images)&&const DeepCollectionEquality().equals(other.specifications, specifications)&&const DeepCollectionEquality().equals(other.skus, skus)&&const DeepCollectionEquality().equals(other.variants, variants)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.vendorAvatar, vendorAvatar) || other.vendorAvatar == vendorAvatar)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable)&&(identical(other.minNegotiablePrice, minNegotiablePrice) || other.minNegotiablePrice == minNegotiablePrice)&&(identical(other.maxNegotiablePrice, maxNegotiablePrice) || other.maxNegotiablePrice == maxNegotiablePrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,description,price,priceMode,currency,condition,status,originalPrice,rating,reviewCount,favoriteCount,favorited,sold,soldCount,category,seller,const DeepCollectionEquality().hash(images),const DeepCollectionEquality().hash(specifications),const DeepCollectionEquality().hash(skus),const DeepCollectionEquality().hash(variants),const DeepCollectionEquality().hash(tags),createdAt,deletedAt,vendorId,vendorName,vendorAvatar,categoryId,isNegotiable,minNegotiablePrice,maxNegotiablePrice]);

@override
String toString() {
  return 'TProductDetail(id: $id, name: $name, slug: $slug, description: $description, price: $price, priceMode: $priceMode, currency: $currency, condition: $condition, status: $status, originalPrice: $originalPrice, rating: $rating, reviewCount: $reviewCount, favoriteCount: $favoriteCount, favorited: $favorited, sold: $sold, soldCount: $soldCount, category: $category, seller: $seller, images: $images, specifications: $specifications, skus: $skus, variants: $variants, tags: $tags, createdAt: $createdAt, deletedAt: $deletedAt, vendorId: $vendorId, vendorName: $vendorName, vendorAvatar: $vendorAvatar, categoryId: $categoryId, isNegotiable: $isNegotiable, minNegotiablePrice: $minNegotiablePrice, maxNegotiablePrice: $maxNegotiablePrice)';
}


}

/// @nodoc
abstract mixin class $TProductDetailCopyWith<$Res>  {
  factory $TProductDetailCopyWith(TProductDetail value, $Res Function(TProductDetail) _then) = _$TProductDetailCopyWithImpl;
@useResult
$Res call({
 String id, String name, String slug, String? description, int price,@JsonKey(name: 'price_mode') String? priceMode, String? currency, String? condition, String? status,@JsonKey(name: 'original_price') int? originalPrice, double rating,@JsonKey(name: 'review_count') int reviewCount,@JsonKey(name: 'favorite_count') int favoriteCount, bool favorited, int sold,@JsonKey(name: 'sold_count') int? soldCount, Category? category, ListingSeller? seller,@JsonKey(name: 'resources') List<ResourceModel>? images, List<ProductSpecification>? specifications, List<ProductSku>? skus, List<ProductSku>? variants, List<String>? tags,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'vendor_id') String? vendorId,@JsonKey(name: 'vendor_name') String? vendorName,@JsonKey(name: 'vendor_avatar') String? vendorAvatar,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'is_negotiable') bool isNegotiable,@JsonKey(name: 'min_negotiable_price') int? minNegotiablePrice,@JsonKey(name: 'max_negotiable_price') int? maxNegotiablePrice
});


$CategoryCopyWith<$Res>? get category;$ListingSellerCopyWith<$Res>? get seller;

}
/// @nodoc
class _$TProductDetailCopyWithImpl<$Res>
    implements $TProductDetailCopyWith<$Res> {
  _$TProductDetailCopyWithImpl(this._self, this._then);

  final TProductDetail _self;
  final $Res Function(TProductDetail) _then;

/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? price = null,Object? priceMode = freezed,Object? currency = freezed,Object? condition = freezed,Object? status = freezed,Object? originalPrice = freezed,Object? rating = null,Object? reviewCount = null,Object? favoriteCount = null,Object? favorited = null,Object? sold = null,Object? soldCount = freezed,Object? category = freezed,Object? seller = freezed,Object? images = freezed,Object? specifications = freezed,Object? skus = freezed,Object? variants = freezed,Object? tags = freezed,Object? createdAt = freezed,Object? deletedAt = freezed,Object? vendorId = freezed,Object? vendorName = freezed,Object? vendorAvatar = freezed,Object? categoryId = freezed,Object? isNegotiable = null,Object? minNegotiablePrice = freezed,Object? maxNegotiablePrice = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,priceMode: freezed == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,favoriteCount: null == favoriteCount ? _self.favoriteCount : favoriteCount // ignore: cast_nullable_to_non_nullable
as int,favorited: null == favorited ? _self.favorited : favorited // ignore: cast_nullable_to_non_nullable
as bool,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,soldCount: freezed == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as ListingSeller?,images: freezed == images ? _self.images : images // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>?,specifications: freezed == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as List<ProductSpecification>?,skus: freezed == skus ? _self.skus : skus // ignore: cast_nullable_to_non_nullable
as List<ProductSku>?,variants: freezed == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<ProductSku>?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String?,vendorName: freezed == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String?,vendorAvatar: freezed == vendorAvatar ? _self.vendorAvatar : vendorAvatar // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,minNegotiablePrice: freezed == minNegotiablePrice ? _self.minNegotiablePrice : minNegotiablePrice // ignore: cast_nullable_to_non_nullable
as int?,maxNegotiablePrice: freezed == maxNegotiablePrice ? _self.maxNegotiablePrice : maxNegotiablePrice // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingSellerCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $ListingSellerCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}


/// Adds pattern-matching-related methods to [TProductDetail].
extension TProductDetailPatterns on TProductDetail {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TProductDetail value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TProductDetail() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TProductDetail value)  $default,){
final _that = this;
switch (_that) {
case _TProductDetail():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TProductDetail value)?  $default,){
final _that = this;
switch (_that) {
case _TProductDetail() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  int price, @JsonKey(name: 'price_mode')  String? priceMode,  String? currency,  String? condition,  String? status, @JsonKey(name: 'original_price')  int? originalPrice,  double rating, @JsonKey(name: 'review_count')  int reviewCount, @JsonKey(name: 'favorite_count')  int favoriteCount,  bool favorited,  int sold, @JsonKey(name: 'sold_count')  int? soldCount,  Category? category,  ListingSeller? seller, @JsonKey(name: 'resources')  List<ResourceModel>? images,  List<ProductSpecification>? specifications,  List<ProductSku>? skus,  List<ProductSku>? variants,  List<String>? tags, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'vendor_avatar')  String? vendorAvatar, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'is_negotiable')  bool isNegotiable, @JsonKey(name: 'min_negotiable_price')  int? minNegotiablePrice, @JsonKey(name: 'max_negotiable_price')  int? maxNegotiablePrice)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TProductDetail() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.price,_that.priceMode,_that.currency,_that.condition,_that.status,_that.originalPrice,_that.rating,_that.reviewCount,_that.favoriteCount,_that.favorited,_that.sold,_that.soldCount,_that.category,_that.seller,_that.images,_that.specifications,_that.skus,_that.variants,_that.tags,_that.createdAt,_that.deletedAt,_that.vendorId,_that.vendorName,_that.vendorAvatar,_that.categoryId,_that.isNegotiable,_that.minNegotiablePrice,_that.maxNegotiablePrice);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String slug,  String? description,  int price, @JsonKey(name: 'price_mode')  String? priceMode,  String? currency,  String? condition,  String? status, @JsonKey(name: 'original_price')  int? originalPrice,  double rating, @JsonKey(name: 'review_count')  int reviewCount, @JsonKey(name: 'favorite_count')  int favoriteCount,  bool favorited,  int sold, @JsonKey(name: 'sold_count')  int? soldCount,  Category? category,  ListingSeller? seller, @JsonKey(name: 'resources')  List<ResourceModel>? images,  List<ProductSpecification>? specifications,  List<ProductSku>? skus,  List<ProductSku>? variants,  List<String>? tags, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'vendor_avatar')  String? vendorAvatar, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'is_negotiable')  bool isNegotiable, @JsonKey(name: 'min_negotiable_price')  int? minNegotiablePrice, @JsonKey(name: 'max_negotiable_price')  int? maxNegotiablePrice)  $default,) {final _that = this;
switch (_that) {
case _TProductDetail():
return $default(_that.id,_that.name,_that.slug,_that.description,_that.price,_that.priceMode,_that.currency,_that.condition,_that.status,_that.originalPrice,_that.rating,_that.reviewCount,_that.favoriteCount,_that.favorited,_that.sold,_that.soldCount,_that.category,_that.seller,_that.images,_that.specifications,_that.skus,_that.variants,_that.tags,_that.createdAt,_that.deletedAt,_that.vendorId,_that.vendorName,_that.vendorAvatar,_that.categoryId,_that.isNegotiable,_that.minNegotiablePrice,_that.maxNegotiablePrice);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String slug,  String? description,  int price, @JsonKey(name: 'price_mode')  String? priceMode,  String? currency,  String? condition,  String? status, @JsonKey(name: 'original_price')  int? originalPrice,  double rating, @JsonKey(name: 'review_count')  int reviewCount, @JsonKey(name: 'favorite_count')  int favoriteCount,  bool favorited,  int sold, @JsonKey(name: 'sold_count')  int? soldCount,  Category? category,  ListingSeller? seller, @JsonKey(name: 'resources')  List<ResourceModel>? images,  List<ProductSpecification>? specifications,  List<ProductSku>? skus,  List<ProductSku>? variants,  List<String>? tags, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deleted_at')  String? deletedAt, @JsonKey(name: 'vendor_id')  String? vendorId, @JsonKey(name: 'vendor_name')  String? vendorName, @JsonKey(name: 'vendor_avatar')  String? vendorAvatar, @JsonKey(name: 'category_id')  String? categoryId, @JsonKey(name: 'is_negotiable')  bool isNegotiable, @JsonKey(name: 'min_negotiable_price')  int? minNegotiablePrice, @JsonKey(name: 'max_negotiable_price')  int? maxNegotiablePrice)?  $default,) {final _that = this;
switch (_that) {
case _TProductDetail() when $default != null:
return $default(_that.id,_that.name,_that.slug,_that.description,_that.price,_that.priceMode,_that.currency,_that.condition,_that.status,_that.originalPrice,_that.rating,_that.reviewCount,_that.favoriteCount,_that.favorited,_that.sold,_that.soldCount,_that.category,_that.seller,_that.images,_that.specifications,_that.skus,_that.variants,_that.tags,_that.createdAt,_that.deletedAt,_that.vendorId,_that.vendorName,_that.vendorAvatar,_that.categoryId,_that.isNegotiable,_that.minNegotiablePrice,_that.maxNegotiablePrice);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TProductDetail extends TProductDetail {
  const _TProductDetail({required this.id, required this.name, this.slug = '', this.description, this.price = 0, @JsonKey(name: 'price_mode') this.priceMode, this.currency, this.condition, this.status, @JsonKey(name: 'original_price') this.originalPrice, this.rating = 0.0, @JsonKey(name: 'review_count') this.reviewCount = 0, @JsonKey(name: 'favorite_count') this.favoriteCount = 0, this.favorited = false, this.sold = 0, @JsonKey(name: 'sold_count') this.soldCount, this.category, this.seller, @JsonKey(name: 'resources') final  List<ResourceModel>? images, final  List<ProductSpecification>? specifications, final  List<ProductSku>? skus, final  List<ProductSku>? variants, final  List<String>? tags, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'deleted_at') this.deletedAt, @JsonKey(name: 'vendor_id') this.vendorId, @JsonKey(name: 'vendor_name') this.vendorName, @JsonKey(name: 'vendor_avatar') this.vendorAvatar, @JsonKey(name: 'category_id') this.categoryId, @JsonKey(name: 'is_negotiable') this.isNegotiable = false, @JsonKey(name: 'min_negotiable_price') this.minNegotiablePrice, @JsonKey(name: 'max_negotiable_price') this.maxNegotiablePrice}): _images = images,_specifications = specifications,_skus = skus,_variants = variants,_tags = tags,super._();
  factory _TProductDetail.fromJson(Map<String, dynamic> json) => _$TProductDetailFromJson(json);

@override final  String id;
@override final  String name;
@override@JsonKey() final  String slug;
@override final  String? description;
@override@JsonKey() final  int price;
@override@JsonKey(name: 'price_mode') final  String? priceMode;
@override final  String? currency;
@override final  String? condition;
@override final  String? status;
@override@JsonKey(name: 'original_price') final  int? originalPrice;
@override@JsonKey() final  double rating;
@override@JsonKey(name: 'review_count') final  int reviewCount;
@override@JsonKey(name: 'favorite_count') final  int favoriteCount;
@override@JsonKey() final  bool favorited;
@override@JsonKey() final  int sold;
@override@JsonKey(name: 'sold_count') final  int? soldCount;
@override final  Category? category;
@override final  ListingSeller? seller;
 final  List<ResourceModel>? _images;
@override@JsonKey(name: 'resources') List<ResourceModel>? get images {
  final value = _images;
  if (value == null) return null;
  if (_images is EqualUnmodifiableListView) return _images;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductSpecification>? _specifications;
@override List<ProductSpecification>? get specifications {
  final value = _specifications;
  if (value == null) return null;
  if (_specifications is EqualUnmodifiableListView) return _specifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductSku>? _skus;
@override List<ProductSku>? get skus {
  final value = _skus;
  if (value == null) return null;
  if (_skus is EqualUnmodifiableListView) return _skus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<ProductSku>? _variants;
@override List<ProductSku>? get variants {
  final value = _variants;
  if (value == null) return null;
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'deleted_at') final  String? deletedAt;
@override@JsonKey(name: 'vendor_id') final  String? vendorId;
@override@JsonKey(name: 'vendor_name') final  String? vendorName;
@override@JsonKey(name: 'vendor_avatar') final  String? vendorAvatar;
@override@JsonKey(name: 'category_id') final  String? categoryId;
@override@JsonKey(name: 'is_negotiable') final  bool isNegotiable;
@override@JsonKey(name: 'min_negotiable_price') final  int? minNegotiablePrice;
@override@JsonKey(name: 'max_negotiable_price') final  int? maxNegotiablePrice;

/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TProductDetailCopyWith<_TProductDetail> get copyWith => __$TProductDetailCopyWithImpl<_TProductDetail>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TProductDetailToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TProductDetail&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.description, description) || other.description == description)&&(identical(other.price, price) || other.price == price)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.status, status) || other.status == status)&&(identical(other.originalPrice, originalPrice) || other.originalPrice == originalPrice)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.reviewCount, reviewCount) || other.reviewCount == reviewCount)&&(identical(other.favoriteCount, favoriteCount) || other.favoriteCount == favoriteCount)&&(identical(other.favorited, favorited) || other.favorited == favorited)&&(identical(other.sold, sold) || other.sold == sold)&&(identical(other.soldCount, soldCount) || other.soldCount == soldCount)&&(identical(other.category, category) || other.category == category)&&(identical(other.seller, seller) || other.seller == seller)&&const DeepCollectionEquality().equals(other._images, _images)&&const DeepCollectionEquality().equals(other._specifications, _specifications)&&const DeepCollectionEquality().equals(other._skus, _skus)&&const DeepCollectionEquality().equals(other._variants, _variants)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deletedAt, deletedAt) || other.deletedAt == deletedAt)&&(identical(other.vendorId, vendorId) || other.vendorId == vendorId)&&(identical(other.vendorName, vendorName) || other.vendorName == vendorName)&&(identical(other.vendorAvatar, vendorAvatar) || other.vendorAvatar == vendorAvatar)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.isNegotiable, isNegotiable) || other.isNegotiable == isNegotiable)&&(identical(other.minNegotiablePrice, minNegotiablePrice) || other.minNegotiablePrice == minNegotiablePrice)&&(identical(other.maxNegotiablePrice, maxNegotiablePrice) || other.maxNegotiablePrice == maxNegotiablePrice));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,slug,description,price,priceMode,currency,condition,status,originalPrice,rating,reviewCount,favoriteCount,favorited,sold,soldCount,category,seller,const DeepCollectionEquality().hash(_images),const DeepCollectionEquality().hash(_specifications),const DeepCollectionEquality().hash(_skus),const DeepCollectionEquality().hash(_variants),const DeepCollectionEquality().hash(_tags),createdAt,deletedAt,vendorId,vendorName,vendorAvatar,categoryId,isNegotiable,minNegotiablePrice,maxNegotiablePrice]);

@override
String toString() {
  return 'TProductDetail(id: $id, name: $name, slug: $slug, description: $description, price: $price, priceMode: $priceMode, currency: $currency, condition: $condition, status: $status, originalPrice: $originalPrice, rating: $rating, reviewCount: $reviewCount, favoriteCount: $favoriteCount, favorited: $favorited, sold: $sold, soldCount: $soldCount, category: $category, seller: $seller, images: $images, specifications: $specifications, skus: $skus, variants: $variants, tags: $tags, createdAt: $createdAt, deletedAt: $deletedAt, vendorId: $vendorId, vendorName: $vendorName, vendorAvatar: $vendorAvatar, categoryId: $categoryId, isNegotiable: $isNegotiable, minNegotiablePrice: $minNegotiablePrice, maxNegotiablePrice: $maxNegotiablePrice)';
}


}

/// @nodoc
abstract mixin class _$TProductDetailCopyWith<$Res> implements $TProductDetailCopyWith<$Res> {
  factory _$TProductDetailCopyWith(_TProductDetail value, $Res Function(_TProductDetail) _then) = __$TProductDetailCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String slug, String? description, int price,@JsonKey(name: 'price_mode') String? priceMode, String? currency, String? condition, String? status,@JsonKey(name: 'original_price') int? originalPrice, double rating,@JsonKey(name: 'review_count') int reviewCount,@JsonKey(name: 'favorite_count') int favoriteCount, bool favorited, int sold,@JsonKey(name: 'sold_count') int? soldCount, Category? category, ListingSeller? seller,@JsonKey(name: 'resources') List<ResourceModel>? images, List<ProductSpecification>? specifications, List<ProductSku>? skus, List<ProductSku>? variants, List<String>? tags,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deleted_at') String? deletedAt,@JsonKey(name: 'vendor_id') String? vendorId,@JsonKey(name: 'vendor_name') String? vendorName,@JsonKey(name: 'vendor_avatar') String? vendorAvatar,@JsonKey(name: 'category_id') String? categoryId,@JsonKey(name: 'is_negotiable') bool isNegotiable,@JsonKey(name: 'min_negotiable_price') int? minNegotiablePrice,@JsonKey(name: 'max_negotiable_price') int? maxNegotiablePrice
});


@override $CategoryCopyWith<$Res>? get category;@override $ListingSellerCopyWith<$Res>? get seller;

}
/// @nodoc
class __$TProductDetailCopyWithImpl<$Res>
    implements _$TProductDetailCopyWith<$Res> {
  __$TProductDetailCopyWithImpl(this._self, this._then);

  final _TProductDetail _self;
  final $Res Function(_TProductDetail) _then;

/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? slug = null,Object? description = freezed,Object? price = null,Object? priceMode = freezed,Object? currency = freezed,Object? condition = freezed,Object? status = freezed,Object? originalPrice = freezed,Object? rating = null,Object? reviewCount = null,Object? favoriteCount = null,Object? favorited = null,Object? sold = null,Object? soldCount = freezed,Object? category = freezed,Object? seller = freezed,Object? images = freezed,Object? specifications = freezed,Object? skus = freezed,Object? variants = freezed,Object? tags = freezed,Object? createdAt = freezed,Object? deletedAt = freezed,Object? vendorId = freezed,Object? vendorName = freezed,Object? vendorAvatar = freezed,Object? categoryId = freezed,Object? isNegotiable = null,Object? minNegotiablePrice = freezed,Object? maxNegotiablePrice = freezed,}) {
  return _then(_TProductDetail(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,priceMode: freezed == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,originalPrice: freezed == originalPrice ? _self.originalPrice : originalPrice // ignore: cast_nullable_to_non_nullable
as int?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as double,reviewCount: null == reviewCount ? _self.reviewCount : reviewCount // ignore: cast_nullable_to_non_nullable
as int,favoriteCount: null == favoriteCount ? _self.favoriteCount : favoriteCount // ignore: cast_nullable_to_non_nullable
as int,favorited: null == favorited ? _self.favorited : favorited // ignore: cast_nullable_to_non_nullable
as bool,sold: null == sold ? _self.sold : sold // ignore: cast_nullable_to_non_nullable
as int,soldCount: freezed == soldCount ? _self.soldCount : soldCount // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as Category?,seller: freezed == seller ? _self.seller : seller // ignore: cast_nullable_to_non_nullable
as ListingSeller?,images: freezed == images ? _self._images : images // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>?,specifications: freezed == specifications ? _self._specifications : specifications // ignore: cast_nullable_to_non_nullable
as List<ProductSpecification>?,skus: freezed == skus ? _self._skus : skus // ignore: cast_nullable_to_non_nullable
as List<ProductSku>?,variants: freezed == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<ProductSku>?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deletedAt: freezed == deletedAt ? _self.deletedAt : deletedAt // ignore: cast_nullable_to_non_nullable
as String?,vendorId: freezed == vendorId ? _self.vendorId : vendorId // ignore: cast_nullable_to_non_nullable
as String?,vendorName: freezed == vendorName ? _self.vendorName : vendorName // ignore: cast_nullable_to_non_nullable
as String?,vendorAvatar: freezed == vendorAvatar ? _self.vendorAvatar : vendorAvatar // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,isNegotiable: null == isNegotiable ? _self.isNegotiable : isNegotiable // ignore: cast_nullable_to_non_nullable
as bool,minNegotiablePrice: freezed == minNegotiablePrice ? _self.minNegotiablePrice : minNegotiablePrice // ignore: cast_nullable_to_non_nullable
as int?,maxNegotiablePrice: freezed == maxNegotiablePrice ? _self.maxNegotiablePrice : maxNegotiablePrice // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CategoryCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $CategoryCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of TProductDetail
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ListingSellerCopyWith<$Res>? get seller {
    if (_self.seller == null) {
    return null;
  }

  return $ListingSellerCopyWith<$Res>(_self.seller!, (value) {
    return _then(_self.copyWith(seller: value));
  });
}
}


/// @nodoc
mixin _$CommentProfile {

 String get id; String? get username; String? get name;@JsonKey(name: 'avatar_url') String? get avatarUrl;
/// Create a copy of CommentProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CommentProfileCopyWith<CommentProfile> get copyWith => _$CommentProfileCopyWithImpl<CommentProfile>(this as CommentProfile, _$identity);

  /// Serializes this CommentProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CommentProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name,avatarUrl);

@override
String toString() {
  return 'CommentProfile(id: $id, username: $username, name: $name, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class $CommentProfileCopyWith<$Res>  {
  factory $CommentProfileCopyWith(CommentProfile value, $Res Function(CommentProfile) _then) = _$CommentProfileCopyWithImpl;
@useResult
$Res call({
 String id, String? username, String? name,@JsonKey(name: 'avatar_url') String? avatarUrl
});




}
/// @nodoc
class _$CommentProfileCopyWithImpl<$Res>
    implements $CommentProfileCopyWith<$Res> {
  _$CommentProfileCopyWithImpl(this._self, this._then);

  final CommentProfile _self;
  final $Res Function(CommentProfile) _then;

/// Create a copy of CommentProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? username = freezed,Object? name = freezed,Object? avatarUrl = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CommentProfile].
extension CommentProfilePatterns on CommentProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CommentProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CommentProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CommentProfile value)  $default,){
final _that = this;
switch (_that) {
case _CommentProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CommentProfile value)?  $default,){
final _that = this;
switch (_that) {
case _CommentProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? username,  String? name, @JsonKey(name: 'avatar_url')  String? avatarUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CommentProfile() when $default != null:
return $default(_that.id,_that.username,_that.name,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? username,  String? name, @JsonKey(name: 'avatar_url')  String? avatarUrl)  $default,) {final _that = this;
switch (_that) {
case _CommentProfile():
return $default(_that.id,_that.username,_that.name,_that.avatarUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? username,  String? name, @JsonKey(name: 'avatar_url')  String? avatarUrl)?  $default,) {final _that = this;
switch (_that) {
case _CommentProfile() when $default != null:
return $default(_that.id,_that.username,_that.name,_that.avatarUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CommentProfile implements CommentProfile {
  const _CommentProfile({required this.id, this.username, this.name, @JsonKey(name: 'avatar_url') this.avatarUrl});
  factory _CommentProfile.fromJson(Map<String, dynamic> json) => _$CommentProfileFromJson(json);

@override final  String id;
@override final  String? username;
@override final  String? name;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;

/// Create a copy of CommentProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CommentProfileCopyWith<_CommentProfile> get copyWith => __$CommentProfileCopyWithImpl<_CommentProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CommentProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CommentProfile&&(identical(other.id, id) || other.id == id)&&(identical(other.username, username) || other.username == username)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,username,name,avatarUrl);

@override
String toString() {
  return 'CommentProfile(id: $id, username: $username, name: $name, avatarUrl: $avatarUrl)';
}


}

/// @nodoc
abstract mixin class _$CommentProfileCopyWith<$Res> implements $CommentProfileCopyWith<$Res> {
  factory _$CommentProfileCopyWith(_CommentProfile value, $Res Function(_CommentProfile) _then) = __$CommentProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String? username, String? name,@JsonKey(name: 'avatar_url') String? avatarUrl
});




}
/// @nodoc
class __$CommentProfileCopyWithImpl<$Res>
    implements _$CommentProfileCopyWith<$Res> {
  __$CommentProfileCopyWithImpl(this._self, this._then);

  final _CommentProfile _self;
  final $Res Function(_CommentProfile) _then;

/// Create a copy of CommentProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? username = freezed,Object? name = freezed,Object? avatarUrl = freezed,}) {
  return _then(_CommentProfile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ReviewAuthor {

 String get id; String get name; ResourceModel? get avatar;
/// Create a copy of ReviewAuthor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewAuthorCopyWith<ReviewAuthor> get copyWith => _$ReviewAuthorCopyWithImpl<ReviewAuthor>(this as ReviewAuthor, _$identity);

  /// Serializes this ReviewAuthor to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewAuthor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar);

@override
String toString() {
  return 'ReviewAuthor(id: $id, name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class $ReviewAuthorCopyWith<$Res>  {
  factory $ReviewAuthorCopyWith(ReviewAuthor value, $Res Function(ReviewAuthor) _then) = _$ReviewAuthorCopyWithImpl;
@useResult
$Res call({
 String id, String name, ResourceModel? avatar
});


$ResourceModelCopyWith<$Res>? get avatar;

}
/// @nodoc
class _$ReviewAuthorCopyWithImpl<$Res>
    implements $ReviewAuthorCopyWith<$Res> {
  _$ReviewAuthorCopyWithImpl(this._self, this._then);

  final ReviewAuthor _self;
  final $Res Function(ReviewAuthor) _then;

/// Create a copy of ReviewAuthor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as ResourceModel?,
  ));
}
/// Create a copy of ReviewAuthor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceModelCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ResourceModelCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewAuthor].
extension ReviewAuthorPatterns on ReviewAuthor {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewAuthor value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewAuthor() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewAuthor value)  $default,){
final _that = this;
switch (_that) {
case _ReviewAuthor():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewAuthor value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewAuthor() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ResourceModel? avatar)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewAuthor() when $default != null:
return $default(_that.id,_that.name,_that.avatar);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ResourceModel? avatar)  $default,) {final _that = this;
switch (_that) {
case _ReviewAuthor():
return $default(_that.id,_that.name,_that.avatar);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ResourceModel? avatar)?  $default,) {final _that = this;
switch (_that) {
case _ReviewAuthor() when $default != null:
return $default(_that.id,_that.name,_that.avatar);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewAuthor implements ReviewAuthor {
  const _ReviewAuthor({required this.id, required this.name, this.avatar});
  factory _ReviewAuthor.fromJson(Map<String, dynamic> json) => _$ReviewAuthorFromJson(json);

@override final  String id;
@override final  String name;
@override final  ResourceModel? avatar;

/// Create a copy of ReviewAuthor
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewAuthorCopyWith<_ReviewAuthor> get copyWith => __$ReviewAuthorCopyWithImpl<_ReviewAuthor>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewAuthorToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewAuthor&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.avatar, avatar) || other.avatar == avatar));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,avatar);

@override
String toString() {
  return 'ReviewAuthor(id: $id, name: $name, avatar: $avatar)';
}


}

/// @nodoc
abstract mixin class _$ReviewAuthorCopyWith<$Res> implements $ReviewAuthorCopyWith<$Res> {
  factory _$ReviewAuthorCopyWith(_ReviewAuthor value, $Res Function(_ReviewAuthor) _then) = __$ReviewAuthorCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ResourceModel? avatar
});


@override $ResourceModelCopyWith<$Res>? get avatar;

}
/// @nodoc
class __$ReviewAuthorCopyWithImpl<$Res>
    implements _$ReviewAuthorCopyWith<$Res> {
  __$ReviewAuthorCopyWithImpl(this._self, this._then);

  final _ReviewAuthor _self;
  final $Res Function(_ReviewAuthor) _then;

/// Create a copy of ReviewAuthor
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? avatar = freezed,}) {
  return _then(_ReviewAuthor(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,avatar: freezed == avatar ? _self.avatar : avatar // ignore: cast_nullable_to_non_nullable
as ResourceModel?,
  ));
}

/// Create a copy of ReviewAuthor
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceModelCopyWith<$Res>? get avatar {
    if (_self.avatar == null) {
    return null;
  }

  return $ResourceModelCopyWith<$Res>(_self.avatar!, (value) {
    return _then(_self.copyWith(avatar: value));
  });
}
}


/// @nodoc
mixin _$ReviewVoteTally {

 int get helpful;@JsonKey(name: 'not_helpful') int get notHelpful;@JsonKey(name: 'my_vote') int? get myVote;
/// Create a copy of ReviewVoteTally
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewVoteTallyCopyWith<ReviewVoteTally> get copyWith => _$ReviewVoteTallyCopyWithImpl<ReviewVoteTally>(this as ReviewVoteTally, _$identity);

  /// Serializes this ReviewVoteTally to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewVoteTally&&(identical(other.helpful, helpful) || other.helpful == helpful)&&(identical(other.notHelpful, notHelpful) || other.notHelpful == notHelpful)&&(identical(other.myVote, myVote) || other.myVote == myVote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,helpful,notHelpful,myVote);

@override
String toString() {
  return 'ReviewVoteTally(helpful: $helpful, notHelpful: $notHelpful, myVote: $myVote)';
}


}

/// @nodoc
abstract mixin class $ReviewVoteTallyCopyWith<$Res>  {
  factory $ReviewVoteTallyCopyWith(ReviewVoteTally value, $Res Function(ReviewVoteTally) _then) = _$ReviewVoteTallyCopyWithImpl;
@useResult
$Res call({
 int helpful,@JsonKey(name: 'not_helpful') int notHelpful,@JsonKey(name: 'my_vote') int? myVote
});




}
/// @nodoc
class _$ReviewVoteTallyCopyWithImpl<$Res>
    implements $ReviewVoteTallyCopyWith<$Res> {
  _$ReviewVoteTallyCopyWithImpl(this._self, this._then);

  final ReviewVoteTally _self;
  final $Res Function(ReviewVoteTally) _then;

/// Create a copy of ReviewVoteTally
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? helpful = null,Object? notHelpful = null,Object? myVote = freezed,}) {
  return _then(_self.copyWith(
helpful: null == helpful ? _self.helpful : helpful // ignore: cast_nullable_to_non_nullable
as int,notHelpful: null == notHelpful ? _self.notHelpful : notHelpful // ignore: cast_nullable_to_non_nullable
as int,myVote: freezed == myVote ? _self.myVote : myVote // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewVoteTally].
extension ReviewVoteTallyPatterns on ReviewVoteTally {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewVoteTally value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewVoteTally() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewVoteTally value)  $default,){
final _that = this;
switch (_that) {
case _ReviewVoteTally():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewVoteTally value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewVoteTally() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int helpful, @JsonKey(name: 'not_helpful')  int notHelpful, @JsonKey(name: 'my_vote')  int? myVote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewVoteTally() when $default != null:
return $default(_that.helpful,_that.notHelpful,_that.myVote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int helpful, @JsonKey(name: 'not_helpful')  int notHelpful, @JsonKey(name: 'my_vote')  int? myVote)  $default,) {final _that = this;
switch (_that) {
case _ReviewVoteTally():
return $default(_that.helpful,_that.notHelpful,_that.myVote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int helpful, @JsonKey(name: 'not_helpful')  int notHelpful, @JsonKey(name: 'my_vote')  int? myVote)?  $default,) {final _that = this;
switch (_that) {
case _ReviewVoteTally() when $default != null:
return $default(_that.helpful,_that.notHelpful,_that.myVote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewVoteTally implements ReviewVoteTally {
  const _ReviewVoteTally({this.helpful = 0, @JsonKey(name: 'not_helpful') this.notHelpful = 0, @JsonKey(name: 'my_vote') this.myVote});
  factory _ReviewVoteTally.fromJson(Map<String, dynamic> json) => _$ReviewVoteTallyFromJson(json);

@override@JsonKey() final  int helpful;
@override@JsonKey(name: 'not_helpful') final  int notHelpful;
@override@JsonKey(name: 'my_vote') final  int? myVote;

/// Create a copy of ReviewVoteTally
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewVoteTallyCopyWith<_ReviewVoteTally> get copyWith => __$ReviewVoteTallyCopyWithImpl<_ReviewVoteTally>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewVoteTallyToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewVoteTally&&(identical(other.helpful, helpful) || other.helpful == helpful)&&(identical(other.notHelpful, notHelpful) || other.notHelpful == notHelpful)&&(identical(other.myVote, myVote) || other.myVote == myVote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,helpful,notHelpful,myVote);

@override
String toString() {
  return 'ReviewVoteTally(helpful: $helpful, notHelpful: $notHelpful, myVote: $myVote)';
}


}

/// @nodoc
abstract mixin class _$ReviewVoteTallyCopyWith<$Res> implements $ReviewVoteTallyCopyWith<$Res> {
  factory _$ReviewVoteTallyCopyWith(_ReviewVoteTally value, $Res Function(_ReviewVoteTally) _then) = __$ReviewVoteTallyCopyWithImpl;
@override @useResult
$Res call({
 int helpful,@JsonKey(name: 'not_helpful') int notHelpful,@JsonKey(name: 'my_vote') int? myVote
});




}
/// @nodoc
class __$ReviewVoteTallyCopyWithImpl<$Res>
    implements _$ReviewVoteTallyCopyWith<$Res> {
  __$ReviewVoteTallyCopyWithImpl(this._self, this._then);

  final _ReviewVoteTally _self;
  final $Res Function(_ReviewVoteTally) _then;

/// Create a copy of ReviewVoteTally
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? helpful = null,Object? notHelpful = null,Object? myVote = freezed,}) {
  return _then(_ReviewVoteTally(
helpful: null == helpful ? _self.helpful : helpful // ignore: cast_nullable_to_non_nullable
as int,notHelpful: null == notHelpful ? _self.notHelpful : notHelpful // ignore: cast_nullable_to_non_nullable
as int,myVote: freezed == myVote ? _self.myVote : myVote // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$ProductComment {

 String get id;@JsonKey(name: 'listing_id') String? get listingId;@JsonKey(name: 'ref_id') String? get refId;@JsonKey(name: 'ref_type') String? get refType;@JsonKey(name: 'account_id') String? get accountId;@JsonKey(name: 'order_id') String? get orderId; CommentProfile? get profile; ReviewAuthor? get author; String? get body; int get rating; int? get upvote; int? get downvote; double? get score; ReviewVoteTally? get votes;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'date_created') String? get dateCreated;@JsonKey(name: 'date_updated') String? get dateUpdated;@JsonKey(name: 'resources') List<ResourceModel>? get attachments; List<SkuAttribute>? get attributes;
/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProductCommentCopyWith<ProductComment> get copyWith => _$ProductCommentCopyWithImpl<ProductComment>(this as ProductComment, _$identity);

  /// Serializes this ProductComment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProductComment&&(identical(other.id, id) || other.id == id)&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.refId, refId) || other.refId == refId)&&(identical(other.refType, refType) || other.refType == refType)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.author, author) || other.author == author)&&(identical(other.body, body) || other.body == body)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.upvote, upvote) || other.upvote == upvote)&&(identical(other.downvote, downvote) || other.downvote == downvote)&&(identical(other.score, score) || other.score == score)&&(identical(other.votes, votes) || other.votes == votes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateUpdated, dateUpdated) || other.dateUpdated == dateUpdated)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&const DeepCollectionEquality().equals(other.attributes, attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,listingId,refId,refType,accountId,orderId,profile,author,body,rating,upvote,downvote,score,votes,createdAt,dateCreated,dateUpdated,const DeepCollectionEquality().hash(attachments),const DeepCollectionEquality().hash(attributes)]);

@override
String toString() {
  return 'ProductComment(id: $id, listingId: $listingId, refId: $refId, refType: $refType, accountId: $accountId, orderId: $orderId, profile: $profile, author: $author, body: $body, rating: $rating, upvote: $upvote, downvote: $downvote, score: $score, votes: $votes, createdAt: $createdAt, dateCreated: $dateCreated, dateUpdated: $dateUpdated, attachments: $attachments, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class $ProductCommentCopyWith<$Res>  {
  factory $ProductCommentCopyWith(ProductComment value, $Res Function(ProductComment) _then) = _$ProductCommentCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'listing_id') String? listingId,@JsonKey(name: 'ref_id') String? refId,@JsonKey(name: 'ref_type') String? refType,@JsonKey(name: 'account_id') String? accountId,@JsonKey(name: 'order_id') String? orderId, CommentProfile? profile, ReviewAuthor? author, String? body, int rating, int? upvote, int? downvote, double? score, ReviewVoteTally? votes,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'date_created') String? dateCreated,@JsonKey(name: 'date_updated') String? dateUpdated,@JsonKey(name: 'resources') List<ResourceModel>? attachments, List<SkuAttribute>? attributes
});


$CommentProfileCopyWith<$Res>? get profile;$ReviewAuthorCopyWith<$Res>? get author;$ReviewVoteTallyCopyWith<$Res>? get votes;

}
/// @nodoc
class _$ProductCommentCopyWithImpl<$Res>
    implements $ProductCommentCopyWith<$Res> {
  _$ProductCommentCopyWithImpl(this._self, this._then);

  final ProductComment _self;
  final $Res Function(ProductComment) _then;

/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? listingId = freezed,Object? refId = freezed,Object? refType = freezed,Object? accountId = freezed,Object? orderId = freezed,Object? profile = freezed,Object? author = freezed,Object? body = freezed,Object? rating = null,Object? upvote = freezed,Object? downvote = freezed,Object? score = freezed,Object? votes = freezed,Object? createdAt = freezed,Object? dateCreated = freezed,Object? dateUpdated = freezed,Object? attachments = freezed,Object? attributes = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listingId: freezed == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String?,refId: freezed == refId ? _self.refId : refId // ignore: cast_nullable_to_non_nullable
as String?,refType: freezed == refType ? _self.refType : refType // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as CommentProfile?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as ReviewAuthor?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,upvote: freezed == upvote ? _self.upvote : upvote // ignore: cast_nullable_to_non_nullable
as int?,downvote: freezed == downvote ? _self.downvote : downvote // ignore: cast_nullable_to_non_nullable
as int?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,votes: freezed == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as ReviewVoteTally?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,dateCreated: freezed == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String?,dateUpdated: freezed == dateUpdated ? _self.dateUpdated : dateUpdated // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>?,attributes: freezed == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,
  ));
}
/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $CommentProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewAuthorCopyWith<$Res>? get author {
    if (_self.author == null) {
    return null;
  }

  return $ReviewAuthorCopyWith<$Res>(_self.author!, (value) {
    return _then(_self.copyWith(author: value));
  });
}/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewVoteTallyCopyWith<$Res>? get votes {
    if (_self.votes == null) {
    return null;
  }

  return $ReviewVoteTallyCopyWith<$Res>(_self.votes!, (value) {
    return _then(_self.copyWith(votes: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProductComment].
extension ProductCommentPatterns on ProductComment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProductComment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProductComment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProductComment value)  $default,){
final _that = this;
switch (_that) {
case _ProductComment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProductComment value)?  $default,){
final _that = this;
switch (_that) {
case _ProductComment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'listing_id')  String? listingId, @JsonKey(name: 'ref_id')  String? refId, @JsonKey(name: 'ref_type')  String? refType, @JsonKey(name: 'account_id')  String? accountId, @JsonKey(name: 'order_id')  String? orderId,  CommentProfile? profile,  ReviewAuthor? author,  String? body,  int rating,  int? upvote,  int? downvote,  double? score,  ReviewVoteTally? votes, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'date_created')  String? dateCreated, @JsonKey(name: 'date_updated')  String? dateUpdated, @JsonKey(name: 'resources')  List<ResourceModel>? attachments,  List<SkuAttribute>? attributes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProductComment() when $default != null:
return $default(_that.id,_that.listingId,_that.refId,_that.refType,_that.accountId,_that.orderId,_that.profile,_that.author,_that.body,_that.rating,_that.upvote,_that.downvote,_that.score,_that.votes,_that.createdAt,_that.dateCreated,_that.dateUpdated,_that.attachments,_that.attributes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'listing_id')  String? listingId, @JsonKey(name: 'ref_id')  String? refId, @JsonKey(name: 'ref_type')  String? refType, @JsonKey(name: 'account_id')  String? accountId, @JsonKey(name: 'order_id')  String? orderId,  CommentProfile? profile,  ReviewAuthor? author,  String? body,  int rating,  int? upvote,  int? downvote,  double? score,  ReviewVoteTally? votes, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'date_created')  String? dateCreated, @JsonKey(name: 'date_updated')  String? dateUpdated, @JsonKey(name: 'resources')  List<ResourceModel>? attachments,  List<SkuAttribute>? attributes)  $default,) {final _that = this;
switch (_that) {
case _ProductComment():
return $default(_that.id,_that.listingId,_that.refId,_that.refType,_that.accountId,_that.orderId,_that.profile,_that.author,_that.body,_that.rating,_that.upvote,_that.downvote,_that.score,_that.votes,_that.createdAt,_that.dateCreated,_that.dateUpdated,_that.attachments,_that.attributes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'listing_id')  String? listingId, @JsonKey(name: 'ref_id')  String? refId, @JsonKey(name: 'ref_type')  String? refType, @JsonKey(name: 'account_id')  String? accountId, @JsonKey(name: 'order_id')  String? orderId,  CommentProfile? profile,  ReviewAuthor? author,  String? body,  int rating,  int? upvote,  int? downvote,  double? score,  ReviewVoteTally? votes, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'date_created')  String? dateCreated, @JsonKey(name: 'date_updated')  String? dateUpdated, @JsonKey(name: 'resources')  List<ResourceModel>? attachments,  List<SkuAttribute>? attributes)?  $default,) {final _that = this;
switch (_that) {
case _ProductComment() when $default != null:
return $default(_that.id,_that.listingId,_that.refId,_that.refType,_that.accountId,_that.orderId,_that.profile,_that.author,_that.body,_that.rating,_that.upvote,_that.downvote,_that.score,_that.votes,_that.createdAt,_that.dateCreated,_that.dateUpdated,_that.attachments,_that.attributes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProductComment extends ProductComment {
  const _ProductComment({required this.id, @JsonKey(name: 'listing_id') this.listingId, @JsonKey(name: 'ref_id') this.refId, @JsonKey(name: 'ref_type') this.refType, @JsonKey(name: 'account_id') this.accountId, @JsonKey(name: 'order_id') this.orderId, this.profile, this.author, this.body, this.rating = 0, this.upvote, this.downvote, this.score, this.votes, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'date_created') this.dateCreated, @JsonKey(name: 'date_updated') this.dateUpdated, @JsonKey(name: 'resources') final  List<ResourceModel>? attachments, final  List<SkuAttribute>? attributes}): _attachments = attachments,_attributes = attributes,super._();
  factory _ProductComment.fromJson(Map<String, dynamic> json) => _$ProductCommentFromJson(json);

@override final  String id;
@override@JsonKey(name: 'listing_id') final  String? listingId;
@override@JsonKey(name: 'ref_id') final  String? refId;
@override@JsonKey(name: 'ref_type') final  String? refType;
@override@JsonKey(name: 'account_id') final  String? accountId;
@override@JsonKey(name: 'order_id') final  String? orderId;
@override final  CommentProfile? profile;
@override final  ReviewAuthor? author;
@override final  String? body;
@override@JsonKey() final  int rating;
@override final  int? upvote;
@override final  int? downvote;
@override final  double? score;
@override final  ReviewVoteTally? votes;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'date_created') final  String? dateCreated;
@override@JsonKey(name: 'date_updated') final  String? dateUpdated;
 final  List<ResourceModel>? _attachments;
@override@JsonKey(name: 'resources') List<ResourceModel>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<SkuAttribute>? _attributes;
@override List<SkuAttribute>? get attributes {
  final value = _attributes;
  if (value == null) return null;
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProductCommentCopyWith<_ProductComment> get copyWith => __$ProductCommentCopyWithImpl<_ProductComment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProductCommentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProductComment&&(identical(other.id, id) || other.id == id)&&(identical(other.listingId, listingId) || other.listingId == listingId)&&(identical(other.refId, refId) || other.refId == refId)&&(identical(other.refType, refType) || other.refType == refType)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.author, author) || other.author == author)&&(identical(other.body, body) || other.body == body)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.upvote, upvote) || other.upvote == upvote)&&(identical(other.downvote, downvote) || other.downvote == downvote)&&(identical(other.score, score) || other.score == score)&&(identical(other.votes, votes) || other.votes == votes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.dateCreated, dateCreated) || other.dateCreated == dateCreated)&&(identical(other.dateUpdated, dateUpdated) || other.dateUpdated == dateUpdated)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&const DeepCollectionEquality().equals(other._attributes, _attributes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,listingId,refId,refType,accountId,orderId,profile,author,body,rating,upvote,downvote,score,votes,createdAt,dateCreated,dateUpdated,const DeepCollectionEquality().hash(_attachments),const DeepCollectionEquality().hash(_attributes)]);

@override
String toString() {
  return 'ProductComment(id: $id, listingId: $listingId, refId: $refId, refType: $refType, accountId: $accountId, orderId: $orderId, profile: $profile, author: $author, body: $body, rating: $rating, upvote: $upvote, downvote: $downvote, score: $score, votes: $votes, createdAt: $createdAt, dateCreated: $dateCreated, dateUpdated: $dateUpdated, attachments: $attachments, attributes: $attributes)';
}


}

/// @nodoc
abstract mixin class _$ProductCommentCopyWith<$Res> implements $ProductCommentCopyWith<$Res> {
  factory _$ProductCommentCopyWith(_ProductComment value, $Res Function(_ProductComment) _then) = __$ProductCommentCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'listing_id') String? listingId,@JsonKey(name: 'ref_id') String? refId,@JsonKey(name: 'ref_type') String? refType,@JsonKey(name: 'account_id') String? accountId,@JsonKey(name: 'order_id') String? orderId, CommentProfile? profile, ReviewAuthor? author, String? body, int rating, int? upvote, int? downvote, double? score, ReviewVoteTally? votes,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'date_created') String? dateCreated,@JsonKey(name: 'date_updated') String? dateUpdated,@JsonKey(name: 'resources') List<ResourceModel>? attachments, List<SkuAttribute>? attributes
});


@override $CommentProfileCopyWith<$Res>? get profile;@override $ReviewAuthorCopyWith<$Res>? get author;@override $ReviewVoteTallyCopyWith<$Res>? get votes;

}
/// @nodoc
class __$ProductCommentCopyWithImpl<$Res>
    implements _$ProductCommentCopyWith<$Res> {
  __$ProductCommentCopyWithImpl(this._self, this._then);

  final _ProductComment _self;
  final $Res Function(_ProductComment) _then;

/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? listingId = freezed,Object? refId = freezed,Object? refType = freezed,Object? accountId = freezed,Object? orderId = freezed,Object? profile = freezed,Object? author = freezed,Object? body = freezed,Object? rating = null,Object? upvote = freezed,Object? downvote = freezed,Object? score = freezed,Object? votes = freezed,Object? createdAt = freezed,Object? dateCreated = freezed,Object? dateUpdated = freezed,Object? attachments = freezed,Object? attributes = freezed,}) {
  return _then(_ProductComment(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,listingId: freezed == listingId ? _self.listingId : listingId // ignore: cast_nullable_to_non_nullable
as String?,refId: freezed == refId ? _self.refId : refId // ignore: cast_nullable_to_non_nullable
as String?,refType: freezed == refType ? _self.refType : refType // ignore: cast_nullable_to_non_nullable
as String?,accountId: freezed == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String?,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,profile: freezed == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as CommentProfile?,author: freezed == author ? _self.author : author // ignore: cast_nullable_to_non_nullable
as ReviewAuthor?,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,upvote: freezed == upvote ? _self.upvote : upvote // ignore: cast_nullable_to_non_nullable
as int?,downvote: freezed == downvote ? _self.downvote : downvote // ignore: cast_nullable_to_non_nullable
as int?,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as double?,votes: freezed == votes ? _self.votes : votes // ignore: cast_nullable_to_non_nullable
as ReviewVoteTally?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,dateCreated: freezed == dateCreated ? _self.dateCreated : dateCreated // ignore: cast_nullable_to_non_nullable
as String?,dateUpdated: freezed == dateUpdated ? _self.dateUpdated : dateUpdated // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<ResourceModel>?,attributes: freezed == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<SkuAttribute>?,
  ));
}

/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CommentProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
    return null;
  }

  return $CommentProfileCopyWith<$Res>(_self.profile!, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewAuthorCopyWith<$Res>? get author {
    if (_self.author == null) {
    return null;
  }

  return $ReviewAuthorCopyWith<$Res>(_self.author!, (value) {
    return _then(_self.copyWith(author: value));
  });
}/// Create a copy of ProductComment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewVoteTallyCopyWith<$Res>? get votes {
    if (_self.votes == null) {
    return null;
  }

  return $ReviewVoteTallyCopyWith<$Res>(_self.votes!, (value) {
    return _then(_self.copyWith(votes: value));
  });
}
}


/// @nodoc
mixin _$CreateListingRequest {

@JsonKey(name: 'name') String get name;@JsonKey(name: 'category_id') String get categoryId;@JsonKey(name: 'condition') String get condition;@JsonKey(name: 'currency') String get currency;@JsonKey(name: 'price_mode') String get priceMode; String? get description; List<String>? get tags; List<String>? get attachments; Map<String, dynamic>? get specifications; List<Map<String, dynamic>> get variants;
/// Create a copy of CreateListingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateListingRequestCopyWith<CreateListingRequest> get copyWith => _$CreateListingRequestCopyWithImpl<CreateListingRequest>(this as CreateListingRequest, _$identity);

  /// Serializes this CreateListingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateListingRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&const DeepCollectionEquality().equals(other.specifications, specifications)&&const DeepCollectionEquality().equals(other.variants, variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,categoryId,condition,currency,priceMode,description,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(attachments),const DeepCollectionEquality().hash(specifications),const DeepCollectionEquality().hash(variants));

@override
String toString() {
  return 'CreateListingRequest(name: $name, categoryId: $categoryId, condition: $condition, currency: $currency, priceMode: $priceMode, description: $description, tags: $tags, attachments: $attachments, specifications: $specifications, variants: $variants)';
}


}

/// @nodoc
abstract mixin class $CreateListingRequestCopyWith<$Res>  {
  factory $CreateListingRequestCopyWith(CreateListingRequest value, $Res Function(CreateListingRequest) _then) = _$CreateListingRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'name') String name,@JsonKey(name: 'category_id') String categoryId,@JsonKey(name: 'condition') String condition,@JsonKey(name: 'currency') String currency,@JsonKey(name: 'price_mode') String priceMode, String? description, List<String>? tags, List<String>? attachments, Map<String, dynamic>? specifications, List<Map<String, dynamic>> variants
});




}
/// @nodoc
class _$CreateListingRequestCopyWithImpl<$Res>
    implements $CreateListingRequestCopyWith<$Res> {
  _$CreateListingRequestCopyWithImpl(this._self, this._then);

  final CreateListingRequest _self;
  final $Res Function(CreateListingRequest) _then;

/// Create a copy of CreateListingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? categoryId = null,Object? condition = null,Object? currency = null,Object? priceMode = null,Object? description = freezed,Object? tags = freezed,Object? attachments = freezed,Object? specifications = freezed,Object? variants = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,priceMode: null == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,specifications: freezed == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,variants: null == variants ? _self.variants : variants // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateListingRequest].
extension CreateListingRequestPatterns on CreateListingRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateListingRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateListingRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateListingRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateListingRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateListingRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateListingRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'category_id')  String categoryId, @JsonKey(name: 'condition')  String condition, @JsonKey(name: 'currency')  String currency, @JsonKey(name: 'price_mode')  String priceMode,  String? description,  List<String>? tags,  List<String>? attachments,  Map<String, dynamic>? specifications,  List<Map<String, dynamic>> variants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateListingRequest() when $default != null:
return $default(_that.name,_that.categoryId,_that.condition,_that.currency,_that.priceMode,_that.description,_that.tags,_that.attachments,_that.specifications,_that.variants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'category_id')  String categoryId, @JsonKey(name: 'condition')  String condition, @JsonKey(name: 'currency')  String currency, @JsonKey(name: 'price_mode')  String priceMode,  String? description,  List<String>? tags,  List<String>? attachments,  Map<String, dynamic>? specifications,  List<Map<String, dynamic>> variants)  $default,) {final _that = this;
switch (_that) {
case _CreateListingRequest():
return $default(_that.name,_that.categoryId,_that.condition,_that.currency,_that.priceMode,_that.description,_that.tags,_that.attachments,_that.specifications,_that.variants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'name')  String name, @JsonKey(name: 'category_id')  String categoryId, @JsonKey(name: 'condition')  String condition, @JsonKey(name: 'currency')  String currency, @JsonKey(name: 'price_mode')  String priceMode,  String? description,  List<String>? tags,  List<String>? attachments,  Map<String, dynamic>? specifications,  List<Map<String, dynamic>> variants)?  $default,) {final _that = this;
switch (_that) {
case _CreateListingRequest() when $default != null:
return $default(_that.name,_that.categoryId,_that.condition,_that.currency,_that.priceMode,_that.description,_that.tags,_that.attachments,_that.specifications,_that.variants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateListingRequest implements CreateListingRequest {
  const _CreateListingRequest({@JsonKey(name: 'name') required this.name, @JsonKey(name: 'category_id') required this.categoryId, @JsonKey(name: 'condition') required this.condition, @JsonKey(name: 'currency') required this.currency, @JsonKey(name: 'price_mode') required this.priceMode, this.description, final  List<String>? tags, final  List<String>? attachments, final  Map<String, dynamic>? specifications, required final  List<Map<String, dynamic>> variants}): _tags = tags,_attachments = attachments,_specifications = specifications,_variants = variants;
  factory _CreateListingRequest.fromJson(Map<String, dynamic> json) => _$CreateListingRequestFromJson(json);

@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'category_id') final  String categoryId;
@override@JsonKey(name: 'condition') final  String condition;
@override@JsonKey(name: 'currency') final  String currency;
@override@JsonKey(name: 'price_mode') final  String priceMode;
@override final  String? description;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _attachments;
@override List<String>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _specifications;
@override Map<String, dynamic>? get specifications {
  final value = _specifications;
  if (value == null) return null;
  if (_specifications is EqualUnmodifiableMapView) return _specifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<Map<String, dynamic>> _variants;
@override List<Map<String, dynamic>> get variants {
  if (_variants is EqualUnmodifiableListView) return _variants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_variants);
}


/// Create a copy of CreateListingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateListingRequestCopyWith<_CreateListingRequest> get copyWith => __$CreateListingRequestCopyWithImpl<_CreateListingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateListingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateListingRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&const DeepCollectionEquality().equals(other._specifications, _specifications)&&const DeepCollectionEquality().equals(other._variants, _variants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,categoryId,condition,currency,priceMode,description,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_attachments),const DeepCollectionEquality().hash(_specifications),const DeepCollectionEquality().hash(_variants));

@override
String toString() {
  return 'CreateListingRequest(name: $name, categoryId: $categoryId, condition: $condition, currency: $currency, priceMode: $priceMode, description: $description, tags: $tags, attachments: $attachments, specifications: $specifications, variants: $variants)';
}


}

/// @nodoc
abstract mixin class _$CreateListingRequestCopyWith<$Res> implements $CreateListingRequestCopyWith<$Res> {
  factory _$CreateListingRequestCopyWith(_CreateListingRequest value, $Res Function(_CreateListingRequest) _then) = __$CreateListingRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'name') String name,@JsonKey(name: 'category_id') String categoryId,@JsonKey(name: 'condition') String condition,@JsonKey(name: 'currency') String currency,@JsonKey(name: 'price_mode') String priceMode, String? description, List<String>? tags, List<String>? attachments, Map<String, dynamic>? specifications, List<Map<String, dynamic>> variants
});




}
/// @nodoc
class __$CreateListingRequestCopyWithImpl<$Res>
    implements _$CreateListingRequestCopyWith<$Res> {
  __$CreateListingRequestCopyWithImpl(this._self, this._then);

  final _CreateListingRequest _self;
  final $Res Function(_CreateListingRequest) _then;

/// Create a copy of CreateListingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? categoryId = null,Object? condition = null,Object? currency = null,Object? priceMode = null,Object? description = freezed,Object? tags = freezed,Object? attachments = freezed,Object? specifications = freezed,Object? variants = null,}) {
  return _then(_CreateListingRequest(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,categoryId: null == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,priceMode: null == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,specifications: freezed == specifications ? _self._specifications : specifications // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,variants: null == variants ? _self._variants : variants // ignore: cast_nullable_to_non_nullable
as List<Map<String, dynamic>>,
  ));
}


}


/// @nodoc
mixin _$UpdateListingRequest {

 String? get name;@JsonKey(name: 'category_id') String? get categoryId; String? get condition; String? get description;@JsonKey(name: 'price_mode') String? get priceMode; List<String>? get tags; List<String>? get attachments; Map<String, dynamic>? get specifications;
/// Create a copy of UpdateListingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateListingRequestCopyWith<UpdateListingRequest> get copyWith => _$UpdateListingRequestCopyWithImpl<UpdateListingRequest>(this as UpdateListingRequest, _$identity);

  /// Serializes this UpdateListingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateListingRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.description, description) || other.description == description)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&const DeepCollectionEquality().equals(other.specifications, specifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,categoryId,condition,description,priceMode,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(attachments),const DeepCollectionEquality().hash(specifications));

@override
String toString() {
  return 'UpdateListingRequest(name: $name, categoryId: $categoryId, condition: $condition, description: $description, priceMode: $priceMode, tags: $tags, attachments: $attachments, specifications: $specifications)';
}


}

/// @nodoc
abstract mixin class $UpdateListingRequestCopyWith<$Res>  {
  factory $UpdateListingRequestCopyWith(UpdateListingRequest value, $Res Function(UpdateListingRequest) _then) = _$UpdateListingRequestCopyWithImpl;
@useResult
$Res call({
 String? name,@JsonKey(name: 'category_id') String? categoryId, String? condition, String? description,@JsonKey(name: 'price_mode') String? priceMode, List<String>? tags, List<String>? attachments, Map<String, dynamic>? specifications
});




}
/// @nodoc
class _$UpdateListingRequestCopyWithImpl<$Res>
    implements $UpdateListingRequestCopyWith<$Res> {
  _$UpdateListingRequestCopyWithImpl(this._self, this._then);

  final UpdateListingRequest _self;
  final $Res Function(UpdateListingRequest) _then;

/// Create a copy of UpdateListingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? categoryId = freezed,Object? condition = freezed,Object? description = freezed,Object? priceMode = freezed,Object? tags = freezed,Object? attachments = freezed,Object? specifications = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,priceMode: freezed == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,specifications: freezed == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateListingRequest].
extension UpdateListingRequestPatterns on UpdateListingRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateListingRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateListingRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateListingRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateListingRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateListingRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateListingRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name, @JsonKey(name: 'category_id')  String? categoryId,  String? condition,  String? description, @JsonKey(name: 'price_mode')  String? priceMode,  List<String>? tags,  List<String>? attachments,  Map<String, dynamic>? specifications)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateListingRequest() when $default != null:
return $default(_that.name,_that.categoryId,_that.condition,_that.description,_that.priceMode,_that.tags,_that.attachments,_that.specifications);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name, @JsonKey(name: 'category_id')  String? categoryId,  String? condition,  String? description, @JsonKey(name: 'price_mode')  String? priceMode,  List<String>? tags,  List<String>? attachments,  Map<String, dynamic>? specifications)  $default,) {final _that = this;
switch (_that) {
case _UpdateListingRequest():
return $default(_that.name,_that.categoryId,_that.condition,_that.description,_that.priceMode,_that.tags,_that.attachments,_that.specifications);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name, @JsonKey(name: 'category_id')  String? categoryId,  String? condition,  String? description, @JsonKey(name: 'price_mode')  String? priceMode,  List<String>? tags,  List<String>? attachments,  Map<String, dynamic>? specifications)?  $default,) {final _that = this;
switch (_that) {
case _UpdateListingRequest() when $default != null:
return $default(_that.name,_that.categoryId,_that.condition,_that.description,_that.priceMode,_that.tags,_that.attachments,_that.specifications);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateListingRequest implements UpdateListingRequest {
  const _UpdateListingRequest({this.name, @JsonKey(name: 'category_id') this.categoryId, this.condition, this.description, @JsonKey(name: 'price_mode') this.priceMode, final  List<String>? tags, final  List<String>? attachments, final  Map<String, dynamic>? specifications}): _tags = tags,_attachments = attachments,_specifications = specifications;
  factory _UpdateListingRequest.fromJson(Map<String, dynamic> json) => _$UpdateListingRequestFromJson(json);

@override final  String? name;
@override@JsonKey(name: 'category_id') final  String? categoryId;
@override final  String? condition;
@override final  String? description;
@override@JsonKey(name: 'price_mode') final  String? priceMode;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<String>? _attachments;
@override List<String>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  Map<String, dynamic>? _specifications;
@override Map<String, dynamic>? get specifications {
  final value = _specifications;
  if (value == null) return null;
  if (_specifications is EqualUnmodifiableMapView) return _specifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of UpdateListingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateListingRequestCopyWith<_UpdateListingRequest> get copyWith => __$UpdateListingRequestCopyWithImpl<_UpdateListingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateListingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateListingRequest&&(identical(other.name, name) || other.name == name)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.description, description) || other.description == description)&&(identical(other.priceMode, priceMode) || other.priceMode == priceMode)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&const DeepCollectionEquality().equals(other._specifications, _specifications));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,categoryId,condition,description,priceMode,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_attachments),const DeepCollectionEquality().hash(_specifications));

@override
String toString() {
  return 'UpdateListingRequest(name: $name, categoryId: $categoryId, condition: $condition, description: $description, priceMode: $priceMode, tags: $tags, attachments: $attachments, specifications: $specifications)';
}


}

/// @nodoc
abstract mixin class _$UpdateListingRequestCopyWith<$Res> implements $UpdateListingRequestCopyWith<$Res> {
  factory _$UpdateListingRequestCopyWith(_UpdateListingRequest value, $Res Function(_UpdateListingRequest) _then) = __$UpdateListingRequestCopyWithImpl;
@override @useResult
$Res call({
 String? name,@JsonKey(name: 'category_id') String? categoryId, String? condition, String? description,@JsonKey(name: 'price_mode') String? priceMode, List<String>? tags, List<String>? attachments, Map<String, dynamic>? specifications
});




}
/// @nodoc
class __$UpdateListingRequestCopyWithImpl<$Res>
    implements _$UpdateListingRequestCopyWith<$Res> {
  __$UpdateListingRequestCopyWithImpl(this._self, this._then);

  final _UpdateListingRequest _self;
  final $Res Function(_UpdateListingRequest) _then;

/// Create a copy of UpdateListingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? categoryId = freezed,Object? condition = freezed,Object? description = freezed,Object? priceMode = freezed,Object? tags = freezed,Object? attachments = freezed,Object? specifications = freezed,}) {
  return _then(_UpdateListingRequest(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as String?,condition: freezed == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,priceMode: freezed == priceMode ? _self.priceMode : priceMode // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,specifications: freezed == specifications ? _self._specifications : specifications // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}


/// @nodoc
mixin _$SubmitReviewRequest {

@JsonKey(name: 'order_id') String get orderId; int get rating; String? get body; List<String>? get attachments;
/// Create a copy of SubmitReviewRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitReviewRequestCopyWith<SubmitReviewRequest> get copyWith => _$SubmitReviewRequestCopyWithImpl<SubmitReviewRequest>(this as SubmitReviewRequest, _$identity);

  /// Serializes this SubmitReviewRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitReviewRequest&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other.attachments, attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,rating,body,const DeepCollectionEquality().hash(attachments));

@override
String toString() {
  return 'SubmitReviewRequest(orderId: $orderId, rating: $rating, body: $body, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $SubmitReviewRequestCopyWith<$Res>  {
  factory $SubmitReviewRequestCopyWith(SubmitReviewRequest value, $Res Function(SubmitReviewRequest) _then) = _$SubmitReviewRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'order_id') String orderId, int rating, String? body, List<String>? attachments
});




}
/// @nodoc
class _$SubmitReviewRequestCopyWithImpl<$Res>
    implements $SubmitReviewRequestCopyWith<$Res> {
  _$SubmitReviewRequestCopyWithImpl(this._self, this._then);

  final SubmitReviewRequest _self;
  final $Res Function(SubmitReviewRequest) _then;

/// Create a copy of SubmitReviewRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? rating = null,Object? body = freezed,Object? attachments = freezed,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitReviewRequest].
extension SubmitReviewRequestPatterns on SubmitReviewRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitReviewRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitReviewRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitReviewRequest value)  $default,){
final _that = this;
switch (_that) {
case _SubmitReviewRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitReviewRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitReviewRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  String orderId,  int rating,  String? body,  List<String>? attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitReviewRequest() when $default != null:
return $default(_that.orderId,_that.rating,_that.body,_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  String orderId,  int rating,  String? body,  List<String>? attachments)  $default,) {final _that = this;
switch (_that) {
case _SubmitReviewRequest():
return $default(_that.orderId,_that.rating,_that.body,_that.attachments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'order_id')  String orderId,  int rating,  String? body,  List<String>? attachments)?  $default,) {final _that = this;
switch (_that) {
case _SubmitReviewRequest() when $default != null:
return $default(_that.orderId,_that.rating,_that.body,_that.attachments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmitReviewRequest implements SubmitReviewRequest {
  const _SubmitReviewRequest({@JsonKey(name: 'order_id') required this.orderId, required this.rating, this.body, final  List<String>? attachments}): _attachments = attachments;
  factory _SubmitReviewRequest.fromJson(Map<String, dynamic> json) => _$SubmitReviewRequestFromJson(json);

@override@JsonKey(name: 'order_id') final  String orderId;
@override final  int rating;
@override final  String? body;
 final  List<String>? _attachments;
@override List<String>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of SubmitReviewRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitReviewRequestCopyWith<_SubmitReviewRequest> get copyWith => __$SubmitReviewRequestCopyWithImpl<_SubmitReviewRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitReviewRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitReviewRequest&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.body, body) || other.body == body)&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,rating,body,const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'SubmitReviewRequest(orderId: $orderId, rating: $rating, body: $body, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$SubmitReviewRequestCopyWith<$Res> implements $SubmitReviewRequestCopyWith<$Res> {
  factory _$SubmitReviewRequestCopyWith(_SubmitReviewRequest value, $Res Function(_SubmitReviewRequest) _then) = __$SubmitReviewRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'order_id') String orderId, int rating, String? body, List<String>? attachments
});




}
/// @nodoc
class __$SubmitReviewRequestCopyWithImpl<$Res>
    implements _$SubmitReviewRequestCopyWith<$Res> {
  __$SubmitReviewRequestCopyWithImpl(this._self, this._then);

  final _SubmitReviewRequest _self;
  final $Res Function(_SubmitReviewRequest) _then;

/// Create a copy of SubmitReviewRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? rating = null,Object? body = freezed,Object? attachments = freezed,}) {
  return _then(_SubmitReviewRequest(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,body: freezed == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$VoteReviewRequest {

 int get vote;
/// Create a copy of VoteReviewRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VoteReviewRequestCopyWith<VoteReviewRequest> get copyWith => _$VoteReviewRequestCopyWithImpl<VoteReviewRequest>(this as VoteReviewRequest, _$identity);

  /// Serializes this VoteReviewRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VoteReviewRequest&&(identical(other.vote, vote) || other.vote == vote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vote);

@override
String toString() {
  return 'VoteReviewRequest(vote: $vote)';
}


}

/// @nodoc
abstract mixin class $VoteReviewRequestCopyWith<$Res>  {
  factory $VoteReviewRequestCopyWith(VoteReviewRequest value, $Res Function(VoteReviewRequest) _then) = _$VoteReviewRequestCopyWithImpl;
@useResult
$Res call({
 int vote
});




}
/// @nodoc
class _$VoteReviewRequestCopyWithImpl<$Res>
    implements $VoteReviewRequestCopyWith<$Res> {
  _$VoteReviewRequestCopyWithImpl(this._self, this._then);

  final VoteReviewRequest _self;
  final $Res Function(VoteReviewRequest) _then;

/// Create a copy of VoteReviewRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? vote = null,}) {
  return _then(_self.copyWith(
vote: null == vote ? _self.vote : vote // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [VoteReviewRequest].
extension VoteReviewRequestPatterns on VoteReviewRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VoteReviewRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VoteReviewRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VoteReviewRequest value)  $default,){
final _that = this;
switch (_that) {
case _VoteReviewRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VoteReviewRequest value)?  $default,){
final _that = this;
switch (_that) {
case _VoteReviewRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int vote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VoteReviewRequest() when $default != null:
return $default(_that.vote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int vote)  $default,) {final _that = this;
switch (_that) {
case _VoteReviewRequest():
return $default(_that.vote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int vote)?  $default,) {final _that = this;
switch (_that) {
case _VoteReviewRequest() when $default != null:
return $default(_that.vote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VoteReviewRequest implements VoteReviewRequest {
  const _VoteReviewRequest({required this.vote});
  factory _VoteReviewRequest.fromJson(Map<String, dynamic> json) => _$VoteReviewRequestFromJson(json);

@override final  int vote;

/// Create a copy of VoteReviewRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VoteReviewRequestCopyWith<_VoteReviewRequest> get copyWith => __$VoteReviewRequestCopyWithImpl<_VoteReviewRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VoteReviewRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VoteReviewRequest&&(identical(other.vote, vote) || other.vote == vote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,vote);

@override
String toString() {
  return 'VoteReviewRequest(vote: $vote)';
}


}

/// @nodoc
abstract mixin class _$VoteReviewRequestCopyWith<$Res> implements $VoteReviewRequestCopyWith<$Res> {
  factory _$VoteReviewRequestCopyWith(_VoteReviewRequest value, $Res Function(_VoteReviewRequest) _then) = __$VoteReviewRequestCopyWithImpl;
@override @useResult
$Res call({
 int vote
});




}
/// @nodoc
class __$VoteReviewRequestCopyWithImpl<$Res>
    implements _$VoteReviewRequestCopyWith<$Res> {
  __$VoteReviewRequestCopyWithImpl(this._self, this._then);

  final _VoteReviewRequest _self;
  final $Res Function(_VoteReviewRequest) _then;

/// Create a copy of VoteReviewRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? vote = null,}) {
  return _then(_VoteReviewRequest(
vote: null == vote ? _self.vote : vote // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
