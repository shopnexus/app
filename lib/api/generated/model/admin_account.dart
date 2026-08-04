//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/account_role.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_status.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_account.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminAccount {
  /// Returns a new [AdminAccount] instance.
  AdminAccount({

    required  this.createdAt,

     this.email,

    required  this.emailVerified,

    required  this.id,

    required  this.identityVerified,

    required  this.name,

     this.phone,

    required  this.role,

    required  this.status,

     this.suspendedUntil,

     this.suspensionReason,

     this.username,
  });

  @JsonKey(
    
    name: r'created_at',
    required: true,
    includeIfNull: false,
  )


  final DateTime createdAt;



  @JsonKey(
    
    name: r'email',
    required: false,
    includeIfNull: false,
  )


  final String? email;



  @JsonKey(
    
    name: r'email_verified',
    required: true,
    includeIfNull: false,
  )


  final bool emailVerified;



  @JsonKey(
    
    name: r'id',
    required: true,
    includeIfNull: false,
  )


  final String id;



  @JsonKey(
    
    name: r'identity_verified',
    required: true,
    includeIfNull: false,
  )


  final bool identityVerified;



  @JsonKey(
    
    name: r'name',
    required: true,
    includeIfNull: false,
  )


  final String name;



  @JsonKey(
    
    name: r'phone',
    required: false,
    includeIfNull: false,
  )


  final String? phone;



  @JsonKey(
    
    name: r'role',
    required: true,
    includeIfNull: false,
  )


  final AccountRole role;



  @JsonKey(
    
    name: r'status',
    required: true,
    includeIfNull: false,
  )


  final AccountStatus status;



      /// Null while suspended means the suspension is permanent.
  @JsonKey(
    
    name: r'suspended_until',
    required: false,
    includeIfNull: false,
  )


  final DateTime? suspendedUntil;



  @JsonKey(
    
    name: r'suspension_reason',
    required: false,
    includeIfNull: false,
  )


  final String? suspensionReason;



  @JsonKey(
    
    name: r'username',
    required: false,
    includeIfNull: false,
  )


  final String? username;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminAccount &&
      other.createdAt == createdAt &&
      other.email == email &&
      other.emailVerified == emailVerified &&
      other.id == id &&
      other.identityVerified == identityVerified &&
      other.name == name &&
      other.phone == phone &&
      other.role == role &&
      other.status == status &&
      other.suspendedUntil == suspendedUntil &&
      other.suspensionReason == suspensionReason &&
      other.username == username;

    @override
    int get hashCode =>
        createdAt.hashCode +
        (email == null ? 0 : email.hashCode) +
        emailVerified.hashCode +
        id.hashCode +
        identityVerified.hashCode +
        name.hashCode +
        (phone == null ? 0 : phone.hashCode) +
        role.hashCode +
        status.hashCode +
        (suspendedUntil == null ? 0 : suspendedUntil.hashCode) +
        (suspensionReason == null ? 0 : suspensionReason.hashCode) +
        (username == null ? 0 : username.hashCode);

  factory AdminAccount.fromJson(Map<String, dynamic> json) => _$AdminAccountFromJson(json);

  Map<String, dynamic> toJson() => _$AdminAccountToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

