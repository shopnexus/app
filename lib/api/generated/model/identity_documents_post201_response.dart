//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/identity_verification_ticket.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'identity_documents_post201_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class IdentityDocumentsPost201Response {
  /// Returns a new [IdentityDocumentsPost201Response] instance.
  IdentityDocumentsPost201Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final IdentityVerificationTicket data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IdentityDocumentsPost201Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory IdentityDocumentsPost201Response.fromJson(
    Map<String, dynamic> json,
  ) => _$IdentityDocumentsPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IdentityDocumentsPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
