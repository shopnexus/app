//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/transaction.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TransactionList {
  /// Returns a new [TransactionList] instance.
  TransactionList({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<Transaction> data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TransactionList &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory TransactionList.fromJson(Map<String, dynamic> json) => _$TransactionListFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

