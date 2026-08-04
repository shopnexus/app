//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/me.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_result.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AuthResult {
  /// Returns a new [AuthResult] instance.
  AuthResult({

    required  this.accessToken,

    required  this.account,

    required  this.expiresIn,

    required  this.refreshToken,
  });

  @JsonKey(
    
    name: r'access_token',
    required: true,
    includeIfNull: false,
  )


  final String accessToken;



  @JsonKey(
    
    name: r'account',
    required: true,
    includeIfNull: false,
  )


  final Me account;



      /// Access token lifetime in seconds.
          // minimum: 0
  @JsonKey(
    
    name: r'expires_in',
    required: true,
    includeIfNull: false,
  )


  final int expiresIn;



  @JsonKey(
    
    name: r'refresh_token',
    required: true,
    includeIfNull: false,
  )


  final String refreshToken;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AuthResult &&
      other.accessToken == accessToken &&
      other.account == account &&
      other.expiresIn == expiresIn &&
      other.refreshToken == refreshToken;

    @override
    int get hashCode =>
        accessToken.hashCode +
        account.hashCode +
        expiresIn.hashCode +
        refreshToken.hashCode;

  factory AuthResult.fromJson(Map<String, dynamic> json) => _$AuthResultFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResultToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

