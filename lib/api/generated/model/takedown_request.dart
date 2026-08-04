//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'takedown_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TakedownRequest {
  /// Returns a new [TakedownRequest] instance.
  TakedownRequest({

     this.notifySeller = true,

    required  this.reason,
  });

  @JsonKey(
    defaultValue: true,
    name: r'notify_seller',
    required: false,
    includeIfNull: false,
  )


  final bool? notifySeller;



  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final String reason;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TakedownRequest &&
      other.notifySeller == notifySeller &&
      other.reason == reason;

    @override
    int get hashCode =>
        notifySeller.hashCode +
        reason.hashCode;

  factory TakedownRequest.fromJson(Map<String, dynamic> json) => _$TakedownRequestFromJson(json);

  Map<String, dynamic> toJson() => _$TakedownRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

