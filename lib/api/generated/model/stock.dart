//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stock.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Stock {
  /// Returns a new [Stock] instance.
  Stock({

    required  this.available,

    required  this.quantity,

    required  this.reserved,

    required  this.sold,
  });

      /// quantity − reserved − sold.
          // minimum: 0
  @JsonKey(
    
    name: r'available',
    required: true,
    includeIfNull: false,
  )


  final int available;



      /// Total on hand.
          // minimum: 0
  @JsonKey(
    
    name: r'quantity',
    required: true,
    includeIfNull: false,
  )


  final int quantity;



      /// Held by a checkout that has not completed. Moved by checkout and by cancellation, never set directly, and it comes back when a session expires. 
          // minimum: 0
  @JsonKey(
    
    name: r'reserved',
    required: true,
    includeIfNull: false,
  )


  final int reserved;



      /// Completed sales. Only ever goes up, which is what makes it usable as social proof — a reservation counts here only once the purchase completes. 
          // minimum: 0
  @JsonKey(
    
    name: r'sold',
    required: true,
    includeIfNull: false,
  )


  final int sold;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Stock &&
      other.available == available &&
      other.quantity == quantity &&
      other.reserved == reserved &&
      other.sold == sold;

    @override
    int get hashCode =>
        available.hashCode +
        quantity.hashCode +
        reserved.hashCode +
        sold.hashCode;

  factory Stock.fromJson(Map<String, dynamic> json) => _$StockFromJson(json);

  Map<String, dynamic> toJson() => _$StockToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

