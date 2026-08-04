//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/listing_suggestion.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'listings_suggestions_post200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListingsSuggestionsPost200Response {
  /// Returns a new [ListingsSuggestionsPost200Response] instance.
  ListingsSuggestionsPost200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final ListingSuggestion data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListingsSuggestionsPost200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory ListingsSuggestionsPost200Response.fromJson(Map<String, dynamic> json) => _$ListingsSuggestionsPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListingsSuggestionsPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

