//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/transport_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transport.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Transport {
  /// Returns a new [Transport] instance.
  Transport({
    required this.createdAt,

    required this.fee,

    required this.id,

    required this.option,

    required this.status,
  });

  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// What the buyer paid for delivery, quoted from this carrier when the checkout opened. The buyer bears carriage on both a fixed-price and a negotiated sale, so a seller is never charged for it.
  // minimum: 0
  @JsonKey(name: r'fee', required: true, includeIfNull: false)
  final int fee;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// An enabled transport option's slug
  @JsonKey(name: r'option', required: true, includeIfNull: false)
  final String option;

  @JsonKey(name: r'status', required: true, includeIfNull: false)
  final TransportStatus status;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Transport &&
          other.createdAt == createdAt &&
          other.fee == fee &&
          other.id == id &&
          other.option == option &&
          other.status == status;

  @override
  int get hashCode =>
      createdAt.hashCode +
      fee.hashCode +
      id.hashCode +
      option.hashCode +
      status.hashCode;

  factory Transport.fromJson(Map<String, dynamic> json) =>
      _$TransportFromJson(json);

  Map<String, dynamic> toJson() => _$TransportToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
