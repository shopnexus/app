//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tax_verification_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TaxVerificationRequest {
  /// Returns a new [TaxVerificationRequest] instance.
  TaxVerificationRequest({
    this.note,

    required this.source_,

    required this.status,
  });

  @JsonKey(name: r'note', required: false, includeIfNull: false)
  final String? note;

  /// What the verdict was based on
  @JsonKey(name: r'source', required: true, includeIfNull: false)
  final String source_;

  /// A verdict, so `pending` is not a choice
  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final TaxVerificationRequestStatusEnum status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaxVerificationRequest &&
          other.note == note &&
          other.source_ == source_ &&
          other.status == status;

  @override
  int get hashCode => note.hashCode + source_.hashCode + status.hashCode;

  factory TaxVerificationRequest.fromJson(Map<String, dynamic> json) =>
      _$TaxVerificationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TaxVerificationRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}

/// A verdict, so `pending` is not a choice
enum TaxVerificationRequestStatusEnum {
  /// A verdict, so `pending` is not a choice
  @JsonValue(r'verified')
  verified(r'verified'),

  /// A verdict, so `pending` is not a choice
  @JsonValue(r'rejected')
  rejected(r'rejected');

  const TaxVerificationRequestStatusEnum(this.value);

  final String value;

  @override
  String toString() => value;
}
