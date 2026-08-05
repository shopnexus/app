//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/identity_document.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_identity_document.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminIdentityDocument {
  /// Returns a new [AdminIdentityDocument] instance.
  AdminIdentityDocument({required this.account, required this.document});

  @JsonKey(name: r'account', required: true, includeIfNull: false)
  final AccountSummary account;

  @JsonKey(name: r'document', required: true, includeIfNull: false)
  final IdentityDocument document;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AdminIdentityDocument &&
          other.account == account &&
          other.document == document;

  @override
  int get hashCode => account.hashCode + document.hashCode;

  factory AdminIdentityDocument.fromJson(Map<String, dynamic> json) =>
      _$AdminIdentityDocumentFromJson(json);

  Map<String, dynamic> toJson() => _$AdminIdentityDocumentToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
