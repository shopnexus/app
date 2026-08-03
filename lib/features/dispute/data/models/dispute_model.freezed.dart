// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dispute_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RefundAttachment {

@JsonKey(name: 'resource_id') String? get resourceId; String? get description; ResourceModel? get resource;
/// Create a copy of RefundAttachment
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefundAttachmentCopyWith<RefundAttachment> get copyWith => _$RefundAttachmentCopyWithImpl<RefundAttachment>(this as RefundAttachment, _$identity);

  /// Serializes this RefundAttachment to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefundAttachment&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.description, description) || other.description == description)&&(identical(other.resource, resource) || other.resource == resource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resourceId,description,resource);

@override
String toString() {
  return 'RefundAttachment(resourceId: $resourceId, description: $description, resource: $resource)';
}


}

/// @nodoc
abstract mixin class $RefundAttachmentCopyWith<$Res>  {
  factory $RefundAttachmentCopyWith(RefundAttachment value, $Res Function(RefundAttachment) _then) = _$RefundAttachmentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'resource_id') String? resourceId, String? description, ResourceModel? resource
});


$ResourceModelCopyWith<$Res>? get resource;

}
/// @nodoc
class _$RefundAttachmentCopyWithImpl<$Res>
    implements $RefundAttachmentCopyWith<$Res> {
  _$RefundAttachmentCopyWithImpl(this._self, this._then);

  final RefundAttachment _self;
  final $Res Function(RefundAttachment) _then;

/// Create a copy of RefundAttachment
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resourceId = freezed,Object? description = freezed,Object? resource = freezed,}) {
  return _then(_self.copyWith(
resourceId: freezed == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,resource: freezed == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as ResourceModel?,
  ));
}
/// Create a copy of RefundAttachment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceModelCopyWith<$Res>? get resource {
    if (_self.resource == null) {
    return null;
  }

  return $ResourceModelCopyWith<$Res>(_self.resource!, (value) {
    return _then(_self.copyWith(resource: value));
  });
}
}


/// Adds pattern-matching-related methods to [RefundAttachment].
extension RefundAttachmentPatterns on RefundAttachment {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefundAttachment value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefundAttachment() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefundAttachment value)  $default,){
final _that = this;
switch (_that) {
case _RefundAttachment():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefundAttachment value)?  $default,){
final _that = this;
switch (_that) {
case _RefundAttachment() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'resource_id')  String? resourceId,  String? description,  ResourceModel? resource)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefundAttachment() when $default != null:
return $default(_that.resourceId,_that.description,_that.resource);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'resource_id')  String? resourceId,  String? description,  ResourceModel? resource)  $default,) {final _that = this;
switch (_that) {
case _RefundAttachment():
return $default(_that.resourceId,_that.description,_that.resource);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'resource_id')  String? resourceId,  String? description,  ResourceModel? resource)?  $default,) {final _that = this;
switch (_that) {
case _RefundAttachment() when $default != null:
return $default(_that.resourceId,_that.description,_that.resource);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefundAttachment implements RefundAttachment {
  const _RefundAttachment({@JsonKey(name: 'resource_id') this.resourceId, this.description, this.resource});
  factory _RefundAttachment.fromJson(Map<String, dynamic> json) => _$RefundAttachmentFromJson(json);

@override@JsonKey(name: 'resource_id') final  String? resourceId;
@override final  String? description;
@override final  ResourceModel? resource;

/// Create a copy of RefundAttachment
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefundAttachmentCopyWith<_RefundAttachment> get copyWith => __$RefundAttachmentCopyWithImpl<_RefundAttachment>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefundAttachmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefundAttachment&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.description, description) || other.description == description)&&(identical(other.resource, resource) || other.resource == resource));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resourceId,description,resource);

@override
String toString() {
  return 'RefundAttachment(resourceId: $resourceId, description: $description, resource: $resource)';
}


}

/// @nodoc
abstract mixin class _$RefundAttachmentCopyWith<$Res> implements $RefundAttachmentCopyWith<$Res> {
  factory _$RefundAttachmentCopyWith(_RefundAttachment value, $Res Function(_RefundAttachment) _then) = __$RefundAttachmentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'resource_id') String? resourceId, String? description, ResourceModel? resource
});


@override $ResourceModelCopyWith<$Res>? get resource;

}
/// @nodoc
class __$RefundAttachmentCopyWithImpl<$Res>
    implements _$RefundAttachmentCopyWith<$Res> {
  __$RefundAttachmentCopyWithImpl(this._self, this._then);

  final _RefundAttachment _self;
  final $Res Function(_RefundAttachment) _then;

/// Create a copy of RefundAttachment
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resourceId = freezed,Object? description = freezed,Object? resource = freezed,}) {
  return _then(_RefundAttachment(
resourceId: freezed == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,resource: freezed == resource ? _self.resource : resource // ignore: cast_nullable_to_non_nullable
as ResourceModel?,
  ));
}

/// Create a copy of RefundAttachment
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ResourceModelCopyWith<$Res>? get resource {
    if (_self.resource == null) {
    return null;
  }

  return $ResourceModelCopyWith<$Res>(_self.resource!, (value) {
    return _then(_self.copyWith(resource: value));
  });
}
}


