//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pending_edit.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PendingEdit {
  /// Returns a new [PendingEdit] instance.
  PendingEdit({

     this.attachments,

     this.categoryId,

     this.condition,

     this.description,

     this.name,

     this.priceMode,

     this.specifications,

     this.tags,
  });

  @JsonKey(
    
    name: r'attachments',
    required: false,
    includeIfNull: false,
  )


  final List<String>? attachments;



  @JsonKey(
    
    name: r'category_id',
    required: false,
    includeIfNull: false,
  )


  final String? categoryId;



  @JsonKey(
    
    name: r'condition',
    required: false,
    includeIfNull: false,
  )


  final ListingCondition? condition;



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
    
    name: r'price_mode',
    required: false,
    includeIfNull: false,
  )


  final PriceMode? priceMode;



  @JsonKey(
    
    name: r'specifications',
    required: false,
    includeIfNull: false,
  )


  final Map<String, Object>? specifications;



  @JsonKey(
    
    name: r'tags',
    required: false,
    includeIfNull: false,
  )


  final List<String>? tags;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PendingEdit &&
      other.attachments == attachments &&
      other.categoryId == categoryId &&
      other.condition == condition &&
      other.description == description &&
      other.name == name &&
      other.priceMode == priceMode &&
      other.specifications == specifications &&
      other.tags == tags;

    @override
    int get hashCode =>
        attachments.hashCode +
        categoryId.hashCode +
        condition.hashCode +
        description.hashCode +
        name.hashCode +
        priceMode.hashCode +
        specifications.hashCode +
        tags.hashCode;

  factory PendingEdit.fromJson(Map<String, dynamic> json) => _$PendingEditFromJson(json);

  Map<String, dynamic> toJson() => _$PendingEditToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

