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
mixin _$RefundDisputeModel {

 String get id;@JsonKey(name: 'refund_id') String? get refundId; String get status;// 'Pending', 'Uheld', 'Dismissed'
@JsonKey(name: 'seller_reason') String? get sellerReason;@JsonKey(name: 'seller_attachments') List<RefundAttachment> get sellerAttachments;@JsonKey(name: 'admin_note') String? get adminNote;@JsonKey(name: 'resolved_at') String? get resolvedAt;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of RefundDisputeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefundDisputeModelCopyWith<RefundDisputeModel> get copyWith => _$RefundDisputeModelCopyWithImpl<RefundDisputeModel>(this as RefundDisputeModel, _$identity);

  /// Serializes this RefundDisputeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefundDisputeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.refundId, refundId) || other.refundId == refundId)&&(identical(other.status, status) || other.status == status)&&(identical(other.sellerReason, sellerReason) || other.sellerReason == sellerReason)&&const DeepCollectionEquality().equals(other.sellerAttachments, sellerAttachments)&&(identical(other.adminNote, adminNote) || other.adminNote == adminNote)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,refundId,status,sellerReason,const DeepCollectionEquality().hash(sellerAttachments),adminNote,resolvedAt,createdAt);

@override
String toString() {
  return 'RefundDisputeModel(id: $id, refundId: $refundId, status: $status, sellerReason: $sellerReason, sellerAttachments: $sellerAttachments, adminNote: $adminNote, resolvedAt: $resolvedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $RefundDisputeModelCopyWith<$Res>  {
  factory $RefundDisputeModelCopyWith(RefundDisputeModel value, $Res Function(RefundDisputeModel) _then) = _$RefundDisputeModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'refund_id') String? refundId, String status,@JsonKey(name: 'seller_reason') String? sellerReason,@JsonKey(name: 'seller_attachments') List<RefundAttachment> sellerAttachments,@JsonKey(name: 'admin_note') String? adminNote,@JsonKey(name: 'resolved_at') String? resolvedAt,@JsonKey(name: 'created_at') String? createdAt
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? refundId = freezed,Object? status = null,Object? sellerReason = freezed,Object? sellerAttachments = null,Object? adminNote = freezed,Object? resolvedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,refundId: freezed == refundId ? _self.refundId : refundId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sellerReason: freezed == sellerReason ? _self.sellerReason : sellerReason // ignore: cast_nullable_to_non_nullable
as String?,sellerAttachments: null == sellerAttachments ? _self.sellerAttachments : sellerAttachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,adminNote: freezed == adminNote ? _self.adminNote : adminNote // ignore: cast_nullable_to_non_nullable
as String?,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'refund_id')  String? refundId,  String status, @JsonKey(name: 'seller_reason')  String? sellerReason, @JsonKey(name: 'seller_attachments')  List<RefundAttachment> sellerAttachments, @JsonKey(name: 'admin_note')  String? adminNote, @JsonKey(name: 'resolved_at')  String? resolvedAt, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefundDisputeModel() when $default != null:
return $default(_that.id,_that.refundId,_that.status,_that.sellerReason,_that.sellerAttachments,_that.adminNote,_that.resolvedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'refund_id')  String? refundId,  String status, @JsonKey(name: 'seller_reason')  String? sellerReason, @JsonKey(name: 'seller_attachments')  List<RefundAttachment> sellerAttachments, @JsonKey(name: 'admin_note')  String? adminNote, @JsonKey(name: 'resolved_at')  String? resolvedAt, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _RefundDisputeModel():
return $default(_that.id,_that.refundId,_that.status,_that.sellerReason,_that.sellerAttachments,_that.adminNote,_that.resolvedAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'refund_id')  String? refundId,  String status, @JsonKey(name: 'seller_reason')  String? sellerReason, @JsonKey(name: 'seller_attachments')  List<RefundAttachment> sellerAttachments, @JsonKey(name: 'admin_note')  String? adminNote, @JsonKey(name: 'resolved_at')  String? resolvedAt, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _RefundDisputeModel() when $default != null:
return $default(_that.id,_that.refundId,_that.status,_that.sellerReason,_that.sellerAttachments,_that.adminNote,_that.resolvedAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefundDisputeModel implements RefundDisputeModel {
  const _RefundDisputeModel({required this.id, @JsonKey(name: 'refund_id') this.refundId, this.status = 'Pending', @JsonKey(name: 'seller_reason') this.sellerReason, @JsonKey(name: 'seller_attachments') final  List<RefundAttachment> sellerAttachments = const [], @JsonKey(name: 'admin_note') this.adminNote, @JsonKey(name: 'resolved_at') this.resolvedAt, @JsonKey(name: 'created_at') this.createdAt}): _sellerAttachments = sellerAttachments;
  factory _RefundDisputeModel.fromJson(Map<String, dynamic> json) => _$RefundDisputeModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'refund_id') final  String? refundId;
@override@JsonKey() final  String status;
// 'Pending', 'Uheld', 'Dismissed'
@override@JsonKey(name: 'seller_reason') final  String? sellerReason;
 final  List<RefundAttachment> _sellerAttachments;
@override@JsonKey(name: 'seller_attachments') List<RefundAttachment> get sellerAttachments {
  if (_sellerAttachments is EqualUnmodifiableListView) return _sellerAttachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sellerAttachments);
}