/// @nodoc
mixin _$CreateRefundRequest {

 String get reason; List<String> get attachments;
/// Create a copy of CreateRefundRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateRefundRequestCopyWith<CreateRefundRequest> get copyWith => _$CreateRefundRequestCopyWithImpl<CreateRefundRequest>(this as CreateRefundRequest, _$identity);

  /// Serializes this CreateRefundRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateRefundRequest&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.attachments, attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,const DeepCollectionEquality().hash(attachments));

@override
String toString() {
  return 'CreateRefundRequest(reason: $reason, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $CreateRefundRequestCopyWith<$Res>  {
  factory $CreateRefundRequestCopyWith(CreateRefundRequest value, $Res Function(CreateRefundRequest) _then) = _$CreateRefundRequestCopyWithImpl;
@useResult
$Res call({
 String reason, List<String> attachments
});




}
/// @nodoc
class _$CreateRefundRequestCopyWithImpl<$Res>
    implements $CreateRefundRequestCopyWith<$Res> {
  _$CreateRefundRequestCopyWithImpl(this._self, this._then);

  final CreateRefundRequest _self;
  final $Res Function(CreateRefundRequest) _then;

/// Create a copy of CreateRefundRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,Object? attachments = null,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateRefundRequest].
extension CreateRefundRequestPatterns on CreateRefundRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateRefundRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateRefundRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateRefundRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreateRefundRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateRefundRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreateRefundRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason,  List<String> attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateRefundRequest() when $default != null:
return $default(_that.reason,_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason,  List<String> attachments)  $default,) {final _that = this;
switch (_that) {
case _CreateRefundRequest():
return $default(_that.reason,_that.attachments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason,  List<String> attachments)?  $default,) {final _that = this;
switch (_that) {
case _CreateRefundRequest() when $default != null:
return $default(_that.reason,_that.attachments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreateRefundRequest implements CreateRefundRequest {
  const _CreateRefundRequest({required this.reason, final  List<String> attachments = const []}): _attachments = attachments;
  factory _CreateRefundRequest.fromJson(Map<String, dynamic> json) => _$CreateRefundRequestFromJson(json);

@override final  String reason;
 final  List<String> _attachments;
@override@JsonKey() List<String> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}


/// Create a copy of CreateRefundRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateRefundRequestCopyWith<_CreateRefundRequest> get copyWith => __$CreateRefundRequestCopyWithImpl<_CreateRefundRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateRefundRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateRefundRequest&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'CreateRefundRequest(reason: $reason, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$CreateRefundRequestCopyWith<$Res> implements $CreateRefundRequestCopyWith<$Res> {
  factory _$CreateRefundRequestCopyWith(_CreateRefundRequest value, $Res Function(_CreateRefundRequest) _then) = __$CreateRefundRequestCopyWithImpl;
@override @useResult
$Res call({
 String reason, List<String> attachments
});




}
/// @nodoc
class __$CreateRefundRequestCopyWithImpl<$Res>
    implements _$CreateRefundRequestCopyWith<$Res> {
  __$CreateRefundRequestCopyWithImpl(this._self, this._then);

  final _CreateRefundRequest _self;
  final $Res Function(_CreateRefundRequest) _then;

/// Create a copy of CreateRefundRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? attachments = null,}) {
  return _then(_CreateRefundRequest(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$BuyerRefundRequest {

@JsonKey(name: 'order_id') String get orderId; String get reason; List<RefundAttachment> get attachments;
/// Create a copy of BuyerRefundRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BuyerRefundRequestCopyWith<BuyerRefundRequest> get copyWith => _$BuyerRefundRequestCopyWithImpl<BuyerRefundRequest>(this as BuyerRefundRequest, _$identity);

  /// Serializes this BuyerRefundRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BuyerRefundRequest&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.attachments, attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,reason,const DeepCollectionEquality().hash(attachments));

@override
String toString() {
  return 'BuyerRefundRequest(orderId: $orderId, reason: $reason, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $BuyerRefundRequestCopyWith<$Res>  {
  factory $BuyerRefundRequestCopyWith(BuyerRefundRequest value, $Res Function(BuyerRefundRequest) _then) = _$BuyerRefundRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'order_id') String orderId, String reason, List<RefundAttachment> attachments
});




}
/// @nodoc
class _$BuyerRefundRequestCopyWithImpl<$Res>
    implements $BuyerRefundRequestCopyWith<$Res> {
  _$BuyerRefundRequestCopyWithImpl(this._self, this._then);

  final BuyerRefundRequest _self;
  final $Res Function(BuyerRefundRequest) _then;

/// Create a copy of BuyerRefundRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderId = null,Object? reason = null,Object? attachments = null,}) {
  return _then(_self.copyWith(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,
  ));
}

}


/// Adds pattern-matching-related methods to [BuyerRefundRequest].
extension BuyerRefundRequestPatterns on BuyerRefundRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BuyerRefundRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BuyerRefundRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BuyerRefundRequest value)  $default,){
final _that = this;
switch (_that) {
case _BuyerRefundRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BuyerRefundRequest value)?  $default,){
final _that = this;
switch (_that) {
case _BuyerRefundRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  String orderId,  String reason,  List<RefundAttachment> attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BuyerRefundRequest() when $default != null:
return $default(_that.orderId,_that.reason,_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'order_id')  String orderId,  String reason,  List<RefundAttachment> attachments)  $default,) {final _that = this;
switch (_that) {
case _BuyerRefundRequest():
return $default(_that.orderId,_that.reason,_that.attachments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'order_id')  String orderId,  String reason,  List<RefundAttachment> attachments)?  $default,) {final _that = this;
switch (_that) {
case _BuyerRefundRequest() when $default != null:
return $default(_that.orderId,_that.reason,_that.attachments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BuyerRefundRequest implements BuyerRefundRequest {
  const _BuyerRefundRequest({@JsonKey(name: 'order_id') required this.orderId, required this.reason, required final  List<RefundAttachment> attachments}): _attachments = attachments;
  factory _BuyerRefundRequest.fromJson(Map<String, dynamic> json) => _$BuyerRefundRequestFromJson(json);

@override@JsonKey(name: 'order_id') final  String orderId;
@override final  String reason;
 final  List<RefundAttachment> _attachments;
@override List<RefundAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}


/// Create a copy of BuyerRefundRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BuyerRefundRequestCopyWith<_BuyerRefundRequest> get copyWith => __$BuyerRefundRequestCopyWithImpl<_BuyerRefundRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BuyerRefundRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BuyerRefundRequest&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,orderId,reason,const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'BuyerRefundRequest(orderId: $orderId, reason: $reason, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$BuyerRefundRequestCopyWith<$Res> implements $BuyerRefundRequestCopyWith<$Res> {
  factory _$BuyerRefundRequestCopyWith(_BuyerRefundRequest value, $Res Function(_BuyerRefundRequest) _then) = __$BuyerRefundRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'order_id') String orderId, String reason, List<RefundAttachment> attachments
});




}
/// @nodoc
class __$BuyerRefundRequestCopyWithImpl<$Res>
    implements _$BuyerRefundRequestCopyWith<$Res> {
  __$BuyerRefundRequestCopyWithImpl(this._self, this._then);

  final _BuyerRefundRequest _self;
  final $Res Function(_BuyerRefundRequest) _then;

/// Create a copy of BuyerRefundRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderId = null,Object? reason = null,Object? attachments = null,}) {
  return _then(_BuyerRefundRequest(
orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,
  ));
}


}


