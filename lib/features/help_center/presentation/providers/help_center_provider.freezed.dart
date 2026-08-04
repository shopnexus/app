// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'help_center_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HelpCenterState {

 List<Ticket> get tickets; List<FaqItem> get faqs; String get selectedCategory; String get searchQuery; bool get isLoading; String? get errorMessage;
/// Create a copy of HelpCenterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HelpCenterStateCopyWith<HelpCenterState> get copyWith => _$HelpCenterStateCopyWithImpl<HelpCenterState>(this as HelpCenterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HelpCenterState&&const DeepCollectionEquality().equals(other.tickets, tickets)&&const DeepCollectionEquality().equals(other.faqs, faqs)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(tickets),const DeepCollectionEquality().hash(faqs),selectedCategory,searchQuery,isLoading,errorMessage);

@override
String toString() {
  return 'HelpCenterState(tickets: $tickets, faqs: $faqs, selectedCategory: $selectedCategory, searchQuery: $searchQuery, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $HelpCenterStateCopyWith<$Res>  {
  factory $HelpCenterStateCopyWith(HelpCenterState value, $Res Function(HelpCenterState) _then) = _$HelpCenterStateCopyWithImpl;
@useResult
$Res call({
 List<Ticket> tickets, List<FaqItem> faqs, String selectedCategory, String searchQuery, bool isLoading, String? errorMessage
});




}
/// @nodoc
class _$HelpCenterStateCopyWithImpl<$Res>
    implements $HelpCenterStateCopyWith<$Res> {
  _$HelpCenterStateCopyWithImpl(this._self, this._then);

  final HelpCenterState _self;
  final $Res Function(HelpCenterState) _then;

/// Create a copy of HelpCenterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tickets = null,Object? faqs = null,Object? selectedCategory = null,Object? searchQuery = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
tickets: null == tickets ? _self.tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<Ticket>,faqs: null == faqs ? _self.faqs : faqs // ignore: cast_nullable_to_non_nullable
as List<FaqItem>,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HelpCenterState].
extension HelpCenterStatePatterns on HelpCenterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HelpCenterState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HelpCenterState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HelpCenterState value)  $default,){
final _that = this;
switch (_that) {
case _HelpCenterState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HelpCenterState value)?  $default,){
final _that = this;
switch (_that) {
case _HelpCenterState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Ticket> tickets,  List<FaqItem> faqs,  String selectedCategory,  String searchQuery,  bool isLoading,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HelpCenterState() when $default != null:
return $default(_that.tickets,_that.faqs,_that.selectedCategory,_that.searchQuery,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Ticket> tickets,  List<FaqItem> faqs,  String selectedCategory,  String searchQuery,  bool isLoading,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _HelpCenterState():
return $default(_that.tickets,_that.faqs,_that.selectedCategory,_that.searchQuery,_that.isLoading,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Ticket> tickets,  List<FaqItem> faqs,  String selectedCategory,  String searchQuery,  bool isLoading,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _HelpCenterState() when $default != null:
return $default(_that.tickets,_that.faqs,_that.selectedCategory,_that.searchQuery,_that.isLoading,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _HelpCenterState extends HelpCenterState {
  const _HelpCenterState({final  List<Ticket> tickets = const [], final  List<FaqItem> faqs = const [], this.selectedCategory = 'Tất cả', this.searchQuery = '', this.isLoading = false, this.errorMessage}): _tickets = tickets,_faqs = faqs,super._();
  

 final  List<Ticket> _tickets;
@override@JsonKey() List<Ticket> get tickets {
  if (_tickets is EqualUnmodifiableListView) return _tickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tickets);
}

 final  List<FaqItem> _faqs;
@override@JsonKey() List<FaqItem> get faqs {
  if (_faqs is EqualUnmodifiableListView) return _faqs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_faqs);
}

@override@JsonKey() final  String selectedCategory;
@override@JsonKey() final  String searchQuery;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;

/// Create a copy of HelpCenterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HelpCenterStateCopyWith<_HelpCenterState> get copyWith => __$HelpCenterStateCopyWithImpl<_HelpCenterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HelpCenterState&&const DeepCollectionEquality().equals(other._tickets, _tickets)&&const DeepCollectionEquality().equals(other._faqs, _faqs)&&(identical(other.selectedCategory, selectedCategory) || other.selectedCategory == selectedCategory)&&(identical(other.searchQuery, searchQuery) || other.searchQuery == searchQuery)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_tickets),const DeepCollectionEquality().hash(_faqs),selectedCategory,searchQuery,isLoading,errorMessage);

@override
String toString() {
  return 'HelpCenterState(tickets: $tickets, faqs: $faqs, selectedCategory: $selectedCategory, searchQuery: $searchQuery, isLoading: $isLoading, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$HelpCenterStateCopyWith<$Res> implements $HelpCenterStateCopyWith<$Res> {
  factory _$HelpCenterStateCopyWith(_HelpCenterState value, $Res Function(_HelpCenterState) _then) = __$HelpCenterStateCopyWithImpl;
@override @useResult
$Res call({
 List<Ticket> tickets, List<FaqItem> faqs, String selectedCategory, String searchQuery, bool isLoading, String? errorMessage
});




}
/// @nodoc
class __$HelpCenterStateCopyWithImpl<$Res>
    implements _$HelpCenterStateCopyWith<$Res> {
  __$HelpCenterStateCopyWithImpl(this._self, this._then);

  final _HelpCenterState _self;
  final $Res Function(_HelpCenterState) _then;

/// Create a copy of HelpCenterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tickets = null,Object? faqs = null,Object? selectedCategory = null,Object? searchQuery = null,Object? isLoading = null,Object? errorMessage = freezed,}) {
  return _then(_HelpCenterState(
tickets: null == tickets ? _self._tickets : tickets // ignore: cast_nullable_to_non_nullable
as List<Ticket>,faqs: null == faqs ? _self._faqs : faqs // ignore: cast_nullable_to_non_nullable
as List<FaqItem>,selectedCategory: null == selectedCategory ? _self.selectedCategory : selectedCategory // ignore: cast_nullable_to_non_nullable
as String,searchQuery: null == searchQuery ? _self.searchQuery : searchQuery // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
