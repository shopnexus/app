//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:json_annotation/json_annotation.dart';

/// `user` self-registers and both buys and sells. `moderator` is granted by an admin. `admin` is configured, not created. `support` is the support desk's own row — the second side of every ticket thread, held by exactly one account and granted by no route.
enum AccountRole {
  /// `user` self-registers and both buys and sells. `moderator` is granted by an admin. `admin` is configured, not created. `support` is the support desk's own row — the second side of every ticket thread, held by exactly one account and granted by no route.
  @JsonValue(r'user')
  user(r'user'),

  /// `user` self-registers and both buys and sells. `moderator` is granted by an admin. `admin` is configured, not created. `support` is the support desk's own row — the second side of every ticket thread, held by exactly one account and granted by no route.
  @JsonValue(r'moderator')
  moderator(r'moderator'),

  /// `user` self-registers and both buys and sells. `moderator` is granted by an admin. `admin` is configured, not created. `support` is the support desk's own row — the second side of every ticket thread, held by exactly one account and granted by no route.
  @JsonValue(r'admin')
  admin(r'admin'),

  /// `user` self-registers and both buys and sells. `moderator` is granted by an admin. `admin` is configured, not created. `support` is the support desk's own row — the second side of every ticket thread, held by exactly one account and granted by no route.
  @JsonValue(r'support')
  support(r'support');

  const AccountRole(this.value);

  final String value;

  @override
  String toString() => value;
}
