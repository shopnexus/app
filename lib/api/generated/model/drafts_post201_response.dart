//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/draft_order.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drafts_post201_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DraftsPost201Response {
  /// Returns a new [DraftsPost201Response] instance.
  DraftsPost201Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final DraftOrder data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DraftsPost201Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory DraftsPost201Response.fromJson(Map<String, dynamic> json) => _$DraftsPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DraftsPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

