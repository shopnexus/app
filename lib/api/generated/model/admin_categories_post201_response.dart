//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_categories_post201_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminCategoriesPost201Response {
  /// Returns a new [AdminCategoriesPost201Response] instance.
  AdminCategoriesPost201Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Category data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminCategoriesPost201Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory AdminCategoriesPost201Response.fromJson(Map<String, dynamic> json) => _$AdminCategoriesPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminCategoriesPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

