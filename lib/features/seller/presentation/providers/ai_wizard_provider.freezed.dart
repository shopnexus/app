// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ai_wizard_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AiWizardState {

 int get step;// 1: Select Media, 2: Upload & Process, 3: Review & Create SPU
 String get inputMode;// 'image_audio' | 'image_text'
 String? get selectedVideoPath; List<String> get selectedImagePaths; String? get selectedAudioPath; double get uploadProgress; bool get isProcessing; String? get rawAudioText; String? get refinedDescription; String get selectedTone;// 'professional' | 'persuasive' | 'minimalist' | 'enthusiastic'
 String get suggestedTitle; String get suggestedCategoryId; String get suggestedCategoryName; double get confidence; List<ProductSpecification> get specifications; List<ProductSkuRequest> get suggestedSkus; String? get errorMessage; bool get isSaving; bool get saveSuccess;
/// Create a copy of AiWizardState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AiWizardStateCopyWith<AiWizardState> get copyWith => _$AiWizardStateCopyWithImpl<AiWizardState>(this as AiWizardState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AiWizardState&&(identical(other.step, step) || other.step == step)&&(identical(other.inputMode, inputMode) || other.inputMode == inputMode)&&(identical(other.selectedVideoPath, selectedVideoPath) || other.selectedVideoPath == selectedVideoPath)&&const DeepCollectionEquality().equals(other.selectedImagePaths, selectedImagePaths)&&(identical(other.selectedAudioPath, selectedAudioPath) || other.selectedAudioPath == selectedAudioPath)&&(identical(other.uploadProgress, uploadProgress) || other.uploadProgress == uploadProgress)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.rawAudioText, rawAudioText) || other.rawAudioText == rawAudioText)&&(identical(other.refinedDescription, refinedDescription) || other.refinedDescription == refinedDescription)&&(identical(other.selectedTone, selectedTone) || other.selectedTone == selectedTone)&&(identical(other.suggestedTitle, suggestedTitle) || other.suggestedTitle == suggestedTitle)&&(identical(other.suggestedCategoryId, suggestedCategoryId) || other.suggestedCategoryId == suggestedCategoryId)&&(identical(other.suggestedCategoryName, suggestedCategoryName) || other.suggestedCategoryName == suggestedCategoryName)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other.specifications, specifications)&&const DeepCollectionEquality().equals(other.suggestedSkus, suggestedSkus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.saveSuccess, saveSuccess) || other.saveSuccess == saveSuccess));
}


@override
int get hashCode => Object.hashAll([runtimeType,step,inputMode,selectedVideoPath,const DeepCollectionEquality().hash(selectedImagePaths),selectedAudioPath,uploadProgress,isProcessing,rawAudioText,refinedDescription,selectedTone,suggestedTitle,suggestedCategoryId,suggestedCategoryName,confidence,const DeepCollectionEquality().hash(specifications),const DeepCollectionEquality().hash(suggestedSkus),errorMessage,isSaving,saveSuccess]);

@override
String toString() {
  return 'AiWizardState(step: $step, inputMode: $inputMode, selectedVideoPath: $selectedVideoPath, selectedImagePaths: $selectedImagePaths, selectedAudioPath: $selectedAudioPath, uploadProgress: $uploadProgress, isProcessing: $isProcessing, rawAudioText: $rawAudioText, refinedDescription: $refinedDescription, selectedTone: $selectedTone, suggestedTitle: $suggestedTitle, suggestedCategoryId: $suggestedCategoryId, suggestedCategoryName: $suggestedCategoryName, confidence: $confidence, specifications: $specifications, suggestedSkus: $suggestedSkus, errorMessage: $errorMessage, isSaving: $isSaving, saveSuccess: $saveSuccess)';
}


}

