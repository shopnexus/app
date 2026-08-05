//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/ticket_resolution_action.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resolve_ticket_request.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ResolveTicketRequest {
  /// Returns a new [ResolveTicketRequest] instance.
  ResolveTicketRequest({required this.actionTaken, this.note});

  /// Required. `none` is the turn-down; anything else names what was done.
  @JsonKey(name: r'action_taken', required: true, includeIfNull: false)
  final TicketResolutionAction actionTaken;

  @JsonKey(name: r'note', required: false, includeIfNull: false)
  final String? note;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResolveTicketRequest &&
          other.actionTaken == actionTaken &&
          other.note == note;

  @override
  int get hashCode => actionTaken.hashCode + note.hashCode;

  factory ResolveTicketRequest.fromJson(Map<String, dynamic> json) =>
      _$ResolveTicketRequestFromJson(json);

  Map<String, dynamic> toJson() => _$ResolveTicketRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
