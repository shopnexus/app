//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_message_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SendMessageRequest {
  /// Returns a new [SendMessageRequest] instance.
  SendMessageRequest({

     this.attachments,

     this.body,

     this.refs,
  });

  @JsonKey(
    
    name: r'attachments',
    required: false,
    includeIfNull: false,
  )


  final List<String>? attachments;



  @JsonKey(
    
    name: r'body',
    required: false,
    includeIfNull: false,
  )


  final String? body;



      /// References to point at, each checked against the caller's access to it. There is no way to set `card` from here: a system payload is the backend's to write. 
  @JsonKey(
    
    name: r'refs',
    required: false,
    includeIfNull: false,
  )


  final Map<String, Object>? refs;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SendMessageRequest &&
      other.attachments == attachments &&
      other.body == body &&
      other.refs == refs;

    @override
    int get hashCode =>
        attachments.hashCode +
        body.hashCode +
        refs.hashCode;

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) => _$SendMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendMessageRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

