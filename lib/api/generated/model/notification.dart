//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/notification_category.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification.g.dart';

@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Notification {
  /// Returns a new [Notification] instance.
  Notification({
    required this.body,

    required this.category,

    required this.createdAt,

    required this.href,

    required this.id,

    required this.kind,

    required this.readAt,

    required this.title,
  });

  /// The one supporting line, empty for a fact that needs none.
  @JsonKey(name: r'body', required: true, includeIfNull: false)
  final String body;

  @JsonKey(name: r'category', required: true, includeIfNull: false)
  final NotificationCategory category;

  /// The feed order, and the bound `POST /notifications/read` takes to clear everything the reader has scrolled past.
  @JsonKey(name: r'created_at', required: true, includeIfNull: false)
  final DateTime createdAt;

  /// The in-app path this notification opens, empty when it opens nothing. A row with nowhere to go is still worth reading and still dismissible.
  @JsonKey(name: r'href', required: true, includeIfNull: false)
  final String href;

  @JsonKey(name: r'id', required: true, includeIfNull: false)
  final String id;

  /// What happened, kebab-case. Not an enum: the vocabulary grows with every fact the platform learns to tell somebody, and a client renders by `category` — `kind` is for a client that wants to special-case one row, and for support reading a log.
  @JsonKey(name: r'kind', required: true, includeIfNull: false)
  final String kind;

  @JsonKey(name: r'read_at', required: true, includeIfNull: true)
  final DateTime? readAt;

  @JsonKey(name: r'title', required: true, includeIfNull: false)
  final String title;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Notification &&
          other.body == body &&
          other.category == category &&
          other.createdAt == createdAt &&
          other.href == href &&
          other.id == id &&
          other.kind == kind &&
          other.readAt == readAt &&
          other.title == title;

  @override
  int get hashCode =>
      body.hashCode +
      category.hashCode +
      createdAt.hashCode +
      href.hashCode +
      id.hashCode +
      kind.hashCode +
      (readAt == null ? 0 : readAt.hashCode) +
      title.hashCode;

  factory Notification.fromJson(Map<String, dynamic> json) =>
      _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }
}
