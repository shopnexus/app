//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/web_socket_ticket.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_web_socket_ticket201_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CreateWebSocketTicket201Response {
  /// Returns a new [CreateWebSocketTicket201Response] instance.
  CreateWebSocketTicket201Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final WebSocketTicket data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CreateWebSocketTicket201Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory CreateWebSocketTicket201Response.fromJson(Map<String, dynamic> json) => _$CreateWebSocketTicket201ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateWebSocketTicket201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

