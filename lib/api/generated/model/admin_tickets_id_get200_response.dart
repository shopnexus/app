//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/admin_ticket.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_tickets_id_get200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminTicketsIdGet200Response {
  /// Returns a new [AdminTicketsIdGet200Response] instance.
  AdminTicketsIdGet200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final AdminTicket data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminTicketsIdGet200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory AdminTicketsIdGet200Response.fromJson(Map<String, dynamic> json) => _$AdminTicketsIdGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminTicketsIdGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

