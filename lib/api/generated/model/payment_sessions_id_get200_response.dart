//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/payment_session.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_sessions_id_get200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaymentSessionsIdGet200Response {
  /// Returns a new [PaymentSessionsIdGet200Response] instance.
  PaymentSessionsIdGet200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final PaymentSession data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaymentSessionsIdGet200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory PaymentSessionsIdGet200Response.fromJson(Map<String, dynamic> json) => _$PaymentSessionsIdGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentSessionsIdGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

