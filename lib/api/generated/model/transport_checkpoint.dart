//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// A position a checkpoint may report, so `pending` is not one of them — that is where a shipment starts, not somewhere it can be moved to. The last three are outcomes and are reachable from anywhere: a parcel can fail before it is ever collected. 
enum TransportCheckpoint {
          /// A position a checkpoint may report, so `pending` is not one of them — that is where a shipment starts, not somewhere it can be moved to. The last three are outcomes and are reachable from anywhere: a parcel can fail before it is ever collected. 
      @JsonValue(r'picked-up')
      pickedUp(r'picked-up'),
          /// A position a checkpoint may report, so `pending` is not one of them — that is where a shipment starts, not somewhere it can be moved to. The last three are outcomes and are reachable from anywhere: a parcel can fail before it is ever collected. 
      @JsonValue(r'in-transit')
      inTransit(r'in-transit'),
          /// A position a checkpoint may report, so `pending` is not one of them — that is where a shipment starts, not somewhere it can be moved to. The last three are outcomes and are reachable from anywhere: a parcel can fail before it is ever collected. 
      @JsonValue(r'delivered')
      delivered(r'delivered'),
          /// A position a checkpoint may report, so `pending` is not one of them — that is where a shipment starts, not somewhere it can be moved to. The last three are outcomes and are reachable from anywhere: a parcel can fail before it is ever collected. 
      @JsonValue(r'returned')
      returned(r'returned'),
          /// A position a checkpoint may report, so `pending` is not one of them — that is where a shipment starts, not somewhere it can be moved to. The last three are outcomes and are reachable from anywhere: a parcel can fail before it is ever collected. 
      @JsonValue(r'failed')
      failed(r'failed');

  const TransportCheckpoint(this.value);

  final String value;

  @override
  String toString() => value;
}
