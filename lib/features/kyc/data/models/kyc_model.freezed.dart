// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'kyc_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IdentityDocument {

 String get id; String? get provider;@JsonKey(name: 'doc_type') IdentityDocType get docType; IdentityStatus get status;@JsonKey(name: 'rejection_reason') String? get rejectionReason;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'expires_at') String? get expiresAt;@JsonKey(name: 'verified_at') String? get verifiedAt;
/// Create a copy of IdentityDocument
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdentityDocumentCopyWith<IdentityDocument> get copyWith => _$IdentityDocumentCopyWithImpl<IdentityDocument>(this as IdentityDocument, _$identity);

  /// Serializes this IdentityDocument to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentityDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.docType, docType) || other.docType == docType)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,provider,docType,status,rejectionReason,createdAt,expiresAt,verifiedAt);

@override
String toString() {
  return 'IdentityDocument(id: $id, provider: $provider, docType: $docType, status: $status, rejectionReason: $rejectionReason, createdAt: $createdAt, expiresAt: $expiresAt, verifiedAt: $verifiedAt)';
}


}

/// @nodoc
abstract mixin class $IdentityDocumentCopyWith<$Res>  {
  factory $IdentityDocumentCopyWith(IdentityDocument value, $Res Function(IdentityDocument) _then) = _$IdentityDocumentCopyWithImpl;
@useResult
$Res call({
 String id, String? provider,@JsonKey(name: 'doc_type') IdentityDocType docType, IdentityStatus status,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'expires_at') String? expiresAt,@JsonKey(name: 'verified_at') String? verifiedAt
});




}
/// @nodoc
class _$IdentityDocumentCopyWithImpl<$Res>
    implements $IdentityDocumentCopyWith<$Res> {
  _$IdentityDocumentCopyWithImpl(this._self, this._then);

  final IdentityDocument _self;
  final $Res Function(IdentityDocument) _then;

/// Create a copy of IdentityDocument
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? provider = freezed,Object? docType = null,Object? status = null,Object? rejectionReason = freezed,Object? createdAt = freezed,Object? expiresAt = freezed,Object? verifiedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,docType: null == docType ? _self.docType : docType // ignore: cast_nullable_to_non_nullable
as IdentityDocType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IdentityStatus,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [IdentityDocument].
extension IdentityDocumentPatterns on IdentityDocument {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdentityDocument value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdentityDocument() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdentityDocument value)  $default,){
final _that = this;
switch (_that) {
case _IdentityDocument():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdentityDocument value)?  $default,){
final _that = this;
switch (_that) {
case _IdentityDocument() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? provider, @JsonKey(name: 'doc_type')  IdentityDocType docType,  IdentityStatus status, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'verified_at')  String? verifiedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdentityDocument() when $default != null:
return $default(_that.id,_that.provider,_that.docType,_that.status,_that.rejectionReason,_that.createdAt,_that.expiresAt,_that.verifiedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? provider, @JsonKey(name: 'doc_type')  IdentityDocType docType,  IdentityStatus status, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'verified_at')  String? verifiedAt)  $default,) {final _that = this;
switch (_that) {
case _IdentityDocument():
return $default(_that.id,_that.provider,_that.docType,_that.status,_that.rejectionReason,_that.createdAt,_that.expiresAt,_that.verifiedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? provider, @JsonKey(name: 'doc_type')  IdentityDocType docType,  IdentityStatus status, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'expires_at')  String? expiresAt, @JsonKey(name: 'verified_at')  String? verifiedAt)?  $default,) {final _that = this;
switch (_that) {
case _IdentityDocument() when $default != null:
return $default(_that.id,_that.provider,_that.docType,_that.status,_that.rejectionReason,_that.createdAt,_that.expiresAt,_that.verifiedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IdentityDocument implements IdentityDocument {
  const _IdentityDocument({required this.id, this.provider, @JsonKey(name: 'doc_type') this.docType = IdentityDocType.nationalId, this.status = IdentityStatus.unverified, @JsonKey(name: 'rejection_reason') this.rejectionReason, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'expires_at') this.expiresAt, @JsonKey(name: 'verified_at') this.verifiedAt});
  factory _IdentityDocument.fromJson(Map<String, dynamic> json) => _$IdentityDocumentFromJson(json);

@override final  String id;
@override final  String? provider;
@override@JsonKey(name: 'doc_type') final  IdentityDocType docType;
@override@JsonKey() final  IdentityStatus status;
@override@JsonKey(name: 'rejection_reason') final  String? rejectionReason;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'expires_at') final  String? expiresAt;
@override@JsonKey(name: 'verified_at') final  String? verifiedAt;

/// Create a copy of IdentityDocument
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdentityDocumentCopyWith<_IdentityDocument> get copyWith => __$IdentityDocumentCopyWithImpl<_IdentityDocument>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdentityDocumentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdentityDocument&&(identical(other.id, id) || other.id == id)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.docType, docType) || other.docType == docType)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,provider,docType,status,rejectionReason,createdAt,expiresAt,verifiedAt);

