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
mixin _$KycModel {

 String get id;@JsonKey(name: 'account_id') String get accountId;@JsonKey(name: 'id_number') String get idNumber;@JsonKey(name: 'full_name') String get fullName;@JsonKey(name: 'date_of_birth') String? get dateOfBirth;@JsonKey(name: 'issue_date') String? get issueDate;@JsonKey(name: 'issue_place') String? get issuePlace;@JsonKey(name: 'front_card_url') String? get frontCardUrl;@JsonKey(name: 'back_card_url') String? get backCardUrl;@JsonKey(name: 'selfie_url') String? get selfieUrl; KycStatus get status;@JsonKey(name: 'rejected_reason') String? get rejectedReason;@JsonKey(name: 'submitted_at') String? get submittedAt;@JsonKey(name: 'verified_at') String? get verifiedAt;
/// Create a copy of KycModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$KycModelCopyWith<KycModel> get copyWith => _$KycModelCopyWithImpl<KycModel>(this as KycModel, _$identity);

  /// Serializes this KycModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is KycModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.issuePlace, issuePlace) || other.issuePlace == issuePlace)&&(identical(other.frontCardUrl, frontCardUrl) || other.frontCardUrl == frontCardUrl)&&(identical(other.backCardUrl, backCardUrl) || other.backCardUrl == backCardUrl)&&(identical(other.selfieUrl, selfieUrl) || other.selfieUrl == selfieUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectedReason, rejectedReason) || other.rejectedReason == rejectedReason)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,idNumber,fullName,dateOfBirth,issueDate,issuePlace,frontCardUrl,backCardUrl,selfieUrl,status,rejectedReason,submittedAt,verifiedAt);

@override
String toString() {
  return 'KycModel(id: $id, accountId: $accountId, idNumber: $idNumber, fullName: $fullName, dateOfBirth: $dateOfBirth, issueDate: $issueDate, issuePlace: $issuePlace, frontCardUrl: $frontCardUrl, backCardUrl: $backCardUrl, selfieUrl: $selfieUrl, status: $status, rejectedReason: $rejectedReason, submittedAt: $submittedAt, verifiedAt: $verifiedAt)';
}


}

