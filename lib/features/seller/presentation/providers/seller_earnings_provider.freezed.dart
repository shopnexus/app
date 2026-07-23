// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'seller_earnings_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SellerTransaction {

 String get id; String get title; String get referenceId; double get amount; String get date; String get time; String get type;// 'credit' | 'withdrawal'
 String get status;// 'settled' | 'initiated' | 'pending'
 double? get processingFee;
/// Create a copy of SellerTransaction
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerTransactionCopyWith<SellerTransaction> get copyWith => _$SellerTransactionCopyWithImpl<SellerTransaction>(this as SellerTransaction, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.processingFee, processingFee) || other.processingFee == processingFee));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,referenceId,amount,date,time,type,status,processingFee);

@override
String toString() {
  return 'SellerTransaction(id: $id, title: $title, referenceId: $referenceId, amount: $amount, date: $date, time: $time, type: $type, status: $status, processingFee: $processingFee)';
}


}

/// @nodoc
abstract mixin class $SellerTransactionCopyWith<$Res>  {
  factory $SellerTransactionCopyWith(SellerTransaction value, $Res Function(SellerTransaction) _then) = _$SellerTransactionCopyWithImpl;
@useResult
$Res call({
 String id, String title, String referenceId, double amount, String date, String time, String type, String status, double? processingFee
});




}
/// @nodoc
class _$SellerTransactionCopyWithImpl<$Res>
    implements $SellerTransactionCopyWith<$Res> {
  _$SellerTransactionCopyWithImpl(this._self, this._then);

  final SellerTransaction _self;
  final $Res Function(SellerTransaction) _then;

/// Create a copy of SellerTransaction
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? referenceId = null,Object? amount = null,Object? date = null,Object? time = null,Object? type = null,Object? status = null,Object? processingFee = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,referenceId: null == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,processingFee: freezed == processingFee ? _self.processingFee : processingFee // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerTransaction].
extension SellerTransactionPatterns on SellerTransaction {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerTransaction value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerTransaction() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerTransaction value)  $default,){
final _that = this;
switch (_that) {
case _SellerTransaction():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerTransaction value)?  $default,){
final _that = this;
switch (_that) {
case _SellerTransaction() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String referenceId,  double amount,  String date,  String time,  String type,  String status,  double? processingFee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerTransaction() when $default != null:
return $default(_that.id,_that.title,_that.referenceId,_that.amount,_that.date,_that.time,_that.type,_that.status,_that.processingFee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String referenceId,  double amount,  String date,  String time,  String type,  String status,  double? processingFee)  $default,) {final _that = this;
switch (_that) {
case _SellerTransaction():
return $default(_that.id,_that.title,_that.referenceId,_that.amount,_that.date,_that.time,_that.type,_that.status,_that.processingFee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String referenceId,  double amount,  String date,  String time,  String type,  String status,  double? processingFee)?  $default,) {final _that = this;
switch (_that) {
case _SellerTransaction() when $default != null:
return $default(_that.id,_that.title,_that.referenceId,_that.amount,_that.date,_that.time,_that.type,_that.status,_that.processingFee);case _:
  return null;

}
}

}

/// @nodoc


class _SellerTransaction implements SellerTransaction {
  const _SellerTransaction({required this.id, required this.title, required this.referenceId, required this.amount, required this.date, required this.time, required this.type, required this.status, this.processingFee});
  

@override final  String id;
@override final  String title;
@override final  String referenceId;
@override final  double amount;
@override final  String date;
@override final  String time;
@override final  String type;
// 'credit' | 'withdrawal'
@override final  String status;
// 'settled' | 'initiated' | 'pending'
@override final  double? processingFee;

/// Create a copy of SellerTransaction
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerTransactionCopyWith<_SellerTransaction> get copyWith => __$SellerTransactionCopyWithImpl<_SellerTransaction>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerTransaction&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.referenceId, referenceId) || other.referenceId == referenceId)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.date, date) || other.date == date)&&(identical(other.time, time) || other.time == time)&&(identical(other.type, type) || other.type == type)&&(identical(other.status, status) || other.status == status)&&(identical(other.processingFee, processingFee) || other.processingFee == processingFee));
}


