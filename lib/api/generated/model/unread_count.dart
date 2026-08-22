//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unread_count.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class UnreadCount {
  /// Returns a new [UnreadCount] instance.
  UnreadCount({required this.byCategory, required this.unread});

  /// Every category, zeros included: a client renders a fixed set of filters and must not have to know which of them the server considers empty.
  @JsonKey(name: r'by_category', required: true, includeIfNull: false)
  final Map<String, int> byCategory;

  // minimum: 0
  @JsonKey(name: r'unread', required: true, includeIfNull: false)
  final int unread;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UnreadCount &&
          other.byCategory == byCategory &&
          other.unread == unread;

  @override
  int get hashCode => byCategory.hashCode + unread.hashCode;

  factory UnreadCount.fromJson(Map<String, dynamic> json) =>
      _$UnreadCountFromJson(json);

  Map<String, dynamic> toJson() => _$UnreadCountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
