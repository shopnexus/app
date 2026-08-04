//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_account.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BankAccount {
  /// Returns a new [BankAccount] instance.
  BankAccount({

    required  this.accountHolder,

    required  this.accountNumberMasked,

    required  this.bankCode,

    required  this.createdAt,

    required  this.id,

    required  this.isDefault,
  });

  @JsonKey(
    
    name: r'account_holder',
    required: true,
    includeIfNull: false,
  )


  final String accountHolder;



      /// Only the last digits. The full number leaves the system solely to move money.
  @JsonKey(
    
    name: r'account_number_masked',
    required: true,
    includeIfNull: false,
  )


  final String accountNumberMasked;



      /// Bank identifier, e.g. `vcb`
  @JsonKey(
    
    name: r'bank_code',
    required: true,
    includeIfNull: false,
  )


  final String bankCode;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'is_default',
    required: true,
    includeIfNull: false,
  )


  final bool isDefault;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BankAccount &&
      other.accountHolder == accountHolder &&
      other.accountNumberMasked == accountNumberMasked &&
      other.bankCode == bankCode &&
      other.createdAt == createdAt &&
      other.id == id &&
      other.isDefault == isDefault;

    @override
    int get hashCode =>
        accountHolder.hashCode +
        accountNumberMasked.hashCode +
        bankCode.hashCode +
        createdAt.hashCode +
        id.hashCode +
        isDefault.hashCode;

  factory BankAccount.fromJson(Map<String, dynamic> json) => _$BankAccountFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

