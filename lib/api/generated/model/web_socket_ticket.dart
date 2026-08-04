//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'web_socket_ticket.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WebSocketTicket {
  /// Returns a new [WebSocketTicket] instance.
  WebSocketTicket({

    required  this.expiresIn,

    required  this.ticket,
  });

      /// Seconds until the ticket expires.
          // minimum: 1
          // maximum: 300
  @JsonKey(
    
    name: r'expires_in',
    required: true,
    includeIfNull: false,
  )


  final int expiresIn;



      /// Pass as the `ticket` query parameter when opening the socket.
  @JsonKey(
    
    name: r'ticket',
    required: true,
    includeIfNull: false,
  )


  final String ticket;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WebSocketTicket &&
      other.expiresIn == expiresIn &&
      other.ticket == ticket;

    @override
    int get hashCode =>
        expiresIn.hashCode +
        ticket.hashCode;

  factory WebSocketTicket.fromJson(Map<String, dynamic> json) => _$WebSocketTicketFromJson(json);

  Map<String, dynamic> toJson() => _$WebSocketTicketToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

