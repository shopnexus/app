//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet_adjustment_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class WalletAdjustmentRequest {
  /// Returns a new [WalletAdjustmentRequest] instance.
  WalletAdjustmentRequest({

     this.availableDelta = 0,

    required  this.currency,

     this.heldDelta = 0,

    required  this.idempotencyKey,

    required  this.reason,
  });

  @JsonKey(
    defaultValue: 0,
    name: r'available_delta',
    required: false,
    includeIfNull: false,
  )


  final int? availableDelta;



      /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one. 
  @JsonKey(
    
    name: r'currency',
    required: true,
    includeIfNull: false,
  )


  final String currency;



  @JsonKey(
    defaultValue: 0,
    name: r'held_delta',
    required: false,
    includeIfNull: false,
  )


  final int? heldDelta;



      /// Required. A retried correction that posts twice is money invented.
  @JsonKey(
    
    name: r'idempotency_key',
    required: true,
    includeIfNull: false,
  )


  final String idempotencyKey;



  @JsonKey(
    
    name: r'reason',
    required: true,
    includeIfNull: false,
  )


  final String reason;





    @override
    bool operator ==(Object other) => identical(this, other) || other is WalletAdjustmentRequest &&
      other.availableDelta == availableDelta &&
      other.currency == currency &&
      other.heldDelta == heldDelta &&
      other.idempotencyKey == idempotencyKey &&
      other.reason == reason;

    @override
    int get hashCode =>
        availableDelta.hashCode +
        currency.hashCode +
        heldDelta.hashCode +
        idempotencyKey.hashCode +
        reason.hashCode;

  factory WalletAdjustmentRequest.fromJson(Map<String, dynamic> json) => _$WalletAdjustmentRequestFromJson(json);

  Map<String, dynamic> toJson() => _$WalletAdjustmentRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

