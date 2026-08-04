//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contacts_post201_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ContactsPost201Response {
  /// Returns a new [ContactsPost201Response] instance.
  ContactsPost201Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Contact data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ContactsPost201Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory ContactsPost201Response.fromJson(Map<String, dynamic> json) => _$ContactsPost201ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContactsPost201ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

