//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/bank_account.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'bank_accounts_post201_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class BankAccountsPost201Response {
  /// Returns a new [BankAccountsPost201Response] instance.
  BankAccountsPost201Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final BankAccount data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is BankAccountsPost201Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory BankAccountsPost201Response.fromJson(Map<String, dynamic> json) => _$BankAccountsPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BankAccountsPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

