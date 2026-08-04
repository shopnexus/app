//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'mark_conversation_read_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MarkConversationReadRequest {
  /// Returns a new [MarkConversationReadRequest] instance.
  MarkConversationReadRequest({

     this.before,
  });

      /// Mark everything sent at or before this instant read. Omit to mark the whole thread read. 
  @JsonKey(
    
    name: r'before',
    required: false,
    includeIfNull: false,
  )


  final DateTime? before;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MarkConversationReadRequest &&
      other.before == before;

    @override
    int get hashCode =>
        before.hashCode;

  factory MarkConversationReadRequest.fromJson(Map<String, dynamic> json) => _$MarkConversationReadRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MarkConversationReadRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

