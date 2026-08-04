//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// A report's grounds. Null on every other kind.
enum TicketReason {
          /// A report's grounds. Null on every other kind.
      @JsonValue(r'scam')
      scam(r'scam'),
          /// A report's grounds. Null on every other kind.
      @JsonValue(r'counterfeit')
      counterfeit(r'counterfeit'),
          /// A report's grounds. Null on every other kind.
      @JsonValue(r'prohibited')
      prohibited(r'prohibited'),
          /// A report's grounds. Null on every other kind.
      @JsonValue(r'harassment')
      harassment(r'harassment'),
          /// A report's grounds. Null on every other kind.
      @JsonValue(r'spam')
      spam(r'spam'),
          /// A report's grounds. Null on every other kind.
      @JsonValue(r'inappropriate')
      inappropriate(r'inappropriate'),
          /// A report's grounds. Null on every other kind.
      @JsonValue(r'other')
      other(r'other');

  const TicketReason(this.value);

  final String value;

  @override
  String toString() => value;
}
