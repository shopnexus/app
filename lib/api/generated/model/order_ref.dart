//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_ref.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OrderRef {
  /// Returns a new [OrderRef] instance.
  OrderRef({

    required  this.id,
  });

  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OrderRef &&
      other.id == id;

    @override
    int get hashCode =>
        id.hashCode;

  factory OrderRef.fromJson(Map<String, dynamic> json) => _$OrderRefFromJson(json);

  Map<String, dynamic> toJson() => _$OrderRefToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

