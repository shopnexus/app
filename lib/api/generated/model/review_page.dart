//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/review.dart';
import 'package:shopnexus_flutter_app/api/generated/model/cursor_meta.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_page.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReviewPage {
  /// Returns a new [ReviewPage] instance.
  ReviewPage({

    required  this.data,

    required  this.meta,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<Review> data;



  @JsonKey(
    
    name: r'meta',
    required: true,
    includeIfNull: false,
  )


  final CursorMeta meta;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReviewPage &&
      other.data == data &&
      other.meta == meta;

    @override
    int get hashCode =>
        data.hashCode +
        meta.hashCode;

  factory ReviewPage.fromJson(Map<String, dynamic> json) => _$ReviewPageFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewPageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

