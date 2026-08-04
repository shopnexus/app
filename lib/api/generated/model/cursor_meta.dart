//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cursor_meta.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class CursorMeta {
  /// Returns a new [CursorMeta] instance.
  CursorMeta({

    required  this.nextCursor,
  });

      /// Pass as `cursor` to get the next page. Null on the last one. Always present so \"no more pages\" is a value rather than a missing key. 
  @JsonKey(
    
    name: r'next_cursor',
    required: true,
    includeIfNull: true,
  )


  final String? nextCursor;





    @override
    bool operator ==(Object other) => identical(this, other) || other is CursorMeta &&
      other.nextCursor == nextCursor;

    @override
    int get hashCode =>
        (nextCursor == null ? 0 : nextCursor.hashCode);

  factory CursorMeta.fromJson(Map<String, dynamic> json) => _$CursorMetaFromJson(json);

  Map<String, dynamic> toJson() => _$CursorMetaToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

