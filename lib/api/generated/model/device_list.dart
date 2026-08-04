//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/device.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DeviceList {
  /// Returns a new [DeviceList] instance.
  DeviceList({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<Device> data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DeviceList &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory DeviceList.fromJson(Map<String, dynamic> json) => _$DeviceListFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

