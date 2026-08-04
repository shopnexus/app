//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/contact_address_type.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_contact_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UpdateContactRequest {
  /// Returns a new [UpdateContactRequest] instance.
  UpdateContactRequest({

     this.address,

     this.addressDetail,

     this.addressType,

     this.clearAddressDetail,

     this.clearDistrict,

     this.clearLocation,

     this.clearPostalCode,

     this.country,

     this.districtCode,

     this.districtName,

     this.fullName,

     this.isDefaultDelivery,

     this.isDefaultPickup,

     this.latitude,

     this.longitude,

     this.phone,

     this.postalCode,

     this.provinceCode,

     this.provinceName,

     this.wardCode,

     this.wardName,
  });

  @JsonKey(
    
    name: r'address',
    required: false,
    includeIfNull: false,
  )


  final String? address;



  @JsonKey(
    
    name: r'address_detail',
    required: false,
    includeIfNull: false,
  )


  final String? addressDetail;



  @JsonKey(
    
    name: r'address_type',
    required: false,
    includeIfNull: false,
  )


  final ContactAddressType? addressType;



  @JsonKey(
    
    name: r'clear_address_detail',
    required: false,
    includeIfNull: false,
  )


  final bool? clearAddressDetail;



  @JsonKey(
    
    name: r'clear_district',
    required: false,
    includeIfNull: false,
  )


  final bool? clearDistrict;



  @JsonKey(
    
    name: r'clear_location',
    required: false,
    includeIfNull: false,
  )


  final bool? clearLocation;



  @JsonKey(
    
    name: r'clear_postal_code',
    required: false,
    includeIfNull: false,
  )


  final bool? clearPostalCode;



  @JsonKey(
    
    name: r'country',
    required: false,
    includeIfNull: false,
  )


  final String? country;



  @JsonKey(
    
    name: r'district_code',
    required: false,
    includeIfNull: false,
  )


  final String? districtCode;



  @JsonKey(
    
    name: r'district_name',
    required: false,
    includeIfNull: false,
  )


  final String? districtName;



  @JsonKey(
    
    name: r'full_name',
    required: false,
    includeIfNull: false,
  )


  final String? fullName;



  @JsonKey(
    
    name: r'is_default_delivery',
    required: false,
    includeIfNull: false,
  )


  final bool? isDefaultDelivery;



  @JsonKey(
    
    name: r'is_default_pickup',
    required: false,
    includeIfNull: false,
  )


  final bool? isDefaultPickup;



          // minimum: -90
          // maximum: 90
  @JsonKey(
    
    name: r'latitude',
    required: false,
    includeIfNull: false,
  )


  final double? latitude;



          // minimum: -180
          // maximum: 180
  @JsonKey(
    
    name: r'longitude',
    required: false,
    includeIfNull: false,
  )


  final double? longitude;



  @JsonKey(
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;



  @JsonKey(
    
    name: r'postal_code',
    required: false,
    includeIfNull: false,
  )


  final String? postalCode;



  @JsonKey(
    
    name: r'province_code',
    required: false,
    includeIfNull: false,
  )


  final String? provinceCode;



  @JsonKey(
    
    name: r'province_name',
    required: false,
    includeIfNull: false,
  )


  final String? provinceName;



  @JsonKey(
    
    name: r'ward_code',
    required: false,
    includeIfNull: false,
  )


  final String? wardCode;



  @JsonKey(
    
    name: r'ward_name',
    required: false,
    includeIfNull: false,
  )


  final String? wardName;





    @override
    bool operator ==(Object other) => identical(this, other) || other is UpdateContactRequest &&
      other.address == address &&
      other.addressDetail == addressDetail &&
      other.addressType == addressType &&
      other.clearAddressDetail == clearAddressDetail &&
      other.clearDistrict == clearDistrict &&
      other.clearLocation == clearLocation &&
      other.clearPostalCode == clearPostalCode &&
      other.country == country &&
      other.districtCode == districtCode &&
      other.districtName == districtName &&
      other.fullName == fullName &&
      other.isDefaultDelivery == isDefaultDelivery &&
      other.isDefaultPickup == isDefaultPickup &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.phone == phone &&
      other.postalCode == postalCode &&
      other.provinceCode == provinceCode &&
      other.provinceName == provinceName &&
      other.wardCode == wardCode &&
      other.wardName == wardName;

    @override
    int get hashCode =>
        address.hashCode +
        addressDetail.hashCode +
        addressType.hashCode +
        clearAddressDetail.hashCode +
        clearDistrict.hashCode +
        clearLocation.hashCode +
        clearPostalCode.hashCode +
        country.hashCode +
        districtCode.hashCode +
        districtName.hashCode +
        fullName.hashCode +
        isDefaultDelivery.hashCode +
        isDefaultPickup.hashCode +
        latitude.hashCode +
        longitude.hashCode +
        phone.hashCode +
        postalCode.hashCode +
        provinceCode.hashCode +
        provinceName.hashCode +
        wardCode.hashCode +
        wardName.hashCode;

  factory UpdateContactRequest.fromJson(Map<String, dynamic> json) => _$UpdateContactRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateContactRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

