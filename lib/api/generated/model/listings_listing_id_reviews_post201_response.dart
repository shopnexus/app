//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/review.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listings_listing_id_reviews_post201_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingsListingIDReviewsPost201Response {
  /// Returns a new [ListingsListingIDReviewsPost201Response] instance.
  ListingsListingIDReviewsPost201Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Review data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListingsListingIDReviewsPost201Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory ListingsListingIDReviewsPost201Response.fromJson(Map<String, dynamic> json) => _$ListingsListingIDReviewsPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListingsListingIDReviewsPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

