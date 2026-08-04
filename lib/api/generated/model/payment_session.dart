//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/payment_session_kind.dart';
import 'package:shopnexus_flutter_app/api/generated/model/payment_session_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_session.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaymentSession {
  /// Returns a new [PaymentSession] instance.
  PaymentSession({

    required  this.createdAt,

    required  this.currency,

    required  this.expiredAt,

     this.fromId,

    required  this.id,

    required  this.kind,

     this.note,

    required  this.outstanding,

     this.paidAt,

    required  this.status,

     this.toId,

    required  this.totalAmount,
  });

  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



      /// ISO 4217. Never inferred from the account's country — one currency spans many countries, and a seller may want a balance in a foreign one. 
  @JsonKey(
    
    name: r'currency',
    required: true,
    includeIfNull: false,
  )


  final String currency;



      /// A session still unsettled past this point is voided by a job.
  @JsonKey(
    
    name: r'expired_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime expiredAt;



      /// The payer. Null means the platform itself.
  @JsonKey(
    
    name: r'from_id',
    required: false,
    includeIfNull: false,
  )


  final String? fromId;



  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'kind',
    required: true,
    includeIfNull: false,
  )


  final PaymentSessionKind kind;



  @JsonKey(
    
    name: r'note',
    required: false,
    includeIfNull: false,
  )


  final String? note;



      /// The total less what has already settled on a rail: what a further payment may still tender. Computed, because a stored copy would be a second fact to keep in step with every leg. 
          // minimum: 0
  @JsonKey(
    
    name: r'outstanding',
    required: true,
    includeIfNull: false,
  )


  final int outstanding;



  @JsonKey(
    
    name: r'paid_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? paidAt;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final PaymentSessionStatus status;



      /// The payee. Null means the platform itself.
  @JsonKey(
    
    name: r'to_id',
    required: false,
    includeIfNull: false,
  )


  final String? toId;



      /// Amount owed, smallest unit of `currency`
          // minimum: 0
  @JsonKey(
    
    name: r'total_amount',
    required: true,
    includeIfNull: false,
  )


  final int totalAmount;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaymentSession &&
      other.createdAt == createdAt &&
      other.currency == currency &&
      other.expiredAt == expiredAt &&
      other.fromId == fromId &&
      other.id == id &&
      other.kind == kind &&
      other.note == note &&
      other.outstanding == outstanding &&
      other.paidAt == paidAt &&
      other.status == status &&
      other.toId == toId &&
      other.totalAmount == totalAmount;

    @override
    int get hashCode =>
        createdAt.hashCode +
        currency.hashCode +
        expiredAt.hashCode +
        (fromId == null ? 0 : fromId.hashCode) +
        id.hashCode +
        kind.hashCode +
        note.hashCode +
        outstanding.hashCode +
        (paidAt == null ? 0 : paidAt.hashCode) +
        status.hashCode +
        (toId == null ? 0 : toId.hashCode) +
        totalAmount.hashCode;

  factory PaymentSession.fromJson(Map<String, dynamic> json) => _$PaymentSessionFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentSessionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

