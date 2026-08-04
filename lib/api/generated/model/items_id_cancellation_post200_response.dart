//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/order_item.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'items_id_cancellation_post200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ItemsIdCancellationPost200Response {
  /// Returns a new [ItemsIdCancellationPost200Response] instance.
  ItemsIdCancellationPost200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final OrderItem data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ItemsIdCancellationPost200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory ItemsIdCancellationPost200Response.fromJson(Map<String, dynamic> json) => _$ItemsIdCancellationPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsIdCancellationPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

