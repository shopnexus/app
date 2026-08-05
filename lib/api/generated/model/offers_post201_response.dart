//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/offer.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offers_post201_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OffersPost201Response {
  /// Returns a new [OffersPost201Response] instance.
  OffersPost201Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final Offer data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OffersPost201Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory OffersPost201Response.fromJson(Map<String, dynamic> json) =>
      _$OffersPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OffersPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