@override
String toString() {
  return 'IdentityDocument(id: $id, provider: $provider, docType: $docType, status: $status, rejectionReason: $rejectionReason, createdAt: $createdAt, expiresAt: $expiresAt, verifiedAt: $verifiedAt)';
}


}

/// @nodoc
abstract mixin class _$IdentityDocumentCopyWith<$Res> implements $IdentityDocumentCopyWith<$Res> {
  factory _$IdentityDocumentCopyWith(_IdentityDocument value, $Res Function(_IdentityDocument) _then) = __$IdentityDocumentCopyWithImpl;
@override @useResult
$Res call({
 String id, String? provider,@JsonKey(name: 'doc_type') IdentityDocType docType, IdentityStatus status,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'expires_at') String? expiresAt,@JsonKey(name: 'verified_at') String? verifiedAt
});




}
/// @nodoc
class __$IdentityDocumentCopyWithImpl<$Res>
    implements _$IdentityDocumentCopyWith<$Res> {
  __$IdentityDocumentCopyWithImpl(this._self, this._then);

  final _IdentityDocument _self;
  final $Res Function(_IdentityDocument) _then;

/// Create a copy of IdentityDocument
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? provider = freezed,Object? docType = null,Object? status = null,Object? rejectionReason = freezed,Object? createdAt = freezed,Object? expiresAt = freezed,Object? verifiedAt = freezed,}) {
  return _then(_IdentityDocument(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,docType: null == docType ? _self.docType : docType // ignore: cast_nullable_to_non_nullable
as IdentityDocType,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as IdentityStatus,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$StartIdentityVerificationRequest {

@JsonKey(name: 'doc_type') IdentityDocType get docType;@JsonKey(name: 'front_resource_id') String get frontResourceId;@JsonKey(name: 'back_resource_id') String? get backResourceId;@JsonKey(name: 'selfie_resource_id') String get selfieResourceId;
/// Create a copy of StartIdentityVerificationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StartIdentityVerificationRequestCopyWith<StartIdentityVerificationRequest> get copyWith => _$StartIdentityVerificationRequestCopyWithImpl<StartIdentityVerificationRequest>(this as StartIdentityVerificationRequest, _$identity);

  /// Serializes this StartIdentityVerificationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StartIdentityVerificationRequest&&(identical(other.docType, docType) || other.docType == docType)&&(identical(other.frontResourceId, frontResourceId) || other.frontResourceId == frontResourceId)&&(identical(other.backResourceId, backResourceId) || other.backResourceId == backResourceId)&&(identical(other.selfieResourceId, selfieResourceId) || other.selfieResourceId == selfieResourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,docType,frontResourceId,backResourceId,selfieResourceId);

@override
String toString() {
  return 'StartIdentityVerificationRequest(docType: $docType, frontResourceId: $frontResourceId, backResourceId: $backResourceId, selfieResourceId: $selfieResourceId)';
}


}

/// @nodoc
abstract mixin class $StartIdentityVerificationRequestCopyWith<$Res>  {
  factory $StartIdentityVerificationRequestCopyWith(StartIdentityVerificationRequest value, $Res Function(StartIdentityVerificationRequest) _then) = _$StartIdentityVerificationRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'doc_type') IdentityDocType docType,@JsonKey(name: 'front_resource_id') String frontResourceId,@JsonKey(name: 'back_resource_id') String? backResourceId,@JsonKey(name: 'selfie_resource_id') String selfieResourceId
});




}
/// @nodoc
class _$StartIdentityVerificationRequestCopyWithImpl<$Res>
    implements $StartIdentityVerificationRequestCopyWith<$Res> {
  _$StartIdentityVerificationRequestCopyWithImpl(this._self, this._then);

  final StartIdentityVerificationRequest _self;
  final $Res Function(StartIdentityVerificationRequest) _then;

/// Create a copy of StartIdentityVerificationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? docType = null,Object? frontResourceId = null,Object? backResourceId = freezed,Object? selfieResourceId = null,}) {
  return _then(_self.copyWith(
docType: null == docType ? _self.docType : docType // ignore: cast_nullable_to_non_nullable
as IdentityDocType,frontResourceId: null == frontResourceId ? _self.frontResourceId : frontResourceId // ignore: cast_nullable_to_non_nullable
as String,backResourceId: freezed == backResourceId ? _self.backResourceId : backResourceId // ignore: cast_nullable_to_non_nullable
as String?,selfieResourceId: null == selfieResourceId ? _self.selfieResourceId : selfieResourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [StartIdentityVerificationRequest].
extension StartIdentityVerificationRequestPatterns on StartIdentityVerificationRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StartIdentityVerificationRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StartIdentityVerificationRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StartIdentityVerificationRequest value)  $default,){
final _that = this;
switch (_that) {
case _StartIdentityVerificationRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StartIdentityVerificationRequest value)?  $default,){
final _that = this;
switch (_that) {
case _StartIdentityVerificationRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'doc_type')  IdentityDocType docType, @JsonKey(name: 'front_resource_id')  String frontResourceId, @JsonKey(name: 'back_resource_id')  String? backResourceId, @JsonKey(name: 'selfie_resource_id')  String selfieResourceId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StartIdentityVerificationRequest() when $default != null:
return $default(_that.docType,_that.frontResourceId,_that.backResourceId,_that.selfieResourceId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'doc_type')  IdentityDocType docType, @JsonKey(name: 'front_resource_id')  String frontResourceId, @JsonKey(name: 'back_resource_id')  String? backResourceId, @JsonKey(name: 'selfie_resource_id')  String selfieResourceId)  $default,) {final _that = this;
switch (_that) {
case _StartIdentityVerificationRequest():
return $default(_that.docType,_that.frontResourceId,_that.backResourceId,_that.selfieResourceId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'doc_type')  IdentityDocType docType, @JsonKey(name: 'front_resource_id')  String frontResourceId, @JsonKey(name: 'back_resource_id')  String? backResourceId, @JsonKey(name: 'selfie_resource_id')  String selfieResourceId)?  $default,) {final _that = this;
switch (_that) {
case _StartIdentityVerificationRequest() when $default != null:
return $default(_that.docType,_that.frontResourceId,_that.backResourceId,_that.selfieResourceId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StartIdentityVerificationRequest implements StartIdentityVerificationRequest {
  const _StartIdentityVerificationRequest({@JsonKey(name: 'doc_type') required this.docType, @JsonKey(name: 'front_resource_id') required this.frontResourceId, @JsonKey(name: 'back_resource_id') this.backResourceId, @JsonKey(name: 'selfie_resource_id') required this.selfieResourceId});
  factory _StartIdentityVerificationRequest.fromJson(Map<String, dynamic> json) => _$StartIdentityVerificationRequestFromJson(json);

@override@JsonKey(name: 'doc_type') final  IdentityDocType docType;
@override@JsonKey(name: 'front_resource_id') final  String frontResourceId;
@override@JsonKey(name: 'back_resource_id') final  String? backResourceId;
@override@JsonKey(name: 'selfie_resource_id') final  String selfieResourceId;

/// Create a copy of StartIdentityVerificationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StartIdentityVerificationRequestCopyWith<_StartIdentityVerificationRequest> get copyWith => __$StartIdentityVerificationRequestCopyWithImpl<_StartIdentityVerificationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StartIdentityVerificationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartIdentityVerificationRequest&&(identical(other.docType, docType) || other.docType == docType)&&(identical(other.frontResourceId, frontResourceId) || other.frontResourceId == frontResourceId)&&(identical(other.backResourceId, backResourceId) || other.backResourceId == backResourceId)&&(identical(other.selfieResourceId, selfieResourceId) || other.selfieResourceId == selfieResourceId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,docType,frontResourceId,backResourceId,selfieResourceId);

@override
String toString() {
  return 'StartIdentityVerificationRequest(docType: $docType, frontResourceId: $frontResourceId, backResourceId: $backResourceId, selfieResourceId: $selfieResourceId)';
}


}

/// @nodoc
abstract mixin class _$StartIdentityVerificationRequestCopyWith<$Res> implements $StartIdentityVerificationRequestCopyWith<$Res> {
  factory _$StartIdentityVerificationRequestCopyWith(_StartIdentityVerificationRequest value, $Res Function(_StartIdentityVerificationRequest) _then) = __$StartIdentityVerificationRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'doc_type') IdentityDocType docType,@JsonKey(name: 'front_resource_id') String frontResourceId,@JsonKey(name: 'back_resource_id') String? backResourceId,@JsonKey(name: 'selfie_resource_id') String selfieResourceId
});




}
/// @nodoc
class __$StartIdentityVerificationRequestCopyWithImpl<$Res>
    implements _$StartIdentityVerificationRequestCopyWith<$Res> {
  __$StartIdentityVerificationRequestCopyWithImpl(this._self, this._then);

  final _StartIdentityVerificationRequest _self;
  final $Res Function(_StartIdentityVerificationRequest) _then;

/// Create a copy of StartIdentityVerificationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? docType = null,Object? frontResourceId = null,Object? backResourceId = freezed,Object? selfieResourceId = null,}) {
  return _then(_StartIdentityVerificationRequest(
docType: null == docType ? _self.docType : docType // ignore: cast_nullable_to_non_nullable
as IdentityDocType,frontResourceId: null == frontResourceId ? _self.frontResourceId : frontResourceId // ignore: cast_nullable_to_non_nullable
as String,backResourceId: freezed == backResourceId ? _self.backResourceId : backResourceId // ignore: cast_nullable_to_non_nullable
as String?,selfieResourceId: null == selfieResourceId ? _self.selfieResourceId : selfieResourceId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$IdentityVerificationTicket {

 IdentityDocument get document;@JsonKey(name: 'vendor_session_expires_at') String? get vendorSessionExpiresAt;@JsonKey(name: 'vendor_session_url') String? get vendorSessionUrl;
/// Create a copy of IdentityVerificationTicket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdentityVerificationTicketCopyWith<IdentityVerificationTicket> get copyWith => _$IdentityVerificationTicketCopyWithImpl<IdentityVerificationTicket>(this as IdentityVerificationTicket, _$identity);

  /// Serializes this IdentityVerificationTicket to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdentityVerificationTicket&&(identical(other.document, document) || other.document == document)&&(identical(other.vendorSessionExpiresAt, vendorSessionExpiresAt) || other.vendorSessionExpiresAt == vendorSessionExpiresAt)&&(identical(other.vendorSessionUrl, vendorSessionUrl) || other.vendorSessionUrl == vendorSessionUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,document,vendorSessionExpiresAt,vendorSessionUrl);

@override
String toString() {
  return 'IdentityVerificationTicket(document: $document, vendorSessionExpiresAt: $vendorSessionExpiresAt, vendorSessionUrl: $vendorSessionUrl)';
}


}

/// @nodoc
abstract mixin class $IdentityVerificationTicketCopyWith<$Res>  {
  factory $IdentityVerificationTicketCopyWith(IdentityVerificationTicket value, $Res Function(IdentityVerificationTicket) _then) = _$IdentityVerificationTicketCopyWithImpl;
@useResult
$Res call({
 IdentityDocument document,@JsonKey(name: 'vendor_session_expires_at') String? vendorSessionExpiresAt,@JsonKey(name: 'vendor_session_url') String? vendorSessionUrl
});


$IdentityDocumentCopyWith<$Res> get document;

}
/// @nodoc
class _$IdentityVerificationTicketCopyWithImpl<$Res>
    implements $IdentityVerificationTicketCopyWith<$Res> {
  _$IdentityVerificationTicketCopyWithImpl(this._self, this._then);

  final IdentityVerificationTicket _self;
  final $Res Function(IdentityVerificationTicket) _then;

/// Create a copy of IdentityVerificationTicket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? document = null,Object? vendorSessionExpiresAt = freezed,Object? vendorSessionUrl = freezed,}) {
  return _then(_self.copyWith(
document: null == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as IdentityDocument,vendorSessionExpiresAt: freezed == vendorSessionExpiresAt ? _self.vendorSessionExpiresAt : vendorSessionExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,vendorSessionUrl: freezed == vendorSessionUrl ? _self.vendorSessionUrl : vendorSessionUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of IdentityVerificationTicket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdentityDocumentCopyWith<$Res> get document {
  
  return $IdentityDocumentCopyWith<$Res>(_self.document, (value) {
    return _then(_self.copyWith(document: value));
  });
}
}


/// Adds pattern-matching-related methods to [IdentityVerificationTicket].
extension IdentityVerificationTicketPatterns on IdentityVerificationTicket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdentityVerificationTicket value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdentityVerificationTicket() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdentityVerificationTicket value)  $default,){
final _that = this;
switch (_that) {
case _IdentityVerificationTicket():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdentityVerificationTicket value)?  $default,){
final _that = this;
switch (_that) {
case _IdentityVerificationTicket() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( IdentityDocument document, @JsonKey(name: 'vendor_session_expires_at')  String? vendorSessionExpiresAt, @JsonKey(name: 'vendor_session_url')  String? vendorSessionUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdentityVerificationTicket() when $default != null:
return $default(_that.document,_that.vendorSessionExpiresAt,_that.vendorSessionUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( IdentityDocument document, @JsonKey(name: 'vendor_session_expires_at')  String? vendorSessionExpiresAt, @JsonKey(name: 'vendor_session_url')  String? vendorSessionUrl)  $default,) {final _that = this;
switch (_that) {
case _IdentityVerificationTicket():
return $default(_that.document,_that.vendorSessionExpiresAt,_that.vendorSessionUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( IdentityDocument document, @JsonKey(name: 'vendor_session_expires_at')  String? vendorSessionExpiresAt, @JsonKey(name: 'vendor_session_url')  String? vendorSessionUrl)?  $default,) {final _that = this;
switch (_that) {
case _IdentityVerificationTicket() when $default != null:
return $default(_that.document,_that.vendorSessionExpiresAt,_that.vendorSessionUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IdentityVerificationTicket implements IdentityVerificationTicket {
  const _IdentityVerificationTicket({required this.document, @JsonKey(name: 'vendor_session_expires_at') this.vendorSessionExpiresAt, @JsonKey(name: 'vendor_session_url') this.vendorSessionUrl});
  factory _IdentityVerificationTicket.fromJson(Map<String, dynamic> json) => _$IdentityVerificationTicketFromJson(json);

@override final  IdentityDocument document;
@override@JsonKey(name: 'vendor_session_expires_at') final  String? vendorSessionExpiresAt;
@override@JsonKey(name: 'vendor_session_url') final  String? vendorSessionUrl;

/// Create a copy of IdentityVerificationTicket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdentityVerificationTicketCopyWith<_IdentityVerificationTicket> get copyWith => __$IdentityVerificationTicketCopyWithImpl<_IdentityVerificationTicket>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdentityVerificationTicketToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdentityVerificationTicket&&(identical(other.document, document) || other.document == document)&&(identical(other.vendorSessionExpiresAt, vendorSessionExpiresAt) || other.vendorSessionExpiresAt == vendorSessionExpiresAt)&&(identical(other.vendorSessionUrl, vendorSessionUrl) || other.vendorSessionUrl == vendorSessionUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,document,vendorSessionExpiresAt,vendorSessionUrl);

@override
String toString() {
  return 'IdentityVerificationTicket(document: $document, vendorSessionExpiresAt: $vendorSessionExpiresAt, vendorSessionUrl: $vendorSessionUrl)';
}


}

/// @nodoc
abstract mixin class _$IdentityVerificationTicketCopyWith<$Res> implements $IdentityVerificationTicketCopyWith<$Res> {
  factory _$IdentityVerificationTicketCopyWith(_IdentityVerificationTicket value, $Res Function(_IdentityVerificationTicket) _then) = __$IdentityVerificationTicketCopyWithImpl;
@override @useResult
$Res call({
 IdentityDocument document,@JsonKey(name: 'vendor_session_expires_at') String? vendorSessionExpiresAt,@JsonKey(name: 'vendor_session_url') String? vendorSessionUrl
});


@override $IdentityDocumentCopyWith<$Res> get document;

}
/// @nodoc
class __$IdentityVerificationTicketCopyWithImpl<$Res>
    implements _$IdentityVerificationTicketCopyWith<$Res> {
  __$IdentityVerificationTicketCopyWithImpl(this._self, this._then);

  final _IdentityVerificationTicket _self;
  final $Res Function(_IdentityVerificationTicket) _then;

/// Create a copy of IdentityVerificationTicket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? document = null,Object? vendorSessionExpiresAt = freezed,Object? vendorSessionUrl = freezed,}) {
  return _then(_IdentityVerificationTicket(
document: null == document ? _self.document : document // ignore: cast_nullable_to_non_nullable
as IdentityDocument,vendorSessionExpiresAt: freezed == vendorSessionExpiresAt ? _self.vendorSessionExpiresAt : vendorSessionExpiresAt // ignore: cast_nullable_to_non_nullable
as String?,vendorSessionUrl: freezed == vendorSessionUrl ? _self.vendorSessionUrl : vendorSessionUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of IdentityVerificationTicket
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdentityDocumentCopyWith<$Res> get document {
  
  return $IdentityDocumentCopyWith<$Res>(_self.document, (value) {
    return _then(_self.copyWith(document: value));
  });
}
}


/// @nodoc
mixin _$AccountCreateUploadRequest {

 String get filename; String get kind; String get mime; int get size;
/// Create a copy of AccountCreateUploadRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountCreateUploadRequestCopyWith<AccountCreateUploadRequest> get copyWith => _$AccountCreateUploadRequestCopyWithImpl<AccountCreateUploadRequest>(this as AccountCreateUploadRequest, _$identity);

  /// Serializes this AccountCreateUploadRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountCreateUploadRequest&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.mime, mime) || other.mime == mime)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,kind,mime,size);

@override
String toString() {
  return 'AccountCreateUploadRequest(filename: $filename, kind: $kind, mime: $mime, size: $size)';
}


}

/// @nodoc
abstract mixin class $AccountCreateUploadRequestCopyWith<$Res>  {
  factory $AccountCreateUploadRequestCopyWith(AccountCreateUploadRequest value, $Res Function(AccountCreateUploadRequest) _then) = _$AccountCreateUploadRequestCopyWithImpl;
@useResult
$Res call({
 String filename, String kind, String mime, int size
});




}
/// @nodoc
class _$AccountCreateUploadRequestCopyWithImpl<$Res>
    implements $AccountCreateUploadRequestCopyWith<$Res> {
  _$AccountCreateUploadRequestCopyWithImpl(this._self, this._then);

  final AccountCreateUploadRequest _self;
  final $Res Function(AccountCreateUploadRequest) _then;

/// Create a copy of AccountCreateUploadRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filename = null,Object? kind = null,Object? mime = null,Object? size = null,}) {
  return _then(_self.copyWith(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,mime: null == mime ? _self.mime : mime // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountCreateUploadRequest].
extension AccountCreateUploadRequestPatterns on AccountCreateUploadRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountCreateUploadRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountCreateUploadRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountCreateUploadRequest value)  $default,){
final _that = this;
switch (_that) {
case _AccountCreateUploadRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountCreateUploadRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AccountCreateUploadRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String filename,  String kind,  String mime,  int size)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountCreateUploadRequest() when $default != null:
return $default(_that.filename,_that.kind,_that.mime,_that.size);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String filename,  String kind,  String mime,  int size)  $default,) {final _that = this;
switch (_that) {
case _AccountCreateUploadRequest():
return $default(_that.filename,_that.kind,_that.mime,_that.size);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String filename,  String kind,  String mime,  int size)?  $default,) {final _that = this;
switch (_that) {
case _AccountCreateUploadRequest() when $default != null:
return $default(_that.filename,_that.kind,_that.mime,_that.size);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountCreateUploadRequest implements AccountCreateUploadRequest {
  const _AccountCreateUploadRequest({required this.filename, this.kind = 'identity', required this.mime, required this.size});
  factory _AccountCreateUploadRequest.fromJson(Map<String, dynamic> json) => _$AccountCreateUploadRequestFromJson(json);

@override final  String filename;
@override@JsonKey() final  String kind;
@override final  String mime;
@override final  int size;

/// Create a copy of AccountCreateUploadRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountCreateUploadRequestCopyWith<_AccountCreateUploadRequest> get copyWith => __$AccountCreateUploadRequestCopyWithImpl<_AccountCreateUploadRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountCreateUploadRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountCreateUploadRequest&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.mime, mime) || other.mime == mime)&&(identical(other.size, size) || other.size == size));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,kind,mime,size);

@override
String toString() {
  return 'AccountCreateUploadRequest(filename: $filename, kind: $kind, mime: $mime, size: $size)';
}


}

/// @nodoc
abstract mixin class _$AccountCreateUploadRequestCopyWith<$Res> implements $AccountCreateUploadRequestCopyWith<$Res> {
  factory _$AccountCreateUploadRequestCopyWith(_AccountCreateUploadRequest value, $Res Function(_AccountCreateUploadRequest) _then) = __$AccountCreateUploadRequestCopyWithImpl;
@override @useResult
$Res call({
 String filename, String kind, String mime, int size
});




}
/// @nodoc
class __$AccountCreateUploadRequestCopyWithImpl<$Res>
    implements _$AccountCreateUploadRequestCopyWith<$Res> {
  __$AccountCreateUploadRequestCopyWithImpl(this._self, this._then);

  final _AccountCreateUploadRequest _self;
  final $Res Function(_AccountCreateUploadRequest) _then;

/// Create a copy of AccountCreateUploadRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filename = null,Object? kind = null,Object? mime = null,Object? size = null,}) {
  return _then(_AccountCreateUploadRequest(
filename: null == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,mime: null == mime ? _self.mime : mime // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$UploadSlot {

@JsonKey(name: 'resource_id') String get resourceId; String get url; Map<String, dynamic>? get headers;@JsonKey(name: 'expires_at') String? get expiresAt;
/// Create a copy of UploadSlot
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UploadSlotCopyWith<UploadSlot> get copyWith => _$UploadSlotCopyWithImpl<UploadSlot>(this as UploadSlot, _$identity);

  /// Serializes this UploadSlot to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UploadSlot&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other.headers, headers)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resourceId,url,const DeepCollectionEquality().hash(headers),expiresAt);

@override
String toString() {
  return 'UploadSlot(resourceId: $resourceId, url: $url, headers: $headers, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class $UploadSlotCopyWith<$Res>  {
  factory $UploadSlotCopyWith(UploadSlot value, $Res Function(UploadSlot) _then) = _$UploadSlotCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'resource_id') String resourceId, String url, Map<String, dynamic>? headers,@JsonKey(name: 'expires_at') String? expiresAt
});




}
/// @nodoc
class _$UploadSlotCopyWithImpl<$Res>
    implements $UploadSlotCopyWith<$Res> {
  _$UploadSlotCopyWithImpl(this._self, this._then);

  final UploadSlot _self;
  final $Res Function(UploadSlot) _then;

/// Create a copy of UploadSlot
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resourceId = null,Object? url = null,Object? headers = freezed,Object? expiresAt = freezed,}) {
  return _then(_self.copyWith(
resourceId: null == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self.headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [UploadSlot].
extension UploadSlotPatterns on UploadSlot {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UploadSlot value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UploadSlot() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UploadSlot value)  $default,){
final _that = this;
switch (_that) {
case _UploadSlot():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UploadSlot value)?  $default,){
final _that = this;
switch (_that) {
case _UploadSlot() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'resource_id')  String resourceId,  String url,  Map<String, dynamic>? headers, @JsonKey(name: 'expires_at')  String? expiresAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UploadSlot() when $default != null:
return $default(_that.resourceId,_that.url,_that.headers,_that.expiresAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'resource_id')  String resourceId,  String url,  Map<String, dynamic>? headers, @JsonKey(name: 'expires_at')  String? expiresAt)  $default,) {final _that = this;
switch (_that) {
case _UploadSlot():
return $default(_that.resourceId,_that.url,_that.headers,_that.expiresAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'resource_id')  String resourceId,  String url,  Map<String, dynamic>? headers, @JsonKey(name: 'expires_at')  String? expiresAt)?  $default,) {final _that = this;
switch (_that) {
case _UploadSlot() when $default != null:
return $default(_that.resourceId,_that.url,_that.headers,_that.expiresAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UploadSlot implements UploadSlot {
  const _UploadSlot({@JsonKey(name: 'resource_id') required this.resourceId, required this.url, final  Map<String, dynamic>? headers, @JsonKey(name: 'expires_at') this.expiresAt}): _headers = headers;
  factory _UploadSlot.fromJson(Map<String, dynamic> json) => _$UploadSlotFromJson(json);

@override@JsonKey(name: 'resource_id') final  String resourceId;
@override final  String url;
 final  Map<String, dynamic>? _headers;
@override Map<String, dynamic>? get headers {
  final value = _headers;
  if (value == null) return null;
  if (_headers is EqualUnmodifiableMapView) return _headers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'expires_at') final  String? expiresAt;

/// Create a copy of UploadSlot
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UploadSlotCopyWith<_UploadSlot> get copyWith => __$UploadSlotCopyWithImpl<_UploadSlot>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UploadSlotToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UploadSlot&&(identical(other.resourceId, resourceId) || other.resourceId == resourceId)&&(identical(other.url, url) || other.url == url)&&const DeepCollectionEquality().equals(other._headers, _headers)&&(identical(other.expiresAt, expiresAt) || other.expiresAt == expiresAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,resourceId,url,const DeepCollectionEquality().hash(_headers),expiresAt);

@override
String toString() {
  return 'UploadSlot(resourceId: $resourceId, url: $url, headers: $headers, expiresAt: $expiresAt)';
}


}

/// @nodoc
abstract mixin class _$UploadSlotCopyWith<$Res> implements $UploadSlotCopyWith<$Res> {
  factory _$UploadSlotCopyWith(_UploadSlot value, $Res Function(_UploadSlot) _then) = __$UploadSlotCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'resource_id') String resourceId, String url, Map<String, dynamic>? headers,@JsonKey(name: 'expires_at') String? expiresAt
});




}
/// @nodoc
class __$UploadSlotCopyWithImpl<$Res>
    implements _$UploadSlotCopyWith<$Res> {
  __$UploadSlotCopyWithImpl(this._self, this._then);

  final _UploadSlot _self;
  final $Res Function(_UploadSlot) _then;

/// Create a copy of UploadSlot
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resourceId = null,Object? url = null,Object? headers = freezed,Object? expiresAt = freezed,}) {
  return _then(_UploadSlot(
resourceId: null == resourceId ? _self.resourceId : resourceId // ignore: cast_nullable_to_non_nullable
as String,url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,headers: freezed == headers ? _self._headers : headers // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,expiresAt: freezed == expiresAt ? _self.expiresAt : expiresAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
