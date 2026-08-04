//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/feedback.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'orders_order_id_feedback_post201_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrdersOrderIDFeedbackPost201Response {
  /// Returns a new [OrdersOrderIDFeedbackPost201Response] instance.
  OrdersOrderIDFeedbackPost201Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Feedback data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OrdersOrderIDFeedbackPost201Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory OrdersOrderIDFeedbackPost201Response.fromJson(Map<String, dynamic> json) => _$OrdersOrderIDFeedbackPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OrdersOrderIDFeedbackPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

