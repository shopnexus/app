//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversations_uploads_id_confirmation_post200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConversationsUploadsIdConfirmationPost200Response {
  /// Returns a new [ConversationsUploadsIdConfirmationPost200Response] instance.
  ConversationsUploadsIdConfirmationPost200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Resource data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConversationsUploadsIdConfirmationPost200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory ConversationsUploadsIdConfirmationPost200Response.fromJson(Map<String, dynamic> json) => _$ConversationsUploadsIdConfirmationPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationsUploadsIdConfirmationPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

