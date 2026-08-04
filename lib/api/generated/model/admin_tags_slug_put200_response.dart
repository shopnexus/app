//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/tag.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_tags_slug_put200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminTagsSlugPut200Response {
  /// Returns a new [AdminTagsSlugPut200Response] instance.
  AdminTagsSlugPut200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Tag data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminTagsSlugPut200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory AdminTagsSlugPut200Response.fromJson(Map<String, dynamic> json) => _$AdminTagsSlugPut200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminTagsSlugPut200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