/// @nodoc
mixin _$RejectRefundRequest {

 String get reason;
/// Create a copy of RejectRefundRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RejectRefundRequestCopyWith<RejectRefundRequest> get copyWith => _$RejectRefundRequestCopyWithImpl<RejectRefundRequest>(this as RejectRefundRequest, _$identity);

  /// Serializes this RejectRefundRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RejectRefundRequest&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'RejectRefundRequest(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $RejectRefundRequestCopyWith<$Res>  {
  factory $RejectRefundRequestCopyWith(RejectRefundRequest value, $Res Function(RejectRefundRequest) _then) = _$RejectRefundRequestCopyWithImpl;
@useResult
$Res call({
 String reason
});




}
/// @nodoc
class _$RejectRefundRequestCopyWithImpl<$Res>
    implements $RejectRefundRequestCopyWith<$Res> {
  _$RejectRefundRequestCopyWithImpl(this._self, this._then);

  final RejectRefundRequest _self;
  final $Res Function(RejectRefundRequest) _then;

/// Create a copy of RejectRefundRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RejectRefundRequest].
extension RejectRefundRequestPatterns on RejectRefundRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RejectRefundRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RejectRefundRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RejectRefundRequest value)  $default,){
final _that = this;
switch (_that) {
case _RejectRefundRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RejectRefundRequest value)?  $default,){
final _that = this;
switch (_that) {
case _RejectRefundRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RejectRefundRequest() when $default != null:
return $default(_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason)  $default,) {final _that = this;
switch (_that) {
case _RejectRefundRequest():
return $default(_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason)?  $default,) {final _that = this;
switch (_that) {
case _RejectRefundRequest() when $default != null:
return $default(_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RejectRefundRequest implements RejectRefundRequest {
  const _RejectRefundRequest({required this.reason});
  factory _RejectRefundRequest.fromJson(Map<String, dynamic> json) => _$RejectRefundRequestFromJson(json);

@override final  String reason;

/// Create a copy of RejectRefundRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RejectRefundRequestCopyWith<_RejectRefundRequest> get copyWith => __$RejectRefundRequestCopyWithImpl<_RejectRefundRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RejectRefundRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RejectRefundRequest&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'RejectRefundRequest(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$RejectRefundRequestCopyWith<$Res> implements $RejectRefundRequestCopyWith<$Res> {
  factory _$RejectRefundRequestCopyWith(_RejectRefundRequest value, $Res Function(_RejectRefundRequest) _then) = __$RejectRefundRequestCopyWithImpl;
@override @useResult
$Res call({
 String reason
});




}
/// @nodoc
class __$RejectRefundRequestCopyWithImpl<$Res>
    implements _$RejectRefundRequestCopyWith<$Res> {
  __$RejectRefundRequestCopyWithImpl(this._self, this._then);

  final _RejectRefundRequest _self;
  final $Res Function(_RejectRefundRequest) _then;

/// Create a copy of RejectRefundRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(_RejectRefundRequest(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$OpenDisputeRequest {

 String get reason;
/// Create a copy of OpenDisputeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenDisputeRequestCopyWith<OpenDisputeRequest> get copyWith => _$OpenDisputeRequestCopyWithImpl<OpenDisputeRequest>(this as OpenDisputeRequest, _$identity);

  /// Serializes this OpenDisputeRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenDisputeRequest&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'OpenDisputeRequest(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $OpenDisputeRequestCopyWith<$Res>  {
  factory $OpenDisputeRequestCopyWith(OpenDisputeRequest value, $Res Function(OpenDisputeRequest) _then) = _$OpenDisputeRequestCopyWithImpl;
@useResult
$Res call({
 String reason
});




}
/// @nodoc
class _$OpenDisputeRequestCopyWithImpl<$Res>
    implements $OpenDisputeRequestCopyWith<$Res> {
  _$OpenDisputeRequestCopyWithImpl(this._self, this._then);

  final OpenDisputeRequest _self;
  final $Res Function(OpenDisputeRequest) _then;

/// Create a copy of OpenDisputeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenDisputeRequest].
extension OpenDisputeRequestPatterns on OpenDisputeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenDisputeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenDisputeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenDisputeRequest value)  $default,){
final _that = this;
switch (_that) {
case _OpenDisputeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenDisputeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _OpenDisputeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenDisputeRequest() when $default != null:
return $default(_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason)  $default,) {final _that = this;
switch (_that) {
case _OpenDisputeRequest():
return $default(_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason)?  $default,) {final _that = this;
switch (_that) {
case _OpenDisputeRequest() when $default != null:
return $default(_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenDisputeRequest implements OpenDisputeRequest {
  const _OpenDisputeRequest({required this.reason});
  factory _OpenDisputeRequest.fromJson(Map<String, dynamic> json) => _$OpenDisputeRequestFromJson(json);

@override final  String reason;

/// Create a copy of OpenDisputeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenDisputeRequestCopyWith<_OpenDisputeRequest> get copyWith => __$OpenDisputeRequestCopyWithImpl<_OpenDisputeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenDisputeRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenDisputeRequest&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'OpenDisputeRequest(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$OpenDisputeRequestCopyWith<$Res> implements $OpenDisputeRequestCopyWith<$Res> {
  factory _$OpenDisputeRequestCopyWith(_OpenDisputeRequest value, $Res Function(_OpenDisputeRequest) _then) = __$OpenDisputeRequestCopyWithImpl;
@override @useResult
$Res call({
 String reason
});




}
/// @nodoc
class __$OpenDisputeRequestCopyWithImpl<$Res>
    implements _$OpenDisputeRequestCopyWith<$Res> {
  __$OpenDisputeRequestCopyWithImpl(this._self, this._then);

  final _OpenDisputeRequest _self;
  final $Res Function(_OpenDisputeRequest) _then;

/// Create a copy of OpenDisputeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(_OpenDisputeRequest(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$SellerDisputeRequest {

 String get reason; List<RefundAttachment> get attachments;
/// Create a copy of SellerDisputeRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerDisputeRequestCopyWith<SellerDisputeRequest> get copyWith => _$SellerDisputeRequestCopyWithImpl<SellerDisputeRequest>(this as SellerDisputeRequest, _$identity);

  /// Serializes this SellerDisputeRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerDisputeRequest&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.attachments, attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,const DeepCollectionEquality().hash(attachments));

@override
String toString() {
  return 'SellerDisputeRequest(reason: $reason, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $SellerDisputeRequestCopyWith<$Res>  {
  factory $SellerDisputeRequestCopyWith(SellerDisputeRequest value, $Res Function(SellerDisputeRequest) _then) = _$SellerDisputeRequestCopyWithImpl;
@useResult
$Res call({
 String reason, List<RefundAttachment> attachments
});




}
/// @nodoc
class _$SellerDisputeRequestCopyWithImpl<$Res>
    implements $SellerDisputeRequestCopyWith<$Res> {
  _$SellerDisputeRequestCopyWithImpl(this._self, this._then);

  final SellerDisputeRequest _self;
  final $Res Function(SellerDisputeRequest) _then;

/// Create a copy of SellerDisputeRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reason = null,Object? attachments = null,}) {
  return _then(_self.copyWith(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerDisputeRequest].
extension SellerDisputeRequestPatterns on SellerDisputeRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerDisputeRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerDisputeRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerDisputeRequest value)  $default,){
final _that = this;
switch (_that) {
case _SellerDisputeRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerDisputeRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SellerDisputeRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reason,  List<RefundAttachment> attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerDisputeRequest() when $default != null:
return $default(_that.reason,_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reason,  List<RefundAttachment> attachments)  $default,) {final _that = this;
switch (_that) {
case _SellerDisputeRequest():
return $default(_that.reason,_that.attachments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reason,  List<RefundAttachment> attachments)?  $default,) {final _that = this;
switch (_that) {
case _SellerDisputeRequest() when $default != null:
return $default(_that.reason,_that.attachments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SellerDisputeRequest implements SellerDisputeRequest {
  const _SellerDisputeRequest({required this.reason, required final  List<RefundAttachment> attachments}): _attachments = attachments;
  factory _SellerDisputeRequest.fromJson(Map<String, dynamic> json) => _$SellerDisputeRequestFromJson(json);

@override final  String reason;
 final  List<RefundAttachment> _attachments;
@override List<RefundAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}


/// Create a copy of SellerDisputeRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerDisputeRequestCopyWith<_SellerDisputeRequest> get copyWith => __$SellerDisputeRequestCopyWithImpl<_SellerDisputeRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SellerDisputeRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerDisputeRequest&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reason,const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'SellerDisputeRequest(reason: $reason, attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$SellerDisputeRequestCopyWith<$Res> implements $SellerDisputeRequestCopyWith<$Res> {
  factory _$SellerDisputeRequestCopyWith(_SellerDisputeRequest value, $Res Function(_SellerDisputeRequest) _then) = __$SellerDisputeRequestCopyWithImpl;
@override @useResult
$Res call({
 String reason, List<RefundAttachment> attachments
});




}
/// @nodoc
class __$SellerDisputeRequestCopyWithImpl<$Res>
    implements _$SellerDisputeRequestCopyWith<$Res> {
  __$SellerDisputeRequestCopyWithImpl(this._self, this._then);

  final _SellerDisputeRequest _self;
  final $Res Function(_SellerDisputeRequest) _then;

/// Create a copy of SellerDisputeRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reason = null,Object? attachments = null,}) {
  return _then(_SellerDisputeRequest(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,
  ));
}


}


/// @nodoc
mixin _$AddAttachmentsRequest {

 List<String> get attachments;
/// Create a copy of AddAttachmentsRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddAttachmentsRequestCopyWith<AddAttachmentsRequest> get copyWith => _$AddAttachmentsRequestCopyWithImpl<AddAttachmentsRequest>(this as AddAttachmentsRequest, _$identity);

  /// Serializes this AddAttachmentsRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddAttachmentsRequest&&const DeepCollectionEquality().equals(other.attachments, attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(attachments));

@override
String toString() {
  return 'AddAttachmentsRequest(attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class $AddAttachmentsRequestCopyWith<$Res>  {
  factory $AddAttachmentsRequestCopyWith(AddAttachmentsRequest value, $Res Function(AddAttachmentsRequest) _then) = _$AddAttachmentsRequestCopyWithImpl;
@useResult
$Res call({
 List<String> attachments
});




}
/// @nodoc
class _$AddAttachmentsRequestCopyWithImpl<$Res>
    implements $AddAttachmentsRequestCopyWith<$Res> {
  _$AddAttachmentsRequestCopyWithImpl(this._self, this._then);

  final AddAttachmentsRequest _self;
  final $Res Function(AddAttachmentsRequest) _then;

/// Create a copy of AddAttachmentsRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attachments = null,}) {
  return _then(_self.copyWith(
attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AddAttachmentsRequest].
extension AddAttachmentsRequestPatterns on AddAttachmentsRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddAttachmentsRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddAttachmentsRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddAttachmentsRequest value)  $default,){
final _that = this;
switch (_that) {
case _AddAttachmentsRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddAttachmentsRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AddAttachmentsRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> attachments)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddAttachmentsRequest() when $default != null:
return $default(_that.attachments);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> attachments)  $default,) {final _that = this;
switch (_that) {
case _AddAttachmentsRequest():
return $default(_that.attachments);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> attachments)?  $default,) {final _that = this;
switch (_that) {
case _AddAttachmentsRequest() when $default != null:
return $default(_that.attachments);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddAttachmentsRequest implements AddAttachmentsRequest {
  const _AddAttachmentsRequest({required final  List<String> attachments}): _attachments = attachments;
  factory _AddAttachmentsRequest.fromJson(Map<String, dynamic> json) => _$AddAttachmentsRequestFromJson(json);

 final  List<String> _attachments;
@override List<String> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}


/// Create a copy of AddAttachmentsRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddAttachmentsRequestCopyWith<_AddAttachmentsRequest> get copyWith => __$AddAttachmentsRequestCopyWithImpl<_AddAttachmentsRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddAttachmentsRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddAttachmentsRequest&&const DeepCollectionEquality().equals(other._attachments, _attachments));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_attachments));

@override
String toString() {
  return 'AddAttachmentsRequest(attachments: $attachments)';
}


}

/// @nodoc
abstract mixin class _$AddAttachmentsRequestCopyWith<$Res> implements $AddAttachmentsRequestCopyWith<$Res> {
  factory _$AddAttachmentsRequestCopyWith(_AddAttachmentsRequest value, $Res Function(_AddAttachmentsRequest) _then) = __$AddAttachmentsRequestCopyWithImpl;
@override @useResult
$Res call({
 List<String> attachments
});




}
/// @nodoc
class __$AddAttachmentsRequestCopyWithImpl<$Res>
    implements _$AddAttachmentsRequestCopyWith<$Res> {
  __$AddAttachmentsRequestCopyWithImpl(this._self, this._then);

  final _AddAttachmentsRequest _self;
  final $Res Function(_AddAttachmentsRequest) _then;

/// Create a copy of AddAttachmentsRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attachments = null,}) {
  return _then(_AddAttachmentsRequest(
attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$DisputeRulingRequest {

@JsonKey(name: 'buyer_wins') bool get buyerWins; String? get note;
/// Create a copy of DisputeRulingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DisputeRulingRequestCopyWith<DisputeRulingRequest> get copyWith => _$DisputeRulingRequestCopyWithImpl<DisputeRulingRequest>(this as DisputeRulingRequest, _$identity);

  /// Serializes this DisputeRulingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DisputeRulingRequest&&(identical(other.buyerWins, buyerWins) || other.buyerWins == buyerWins)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buyerWins,note);

@override
String toString() {
  return 'DisputeRulingRequest(buyerWins: $buyerWins, note: $note)';
}


}

/// @nodoc
abstract mixin class $DisputeRulingRequestCopyWith<$Res>  {
  factory $DisputeRulingRequestCopyWith(DisputeRulingRequest value, $Res Function(DisputeRulingRequest) _then) = _$DisputeRulingRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'buyer_wins') bool buyerWins, String? note
});




}
/// @nodoc
class _$DisputeRulingRequestCopyWithImpl<$Res>
    implements $DisputeRulingRequestCopyWith<$Res> {
  _$DisputeRulingRequestCopyWithImpl(this._self, this._then);

  final DisputeRulingRequest _self;
  final $Res Function(DisputeRulingRequest) _then;

/// Create a copy of DisputeRulingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? buyerWins = null,Object? note = freezed,}) {
  return _then(_self.copyWith(
buyerWins: null == buyerWins ? _self.buyerWins : buyerWins // ignore: cast_nullable_to_non_nullable
as bool,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [DisputeRulingRequest].
extension DisputeRulingRequestPatterns on DisputeRulingRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DisputeRulingRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DisputeRulingRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DisputeRulingRequest value)  $default,){
final _that = this;
switch (_that) {
case _DisputeRulingRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DisputeRulingRequest value)?  $default,){
final _that = this;
switch (_that) {
case _DisputeRulingRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'buyer_wins')  bool buyerWins,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DisputeRulingRequest() when $default != null:
return $default(_that.buyerWins,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'buyer_wins')  bool buyerWins,  String? note)  $default,) {final _that = this;
switch (_that) {
case _DisputeRulingRequest():
return $default(_that.buyerWins,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'buyer_wins')  bool buyerWins,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _DisputeRulingRequest() when $default != null:
return $default(_that.buyerWins,_that.note);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DisputeRulingRequest implements DisputeRulingRequest {
  const _DisputeRulingRequest({@JsonKey(name: 'buyer_wins') required this.buyerWins, this.note});
  factory _DisputeRulingRequest.fromJson(Map<String, dynamic> json) => _$DisputeRulingRequestFromJson(json);

@override@JsonKey(name: 'buyer_wins') final  bool buyerWins;
@override final  String? note;

/// Create a copy of DisputeRulingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DisputeRulingRequestCopyWith<_DisputeRulingRequest> get copyWith => __$DisputeRulingRequestCopyWithImpl<_DisputeRulingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DisputeRulingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DisputeRulingRequest&&(identical(other.buyerWins, buyerWins) || other.buyerWins == buyerWins)&&(identical(other.note, note) || other.note == note));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,buyerWins,note);

@override
String toString() {
  return 'DisputeRulingRequest(buyerWins: $buyerWins, note: $note)';
}


}

/// @nodoc
abstract mixin class _$DisputeRulingRequestCopyWith<$Res> implements $DisputeRulingRequestCopyWith<$Res> {
  factory _$DisputeRulingRequestCopyWith(_DisputeRulingRequest value, $Res Function(_DisputeRulingRequest) _then) = __$DisputeRulingRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'buyer_wins') bool buyerWins, String? note
});




}
/// @nodoc
class __$DisputeRulingRequestCopyWithImpl<$Res>
    implements _$DisputeRulingRequestCopyWith<$Res> {
  __$DisputeRulingRequestCopyWithImpl(this._self, this._then);

  final _DisputeRulingRequest _self;
  final $Res Function(_DisputeRulingRequest) _then;

/// Create a copy of DisputeRulingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? buyerWins = null,Object? note = freezed,}) {
  return _then(_DisputeRulingRequest(
buyerWins: null == buyerWins ? _self.buyerWins : buyerWins // ignore: cast_nullable_to_non_nullable
as bool,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RefundDisputeModel {

 String get id;@JsonKey(name: 'refund_id') String? get refundId;@JsonKey(name: 'opened_by') String? get openedBy; String? get reason; dynamic get round; String get status;// 'open', 'seller-wins', 'buyer-wins'
 String? get note;@JsonKey(name: 'ruled_at') String? get ruledAt;@JsonKey(name: 'created_at') String? get createdAt;// Backward compatibility fields
@JsonKey(name: 'seller_reason') String? get legacySellerReason;@JsonKey(name: 'seller_attachments') List<RefundAttachment> get sellerAttachments;@JsonKey(name: 'admin_note') String? get legacyAdminNote;@JsonKey(name: 'resolved_at') String? get legacyResolvedAt;
/// Create a copy of RefundDisputeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefundDisputeModelCopyWith<RefundDisputeModel> get copyWith => _$RefundDisputeModelCopyWithImpl<RefundDisputeModel>(this as RefundDisputeModel, _$identity);

  /// Serializes this RefundDisputeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefundDisputeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.refundId, refundId) || other.refundId == refundId)&&(identical(other.openedBy, openedBy) || other.openedBy == openedBy)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.round, round)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note)&&(identical(other.ruledAt, ruledAt) || other.ruledAt == ruledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.legacySellerReason, legacySellerReason) || other.legacySellerReason == legacySellerReason)&&const DeepCollectionEquality().equals(other.sellerAttachments, sellerAttachments)&&(identical(other.legacyAdminNote, legacyAdminNote) || other.legacyAdminNote == legacyAdminNote)&&(identical(other.legacyResolvedAt, legacyResolvedAt) || other.legacyResolvedAt == legacyResolvedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,refundId,openedBy,reason,const DeepCollectionEquality().hash(round),status,note,ruledAt,createdAt,legacySellerReason,const DeepCollectionEquality().hash(sellerAttachments),legacyAdminNote,legacyResolvedAt);

@override
String toString() {
  return 'RefundDisputeModel(id: $id, refundId: $refundId, openedBy: $openedBy, reason: $reason, round: $round, status: $status, note: $note, ruledAt: $ruledAt, createdAt: $createdAt, legacySellerReason: $legacySellerReason, sellerAttachments: $sellerAttachments, legacyAdminNote: $legacyAdminNote, legacyResolvedAt: $legacyResolvedAt)';
}


}

/// @nodoc
abstract mixin class $RefundDisputeModelCopyWith<$Res>  {
  factory $RefundDisputeModelCopyWith(RefundDisputeModel value, $Res Function(RefundDisputeModel) _then) = _$RefundDisputeModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'refund_id') String? refundId,@JsonKey(name: 'opened_by') String? openedBy, String? reason, dynamic round, String status, String? note,@JsonKey(name: 'ruled_at') String? ruledAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'seller_reason') String? legacySellerReason,@JsonKey(name: 'seller_attachments') List<RefundAttachment> sellerAttachments,@JsonKey(name: 'admin_note') String? legacyAdminNote,@JsonKey(name: 'resolved_at') String? legacyResolvedAt
});




}
/// @nodoc
class _$RefundDisputeModelCopyWithImpl<$Res>
    implements $RefundDisputeModelCopyWith<$Res> {
  _$RefundDisputeModelCopyWithImpl(this._self, this._then);

  final RefundDisputeModel _self;
  final $Res Function(RefundDisputeModel) _then;

/// Create a copy of RefundDisputeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? refundId = freezed,Object? openedBy = freezed,Object? reason = freezed,Object? round = freezed,Object? status = null,Object? note = freezed,Object? ruledAt = freezed,Object? createdAt = freezed,Object? legacySellerReason = freezed,Object? sellerAttachments = null,Object? legacyAdminNote = freezed,Object? legacyResolvedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,refundId: freezed == refundId ? _self.refundId : refundId // ignore: cast_nullable_to_non_nullable
as String?,openedBy: freezed == openedBy ? _self.openedBy : openedBy // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as dynamic,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,ruledAt: freezed == ruledAt ? _self.ruledAt : ruledAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,legacySellerReason: freezed == legacySellerReason ? _self.legacySellerReason : legacySellerReason // ignore: cast_nullable_to_non_nullable
as String?,sellerAttachments: null == sellerAttachments ? _self.sellerAttachments : sellerAttachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,legacyAdminNote: freezed == legacyAdminNote ? _self.legacyAdminNote : legacyAdminNote // ignore: cast_nullable_to_non_nullable
as String?,legacyResolvedAt: freezed == legacyResolvedAt ? _self.legacyResolvedAt : legacyResolvedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RefundDisputeModel].
extension RefundDisputeModelPatterns on RefundDisputeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefundDisputeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefundDisputeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefundDisputeModel value)  $default,){
final _that = this;
switch (_that) {
case _RefundDisputeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefundDisputeModel value)?  $default,){
final _that = this;
switch (_that) {
case _RefundDisputeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'refund_id')  String? refundId, @JsonKey(name: 'opened_by')  String? openedBy,  String? reason,  dynamic round,  String status,  String? note, @JsonKey(name: 'ruled_at')  String? ruledAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'seller_reason')  String? legacySellerReason, @JsonKey(name: 'seller_attachments')  List<RefundAttachment> sellerAttachments, @JsonKey(name: 'admin_note')  String? legacyAdminNote, @JsonKey(name: 'resolved_at')  String? legacyResolvedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefundDisputeModel() when $default != null:
return $default(_that.id,_that.refundId,_that.openedBy,_that.reason,_that.round,_that.status,_that.note,_that.ruledAt,_that.createdAt,_that.legacySellerReason,_that.sellerAttachments,_that.legacyAdminNote,_that.legacyResolvedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'refund_id')  String? refundId, @JsonKey(name: 'opened_by')  String? openedBy,  String? reason,  dynamic round,  String status,  String? note, @JsonKey(name: 'ruled_at')  String? ruledAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'seller_reason')  String? legacySellerReason, @JsonKey(name: 'seller_attachments')  List<RefundAttachment> sellerAttachments, @JsonKey(name: 'admin_note')  String? legacyAdminNote, @JsonKey(name: 'resolved_at')  String? legacyResolvedAt)  $default,) {final _that = this;
switch (_that) {
case _RefundDisputeModel():
return $default(_that.id,_that.refundId,_that.openedBy,_that.reason,_that.round,_that.status,_that.note,_that.ruledAt,_that.createdAt,_that.legacySellerReason,_that.sellerAttachments,_that.legacyAdminNote,_that.legacyResolvedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'refund_id')  String? refundId, @JsonKey(name: 'opened_by')  String? openedBy,  String? reason,  dynamic round,  String status,  String? note, @JsonKey(name: 'ruled_at')  String? ruledAt, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'seller_reason')  String? legacySellerReason, @JsonKey(name: 'seller_attachments')  List<RefundAttachment> sellerAttachments, @JsonKey(name: 'admin_note')  String? legacyAdminNote, @JsonKey(name: 'resolved_at')  String? legacyResolvedAt)?  $default,) {final _that = this;
switch (_that) {
case _RefundDisputeModel() when $default != null:
return $default(_that.id,_that.refundId,_that.openedBy,_that.reason,_that.round,_that.status,_that.note,_that.ruledAt,_that.createdAt,_that.legacySellerReason,_that.sellerAttachments,_that.legacyAdminNote,_that.legacyResolvedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefundDisputeModel extends RefundDisputeModel {
  const _RefundDisputeModel({required this.id, @JsonKey(name: 'refund_id') this.refundId, @JsonKey(name: 'opened_by') this.openedBy, this.reason, this.round, this.status = 'open', this.note, @JsonKey(name: 'ruled_at') this.ruledAt, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'seller_reason') this.legacySellerReason, @JsonKey(name: 'seller_attachments') final  List<RefundAttachment> sellerAttachments = const [], @JsonKey(name: 'admin_note') this.legacyAdminNote, @JsonKey(name: 'resolved_at') this.legacyResolvedAt}): _sellerAttachments = sellerAttachments,super._();
  factory _RefundDisputeModel.fromJson(Map<String, dynamic> json) => _$RefundDisputeModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'refund_id') final  String? refundId;
@override@JsonKey(name: 'opened_by') final  String? openedBy;
@override final  String? reason;
@override final  dynamic round;
@override@JsonKey() final  String status;
// 'open', 'seller-wins', 'buyer-wins'
@override final  String? note;
@override@JsonKey(name: 'ruled_at') final  String? ruledAt;
@override@JsonKey(name: 'created_at') final  String? createdAt;
// Backward compatibility fields
@override@JsonKey(name: 'seller_reason') final  String? legacySellerReason;
 final  List<RefundAttachment> _sellerAttachments;
@override@JsonKey(name: 'seller_attachments') List<RefundAttachment> get sellerAttachments {
  if (_sellerAttachments is EqualUnmodifiableListView) return _sellerAttachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sellerAttachments);
}

@override@JsonKey(name: 'admin_note') final  String? legacyAdminNote;
@override@JsonKey(name: 'resolved_at') final  String? legacyResolvedAt;

/// Create a copy of RefundDisputeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefundDisputeModelCopyWith<_RefundDisputeModel> get copyWith => __$RefundDisputeModelCopyWithImpl<_RefundDisputeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefundDisputeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefundDisputeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.refundId, refundId) || other.refundId == refundId)&&(identical(other.openedBy, openedBy) || other.openedBy == openedBy)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.round, round)&&(identical(other.status, status) || other.status == status)&&(identical(other.note, note) || other.note == note)&&(identical(other.ruledAt, ruledAt) || other.ruledAt == ruledAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.legacySellerReason, legacySellerReason) || other.legacySellerReason == legacySellerReason)&&const DeepCollectionEquality().equals(other._sellerAttachments, _sellerAttachments)&&(identical(other.legacyAdminNote, legacyAdminNote) || other.legacyAdminNote == legacyAdminNote)&&(identical(other.legacyResolvedAt, legacyResolvedAt) || other.legacyResolvedAt == legacyResolvedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,refundId,openedBy,reason,const DeepCollectionEquality().hash(round),status,note,ruledAt,createdAt,legacySellerReason,const DeepCollectionEquality().hash(_sellerAttachments),legacyAdminNote,legacyResolvedAt);

@override
String toString() {
  return 'RefundDisputeModel(id: $id, refundId: $refundId, openedBy: $openedBy, reason: $reason, round: $round, status: $status, note: $note, ruledAt: $ruledAt, createdAt: $createdAt, legacySellerReason: $legacySellerReason, sellerAttachments: $sellerAttachments, legacyAdminNote: $legacyAdminNote, legacyResolvedAt: $legacyResolvedAt)';
}


}

/// @nodoc
abstract mixin class _$RefundDisputeModelCopyWith<$Res> implements $RefundDisputeModelCopyWith<$Res> {
  factory _$RefundDisputeModelCopyWith(_RefundDisputeModel value, $Res Function(_RefundDisputeModel) _then) = __$RefundDisputeModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'refund_id') String? refundId,@JsonKey(name: 'opened_by') String? openedBy, String? reason, dynamic round, String status, String? note,@JsonKey(name: 'ruled_at') String? ruledAt,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'seller_reason') String? legacySellerReason,@JsonKey(name: 'seller_attachments') List<RefundAttachment> sellerAttachments,@JsonKey(name: 'admin_note') String? legacyAdminNote,@JsonKey(name: 'resolved_at') String? legacyResolvedAt
});




}
/// @nodoc
class __$RefundDisputeModelCopyWithImpl<$Res>
    implements _$RefundDisputeModelCopyWith<$Res> {
  __$RefundDisputeModelCopyWithImpl(this._self, this._then);

  final _RefundDisputeModel _self;
  final $Res Function(_RefundDisputeModel) _then;

/// Create a copy of RefundDisputeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? refundId = freezed,Object? openedBy = freezed,Object? reason = freezed,Object? round = freezed,Object? status = null,Object? note = freezed,Object? ruledAt = freezed,Object? createdAt = freezed,Object? legacySellerReason = freezed,Object? sellerAttachments = null,Object? legacyAdminNote = freezed,Object? legacyResolvedAt = freezed,}) {
  return _then(_RefundDisputeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,refundId: freezed == refundId ? _self.refundId : refundId // ignore: cast_nullable_to_non_nullable
as String?,openedBy: freezed == openedBy ? _self.openedBy : openedBy // ignore: cast_nullable_to_non_nullable
as String?,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as dynamic,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,ruledAt: freezed == ruledAt ? _self.ruledAt : ruledAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,legacySellerReason: freezed == legacySellerReason ? _self.legacySellerReason : legacySellerReason // ignore: cast_nullable_to_non_nullable
as String?,sellerAttachments: null == sellerAttachments ? _self._sellerAttachments : sellerAttachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,legacyAdminNote: freezed == legacyAdminNote ? _self.legacyAdminNote : legacyAdminNote // ignore: cast_nullable_to_non_nullable
as String?,legacyResolvedAt: freezed == legacyResolvedAt ? _self.legacyResolvedAt : legacyResolvedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RefundModel {

 String get id;@JsonKey(name: 'order_id') String get orderId;@JsonKey(name: 'buyer_id') String? get buyerId;@JsonKey(name: 'seller_id') String? get sellerId; String get status;// 'awaiting-seller-review', 'awaiting-buyer-action', 'disputed', 'returning', 'returned', 'accepted', 'rejected', 'cancelled'
 String get reason; List<RefundAttachment> get attachments;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'deadline_at') String? get deadlineAt;@JsonKey(name: 'rejection_reason') String? get rejectionReason;@JsonKey(name: 'returned_at') String? get returnedAt;@JsonKey(name: 'seller_decided_at') String? get sellerDecidedAt;@JsonKey(name: 'updated_at') String? get updatedAt;// Backward compatibility fields
@JsonKey(name: 'expires_at') String? get legacyExpiresAt;@JsonKey(name: 'seller_response') String? get legacySellerResponse; RefundDisputeModel? get dispute;
/// Create a copy of RefundModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefundModelCopyWith<RefundModel> get copyWith => _$RefundModelCopyWithImpl<RefundModel>(this as RefundModel, _$identity);

  /// Serializes this RefundModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefundModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deadlineAt, deadlineAt) || other.deadlineAt == deadlineAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.returnedAt, returnedAt) || other.returnedAt == returnedAt)&&(identical(other.sellerDecidedAt, sellerDecidedAt) || other.sellerDecidedAt == sellerDecidedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.legacyExpiresAt, legacyExpiresAt) || other.legacyExpiresAt == legacyExpiresAt)&&(identical(other.legacySellerResponse, legacySellerResponse) || other.legacySellerResponse == legacySellerResponse)&&(identical(other.dispute, dispute) || other.dispute == dispute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,buyerId,sellerId,status,reason,const DeepCollectionEquality().hash(attachments),createdAt,deadlineAt,rejectionReason,returnedAt,sellerDecidedAt,updatedAt,legacyExpiresAt,legacySellerResponse,dispute);

@override
String toString() {
  return 'RefundModel(id: $id, orderId: $orderId, buyerId: $buyerId, sellerId: $sellerId, status: $status, reason: $reason, attachments: $attachments, createdAt: $createdAt, deadlineAt: $deadlineAt, rejectionReason: $rejectionReason, returnedAt: $returnedAt, sellerDecidedAt: $sellerDecidedAt, updatedAt: $updatedAt, legacyExpiresAt: $legacyExpiresAt, legacySellerResponse: $legacySellerResponse, dispute: $dispute)';
}


}

/// @nodoc
abstract mixin class $RefundModelCopyWith<$Res>  {
  factory $RefundModelCopyWith(RefundModel value, $Res Function(RefundModel) _then) = _$RefundModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'buyer_id') String? buyerId,@JsonKey(name: 'seller_id') String? sellerId, String status, String reason, List<RefundAttachment> attachments,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deadline_at') String? deadlineAt,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'returned_at') String? returnedAt,@JsonKey(name: 'seller_decided_at') String? sellerDecidedAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'expires_at') String? legacyExpiresAt,@JsonKey(name: 'seller_response') String? legacySellerResponse, RefundDisputeModel? dispute
});


$RefundDisputeModelCopyWith<$Res>? get dispute;

}
/// @nodoc
class _$RefundModelCopyWithImpl<$Res>
    implements $RefundModelCopyWith<$Res> {
  _$RefundModelCopyWithImpl(this._self, this._then);

  final RefundModel _self;
  final $Res Function(RefundModel) _then;

/// Create a copy of RefundModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? buyerId = freezed,Object? sellerId = freezed,Object? status = null,Object? reason = null,Object? attachments = null,Object? createdAt = freezed,Object? deadlineAt = freezed,Object? rejectionReason = freezed,Object? returnedAt = freezed,Object? sellerDecidedAt = freezed,Object? updatedAt = freezed,Object? legacyExpiresAt = freezed,Object? legacySellerResponse = freezed,Object? dispute = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deadlineAt: freezed == deadlineAt ? _self.deadlineAt : deadlineAt // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,returnedAt: freezed == returnedAt ? _self.returnedAt : returnedAt // ignore: cast_nullable_to_non_nullable
as String?,sellerDecidedAt: freezed == sellerDecidedAt ? _self.sellerDecidedAt : sellerDecidedAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,legacyExpiresAt: freezed == legacyExpiresAt ? _self.legacyExpiresAt : legacyExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,legacySellerResponse: freezed == legacySellerResponse ? _self.legacySellerResponse : legacySellerResponse // ignore: cast_nullable_to_non_nullable
as String?,dispute: freezed == dispute ? _self.dispute : dispute // ignore: cast_nullable_to_non_nullable
as RefundDisputeModel?,
  ));
}
/// Create a copy of RefundModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefundDisputeModelCopyWith<$Res>? get dispute {
    if (_self.dispute == null) {
    return null;
  }

  return $RefundDisputeModelCopyWith<$Res>(_self.dispute!, (value) {
    return _then(_self.copyWith(dispute: value));
  });
}
}