/// @nodoc
abstract mixin class $KycModelCopyWith<$Res>  {
  factory $KycModelCopyWith(KycModel value, $Res Function(KycModel) _then) = _$KycModelCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'account_id') String accountId,@JsonKey(name: 'id_number') String idNumber,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'date_of_birth') String? dateOfBirth,@JsonKey(name: 'issue_date') String? issueDate,@JsonKey(name: 'issue_place') String? issuePlace,@JsonKey(name: 'front_card_url') String? frontCardUrl,@JsonKey(name: 'back_card_url') String? backCardUrl,@JsonKey(name: 'selfie_url') String? selfieUrl, KycStatus status,@JsonKey(name: 'rejected_reason') String? rejectedReason,@JsonKey(name: 'submitted_at') String? submittedAt,@JsonKey(name: 'verified_at') String? verifiedAt
});




}
/// @nodoc
class _$KycModelCopyWithImpl<$Res>
    implements $KycModelCopyWith<$Res> {
  _$KycModelCopyWithImpl(this._self, this._then);

  final KycModel _self;
  final $Res Function(KycModel) _then;

/// Create a copy of KycModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? accountId = null,Object? idNumber = null,Object? fullName = null,Object? dateOfBirth = freezed,Object? issueDate = freezed,Object? issuePlace = freezed,Object? frontCardUrl = freezed,Object? backCardUrl = freezed,Object? selfieUrl = freezed,Object? status = null,Object? rejectedReason = freezed,Object? submittedAt = freezed,Object? verifiedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,issueDate: freezed == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as String?,issuePlace: freezed == issuePlace ? _self.issuePlace : issuePlace // ignore: cast_nullable_to_non_nullable
as String?,frontCardUrl: freezed == frontCardUrl ? _self.frontCardUrl : frontCardUrl // ignore: cast_nullable_to_non_nullable
as String?,backCardUrl: freezed == backCardUrl ? _self.backCardUrl : backCardUrl // ignore: cast_nullable_to_non_nullable
as String?,selfieUrl: freezed == selfieUrl ? _self.selfieUrl : selfieUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as KycStatus,rejectedReason: freezed == rejectedReason ? _self.rejectedReason : rejectedReason // ignore: cast_nullable_to_non_nullable
as String?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [KycModel].
extension KycModelPatterns on KycModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _KycModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _KycModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _KycModel value)  $default,){
final _that = this;
switch (_that) {
case _KycModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _KycModel value)?  $default,){
final _that = this;
switch (_that) {
case _KycModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'account_id')  String accountId, @JsonKey(name: 'id_number')  String idNumber, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'issue_date')  String? issueDate, @JsonKey(name: 'issue_place')  String? issuePlace, @JsonKey(name: 'front_card_url')  String? frontCardUrl, @JsonKey(name: 'back_card_url')  String? backCardUrl, @JsonKey(name: 'selfie_url')  String? selfieUrl,  KycStatus status, @JsonKey(name: 'rejected_reason')  String? rejectedReason, @JsonKey(name: 'submitted_at')  String? submittedAt, @JsonKey(name: 'verified_at')  String? verifiedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _KycModel() when $default != null:
return $default(_that.id,_that.accountId,_that.idNumber,_that.fullName,_that.dateOfBirth,_that.issueDate,_that.issuePlace,_that.frontCardUrl,_that.backCardUrl,_that.selfieUrl,_that.status,_that.rejectedReason,_that.submittedAt,_that.verifiedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'account_id')  String accountId, @JsonKey(name: 'id_number')  String idNumber, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'issue_date')  String? issueDate, @JsonKey(name: 'issue_place')  String? issuePlace, @JsonKey(name: 'front_card_url')  String? frontCardUrl, @JsonKey(name: 'back_card_url')  String? backCardUrl, @JsonKey(name: 'selfie_url')  String? selfieUrl,  KycStatus status, @JsonKey(name: 'rejected_reason')  String? rejectedReason, @JsonKey(name: 'submitted_at')  String? submittedAt, @JsonKey(name: 'verified_at')  String? verifiedAt)  $default,) {final _that = this;
switch (_that) {
case _KycModel():
return $default(_that.id,_that.accountId,_that.idNumber,_that.fullName,_that.dateOfBirth,_that.issueDate,_that.issuePlace,_that.frontCardUrl,_that.backCardUrl,_that.selfieUrl,_that.status,_that.rejectedReason,_that.submittedAt,_that.verifiedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'account_id')  String accountId, @JsonKey(name: 'id_number')  String idNumber, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'issue_date')  String? issueDate, @JsonKey(name: 'issue_place')  String? issuePlace, @JsonKey(name: 'front_card_url')  String? frontCardUrl, @JsonKey(name: 'back_card_url')  String? backCardUrl, @JsonKey(name: 'selfie_url')  String? selfieUrl,  KycStatus status, @JsonKey(name: 'rejected_reason')  String? rejectedReason, @JsonKey(name: 'submitted_at')  String? submittedAt, @JsonKey(name: 'verified_at')  String? verifiedAt)?  $default,) {final _that = this;
switch (_that) {
case _KycModel() when $default != null:
return $default(_that.id,_that.accountId,_that.idNumber,_that.fullName,_that.dateOfBirth,_that.issueDate,_that.issuePlace,_that.frontCardUrl,_that.backCardUrl,_that.selfieUrl,_that.status,_that.rejectedReason,_that.submittedAt,_that.verifiedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _KycModel implements KycModel {
  const _KycModel({required this.id, @JsonKey(name: 'account_id') required this.accountId, @JsonKey(name: 'id_number') required this.idNumber, @JsonKey(name: 'full_name') required this.fullName, @JsonKey(name: 'date_of_birth') this.dateOfBirth, @JsonKey(name: 'issue_date') this.issueDate, @JsonKey(name: 'issue_place') this.issuePlace, @JsonKey(name: 'front_card_url') this.frontCardUrl, @JsonKey(name: 'back_card_url') this.backCardUrl, @JsonKey(name: 'selfie_url') this.selfieUrl, this.status = KycStatus.unverified, @JsonKey(name: 'rejected_reason') this.rejectedReason, @JsonKey(name: 'submitted_at') this.submittedAt, @JsonKey(name: 'verified_at') this.verifiedAt});
  factory _KycModel.fromJson(Map<String, dynamic> json) => _$KycModelFromJson(json);

@override final  String id;
@override@JsonKey(name: 'account_id') final  String accountId;
@override@JsonKey(name: 'id_number') final  String idNumber;
@override@JsonKey(name: 'full_name') final  String fullName;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override@JsonKey(name: 'issue_date') final  String? issueDate;
@override@JsonKey(name: 'issue_place') final  String? issuePlace;
@override@JsonKey(name: 'front_card_url') final  String? frontCardUrl;
@override@JsonKey(name: 'back_card_url') final  String? backCardUrl;
@override@JsonKey(name: 'selfie_url') final  String? selfieUrl;
@override@JsonKey() final  KycStatus status;
@override@JsonKey(name: 'rejected_reason') final  String? rejectedReason;
@override@JsonKey(name: 'submitted_at') final  String? submittedAt;
@override@JsonKey(name: 'verified_at') final  String? verifiedAt;

/// Create a copy of KycModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$KycModelCopyWith<_KycModel> get copyWith => __$KycModelCopyWithImpl<_KycModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$KycModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _KycModel&&(identical(other.id, id) || other.id == id)&&(identical(other.accountId, accountId) || other.accountId == accountId)&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.issuePlace, issuePlace) || other.issuePlace == issuePlace)&&(identical(other.frontCardUrl, frontCardUrl) || other.frontCardUrl == frontCardUrl)&&(identical(other.backCardUrl, backCardUrl) || other.backCardUrl == backCardUrl)&&(identical(other.selfieUrl, selfieUrl) || other.selfieUrl == selfieUrl)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejectedReason, rejectedReason) || other.rejectedReason == rejectedReason)&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,accountId,idNumber,fullName,dateOfBirth,issueDate,issuePlace,frontCardUrl,backCardUrl,selfieUrl,status,rejectedReason,submittedAt,verifiedAt);

@override
String toString() {
  return 'KycModel(id: $id, accountId: $accountId, idNumber: $idNumber, fullName: $fullName, dateOfBirth: $dateOfBirth, issueDate: $issueDate, issuePlace: $issuePlace, frontCardUrl: $frontCardUrl, backCardUrl: $backCardUrl, selfieUrl: $selfieUrl, status: $status, rejectedReason: $rejectedReason, submittedAt: $submittedAt, verifiedAt: $verifiedAt)';
}


}

/// @nodoc
abstract mixin class _$KycModelCopyWith<$Res> implements $KycModelCopyWith<$Res> {
  factory _$KycModelCopyWith(_KycModel value, $Res Function(_KycModel) _then) = __$KycModelCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'account_id') String accountId,@JsonKey(name: 'id_number') String idNumber,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'date_of_birth') String? dateOfBirth,@JsonKey(name: 'issue_date') String? issueDate,@JsonKey(name: 'issue_place') String? issuePlace,@JsonKey(name: 'front_card_url') String? frontCardUrl,@JsonKey(name: 'back_card_url') String? backCardUrl,@JsonKey(name: 'selfie_url') String? selfieUrl, KycStatus status,@JsonKey(name: 'rejected_reason') String? rejectedReason,@JsonKey(name: 'submitted_at') String? submittedAt,@JsonKey(name: 'verified_at') String? verifiedAt
});




}
/// @nodoc
class __$KycModelCopyWithImpl<$Res>
    implements _$KycModelCopyWith<$Res> {
  __$KycModelCopyWithImpl(this._self, this._then);

  final _KycModel _self;
  final $Res Function(_KycModel) _then;

/// Create a copy of KycModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? accountId = null,Object? idNumber = null,Object? fullName = null,Object? dateOfBirth = freezed,Object? issueDate = freezed,Object? issuePlace = freezed,Object? frontCardUrl = freezed,Object? backCardUrl = freezed,Object? selfieUrl = freezed,Object? status = null,Object? rejectedReason = freezed,Object? submittedAt = freezed,Object? verifiedAt = freezed,}) {
  return _then(_KycModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,accountId: null == accountId ? _self.accountId : accountId // ignore: cast_nullable_to_non_nullable
as String,idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,issueDate: freezed == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as String?,issuePlace: freezed == issuePlace ? _self.issuePlace : issuePlace // ignore: cast_nullable_to_non_nullable
as String?,frontCardUrl: freezed == frontCardUrl ? _self.frontCardUrl : frontCardUrl // ignore: cast_nullable_to_non_nullable
as String?,backCardUrl: freezed == backCardUrl ? _self.backCardUrl : backCardUrl // ignore: cast_nullable_to_non_nullable
as String?,selfieUrl: freezed == selfieUrl ? _self.selfieUrl : selfieUrl // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as KycStatus,rejectedReason: freezed == rejectedReason ? _self.rejectedReason : rejectedReason // ignore: cast_nullable_to_non_nullable
as String?,submittedAt: freezed == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as String?,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$SubmitKycRequest {

@JsonKey(name: 'id_number') String get idNumber;@JsonKey(name: 'full_name') String get fullName;@JsonKey(name: 'date_of_birth') String? get dateOfBirth;@JsonKey(name: 'issue_date') String? get issueDate;@JsonKey(name: 'issue_place') String? get issuePlace;@JsonKey(name: 'front_card_rs_id') String? get frontCardRsId;@JsonKey(name: 'back_card_rs_id') String? get backCardRsId;@JsonKey(name: 'selfie_rs_id') String? get selfieRsId;
/// Create a copy of SubmitKycRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmitKycRequestCopyWith<SubmitKycRequest> get copyWith => _$SubmitKycRequestCopyWithImpl<SubmitKycRequest>(this as SubmitKycRequest, _$identity);

  /// Serializes this SubmitKycRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmitKycRequest&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.issuePlace, issuePlace) || other.issuePlace == issuePlace)&&(identical(other.frontCardRsId, frontCardRsId) || other.frontCardRsId == frontCardRsId)&&(identical(other.backCardRsId, backCardRsId) || other.backCardRsId == backCardRsId)&&(identical(other.selfieRsId, selfieRsId) || other.selfieRsId == selfieRsId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idNumber,fullName,dateOfBirth,issueDate,issuePlace,frontCardRsId,backCardRsId,selfieRsId);

@override
String toString() {
  return 'SubmitKycRequest(idNumber: $idNumber, fullName: $fullName, dateOfBirth: $dateOfBirth, issueDate: $issueDate, issuePlace: $issuePlace, frontCardRsId: $frontCardRsId, backCardRsId: $backCardRsId, selfieRsId: $selfieRsId)';
}


}

/// @nodoc
abstract mixin class $SubmitKycRequestCopyWith<$Res>  {
  factory $SubmitKycRequestCopyWith(SubmitKycRequest value, $Res Function(SubmitKycRequest) _then) = _$SubmitKycRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id_number') String idNumber,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'date_of_birth') String? dateOfBirth,@JsonKey(name: 'issue_date') String? issueDate,@JsonKey(name: 'issue_place') String? issuePlace,@JsonKey(name: 'front_card_rs_id') String? frontCardRsId,@JsonKey(name: 'back_card_rs_id') String? backCardRsId,@JsonKey(name: 'selfie_rs_id') String? selfieRsId
});




}
/// @nodoc
class _$SubmitKycRequestCopyWithImpl<$Res>
    implements $SubmitKycRequestCopyWith<$Res> {
  _$SubmitKycRequestCopyWithImpl(this._self, this._then);

  final SubmitKycRequest _self;
  final $Res Function(SubmitKycRequest) _then;

/// Create a copy of SubmitKycRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? idNumber = null,Object? fullName = null,Object? dateOfBirth = freezed,Object? issueDate = freezed,Object? issuePlace = freezed,Object? frontCardRsId = freezed,Object? backCardRsId = freezed,Object? selfieRsId = freezed,}) {
  return _then(_self.copyWith(
idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,issueDate: freezed == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as String?,issuePlace: freezed == issuePlace ? _self.issuePlace : issuePlace // ignore: cast_nullable_to_non_nullable
as String?,frontCardRsId: freezed == frontCardRsId ? _self.frontCardRsId : frontCardRsId // ignore: cast_nullable_to_non_nullable
as String?,backCardRsId: freezed == backCardRsId ? _self.backCardRsId : backCardRsId // ignore: cast_nullable_to_non_nullable
as String?,selfieRsId: freezed == selfieRsId ? _self.selfieRsId : selfieRsId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmitKycRequest].
extension SubmitKycRequestPatterns on SubmitKycRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmitKycRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmitKycRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmitKycRequest value)  $default,){
final _that = this;
switch (_that) {
case _SubmitKycRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmitKycRequest value)?  $default,){
final _that = this;
switch (_that) {
case _SubmitKycRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_number')  String idNumber, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'issue_date')  String? issueDate, @JsonKey(name: 'issue_place')  String? issuePlace, @JsonKey(name: 'front_card_rs_id')  String? frontCardRsId, @JsonKey(name: 'back_card_rs_id')  String? backCardRsId, @JsonKey(name: 'selfie_rs_id')  String? selfieRsId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmitKycRequest() when $default != null:
return $default(_that.idNumber,_that.fullName,_that.dateOfBirth,_that.issueDate,_that.issuePlace,_that.frontCardRsId,_that.backCardRsId,_that.selfieRsId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id_number')  String idNumber, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'issue_date')  String? issueDate, @JsonKey(name: 'issue_place')  String? issuePlace, @JsonKey(name: 'front_card_rs_id')  String? frontCardRsId, @JsonKey(name: 'back_card_rs_id')  String? backCardRsId, @JsonKey(name: 'selfie_rs_id')  String? selfieRsId)  $default,) {final _that = this;
switch (_that) {
case _SubmitKycRequest():
return $default(_that.idNumber,_that.fullName,_that.dateOfBirth,_that.issueDate,_that.issuePlace,_that.frontCardRsId,_that.backCardRsId,_that.selfieRsId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id_number')  String idNumber, @JsonKey(name: 'full_name')  String fullName, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'issue_date')  String? issueDate, @JsonKey(name: 'issue_place')  String? issuePlace, @JsonKey(name: 'front_card_rs_id')  String? frontCardRsId, @JsonKey(name: 'back_card_rs_id')  String? backCardRsId, @JsonKey(name: 'selfie_rs_id')  String? selfieRsId)?  $default,) {final _that = this;
switch (_that) {
case _SubmitKycRequest() when $default != null:
return $default(_that.idNumber,_that.fullName,_that.dateOfBirth,_that.issueDate,_that.issuePlace,_that.frontCardRsId,_that.backCardRsId,_that.selfieRsId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmitKycRequest implements SubmitKycRequest {
  const _SubmitKycRequest({@JsonKey(name: 'id_number') required this.idNumber, @JsonKey(name: 'full_name') required this.fullName, @JsonKey(name: 'date_of_birth') this.dateOfBirth, @JsonKey(name: 'issue_date') this.issueDate, @JsonKey(name: 'issue_place') this.issuePlace, @JsonKey(name: 'front_card_rs_id') this.frontCardRsId, @JsonKey(name: 'back_card_rs_id') this.backCardRsId, @JsonKey(name: 'selfie_rs_id') this.selfieRsId});
  factory _SubmitKycRequest.fromJson(Map<String, dynamic> json) => _$SubmitKycRequestFromJson(json);

@override@JsonKey(name: 'id_number') final  String idNumber;
@override@JsonKey(name: 'full_name') final  String fullName;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override@JsonKey(name: 'issue_date') final  String? issueDate;
@override@JsonKey(name: 'issue_place') final  String? issuePlace;
@override@JsonKey(name: 'front_card_rs_id') final  String? frontCardRsId;
@override@JsonKey(name: 'back_card_rs_id') final  String? backCardRsId;
@override@JsonKey(name: 'selfie_rs_id') final  String? selfieRsId;

/// Create a copy of SubmitKycRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitKycRequestCopyWith<_SubmitKycRequest> get copyWith => __$SubmitKycRequestCopyWithImpl<_SubmitKycRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmitKycRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmitKycRequest&&(identical(other.idNumber, idNumber) || other.idNumber == idNumber)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.issueDate, issueDate) || other.issueDate == issueDate)&&(identical(other.issuePlace, issuePlace) || other.issuePlace == issuePlace)&&(identical(other.frontCardRsId, frontCardRsId) || other.frontCardRsId == frontCardRsId)&&(identical(other.backCardRsId, backCardRsId) || other.backCardRsId == backCardRsId)&&(identical(other.selfieRsId, selfieRsId) || other.selfieRsId == selfieRsId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,idNumber,fullName,dateOfBirth,issueDate,issuePlace,frontCardRsId,backCardRsId,selfieRsId);

@override
String toString() {
  return 'SubmitKycRequest(idNumber: $idNumber, fullName: $fullName, dateOfBirth: $dateOfBirth, issueDate: $issueDate, issuePlace: $issuePlace, frontCardRsId: $frontCardRsId, backCardRsId: $backCardRsId, selfieRsId: $selfieRsId)';
}


}

/// @nodoc
abstract mixin class _$SubmitKycRequestCopyWith<$Res> implements $SubmitKycRequestCopyWith<$Res> {
  factory _$SubmitKycRequestCopyWith(_SubmitKycRequest value, $Res Function(_SubmitKycRequest) _then) = __$SubmitKycRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id_number') String idNumber,@JsonKey(name: 'full_name') String fullName,@JsonKey(name: 'date_of_birth') String? dateOfBirth,@JsonKey(name: 'issue_date') String? issueDate,@JsonKey(name: 'issue_place') String? issuePlace,@JsonKey(name: 'front_card_rs_id') String? frontCardRsId,@JsonKey(name: 'back_card_rs_id') String? backCardRsId,@JsonKey(name: 'selfie_rs_id') String? selfieRsId
});




}
/// @nodoc
class __$SubmitKycRequestCopyWithImpl<$Res>
    implements _$SubmitKycRequestCopyWith<$Res> {
  __$SubmitKycRequestCopyWithImpl(this._self, this._then);

  final _SubmitKycRequest _self;
  final $Res Function(_SubmitKycRequest) _then;

/// Create a copy of SubmitKycRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? idNumber = null,Object? fullName = null,Object? dateOfBirth = freezed,Object? issueDate = freezed,Object? issuePlace = freezed,Object? frontCardRsId = freezed,Object? backCardRsId = freezed,Object? selfieRsId = freezed,}) {
  return _then(_SubmitKycRequest(
idNumber: null == idNumber ? _self.idNumber : idNumber // ignore: cast_nullable_to_non_nullable
as String,fullName: null == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,issueDate: freezed == issueDate ? _self.issueDate : issueDate // ignore: cast_nullable_to_non_nullable
as String?,issuePlace: freezed == issuePlace ? _self.issuePlace : issuePlace // ignore: cast_nullable_to_non_nullable
as String?,frontCardRsId: freezed == frontCardRsId ? _self.frontCardRsId : frontCardRsId // ignore: cast_nullable_to_non_nullable
as String?,backCardRsId: freezed == backCardRsId ? _self.backCardRsId : backCardRsId // ignore: cast_nullable_to_non_nullable
as String?,selfieRsId: freezed == selfieRsId ? _self.selfieRsId : selfieRsId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
