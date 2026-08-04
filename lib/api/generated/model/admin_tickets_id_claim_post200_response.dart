//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_tickets_id_claim_post200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminTicketsIdClaimPost200Response {
  /// Returns a new [AdminTicketsIdClaimPost200Response] instance.
  AdminTicketsIdClaimPost200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Ticket data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminTicketsIdClaimPost200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory AdminTicketsIdClaimPost200Response.fromJson(Map<String, dynamic> json) => _$AdminTicketsIdClaimPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminTicketsIdClaimPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

