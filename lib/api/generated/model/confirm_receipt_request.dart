//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'confirm_receipt_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfirmReceiptRequest {
  /// Returns a new [ConfirmReceiptRequest] instance.
  ConfirmReceiptRequest({

    required  this.attachments,
  });

      /// Unboxing photos or video. At least one is mandatory — a later refund is judged on this evidence. 
  @JsonKey(
    
    name: r'attachments',
    required: true,
    includeIfNull: false,
  )


  final List<String> attachments;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfirmReceiptRequest &&
      other.attachments == attachments;

    @override
    int get hashCode =>
        attachments.hashCode;

  factory ConfirmReceiptRequest.fromJson(Map<String, dynamic> json) => _$ConfirmReceiptRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmReceiptRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

