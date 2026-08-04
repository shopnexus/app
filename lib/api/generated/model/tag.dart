//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tag.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Tag {
  /// Returns a new [Tag] instance.
  Tag({

     this.description,

     this.score,

    required  this.slug,
  });

  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



      /// Relevance, always oriented so that higher is closer — for a vector ranking that is `1 - (a <=> b)`, the cosine similarity, because the operator itself returns a distance. Null unless the request asked for a ranking. 
          // minimum: -1
          // maximum: 1
  @JsonKey(
    
    name: r'score',
    required: false,
    includeIfNull: false,
  )


  final double? score;



      /// A tag's id is its slug. A natural key, so it is never encoded.
  @JsonKey(
    
    name: r'slug',
    required: true,
    includeIfNull: false,
  )


  final String slug;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Tag &&
      other.description == description &&
      other.score == score &&
      other.slug == slug;

    @override
    int get hashCode =>
        (description == null ? 0 : description.hashCode) +
        (score == null ? 0 : score.hashCode) +
        slug.hashCode;

  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