@override@JsonKey(name: 'admin_note') final  String? adminNote;
@override@JsonKey(name: 'resolved_at') final  String? resolvedAt;
@override@JsonKey(name: 'created_at') final  String? createdAt;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefundDisputeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.refundId, refundId) || other.refundId == refundId)&&(identical(other.status, status) || other.status == status)&&(identical(other.sellerReason, sellerReason) || other.sellerReason == sellerReason)&&const DeepCollectionEquality().equals(other._sellerAttachments, _sellerAttachments)&&(identical(other.adminNote, adminNote) || other.adminNote == adminNote)&&(identical(other.resolvedAt, resolvedAt) || other.resolvedAt == resolvedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,refundId,status,sellerReason,const DeepCollectionEquality().hash(_sellerAttachments),adminNote,resolvedAt,createdAt);

@override
String toString() {
  return 'RefundDisputeModel(id: $id, refundId: $refundId, status: $status, sellerReason: $sellerReason, sellerAttachments: $sellerAttachments, adminNote: $adminNote, resolvedAt: $resolvedAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$RefundDisputeModelCopyWith<$Res> implements $RefundDisputeModelCopyWith<$Res> {
  factory _$RefundDisputeModelCopyWith(_RefundDisputeModel value, $Res Function(_RefundDisputeModel) _then) = __$RefundDisputeModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'refund_id') String? refundId, String status,@JsonKey(name: 'seller_reason') String? sellerReason,@JsonKey(name: 'seller_attachments') List<RefundAttachment> sellerAttachments,@JsonKey(name: 'admin_note') String? adminNote,@JsonKey(name: 'resolved_at') String? resolvedAt,@JsonKey(name: 'created_at') String? createdAt
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? refundId = freezed,Object? status = null,Object? sellerReason = freezed,Object? sellerAttachments = null,Object? adminNote = freezed,Object? resolvedAt = freezed,Object? createdAt = freezed,}) {
  return _then(_RefundDisputeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,refundId: freezed == refundId ? _self.refundId : refundId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,sellerReason: freezed == sellerReason ? _self.sellerReason : sellerReason // ignore: cast_nullable_to_non_nullable
as String?,sellerAttachments: null == sellerAttachments ? _self._sellerAttachments : sellerAttachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,adminNote: freezed == adminNote ? _self.adminNote : adminNote // ignore: cast_nullable_to_non_nullable
as String?,resolvedAt: freezed == resolvedAt ? _self.resolvedAt : resolvedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$RefundModel {

 String get id;@JsonKey(name: 'order_id') String get orderId;@JsonKey(name: 'buyer_id') String? get buyerId;@JsonKey(name: 'seller_id') String? get sellerId; String get status;// 'Shipping', 'AwaitingSellerReview', 'Accepted', 'Disputed', 'Withdrawn', 'AutoRefunded'
 String get reason; List<RefundAttachment> get attachments;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'expires_at') String? get expiresAt;// Hạn chót 3 ngày Seller phải phản hồi
@JsonKey(name: 'seller_response') String? get sellerResponse; RefundDisputeModel? get dispute;
/// Create a copy of RefundModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RefundModelCopyWith<RefundModel> get copyWith => _$RefundModelCopyWithImpl<RefundModel>(this as RefundModel, _$identity);

  /// Serializes this RefundModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RefundModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other.attachments, attachments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.sellerResponse, sellerResponse) || other.sellerResponse == sellerResponse)&&(identical(other.dispute, dispute) || other.dispute == dispute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,buyerId,sellerId,status,reason,const DeepCollectionEquality().hash(attachments),createdAt,updatedAt,expiresAt,sellerResponse,dispute);

@override
String toString() {
  return 'RefundModel(id: $id, orderId: $orderId, buyerId: $buyerId, sellerId: $sellerId, status: $status, reason: $reason, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt, sellerResponse: $sellerResponse, dispute: $dispute)';
}


}

/// @nodoc
abstract mixin class $RefundModelCopyWith<$Res>  {
  factory $RefundModelCopyWith(RefundModel value, $Res Function(RefundModel) _then) = _$RefundModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'buyer_id') String? buyerId,@JsonKey(name: 'seller_id') String? sellerId, String status, String reason, List<RefundAttachment> attachments,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'expires_at') String? expiresAt,@JsonKey(name: 'seller_response') String? sellerResponse, RefundDisputeModel? dispute
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = null,Object? buyerId = freezed,Object? sellerId = freezed,Object? status = null,Object? reason = null,Object? attachments = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? expiresAt = freezed,Object? sellerResponse = freezed,Object? dispute = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self.attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,sellerResponse: freezed == sellerResponse ? _self.sellerResponse : sellerResponse // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'buyer_id')  String? buyerId, @JsonKey(name: 'seller_id')  String? sellerId,  String status,  String reason,  List<RefundAttachment> attachments, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'seller_response')  String? sellerResponse,  RefundDisputeModel? dispute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RefundModel() when $default != null:
return $default(_that.id,_that.orderId,_that.buyerId,_that.sellerId,_that.status,_that.reason,_that.attachments,_that.createdAt,_that.updatedAt,_that.expiresAt,_that.sellerResponse,_that.dispute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'buyer_id')  String? buyerId, @JsonKey(name: 'seller_id')  String? sellerId,  String status,  String reason,  List<RefundAttachment> attachments, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'seller_response')  String? sellerResponse,  RefundDisputeModel? dispute)  $default,) {final _that = this;
switch (_that) {
case _RefundModel():
return $default(_that.id,_that.orderId,_that.buyerId,_that.sellerId,_that.status,_that.reason,_that.attachments,_that.createdAt,_that.updatedAt,_that.expiresAt,_that.sellerResponse,_that.dispute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'order_id')  String orderId, @JsonKey(name: 'buyer_id')  String? buyerId, @JsonKey(name: 'seller_id')  String? sellerId,  String status,  String reason,  List<RefundAttachment> attachments, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'seller_response')  String? sellerResponse,  RefundDisputeModel? dispute)?  $default,) {final _that = this;
switch (_that) {
case _RefundModel() when $default != null:
return $default(_that.id,_that.orderId,_that.buyerId,_that.sellerId,_that.status,_that.reason,_that.attachments,_that.createdAt,_that.updatedAt,_that.expiresAt,_that.sellerResponse,_that.dispute);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RefundModel extends RefundModel {
  const _RefundModel({required this.id, @JsonKey(name: 'order_id') required this.orderId, @JsonKey(name: 'buyer_id') this.buyerId, @JsonKey(name: 'seller_id') this.sellerId, this.status = 'AwaitingSellerReview', required this.reason, final  List<RefundAttachment> attachments = const [], @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'seller_response') this.sellerResponse, this.dispute}): _attachments = attachments,super._();
  factory _RefundModel.fromJson(Map<String, dynamic> json) => _$RefundModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'order_id') final  String orderId;
@override@JsonKey(name: 'buyer_id') final  String? buyerId;
@override@JsonKey(name: 'seller_id') final  String? sellerId;
@override@JsonKey() final  String status;
// 'Shipping', 'AwaitingSellerReview', 'Accepted', 'Disputed', 'Withdrawn', 'AutoRefunded'
@override final  String reason;
 final  List<RefundAttachment> _attachments;
@override@JsonKey() List<RefundAttachment> get attachments {
  if (_attachments is EqualUnmodifiableListView) return _attachments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachments);
}

