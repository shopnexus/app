//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/review_reply.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'reviews_id_replies_post201_response.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReviewsIdRepliesPost201Response {
  /// Returns a new [ReviewsIdRepliesPost201Response] instance.
  ReviewsIdRepliesPost201Response({required this.data});

  @JsonKey(name: r'data', required: true, includeIfNull: false)
  final ReviewReply data;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReviewsIdRepliesPost201Response && other.data == data;

  @override
  int get hashCode => data.hashCode;

  factory ReviewsIdRepliesPost201Response.fromJson(Map<String, dynamic> json) =>
      _$ReviewsIdRepliesPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ReviewsIdRepliesPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
