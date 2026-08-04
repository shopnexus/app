//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_category_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateCategoryRequest {
  /// Returns a new [UpdateCategoryRequest] instance.
  UpdateCategoryRequest({

     this.clearParentId,

     this.description,

     this.name,

     this.parentId,
  });

      /// Promotes the category to a root.
  @JsonKey(
    
    name: r'clear_parent_id',
    required: false,
    includeIfNull: false,
  )


  final bool? clearParentId;



  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;



  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



  @JsonKey(
    
    name: r'parent_id',
    required: false,
    includeIfNull: false,
  )


  final String? parentId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateCategoryRequest &&
      other.clearParentId == clearParentId &&
      other.description == description &&
      other.name == name &&
      other.parentId == parentId;

    @override
    int get hashCode =>
        clearParentId.hashCode +
        description.hashCode +
        name.hashCode +
        parentId.hashCode;

  factory UpdateCategoryRequest.fromJson(Map<String, dynamic> json) => _$UpdateCategoryRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCategoryRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

