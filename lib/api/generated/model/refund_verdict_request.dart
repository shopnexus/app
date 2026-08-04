//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'refund_verdict_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RefundVerdictRequest {
  /// Returns a new [RefundVerdictRequest] instance.
  RefundVerdictRequest({

    required  this.buyerWins,

     this.note,
  });

      /// What it does to the money depends on whether the goods have come back; see the endpoint.
  @JsonKey(
    
    name: r'buyer_wins',
    required: true,
    includeIfNull: false,
  )


  final bool buyerWins;



      /// The reasoning, carried to the ticket this closes
  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RefundVerdictRequest &&
      other.buyerWins == buyerWins &&
      other.note == note;

    @override
    int get hashCode =>
        buyerWins.hashCode +
        note.hashCode;

  factory RefundVerdictRequest.fromJson(Map<String, dynamic> json) => _$RefundVerdictRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RefundVerdictRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

