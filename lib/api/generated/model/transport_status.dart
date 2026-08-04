//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// Where the shipment is. `pending` is created but not yet handed over.
enum TransportStatus {
          /// Where the shipment is. `pending` is created but not yet handed over.
      @JsonValue(r'pending')
      pending(r'pending'),
          /// Where the shipment is. `pending` is created but not yet handed over.
      @JsonValue(r'picked-up')
      pickedUp(r'picked-up'),
          /// Where the shipment is. `pending` is created but not yet handed over.
      @JsonValue(r'in-transit')
      inTransit(r'in-transit'),
          /// Where the shipment is. `pending` is created but not yet handed over.
      @JsonValue(r'delivered')
      delivered(r'delivered'),
          /// Where the shipment is. `pending` is created but not yet handed over.
      @JsonValue(r'returned')
      returned(r'returned'),
          /// Where the shipment is. `pending` is created but not yet handed over.
      @JsonValue(r'failed')
      failed(r'failed'),
          /// Where the shipment is. `pending` is created but not yet handed over.
      @JsonValue(r'cancelled')
      cancelled(r'cancelled');

  const TransportStatus(this.value);

  final String value;

  @override
  String toString() => value;
}
