// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'help_ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HelpTicket {

 String get id; String get title; String get description; String get category; String get status;// 'open' | 'in_progress' | 'waiting' | 'resolved' | 'closed'
@JsonKey(name: 'created_at') String get createdAt;@JsonKey(name: 'updated_at') String get updatedAt;@JsonKey(name: 'last_message') String? get lastMessage; List<String>? get attachments;
/// Create a copy of HelpTicket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HelpTicketCopyWith<HelpTicket> get copyWith => _$HelpTicketCopyWithImpl<HelpTicket>(this as HelpTicket, _$identity);

  /// Serializes this HelpTicket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpTicket&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&const DeepCollectionEquality().equals(other.attachments, attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,category,status,createdAt,updatedAt,lastMessage,const DeepCollectionEquality().hash(attachments));

@override
String toString() {
  return 'HelpTicket(id: $id, title: $title, description: $description, category: $category, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, lastMessage: $lastMessage, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $HelpTicketCopyWith<$Res>  {
  factory $HelpTicketCopyWith(HelpTicket value, $Res Function(HelpTicket) _then) = _$HelpTicketCopyWithImpl;
@useResult
$Res call({
 String id, String title, String description, String category, String status,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'last_message') String? lastMessage, List<String>? attachments
});




}
/// @nodoc
class _$HelpTicketCopyWithImpl<$Res>
    implements $HelpTicketCopyWith<$Res> {
  _$HelpTicketCopyWithImpl(this._self, this._then);

  final HelpTicket _self;
  final $Res Function(HelpTicket) _then;

/// Create a copy of HelpTicket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? description = null,Object? category = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? lastMessage = freezed,Object? attachments = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [HelpTicket].
extension HelpTicketPatterns on HelpTicket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HelpTicket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HelpTicket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HelpTicket value)  $default,){
final _that = this;
switch (_that) {
case _HelpTicket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HelpTicket value)?  $default,){
final _that = this;
switch (_that) {
case _HelpTicket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String category,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'last_message')  String? lastMessage,  List<String>? attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HelpTicket() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category,_that.status,_that.createdAt,_that.updatedAt,_that.lastMessage,_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String description,  String category,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'last_message')  String? lastMessage,  List<String>? attachments)  $default,) {final _that = this;
switch (_that) {
case _HelpTicket():
return $default(_that.id,_that.title,_that.description,_that.category,_that.status,_that.createdAt,_that.updatedAt,_that.lastMessage,_that.attachments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String description,  String category,  String status, @JsonKey(name: 'created_at')  String createdAt, @JsonKey(name: 'updated_at')  String updatedAt, @JsonKey(name: 'last_message')  String? lastMessage,  List<String>? attachments)?  $default,) {final _that = this;
switch (_that) {
case _HelpTicket() when $default != null:
return $default(_that.id,_that.title,_that.description,_that.category,_that.status,_that.createdAt,_that.updatedAt,_that.lastMessage,_that.attachments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HelpTicket implements HelpTicket {
  const _HelpTicket({required this.id, required this.title, required this.description, required this.category, required this.status, @JsonKey(name: 'created_at') required this.createdAt, @JsonKey(name: 'updated_at') required this.updatedAt, @JsonKey(name: 'last_message') this.lastMessage, final  List<String>? attachments}): _attachments = attachments;
  factory _HelpTicket.fromJson(Map<String, dynamic> json) => _$HelpTicketFromJson(json);

@override final  String id;
@override final  String title;
@override final  String description;
@override final  String category;
@override final  String status;
// 'open' | 'in_progress' | 'waiting' | 'resolved' | 'closed'
@override@JsonKey(name: 'created_at') final  String createdAt;
@override@JsonKey(name: 'updated_at') final  String updatedAt;
@override@JsonKey(name: 'last_message') final  String? lastMessage;
 final  List<String>? _attachments;
@override List<String>? get attachments {
  final value = _attachments;
  if (value == null) return null;
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of HelpTicket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HelpTicketCopyWith<_HelpTicket> get copyWith => __$HelpTicketCopyWithImpl<_HelpTicket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HelpTicketToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HelpTicket&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.status, status) || other.status == status)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastMessage, lastMessage) || other.lastMessage == lastMessage)&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,description,category,status,createdAt,updatedAt,lastMessage,const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'HelpTicket(id: $id, title: $title, description: $description, category: $category, status: $status, createdAt: $createdAt, updatedAt: $updatedAt, lastMessage: $lastMessage, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$HelpTicketCopyWith<$Res> implements $HelpTicketCopyWith<$Res> {
  factory _$HelpTicketCopyWith(_HelpTicket value, $Res Function(_HelpTicket) _then) = __$HelpTicketCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String description, String category, String status,@JsonKey(name: 'created_at') String createdAt,@JsonKey(name: 'updated_at') String updatedAt,@JsonKey(name: 'last_message') String? lastMessage, List<String>? attachments
});




}
/// @nodoc
class __$HelpTicketCopyWithImpl<$Res>
    implements _$HelpTicketCopyWith<$Res> {
  __$HelpTicketCopyWithImpl(this._self, this._then);

  final _HelpTicket _self;
  final $Res Function(_HelpTicket) _then;

/// Create a copy of HelpTicket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? description = null,Object? category = null,Object? status = null,Object? createdAt = null,Object? updatedAt = null,Object? lastMessage = freezed,Object? attachments = freezed,}) {
  return _then(_HelpTicket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,lastMessage: freezed == lastMessage ? _self.lastMessage : lastMessage // ignore: cast_nullable_to_non_nullable
as String?,attachments: freezed == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}


/// @nodoc
mixin _$FaqItem {

 String get id; String get question; String get answer; String get category;
/// Create a copy of FaqItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FaqItemCopyWith<FaqItem> get copyWith => _$FaqItemCopyWithImpl<FaqItem>(this as FaqItem, _$identity);

  /// Serializes this FaqItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FaqItem&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,question,answer,category);

@override
String toString() {
  return 'FaqItem(id: $id, question: $question, answer: $answer, category: $category)';
}


}

/// @nodoc
abstract mixin class $FaqItemCopyWith<$Res>  {
  factory $FaqItemCopyWith(FaqItem value, $Res Function(FaqItem) _then) = _$FaqItemCopyWithImpl;
@useResult
$Res call({
 String id, String question, String answer, String category
});




}
/// @nodoc
class _$FaqItemCopyWithImpl<$Res>
    implements $FaqItemCopyWith<$Res> {
  _$FaqItemCopyWithImpl(this._self, this._then);

  final FaqItem _self;
  final $Res Function(FaqItem) _then;

/// Create a copy of FaqItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? question = null,Object? answer = null,Object? category = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [FaqItem].
extension FaqItemPatterns on FaqItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FaqItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FaqItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FaqItem value)  $default,){
final _that = this;
switch (_that) {
case _FaqItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FaqItem value)?  $default,){
final _that = this;
switch (_that) {
case _FaqItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String question,  String answer,  String category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FaqItem() when $default != null:
return $default(_that.id,_that.question,_that.answer,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String question,  String answer,  String category)  $default,) {final _that = this;
switch (_that) {
case _FaqItem():
return $default(_that.id,_that.question,_that.answer,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String question,  String answer,  String category)?  $default,) {final _that = this;
switch (_that) {
case _FaqItem() when $default != null:
return $default(_that.id,_that.question,_that.answer,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FaqItem implements FaqItem {
  const _FaqItem({required this.id, required this.question, required this.answer, required this.category});
  factory _FaqItem.fromJson(Map<String, dynamic> json) => _$FaqItemFromJson(json);

@override final  String id;
@override final  String question;
@override final  String answer;
@override final  String category;

/// Create a copy of FaqItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FaqItemCopyWith<_FaqItem> get copyWith => __$FaqItemCopyWithImpl<_FaqItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FaqItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FaqItem&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.answer, answer) || other.answer == answer)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,question,answer,category);

@override
String toString() {
  return 'FaqItem(id: $id, question: $question, answer: $answer, category: $category)';
}


}

/// @nodoc
abstract mixin class _$FaqItemCopyWith<$Res> implements $FaqItemCopyWith<$Res> {
  factory _$FaqItemCopyWith(_FaqItem value, $Res Function(_FaqItem) _then) = __$FaqItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String question, String answer, String category
});




}
/// @nodoc
class __$FaqItemCopyWithImpl<$Res>
    implements _$FaqItemCopyWith<$Res> {
  __$FaqItemCopyWithImpl(this._self, this._then);

  final _FaqItem _self;
  final $Res Function(_FaqItem) _then;

/// Create a copy of FaqItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? question = null,Object? answer = null,Object? category = null,}) {
  return _then(_FaqItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,answer: null == answer ? _self.answer : answer // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$HelpCenterStats {

@JsonKey(name: 'open_count') int get openCount;@JsonKey(name: 'resolved_count') int get resolvedCount;@JsonKey(name: 'total_count') int get totalCount;
/// Create a copy of HelpCenterStats
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HelpCenterStatsCopyWith<HelpCenterStats> get copyWith => _$HelpCenterStatsCopyWithImpl<HelpCenterStats>(this as HelpCenterStats, _$identity);

  /// Serializes this HelpCenterStats to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpCenterStats&&(identical(other.openCount, openCount) || other.openCount == openCount)&&(identical(other.resolvedCount, resolvedCount) || other.resolvedCount == resolvedCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,openCount,resolvedCount,totalCount);

@override
String toString() {
  return 'HelpCenterStats(openCount: $openCount, resolvedCount: $resolvedCount, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class $HelpCenterStatsCopyWith<$Res>  {
  factory $HelpCenterStatsCopyWith(HelpCenterStats value, $Res Function(HelpCenterStats) _then) = _$HelpCenterStatsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'open_count') int openCount,@JsonKey(name: 'resolved_count') int resolvedCount,@JsonKey(name: 'total_count') int totalCount
});




}
/// @nodoc
class _$HelpCenterStatsCopyWithImpl<$Res>
    implements $HelpCenterStatsCopyWith<$Res> {
  _$HelpCenterStatsCopyWithImpl(this._self, this._then);

  final HelpCenterStats _self;
  final $Res Function(HelpCenterStats) _then;

/// Create a copy of HelpCenterStats
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? openCount = null,Object? resolvedCount = null,Object? totalCount = null,}) {
  return _then(_self.copyWith(
openCount: null == openCount ? _self.openCount : openCount // ignore: cast_nullable_to_non_nullable
as int,resolvedCount: null == resolvedCount ? _self.resolvedCount : resolvedCount // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HelpCenterStats].
extension HelpCenterStatsPatterns on HelpCenterStats {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HelpCenterStats value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HelpCenterStats() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HelpCenterStats value)  $default,){
final _that = this;
switch (_that) {
case _HelpCenterStats():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HelpCenterStats value)?  $default,){
final _that = this;
switch (_that) {
case _HelpCenterStats() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'open_count')  int openCount, @JsonKey(name: 'resolved_count')  int resolvedCount, @JsonKey(name: 'total_count')  int totalCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HelpCenterStats() when $default != null:
return $default(_that.openCount,_that.resolvedCount,_that.totalCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'open_count')  int openCount, @JsonKey(name: 'resolved_count')  int resolvedCount, @JsonKey(name: 'total_count')  int totalCount)  $default,) {final _that = this;
switch (_that) {
case _HelpCenterStats():
return $default(_that.openCount,_that.resolvedCount,_that.totalCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'open_count')  int openCount, @JsonKey(name: 'resolved_count')  int resolvedCount, @JsonKey(name: 'total_count')  int totalCount)?  $default,) {final _that = this;
switch (_that) {
case _HelpCenterStats() when $default != null:
return $default(_that.openCount,_that.resolvedCount,_that.totalCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HelpCenterStats implements HelpCenterStats {
  const _HelpCenterStats({@JsonKey(name: 'open_count') required this.openCount, @JsonKey(name: 'resolved_count') required this.resolvedCount, @JsonKey(name: 'total_count') required this.totalCount});
  factory _HelpCenterStats.fromJson(Map<String, dynamic> json) => _$HelpCenterStatsFromJson(json);

@override@JsonKey(name: 'open_count') final  int openCount;
@override@JsonKey(name: 'resolved_count') final  int resolvedCount;
@override@JsonKey(name: 'total_count') final  int totalCount;

/// Create a copy of HelpCenterStats
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HelpCenterStatsCopyWith<_HelpCenterStats> get copyWith => __$HelpCenterStatsCopyWithImpl<_HelpCenterStats>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HelpCenterStatsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HelpCenterStats&&(identical(other.openCount, openCount) || other.openCount == openCount)&&(identical(other.resolvedCount, resolvedCount) || other.resolvedCount == resolvedCount)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,openCount,resolvedCount,totalCount);

@override
String toString() {
  return 'HelpCenterStats(openCount: $openCount, resolvedCount: $resolvedCount, totalCount: $totalCount)';
}


}

/// @nodoc
abstract mixin class _$HelpCenterStatsCopyWith<$Res> implements $HelpCenterStatsCopyWith<$Res> {
  factory _$HelpCenterStatsCopyWith(_HelpCenterStats value, $Res Function(_HelpCenterStats) _then) = __$HelpCenterStatsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'open_count') int openCount,@JsonKey(name: 'resolved_count') int resolvedCount,@JsonKey(name: 'total_count') int totalCount
});




}
/// @nodoc
class __$HelpCenterStatsCopyWithImpl<$Res>
    implements _$HelpCenterStatsCopyWith<$Res> {
  __$HelpCenterStatsCopyWithImpl(this._self, this._then);

  final _HelpCenterStats _self;
  final $Res Function(_HelpCenterStats) _then;

/// Create a copy of HelpCenterStats
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? openCount = null,Object? resolvedCount = null,Object? totalCount = null,}) {
  return _then(_HelpCenterStats(
openCount: null == openCount ? _self.openCount : openCount // ignore: cast_nullable_to_non_nullable
as int,resolvedCount: null == resolvedCount ? _self.resolvedCount : resolvedCount // ignore: cast_nullable_to_non_nullable
as int,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
