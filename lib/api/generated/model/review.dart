//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/review_vote_tally.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:shopnexus_flutter_app/api/generated/model/review_reply.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Review {
  /// Returns a new [Review] instance.
  Review({
    required this.attachments,

    required this.author,

    required this.body,

    required this.createdAt,

    required this.id,

    required this.listingId,

    required this.rating,

    required this.replies,

    required this.replyCount,

    required this.updatedAt,

    required this.votes,
  });

  @JsonKey(name: r'attachments', required: true, includeIfNull: false)
  final List<Resource> attachments;

  @JsonKey(name: r'author', required: true, includeIfNull: false)
  final AccountSummary author;

  @JsonKey(name: r'body', required: true, includeIfNull: false)
  final String body;

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  @JsonKey(name: r'listing_id', required: true, includeIfNull: false)
  final String listingId;

  // minimum: 1
  // maximum: 5
  @JsonKey(name: r'rating', required: true, includeIfNull: false)
  final int rating;

  /// The first few, oldest first. Replies are unlimited, so a page of reviews cannot carry all of them — `reply_count` says how many there are and `GET /reviews/{id}` returns the rest.
  @JsonKey(name: r'replies', required: true, includeIfNull: false)
  final List<ReviewReply> replies;

  // minimum: 0
  @JsonKey(name: r'reply_count', required: true, includeIfNull: false)
  final int replyCount;

  /// Null until the author edits it. A review rewritten after the seller answered it should say so, and the reply thread cannot say it on its own.
  @JsonKey(name: r'updated_at', required: true, includeIfNull: true)
  final DateTime? updatedAt;

  @JsonKey(name: r'votes', required: true, includeIfNull: false)
  final ReviewVoteTally votes;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Review &&
          other.attachments == attachments &&
          other.author == author &&
          other.body == body &&
          other.createdAt == createdAt &&
          other.id == id &&
          other.listingId == listingId &&
          other.rating == rating &&
          other.replies == replies &&
          other.replyCount == replyCount &&
          other.updatedAt == updatedAt &&
          other.votes == votes;

  @override
  int get hashCode =>
      attachments.hashCode +
      author.hashCode +
      body.hashCode +
      createdAt.hashCode +
      id.hashCode +
      listingId.hashCode +
      rating.hashCode +
      replies.hashCode +
      replyCount.hashCode +
      (updatedAt == null ? 0 : updatedAt.hashCode) +
      votes.hashCode;

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
