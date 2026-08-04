//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/reputation.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accounts_account_id_reputation_get200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AccountsAccountIDReputationGet200Response {
  /// Returns a new [AccountsAccountIDReputationGet200Response] instance.
  AccountsAccountIDReputationGet200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final Reputation data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AccountsAccountIDReputationGet200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory AccountsAccountIDReputationGet200Response.fromJson(Map<String, dynamic> json) => _$AccountsAccountIDReputationGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountsAccountIDReputationGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