/// Adds pattern-matching-related methods to [RefundModel].
extension RefundModelPatterns on RefundModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RefundModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RefundModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RefundModel value)  $default,){
final _that = this;
switch (_that) {
case _RefundModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RefundModel value)?  $default,){
final _that = this;
switch (_that) {
case _RefundModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'buyer_id')  String? buyerId, @JsonKey(name: 'seller_id')  String? sellerId,  String status,  String reason,  List<RefundAttachment> attachments, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deadline_at')  String? deadlineAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'returned_at')  String? returnedAt, @JsonKey(name: 'seller_decided_at')  String? sellerDecidedAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'expires_at')  String? legacyExpiresAt, @JsonKey(name: 'seller_response')  String? legacySellerResponse,  RefundDisputeModel? dispute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefundModel() when $default != null:
return $default(_that.id,_that.orderId,_that.buyerId,_that.sellerId,_that.status,_that.reason,_that.attachments,_that.createdAt,_that.deadlineAt,_that.rejectionReason,_that.returnedAt,_that.sellerDecidedAt,_that.updatedAt,_that.legacyExpiresAt,_that.legacySellerResponse,_that.dispute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'buyer_id')  String? buyerId, @JsonKey(name: 'seller_id')  String? sellerId,  String status,  String reason,  List<RefundAttachment> attachments, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deadline_at')  String? deadlineAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'returned_at')  String? returnedAt, @JsonKey(name: 'seller_decided_at')  String? sellerDecidedAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'expires_at')  String? legacyExpiresAt, @JsonKey(name: 'seller_response')  String? legacySellerResponse,  RefundDisputeModel? dispute)  $default,) {final _that = this;
switch (_that) {
case _RefundModel():
return $default(_that.id,_that.orderId,_that.buyerId,_that.sellerId,_that.status,_that.reason,_that.attachments,_that.createdAt,_that.deadlineAt,_that.rejectionReason,_that.returnedAt,_that.sellerDecidedAt,_that.updatedAt,_that.legacyExpiresAt,_that.legacySellerResponse,_that.dispute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'buyer_id')  String? buyerId, @JsonKey(name: 'seller_id')  String? sellerId,  String status,  String reason,  List<RefundAttachment> attachments, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'deadline_at')  String? deadlineAt, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'returned_at')  String? returnedAt, @JsonKey(name: 'seller_decided_at')  String? sellerDecidedAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'expires_at')  String? legacyExpiresAt, @JsonKey(name: 'seller_response')  String? legacySellerResponse,  RefundDisputeModel? dispute)?  $default,) {final _that = this;
switch (_that) {
case _RefundModel() when $default != null:
return $default(_that.id,_that.orderId,_that.buyerId,_that.sellerId,_that.status,_that.reason,_that.attachments,_that.createdAt,_that.deadlineAt,_that.rejectionReason,_that.returnedAt,_that.sellerDecidedAt,_that.updatedAt,_that.legacyExpiresAt,_that.legacySellerResponse,_that.dispute);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefundModel extends RefundModel {
  const _RefundModel({required this.id, @JsonKey(name: 'order_id') required this.orderId, @JsonKey(name: 'buyer_id') this.buyerId, @JsonKey(name: 'seller_id') this.sellerId, this.status = 'awaiting-seller-review', required this.reason, final  List<RefundAttachment> attachments = const [], @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'deadline_at') this.deadlineAt, @JsonKey(name: 'rejection_reason') this.rejectionReason, @JsonKey(name: 'returned_at') this.returnedAt, @JsonKey(name: 'seller_decided_at') this.sellerDecidedAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'expires_at') this.legacyExpiresAt, @JsonKey(name: 'seller_response') this.legacySellerResponse, this.dispute}): _attachments = attachments,super._();
  factory _RefundModel.fromJson(Map<String, dynamic> json) => _$RefundModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'order_id') final  String orderId;