/// @nodoc
abstract mixin class $AiWizardStateCopyWith<$Res>  {
  factory $AiWizardStateCopyWith(AiWizardState value, $Res Function(AiWizardState) _then) = _$AiWizardStateCopyWithImpl;
@useResult
$Res call({
 int step, String inputMode, String? selectedVideoPath, List<String> selectedImagePaths, String? selectedAudioPath, double uploadProgress, bool isProcessing, String? rawAudioText, String? refinedDescription, String selectedTone, String suggestedTitle, String suggestedCategoryId, String suggestedCategoryName, double confidence, List<ProductSpecification> specifications, List<ProductSkuRequest> suggestedSkus, String? errorMessage, bool isSaving, bool saveSuccess
});




}
/// @nodoc
class _$AiWizardStateCopyWithImpl<$Res>
    implements $AiWizardStateCopyWith<$Res> {
  _$AiWizardStateCopyWithImpl(this._self, this._then);

  final AiWizardState _self;
  final $Res Function(AiWizardState) _then;

/// Create a copy of AiWizardState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? step = null,Object? inputMode = null,Object? selectedVideoPath = freezed,Object? selectedImagePaths = null,Object? selectedAudioPath = freezed,Object? uploadProgress = null,Object? isProcessing = null,Object? rawAudioText = freezed,Object? refinedDescription = freezed,Object? selectedTone = null,Object? suggestedTitle = null,Object? suggestedCategoryId = null,Object? suggestedCategoryName = null,Object? confidence = null,Object? specifications = null,Object? suggestedSkus = null,Object? errorMessage = freezed,Object? isSaving = null,Object? saveSuccess = null,}) {
  return _then(_self.copyWith(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,inputMode: null == inputMode ? _self.inputMode : inputMode // ignore: cast_nullable_to_non_nullable
as String,selectedVideoPath: freezed == selectedVideoPath ? _self.selectedVideoPath : selectedVideoPath // ignore: cast_nullable_to_non_nullable
as String?,selectedImagePaths: null == selectedImagePaths ? _self.selectedImagePaths : selectedImagePaths // ignore: cast_nullable_to_non_nullable
as List<String>,selectedAudioPath: freezed == selectedAudioPath ? _self.selectedAudioPath : selectedAudioPath // ignore: cast_nullable_to_non_nullable
as String?,uploadProgress: null == uploadProgress ? _self.uploadProgress : uploadProgress // ignore: cast_nullable_to_non_nullable
as double,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,rawAudioText: freezed == rawAudioText ? _self.rawAudioText : rawAudioText // ignore: cast_nullable_to_non_nullable
as String?,refinedDescription: freezed == refinedDescription ? _self.refinedDescription : refinedDescription // ignore: cast_nullable_to_non_nullable
as String?,selectedTone: null == selectedTone ? _self.selectedTone : selectedTone // ignore: cast_nullable_to_non_nullable
as String,suggestedTitle: null == suggestedTitle ? _self.suggestedTitle : suggestedTitle // ignore: cast_nullable_to_non_nullable
as String,suggestedCategoryId: null == suggestedCategoryId ? _self.suggestedCategoryId : suggestedCategoryId // ignore: cast_nullable_to_non_nullable
as String,suggestedCategoryName: null == suggestedCategoryName ? _self.suggestedCategoryName : suggestedCategoryName // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,specifications: null == specifications ? _self.specifications : specifications // ignore: cast_nullable_to_non_nullable
as List<ProductSpecification>,suggestedSkus: null == suggestedSkus ? _self.suggestedSkus : suggestedSkus // ignore: cast_nullable_to_non_nullable
as List<ProductSkuRequest>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,saveSuccess: null == saveSuccess ? _self.saveSuccess : saveSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AiWizardState].
extension AiWizardStatePatterns on AiWizardState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AiWizardState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AiWizardState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AiWizardState value)  $default,){
final _that = this;
switch (_that) {
case _AiWizardState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AiWizardState value)?  $default,){
final _that = this;
switch (_that) {
case _AiWizardState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int step,  String inputMode,  String? selectedVideoPath,  List<String> selectedImagePaths,  String? selectedAudioPath,  double uploadProgress,  bool isProcessing,  String? rawAudioText,  String? refinedDescription,  String selectedTone,  String suggestedTitle,  String suggestedCategoryId,  String suggestedCategoryName,  double confidence,  List<ProductSpecification> specifications,  List<ProductSkuRequest> suggestedSkus,  String? errorMessage,  bool isSaving,  bool saveSuccess)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AiWizardState() when $default != null:
return $default(_that.step,_that.inputMode,_that.selectedVideoPath,_that.selectedImagePaths,_that.selectedAudioPath,_that.uploadProgress,_that.isProcessing,_that.rawAudioText,_that.refinedDescription,_that.selectedTone,_that.suggestedTitle,_that.suggestedCategoryId,_that.suggestedCategoryName,_that.confidence,_that.specifications,_that.suggestedSkus,_that.errorMessage,_that.isSaving,_that.saveSuccess);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int step,  String inputMode,  String? selectedVideoPath,  List<String> selectedImagePaths,  String? selectedAudioPath,  double uploadProgress,  bool isProcessing,  String? rawAudioText,  String? refinedDescription,  String selectedTone,  String suggestedTitle,  String suggestedCategoryId,  String suggestedCategoryName,  double confidence,  List<ProductSpecification> specifications,  List<ProductSkuRequest> suggestedSkus,  String? errorMessage,  bool isSaving,  bool saveSuccess)  $default,) {final _that = this;
switch (_that) {
case _AiWizardState():
return $default(_that.step,_that.inputMode,_that.selectedVideoPath,_that.selectedImagePaths,_that.selectedAudioPath,_that.uploadProgress,_that.isProcessing,_that.rawAudioText,_that.refinedDescription,_that.selectedTone,_that.suggestedTitle,_that.suggestedCategoryId,_that.suggestedCategoryName,_that.confidence,_that.specifications,_that.suggestedSkus,_that.errorMessage,_that.isSaving,_that.saveSuccess);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int step,  String inputMode,  String? selectedVideoPath,  List<String> selectedImagePaths,  String? selectedAudioPath,  double uploadProgress,  bool isProcessing,  String? rawAudioText,  String? refinedDescription,  String selectedTone,  String suggestedTitle,  String suggestedCategoryId,  String suggestedCategoryName,  double confidence,  List<ProductSpecification> specifications,  List<ProductSkuRequest> suggestedSkus,  String? errorMessage,  bool isSaving,  bool saveSuccess)?  $default,) {final _that = this;
switch (_that) {
case _AiWizardState() when $default != null:
return $default(_that.step,_that.inputMode,_that.selectedVideoPath,_that.selectedImagePaths,_that.selectedAudioPath,_that.uploadProgress,_that.isProcessing,_that.rawAudioText,_that.refinedDescription,_that.selectedTone,_that.suggestedTitle,_that.suggestedCategoryId,_that.suggestedCategoryName,_that.confidence,_that.specifications,_that.suggestedSkus,_that.errorMessage,_that.isSaving,_that.saveSuccess);case _:
  return null;

}
}

}

