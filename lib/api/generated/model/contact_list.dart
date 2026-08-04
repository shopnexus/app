//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contact_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ContactList {
  /// Returns a new [ContactList] instance.
  ContactList({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<Contact> data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ContactList &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory ContactList.fromJson(Map<String, dynamic> json) => _$ContactListFromJson(json);

  Map<String, dynamic> toJson() => _$ContactListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