@override@JsonKey(name: 'buyer_id') final  String? buyerId;
@override@JsonKey(name: 'seller_id') final  String? sellerId;
@override@JsonKey() final  String status;
// 'awaiting-seller-review', 'awaiting-buyer-action', 'disputed', 'returning', 'returned', 'accepted', 'rejected', 'cancelled'
@override final  String reason;
 final  List<RefundAttachment> _attachments;
@override@JsonKey() List<RefundAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'deadline_at') final  String? deadlineAt;
@override@JsonKey(name: 'rejection_reason') final  String? rejectionReason;
@override@JsonKey(name: 'returned_at') final  String? returnedAt;
@override@JsonKey(name: 'seller_decided_at') final  String? sellerDecidedAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
// Backward compatibility fields
@override@JsonKey(name: 'expires_at') final  String? legacyExpiresAt;
@override@JsonKey(name: 'seller_response') final  String? legacySellerResponse;
@override final  RefundDisputeModel? dispute;

/// Create a copy of RefundModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RefundModelCopyWith<_RefundModel> get copyWith => __$RefundModelCopyWithImpl<_RefundModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RefundModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefundModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.deadlineAt, deadlineAt) || other.deadlineAt == deadlineAt)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.returnedAt, returnedAt) || other.returnedAt == returnedAt)&&(identical(other.sellerDecidedAt, sellerDecidedAt) || other.sellerDecidedAt == sellerDecidedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.legacyExpiresAt, legacyExpiresAt) || other.legacyExpiresAt == legacyExpiresAt)&&(identical(other.legacySellerResponse, legacySellerResponse) || other.legacySellerResponse == legacySellerResponse)&&(identical(other.dispute, dispute) || other.dispute == dispute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,buyerId,sellerId,status,reason,const DeepCollectionEquality().hash(_attachments),createdAt,deadlineAt,rejectionReason,returnedAt,sellerDecidedAt,updatedAt,legacyExpiresAt,legacySellerResponse,dispute);