/// @nodoc


class _AiWizardState implements AiWizardState {
  const _AiWizardState({this.step = 1, this.inputMode = 'image_audio', this.selectedVideoPath, final  List<String> selectedImagePaths = const [], this.selectedAudioPath, this.uploadProgress = 0.0, this.isProcessing = false, this.rawAudioText, this.refinedDescription, this.selectedTone = 'professional', this.suggestedTitle = '', this.suggestedCategoryId = '', this.suggestedCategoryName = 'Thiết bị điện tử & Gia dụng', this.confidence = 0.92, final  List<ProductSpecification> specifications = const [], final  List<ProductSkuRequest> suggestedSkus = const [], this.errorMessage, this.isSaving = false, this.saveSuccess = false}): _selectedImagePaths = selectedImagePaths,_specifications = specifications,_suggestedSkus = suggestedSkus;
  

@override@JsonKey() final  int step;
// 1: Select Media, 2: Upload & Process, 3: Review & Create SPU
@override@JsonKey() final  String inputMode;
// 'image_audio' | 'image_text'
@override final  String? selectedVideoPath;
 final  List<String> _selectedImagePaths;
@override@JsonKey() List<String> get selectedImagePaths {
  if (_selectedImagePaths is EqualUnmodifiableListView) return _selectedImagePaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedImagePaths);
}

