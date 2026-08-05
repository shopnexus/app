//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/wallet.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_list.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WalletList {
  /// Returns a new [WalletList] instance.
  WalletList({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final List<Wallet> data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is WalletList && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory WalletList.fromJson(Map<String, dynamic> json) =>
      _$WalletListFromJson(json);

  Map<String, dynamic> toJson() => _$WalletListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
