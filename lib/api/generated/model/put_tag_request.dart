//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'put_tag_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PutTagRequest {
  /// Returns a new [PutTagRequest] instance.
  PutTagRequest({

     this.description,
  });

  @JsonKey(
    
    name: r'description',
    required: false,
    includeIfNull: false,
  )


  final String? description;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PutTagRequest &&
      other.description == description;

    @override
    int get hashCode =>
        description.hashCode;

  factory PutTagRequest.fromJson(Map<String, dynamic> json) => _$PutTagRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PutTagRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

