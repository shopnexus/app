//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/bank_account.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_account_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BankAccountList {
  /// Returns a new [BankAccountList] instance.
  BankAccountList({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<BankAccount> data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BankAccountList &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory BankAccountList.fromJson(Map<String, dynamic> json) => _$BankAccountListFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

