//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_cart_item_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateCartItemRequest {
  /// Returns a new [UpdateCartItemRequest] instance.
  UpdateCartItemRequest({

    required  this.quantity,
  });

          // minimum: 1
  @JsonKey(
    
    name: r'quantity',
    required: true,
    includeIfNull: false,
  )


  final int quantity;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateCartItemRequest &&
      other.quantity == quantity;

    @override
    int get hashCode =>
        quantity.hashCode;

  factory UpdateCartItemRequest.fromJson(Map<String, dynamic> json) => _$UpdateCartItemRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateCartItemRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