@override final  String? selectedAudioPath;
@override@JsonKey() final  double uploadProgress;
@override@JsonKey() final  bool isProcessing;
@override final  String? rawAudioText;
@override final  String? refinedDescription;
@override@JsonKey() final  String selectedTone;
// 'professional' | 'persuasive' | 'minimalist' | 'enthusiastic'
@override@JsonKey() final  String suggestedTitle;
@override@JsonKey() final  String suggestedCategoryId;
@override@JsonKey() final  String suggestedCategoryName;
@override@JsonKey() final  double confidence;
 final  List<ProductSpecification> _specifications;
@override@JsonKey() List<ProductSpecification> get specifications {
  if (_specifications is EqualUnmodifiableListView) return _specifications;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specifications);
}

 final  List<ProductSkuRequest> _suggestedSkus;
@override@JsonKey() List<ProductSkuRequest> get suggestedSkus {
  if (_suggestedSkus is EqualUnmodifiableListView) return _suggestedSkus;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestedSkus);
}

@override final  String? errorMessage;
@override@JsonKey() final  bool isSaving;
@override@JsonKey() final  bool saveSuccess;

/// Create a copy of AiWizardState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AiWizardStateCopyWith<_AiWizardState> get copyWith => __$AiWizardStateCopyWithImpl<_AiWizardState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AiWizardState&&(identical(other.step, step) || other.step == step)&&(identical(other.inputMode, inputMode) || other.inputMode == inputMode)&&(identical(other.selectedVideoPath, selectedVideoPath) || other.selectedVideoPath == selectedVideoPath)&&const DeepCollectionEquality().equals(other._selectedImagePaths, _selectedImagePaths)&&(identical(other.selectedAudioPath, selectedAudioPath) || other.selectedAudioPath == selectedAudioPath)&&(identical(other.uploadProgress, uploadProgress) || other.uploadProgress == uploadProgress)&&(identical(other.isProcessing, isProcessing) || other.isProcessing == isProcessing)&&(identical(other.rawAudioText, rawAudioText) || other.rawAudioText == rawAudioText)&&(identical(other.refinedDescription, refinedDescription) || other.refinedDescription == refinedDescription)&&(identical(other.selectedTone, selectedTone) || other.selectedTone == selectedTone)&&(identical(other.suggestedTitle, suggestedTitle) || other.suggestedTitle == suggestedTitle)&&(identical(other.suggestedCategoryId, suggestedCategoryId) || other.suggestedCategoryId == suggestedCategoryId)&&(identical(other.suggestedCategoryName, suggestedCategoryName) || other.suggestedCategoryName == suggestedCategoryName)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other._specifications, _specifications)&&const DeepCollectionEquality().equals(other._suggestedSkus, _suggestedSkus)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.saveSuccess, saveSuccess) || other.saveSuccess == saveSuccess));
}


@override
int get hashCode => Object.hashAll([runtimeType,step,inputMode,selectedVideoPath,const DeepCollectionEquality().hash(_selectedImagePaths),selectedAudioPath,uploadProgress,isProcessing,rawAudioText,refinedDescription,selectedTone,suggestedTitle,suggestedCategoryId,suggestedCategoryName,confidence,const DeepCollectionEquality().hash(_specifications),const DeepCollectionEquality().hash(_suggestedSkus),errorMessage,isSaving,saveSuccess]);

@override
String toString() {
  return 'AiWizardState(step: $step, inputMode: $inputMode, selectedVideoPath: $selectedVideoPath, selectedImagePaths: $selectedImagePaths, selectedAudioPath: $selectedAudioPath, uploadProgress: $uploadProgress, isProcessing: $isProcessing, rawAudioText: $rawAudioText, refinedDescription: $refinedDescription, selectedTone: $selectedTone, suggestedTitle: $suggestedTitle, suggestedCategoryId: $suggestedCategoryId, suggestedCategoryName: $suggestedCategoryName, confidence: $confidence, specifications: $specifications, suggestedSkus: $suggestedSkus, errorMessage: $errorMessage, isSaving: $isSaving, saveSuccess: $saveSuccess)';
}


}