@override
int get hashCode => Object.hash(runtimeType,id,title,referenceId,amount,date,time,type,status,processingFee);

@override
String toString() {
  return 'SellerTransaction(id: $id, title: $title, referenceId: $referenceId, amount: $amount, date: $date, time: $time, type: $type, status: $status, processingFee: $processingFee)';
}


}

/// @nodoc
abstract mixin class _$SellerTransactionCopyWith<$Res> implements $SellerTransactionCopyWith<$Res> {
  factory _$SellerTransactionCopyWith(_SellerTransaction value, $Res Function(_SellerTransaction) _then) = __$SellerTransactionCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String referenceId, double amount, String date, String time, String type, String status, double? processingFee
});




}
/// @nodoc
class __$SellerTransactionCopyWithImpl<$Res>
    implements _$SellerTransactionCopyWith<$Res> {
  __$SellerTransactionCopyWithImpl(this._self, this._then);

  final _SellerTransaction _self;
  final $Res Function(_SellerTransaction) _then;

/// Create a copy of SellerTransaction
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? referenceId = null,Object? amount = null,Object? date = null,Object? time = null,Object? type = null,Object? status = null,Object? processingFee = freezed,}) {
  return _then(_SellerTransaction(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,referenceId: null == referenceId ? _self.referenceId : referenceId // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,processingFee: freezed == processingFee ? _self.processingFee : processingFee // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

/// @nodoc
mixin _$SellerEarningsState {

 double get availableBalance;// 32.450.000 VND
 String get bankName; String get bankAccountNumber; String get bankAccountHolder; double get totalIn; double get totalOut; List<SellerTransaction> get transactions; String get selectedPeriod;// '30d' | '1y'
 bool get isLoading; bool get isWithdrawing; String? get errorMessage;
/// Create a copy of SellerEarningsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SellerEarningsStateCopyWith<SellerEarningsState> get copyWith => _$SellerEarningsStateCopyWithImpl<SellerEarningsState>(this as SellerEarningsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SellerEarningsState&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankAccountNumber, bankAccountNumber) || other.bankAccountNumber == bankAccountNumber)&&(identical(other.bankAccountHolder, bankAccountHolder) || other.bankAccountHolder == bankAccountHolder)&&(identical(other.totalIn, totalIn) || other.totalIn == totalIn)&&(identical(other.totalOut, totalOut) || other.totalOut == totalOut)&&const DeepCollectionEquality().equals(other.transactions, transactions)&&(identical(other.selectedPeriod, selectedPeriod) || other.selectedPeriod == selectedPeriod)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isWithdrawing, isWithdrawing) || other.isWithdrawing == isWithdrawing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,availableBalance,bankName,bankAccountNumber,bankAccountHolder,totalIn,totalOut,const DeepCollectionEquality().hash(transactions),selectedPeriod,isLoading,isWithdrawing,errorMessage);

@override
String toString() {
  return 'SellerEarningsState(availableBalance: $availableBalance, bankName: $bankName, bankAccountNumber: $bankAccountNumber, bankAccountHolder: $bankAccountHolder, totalIn: $totalIn, totalOut: $totalOut, transactions: $transactions, selectedPeriod: $selectedPeriod, isLoading: $isLoading, isWithdrawing: $isWithdrawing, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $SellerEarningsStateCopyWith<$Res>  {
  factory $SellerEarningsStateCopyWith(SellerEarningsState value, $Res Function(SellerEarningsState) _then) = _$SellerEarningsStateCopyWithImpl;
@useResult
$Res call({
 double availableBalance, String bankName, String bankAccountNumber, String bankAccountHolder, double totalIn, double totalOut, List<SellerTransaction> transactions, String selectedPeriod, bool isLoading, bool isWithdrawing, String? errorMessage
});




}
/// @nodoc
class _$SellerEarningsStateCopyWithImpl<$Res>
    implements $SellerEarningsStateCopyWith<$Res> {
  _$SellerEarningsStateCopyWithImpl(this._self, this._then);

  final SellerEarningsState _self;
  final $Res Function(SellerEarningsState) _then;

/// Create a copy of SellerEarningsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableBalance = null,Object? bankName = null,Object? bankAccountNumber = null,Object? bankAccountHolder = null,Object? totalIn = null,Object? totalOut = null,Object? transactions = null,Object? selectedPeriod = null,Object? isLoading = null,Object? isWithdrawing = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
availableBalance: null == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,bankAccountNumber: null == bankAccountNumber ? _self.bankAccountNumber : bankAccountNumber // ignore: cast_nullable_to_non_nullable
as String,bankAccountHolder: null == bankAccountHolder ? _self.bankAccountHolder : bankAccountHolder // ignore: cast_nullable_to_non_nullable
as String,totalIn: null == totalIn ? _self.totalIn : totalIn // ignore: cast_nullable_to_non_nullable
as double,totalOut: null == totalOut ? _self.totalOut : totalOut // ignore: cast_nullable_to_non_nullable
as double,transactions: null == transactions ? _self.transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<SellerTransaction>,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isWithdrawing: null == isWithdrawing ? _self.isWithdrawing : isWithdrawing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [SellerEarningsState].
extension SellerEarningsStatePatterns on SellerEarningsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SellerEarningsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SellerEarningsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SellerEarningsState value)  $default,){
final _that = this;
switch (_that) {
case _SellerEarningsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SellerEarningsState value)?  $default,){
final _that = this;
switch (_that) {
case _SellerEarningsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double availableBalance,  String bankName,  String bankAccountNumber,  String bankAccountHolder,  double totalIn,  double totalOut,  List<SellerTransaction> transactions,  String selectedPeriod,  bool isLoading,  bool isWithdrawing,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SellerEarningsState() when $default != null:
return $default(_that.availableBalance,_that.bankName,_that.bankAccountNumber,_that.bankAccountHolder,_that.totalIn,_that.totalOut,_that.transactions,_that.selectedPeriod,_that.isLoading,_that.isWithdrawing,_that.errorMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double availableBalance,  String bankName,  String bankAccountNumber,  String bankAccountHolder,  double totalIn,  double totalOut,  List<SellerTransaction> transactions,  String selectedPeriod,  bool isLoading,  bool isWithdrawing,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _SellerEarningsState():
return $default(_that.availableBalance,_that.bankName,_that.bankAccountNumber,_that.bankAccountHolder,_that.totalIn,_that.totalOut,_that.transactions,_that.selectedPeriod,_that.isLoading,_that.isWithdrawing,_that.errorMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double availableBalance,  String bankName,  String bankAccountNumber,  String bankAccountHolder,  double totalIn,  double totalOut,  List<SellerTransaction> transactions,  String selectedPeriod,  bool isLoading,  bool isWithdrawing,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _SellerEarningsState() when $default != null:
return $default(_that.availableBalance,_that.bankName,_that.bankAccountNumber,_that.bankAccountHolder,_that.totalIn,_that.totalOut,_that.transactions,_that.selectedPeriod,_that.isLoading,_that.isWithdrawing,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _SellerEarningsState implements SellerEarningsState {
  const _SellerEarningsState({this.availableBalance = 32450000.0, this.bankName = 'MBBank Checking', this.bankAccountNumber = '**** 1234', this.bankAccountHolder = 'NGUYEN VAN A', this.totalIn = 4125000.0, this.totalOut = 5000000.0, final  List<SellerTransaction> transactions = const [], this.selectedPeriod = '30d', this.isLoading = false, this.isWithdrawing = false, this.errorMessage}): _transactions = transactions;
  

@override@JsonKey() final  double availableBalance;
// 32.450.000 VND
@override@JsonKey() final  String bankName;
@override@JsonKey() final  String bankAccountNumber;
@override@JsonKey() final  String bankAccountHolder;
@override@JsonKey() final  double totalIn;
@override@JsonKey() final  double totalOut;
 final  List<SellerTransaction> _transactions;
@override@JsonKey() List<SellerTransaction> get transactions {
  if (_transactions is EqualUnmodifiableListView) return _transactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_transactions);
}

@override@JsonKey() final  String selectedPeriod;
// '30d' | '1y'
@override@JsonKey() final  bool isLoading;
@override@JsonKey() final  bool isWithdrawing;
@override final  String? errorMessage;

/// Create a copy of SellerEarningsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SellerEarningsStateCopyWith<_SellerEarningsState> get copyWith => __$SellerEarningsStateCopyWithImpl<_SellerEarningsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SellerEarningsState&&(identical(other.availableBalance, availableBalance) || other.availableBalance == availableBalance)&&(identical(other.bankName, bankName) || other.bankName == bankName)&&(identical(other.bankAccountNumber, bankAccountNumber) || other.bankAccountNumber == bankAccountNumber)&&(identical(other.bankAccountHolder, bankAccountHolder) || other.bankAccountHolder == bankAccountHolder)&&(identical(other.totalIn, totalIn) || other.totalIn == totalIn)&&(identical(other.totalOut, totalOut) || other.totalOut == totalOut)&&const DeepCollectionEquality().equals(other._transactions, _transactions)&&(identical(other.selectedPeriod, selectedPeriod) || other.selectedPeriod == selectedPeriod)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.isWithdrawing, isWithdrawing) || other.isWithdrawing == isWithdrawing)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,availableBalance,bankName,bankAccountNumber,bankAccountHolder,totalIn,totalOut,const DeepCollectionEquality().hash(_transactions),selectedPeriod,isLoading,isWithdrawing,errorMessage);

@override
String toString() {
  return 'SellerEarningsState(availableBalance: $availableBalance, bankName: $bankName, bankAccountNumber: $bankAccountNumber, bankAccountHolder: $bankAccountHolder, totalIn: $totalIn, totalOut: $totalOut, transactions: $transactions, selectedPeriod: $selectedPeriod, isLoading: $isLoading, isWithdrawing: $isWithdrawing, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$SellerEarningsStateCopyWith<$Res> implements $SellerEarningsStateCopyWith<$Res> {
  factory _$SellerEarningsStateCopyWith(_SellerEarningsState value, $Res Function(_SellerEarningsState) _then) = __$SellerEarningsStateCopyWithImpl;
@override @useResult
$Res call({
 double availableBalance, String bankName, String bankAccountNumber, String bankAccountHolder, double totalIn, double totalOut, List<SellerTransaction> transactions, String selectedPeriod, bool isLoading, bool isWithdrawing, String? errorMessage
});




}
/// @nodoc
class __$SellerEarningsStateCopyWithImpl<$Res>
    implements _$SellerEarningsStateCopyWith<$Res> {
  __$SellerEarningsStateCopyWithImpl(this._self, this._then);

  final _SellerEarningsState _self;
  final $Res Function(_SellerEarningsState) _then;

/// Create a copy of SellerEarningsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableBalance = null,Object? bankName = null,Object? bankAccountNumber = null,Object? bankAccountHolder = null,Object? totalIn = null,Object? totalOut = null,Object? transactions = null,Object? selectedPeriod = null,Object? isLoading = null,Object? isWithdrawing = null,Object? errorMessage = freezed,}) {
  return _then(_SellerEarningsState(
availableBalance: null == availableBalance ? _self.availableBalance : availableBalance // ignore: cast_nullable_to_non_nullable
as double,bankName: null == bankName ? _self.bankName : bankName // ignore: cast_nullable_to_non_nullable
as String,bankAccountNumber: null == bankAccountNumber ? _self.bankAccountNumber : bankAccountNumber // ignore: cast_nullable_to_non_nullable
as String,bankAccountHolder: null == bankAccountHolder ? _self.bankAccountHolder : bankAccountHolder // ignore: cast_nullable_to_non_nullable
as String,totalIn: null == totalIn ? _self.totalIn : totalIn // ignore: cast_nullable_to_non_nullable
as double,totalOut: null == totalOut ? _self.totalOut : totalOut // ignore: cast_nullable_to_non_nullable
as double,transactions: null == transactions ? _self._transactions : transactions // ignore: cast_nullable_to_non_nullable
as List<SellerTransaction>,selectedPeriod: null == selectedPeriod ? _self.selectedPeriod : selectedPeriod // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,isWithdrawing: null == isWithdrawing ? _self.isWithdrawing : isWithdrawing // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
