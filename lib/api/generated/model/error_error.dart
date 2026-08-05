//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/error_field.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_error.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ErrorError {
  /// Returns a new [ErrorError] instance.
  ErrorError({
    required this.code,

    this.fields,

    required this.message,

    required this.requestId,
  });

  /// Stable machine-readable code — switch on this, never on `message`. The cross-cutting ones live in `shared/errx`; the rest belong to the module that raised them.
  @JsonKey(name: r'code', required: true, includeIfNull: false)
  final String code;

  /// Per-field detail, present when the request failed validation and absent otherwise. Without it a form with twelve inputs and three problems gets one sentence and cannot mark a single box red.
  @JsonKey(name: r'fields', required: false, includeIfNull: false)
  final List<ErrorField>? fields;

  /// Human-readable, for a developer or a log. Not a UI string.
  @JsonKey(name: r'message', required: true, includeIfNull: false)
  final String message;

  /// The id of this request, the same value as the `X-Request-Id` response header and the one on every log line for it. Present so a user reporting a failure hands over something that can be grepped, instead of a sentence.
  @JsonKey(name: r'request_id', required: true, includeIfNull: false)
  final String requestId;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ErrorError &&
          other.code == code &&
          other.fields == fields &&
          other.message == message &&
          other.requestId == requestId;

  @override
  int get hashCode =>
      code.hashCode + fields.hashCode + message.hashCode + requestId.hashCode;

  factory ErrorError.fromJson(Map<String, dynamic> json) =>
      _$ErrorErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
