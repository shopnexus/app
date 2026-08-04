//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// `user` self-registers and both buys and sells. `moderator` is granted by an admin. `admin` is configured, not created. 
enum AccountRole {
          /// `user` self-registers and both buys and sells. `moderator` is granted by an admin. `admin` is configured, not created. 
      @JsonValue(r'user')
      user(r'user'),
          /// `user` self-registers and both buys and sells. `moderator` is granted by an admin. `admin` is configured, not created. 
      @JsonValue(r'moderator')
      moderator(r'moderator'),
          /// `user` self-registers and both buys and sells. `moderator` is granted by an admin. `admin` is configured, not created. 
      @JsonValue(r'admin')
      admin(r'admin');

  const AccountRole(this.value);

  final String value;

  @override
  String toString() => value;
}
