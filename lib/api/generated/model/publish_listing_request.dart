//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'publish_listing_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PublishListingRequest {
  /// Returns a new [PublishListingRequest] instance.
  PublishListingRequest({

     this.pickupContactId,
  });

  @JsonKey(
    
    name: r'pickup_contact_id',
    required: false,
    includeIfNull: false,
  )


  final String? pickupContactId;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PublishListingRequest &&
      other.pickupContactId == pickupContactId;

    @override
    int get hashCode =>
        pickupContactId.hashCode;

  factory PublishListingRequest.fromJson(Map<String, dynamic> json) => _$PublishListingRequestFromJson(json);

  Map<String, dynamic> toJson() => _$PublishListingRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

