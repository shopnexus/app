//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/transport_checkpoint.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transport_checkpoint_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TransportCheckpointRequest {
  /// Returns a new [TransportCheckpointRequest] instance.
  TransportCheckpointRequest({

    required  this.status,
  });

  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final TransportCheckpoint status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TransportCheckpointRequest &&
      other.status == status;

    @override
    int get hashCode =>
        status.hashCode;

  factory TransportCheckpointRequest.fromJson(Map<String, dynamic> json) => _$TransportCheckpointRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TransportCheckpointRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

