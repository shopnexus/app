//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_field.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ErrorField {
  /// Returns a new [ErrorField] instance.
  ErrorField({

    required  this.field,

    required  this.message,

    required  this.rule,
  });

      /// Dotted path from the request body's root, so a nested or repeated field is addressable by the same client code that rendered it. 
  @JsonKey(
    
    name: r'field',
    required: true,
    includeIfNull: false,
  )


  final String field;



  @JsonKey(
    
    name: r'message',
    required: true,
    includeIfNull: false,
  )


  final String message;



      /// Which constraint failed, as the validate tag that raised it. Machine-readable, so a client can localise the message instead of showing this one. 
  @JsonKey(
    
    name: r'rule',
    required: true,
    includeIfNull: false,
  )


  final String rule;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ErrorField &&
      other.field == field &&
      other.message == message &&
      other.rule == rule;

    @override
    int get hashCode =>
        field.hashCode +
        message.hashCode +
        rule.hashCode;

  factory ErrorField.fromJson(Map<String, dynamic> json) => _$ErrorFieldFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorFieldToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