@override
String toString() {
  return 'RefundModel(id: $id, orderId: $orderId, buyerId: $buyerId, sellerId: $sellerId, status: $status, reason: $reason, attachments: $attachments, createdAt: $createdAt, deadlineAt: $deadlineAt, rejectionReason: $rejectionReason, returnedAt: $returnedAt, sellerDecidedAt: $sellerDecidedAt, updatedAt: $updatedAt, legacyExpiresAt: $legacyExpiresAt, legacySellerResponse: $legacySellerResponse, dispute: $dispute)';
}


}

/// @nodoc
abstract mixin class _$RefundModelCopyWith<$Res> implements $RefundModelCopyWith<$Res> {
  factory _$RefundModelCopyWith(_RefundModel value, $Res Function(_RefundModel) _then) = __$RefundModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'buyer_id') String? buyerId,@JsonKey(name: 'seller_id') String? sellerId, String status, String reason, List<RefundAttachment> attachments,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'deadline_at') String? deadlineAt,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'returned_at') String? returnedAt,@JsonKey(name: 'seller_decided_at') String? sellerDecidedAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'expires_at') String? legacyExpiresAt,@JsonKey(name: 'seller_response') String? legacySellerResponse, RefundDisputeModel? dispute
});


@override $RefundDisputeModelCopyWith<$Res>? get dispute;

}
/// @nodoc
class __$RefundModelCopyWithImpl<$Res>
    implements _$RefundModelCopyWith<$Res> {
  __$RefundModelCopyWithImpl(this._self, this._then);

  final _RefundModel _self;
  final $Res Function(_RefundModel) _then;

/// Create a copy of RefundModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? buyerId = freezed,Object? sellerId = freezed,Object? status = null,Object? reason = null,Object? attachments = null,Object? createdAt = freezed,Object? deadlineAt = freezed,Object? rejectionReason = freezed,Object? returnedAt = freezed,Object? sellerDecidedAt = freezed,Object? updatedAt = freezed,Object? legacyExpiresAt = freezed,Object? legacySellerResponse = freezed,Object? dispute = freezed,}) {
  return _then(_RefundModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,deadlineAt: freezed == deadlineAt ? _self.deadlineAt : deadlineAt // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,returnedAt: freezed == returnedAt ? _self.returnedAt : returnedAt // ignore: cast_nullable_to_non_nullable
as String?,sellerDecidedAt: freezed == sellerDecidedAt ? _self.sellerDecidedAt : sellerDecidedAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,legacyExpiresAt: freezed == legacyExpiresAt ? _self.legacyExpiresAt : legacyExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,legacySellerResponse: freezed == legacySellerResponse ? _self.legacySellerResponse : legacySellerResponse // ignore: cast_nullable_to_non_nullable
as String?,dispute: freezed == dispute ? _self.dispute : dispute // ignore: cast_nullable_to_non_nullable
as RefundDisputeModel?,
  ));
}

/// Create a copy of RefundModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RefundDisputeModelCopyWith<$Res>? get dispute {
    if (_self.dispute == null) {
    return null;
  }

  return $RefundDisputeModelCopyWith<$Res>(_self.dispute!, (value) {
    return _then(_self.copyWith(dispute: value));
  });
}
}

// dart format on
