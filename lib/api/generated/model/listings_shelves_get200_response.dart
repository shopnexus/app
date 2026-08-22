//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/shelf.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listings_shelves_get200_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingsShelvesGet200Response {
  /// Returns a new [ListingsShelvesGet200Response] instance.
  ListingsShelvesGet200Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final List<Shelf> data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListingsShelvesGet200Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory ListingsShelvesGet200Response.fromJson(Map<String, dynamic> json) =>
      _$ListingsShelvesGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListingsShelvesGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
