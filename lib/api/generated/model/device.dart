//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/device_platform.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Device {
  /// Returns a new [Device] instance.
  Device({

    required  this.createdAt,

    required  this.id,

    required  this.lastSeenAt,

    required  this.platform,

    required  this.pushTokenSuffix,
  });

  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'last_seen_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime lastSeenAt;



  @JsonKey(
    
    name: r'platform',
    required: true,
    includeIfNull: false,
  )


  final DevicePlatform platform;



      /// The tail of the token, enough for a client to recognise its own install. The whole token is a delivery credential and is never returned. 
  @JsonKey(
    
    name: r'push_token_suffix',
    required: true,
    includeIfNull: false,
  )


  final String pushTokenSuffix;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Device &&
      other.createdAt == createdAt &&
      other.id == id &&
      other.lastSeenAt == lastSeenAt &&
      other.platform == platform &&
      other.pushTokenSuffix == pushTokenSuffix;

    @override
    int get hashCode =>
        createdAt.hashCode +
        id.hashCode +
        lastSeenAt.hashCode +
        platform.hashCode +
        pushTokenSuffix.hashCode;

  factory Device.fromJson(Map<String, dynamic> json) => _$DeviceFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

