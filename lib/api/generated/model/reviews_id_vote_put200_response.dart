//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/review_vote_tally.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reviews_id_vote_put200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReviewsIdVotePut200Response {
  /// Returns a new [ReviewsIdVotePut200Response] instance.
  ReviewsIdVotePut200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final ReviewVoteTally data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReviewsIdVotePut200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory ReviewsIdVotePut200Response.fromJson(Map<String, dynamic> json) => _$ReviewsIdVotePut200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsIdVotePut200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

