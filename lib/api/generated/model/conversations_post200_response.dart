//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/conversation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversations_post200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConversationsPost200Response {
  /// Returns a new [ConversationsPost200Response] instance.
  ConversationsPost200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Conversation data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConversationsPost200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory ConversationsPost200Response.fromJson(Map<String, dynamic> json) => _$ConversationsPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationsPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

