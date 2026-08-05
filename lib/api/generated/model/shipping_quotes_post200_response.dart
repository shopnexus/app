//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/shipping_quotes.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shipping_quotes_post200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ShippingQuotesPost200Response {
  /// Returns a new [ShippingQuotesPost200Response] instance.
  ShippingQuotesPost200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final ShippingQuotes data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShippingQuotesPost200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory ShippingQuotesPost200Response.fromJson(Map<String, dynamic> json) =>
      _$ShippingQuotesPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ShippingQuotesPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
