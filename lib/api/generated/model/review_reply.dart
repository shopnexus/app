//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_reply.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReviewReply {
  /// Returns a new [ReviewReply] instance.
  ReviewReply({

    required  this.author,

    required  this.body,

    required  this.createdAt,

    required  this.id,

    required  this.isSeller,
  });

  @JsonKey(
    
    name: r'author',
    required: true,
    includeIfNull: false,
  )


  final AccountSummary author;



  @JsonKey(
    
    name: r'body',
    required: true,
    includeIfNull: false,
  )


  final String body;



  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



      /// Whether the author owns the listing.
  @JsonKey(
    
    name: r'is_seller',
    required: true,
    includeIfNull: false,
  )


  final bool isSeller;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReviewReply &&
      other.author == author &&
      other.body == body &&
      other.createdAt == createdAt &&
      other.id == id &&
      other.isSeller == isSeller;

    @override
    int get hashCode =>
        author.hashCode +
        body.hashCode +
        createdAt.hashCode +
        id.hashCode +
        isSeller.hashCode;

  factory ReviewReply.fromJson(Map<String, dynamic> json) => _$ReviewReplyFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewReplyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