/// @nodoc
abstract mixin class _$AiWizardStateCopyWith<$Res> implements $AiWizardStateCopyWith<$Res> {
  factory _$AiWizardStateCopyWith(_AiWizardState value, $Res Function(_AiWizardState) _then) = __$AiWizardStateCopyWithImpl;
@override @useResult
$Res call({
 int step, String inputMode, String? selectedVideoPath, List<String> selectedImagePaths, String? selectedAudioPath, double uploadProgress, bool isProcessing, String? rawAudioText, String? refinedDescription, String selectedTone, String suggestedTitle, String suggestedCategoryId, String suggestedCategoryName, double confidence, List<ProductSpecification> specifications, List<ProductSkuRequest> suggestedSkus, String? errorMessage, bool isSaving, bool saveSuccess
});




}
/// @nodoc
class __$AiWizardStateCopyWithImpl<$Res>
    implements _$AiWizardStateCopyWith<$Res> {
  __$AiWizardStateCopyWithImpl(this._self, this._then);

  final _AiWizardState _self;
  final $Res Function(_AiWizardState) _then;

/// Create a copy of AiWizardState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? step = null,Object? inputMode = null,Object? selectedVideoPath = freezed,Object? selectedImagePaths = null,Object? selectedAudioPath = freezed,Object? uploadProgress = null,Object? isProcessing = null,Object? rawAudioText = freezed,Object? refinedDescription = freezed,Object? selectedTone = null,Object? suggestedTitle = null,Object? suggestedCategoryId = null,Object? suggestedCategoryName = null,Object? confidence = null,Object? specifications = null,Object? suggestedSkus = null,Object? errorMessage = freezed,Object? isSaving = null,Object? saveSuccess = null,}) {
  return _then(_AiWizardState(
step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as int,inputMode: null == inputMode ? _self.inputMode : inputMode // ignore: cast_nullable_to_non_nullable
as String,selectedVideoPath: freezed == selectedVideoPath ? _self.selectedVideoPath : selectedVideoPath // ignore: cast_nullable_to_non_nullable
as String?,selectedImagePaths: null == selectedImagePaths ? _self._selectedImagePaths : selectedImagePaths // ignore: cast_nullable_to_non_nullable
as List<String>,selectedAudioPath: freezed == selectedAudioPath ? _self.selectedAudioPath : selectedAudioPath // ignore: cast_nullable_to_non_nullable
as String?,uploadProgress: null == uploadProgress ? _self.uploadProgress : uploadProgress // ignore: cast_nullable_to_non_nullable
as double,isProcessing: null == isProcessing ? _self.isProcessing : isProcessing // ignore: cast_nullable_to_non_nullable
as bool,rawAudioText: freezed == rawAudioText ? _self.rawAudioText : rawAudioText // ignore: cast_nullable_to_non_nullable
as String?,refinedDescription: freezed == refinedDescription ? _self.refinedDescription : refinedDescription // ignore: cast_nullable_to_non_nullable
as String?,selectedTone: null == selectedTone ? _self.selectedTone : selectedTone // ignore: cast_nullable_to_non_nullable
as String,suggestedTitle: null == suggestedTitle ? _self.suggestedTitle : suggestedTitle // ignore: cast_nullable_to_non_nullable
as String,suggestedCategoryId: null == suggestedCategoryId ? _self.suggestedCategoryId : suggestedCategoryId // ignore: cast_nullable_to_non_nullable
as String,suggestedCategoryName: null == suggestedCategoryName ? _self.suggestedCategoryName : suggestedCategoryName // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,specifications: null == specifications ? _self._specifications : specifications // ignore: cast_nullable_to_non_nullable
as List<ProductSpecification>,suggestedSkus: null == suggestedSkus ? _self._suggestedSkus : suggestedSkus // ignore: cast_nullable_to_non_nullable
as List<ProductSkuRequest>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,saveSuccess: null == saveSuccess ? _self.saveSuccess : saveSuccess // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
