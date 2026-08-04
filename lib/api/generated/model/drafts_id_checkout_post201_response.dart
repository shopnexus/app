//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/checkout_result.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'drafts_id_checkout_post201_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DraftsIdCheckoutPost201Response {
  /// Returns a new [DraftsIdCheckoutPost201Response] instance.
  DraftsIdCheckoutPost201Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final CheckoutResult data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DraftsIdCheckoutPost201Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory DraftsIdCheckoutPost201Response.fromJson(Map<String, dynamic> json) => _$DraftsIdCheckoutPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DraftsIdCheckoutPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

