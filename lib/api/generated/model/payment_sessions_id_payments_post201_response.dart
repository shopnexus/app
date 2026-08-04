//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/transaction.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_sessions_id_payments_post201_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaymentSessionsIdPaymentsPost201Response {
  /// Returns a new [PaymentSessionsIdPaymentsPost201Response] instance.
  PaymentSessionsIdPaymentsPost201Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Transaction data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaymentSessionsIdPaymentsPost201Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory PaymentSessionsIdPaymentsPost201Response.fromJson(Map<String, dynamic> json) => _$PaymentSessionsIdPaymentsPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentSessionsIdPaymentsPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