@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'expires_at') final  String? expiresAt;
// Hạn chót 3 ngày Seller phải phản hồi
@override@JsonKey(name: 'seller_response') final  String? sellerResponse;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RefundModel&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.buyerId, buyerId) || other.buyerId == buyerId)&&(identical(other.sellerId, sellerId) || other.sellerId == sellerId)&&(identical(other.status, status) || other.status == status)&&(identical(other.reason, reason) || other.reason == reason)&&const DeepCollectionEquality().equals(other._attachments, _attachments)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.sellerResponse, sellerResponse) || other.sellerResponse == sellerResponse)&&(identical(other.dispute, dispute) || other.dispute == dispute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,orderId,buyerId,sellerId,status,reason,const DeepCollectionEquality().hash(_attachments),createdAt,updatedAt,expiresAt,sellerResponse,dispute);

@override
String toString() {
  return 'RefundModel(id: $id, orderId: $orderId, buyerId: $buyerId, sellerId: $sellerId, status: $status, reason: $reason, attachments: $attachments, createdAt: $createdAt, updatedAt: $updatedAt, expiresAt: $expiresAt, sellerResponse: $sellerResponse, dispute: $dispute)';
}


}

/// @nodoc
abstract mixin class _$RefundModelCopyWith<$Res> implements $RefundModelCopyWith<$Res> {
  factory _$RefundModelCopyWith(_RefundModel value, $Res Function(_RefundModel) _then) = __$RefundModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'order_id') String orderId,@JsonKey(name: 'buyer_id') String? buyerId,@JsonKey(name: 'seller_id') String? sellerId, String status, String reason, List<RefundAttachment> attachments,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'expires_at') String? expiresAt,@JsonKey(name: 'seller_response') String? sellerResponse, RefundDisputeModel? dispute
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
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = null,Object? buyerId = freezed,Object? sellerId = freezed,Object? status = null,Object? reason = null,Object? attachments = null,Object? createdAt = freezed,Object? updatedAt = freezed,Object? expiresAt = freezed,Object? sellerResponse = freezed,Object? dispute = freezed,}) {
  return _then(_RefundModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: null == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String,buyerId: freezed == buyerId ? _self.buyerId : buyerId // ignore: cast_nullable_to_non_nullable
as String?,sellerId: freezed == sellerId ? _self.sellerId : sellerId // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,attachments: null == attachments ? _self._attachments : attachments // ignore: cast_nullable_to_non_nullable
as List<RefundAttachment>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,sellerResponse: freezed == sellerResponse ? _self.sellerResponse : sellerResponse // ignore: cast_nullable_to_non_nullable
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
