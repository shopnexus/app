//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/identity_document.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'identity_document_list.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class IdentityDocumentList {
  /// Returns a new [IdentityDocumentList] instance.
  IdentityDocumentList({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final List<IdentityDocument> data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdentityDocumentList && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory IdentityDocumentList.fromJson(Map<String, dynamic> json) =>
      _$IdentityDocumentListFromJson(json);

  Map<String, dynamic> toJson() => _$IdentityDocumentListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
