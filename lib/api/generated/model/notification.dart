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

    required  this.category,

    required  this.createdAt,

    required  this.payload,

     this.readAt,

    required  this.title,
  });

  @JsonKey(
    
    name: r'category',
    required: true,
    includeIfNull: false,
  )


  final NotificationCategory category;



      /// Identifies the row together with the feed order, and it is what `POST /notifications/read` is given a bound against. 
  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



      /// Structured content such as deep links and images.
  @JsonKey(
    
    name: r'payload',
    required: true,
    includeIfNull: false,
  )


  final Map<String, Object> payload;



  @JsonKey(
    
    name: r'read_at',
    required: false,
    includeIfNull: false,
  )


  final DateTime? readAt;



  @JsonKey(
    
    name: r'title',
    required: true,
    includeIfNull: false,
  )


  final String title;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Notification &&
      other.category == category &&
      other.createdAt == createdAt &&
      other.payload == payload &&
      other.readAt == readAt &&
      other.title == title;

    @override
    int get hashCode =>
        category.hashCode +
        createdAt.hashCode +
        payload.hashCode +
        (readAt == null ? 0 : readAt.hashCode) +
        title.hashCode;

  factory Notification.fromJson(Map<String, dynamic> json) => _$NotificationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

