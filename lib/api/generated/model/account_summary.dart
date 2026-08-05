//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_summary.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AccountSummary {
  /// Returns a new [AccountSummary] instance.
  AccountSummary({this.avatar, required this.id, required this.name});

  @JsonKey(name: r'avatar', required: false, includeIfNull: false)
  final Resource? avatar;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'name', required: true, includeIfNull: false)
  final String name;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccountSummary &&
          other.avatar == avatar &&
          other.id == id &&
          other.name == name;

  @override
  int get hashCode =>
      (avatar == null ? 0 : avatar.hashCode) + id.hashCode + name.hashCode;

  factory AccountSummary.fromJson(Map<String, dynamic> json) =>
      _$AccountSummaryFromJson(json);

  Map<String, dynamic> toJson() => _$AccountSummaryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
