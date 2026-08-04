//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// What the money is for; it is what routes the flow. A client cannot pick this — the module that owes the money does. 
enum PaymentSessionKind {
          /// What the money is for; it is what routes the flow. A client cannot pick this — the module that owes the money does. 
      @JsonValue(r'buyer-checkout')
      buyerCheckout(r'buyer-checkout'),
          /// What the money is for; it is what routes the flow. A client cannot pick this — the module that owes the money does. 
      @JsonValue(r'seller-payout')
      sellerPayout(r'seller-payout'),
          /// What the money is for; it is what routes the flow. A client cannot pick this — the module that owes the money does. 
      @JsonValue(r'withdrawal')
      withdrawal(r'withdrawal');

  const PaymentSessionKind(this.value);

  final String value;

  @override
  String toString() => value;
}
