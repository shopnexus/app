//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/public_account.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'accounts_id_get200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AccountsIdGet200Response {
  /// Returns a new [AccountsIdGet200Response] instance.
  AccountsIdGet200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final PublicAccount data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AccountsIdGet200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory AccountsIdGet200Response.fromJson(Map<String, dynamic> json) => _$AccountsIdGet200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountsIdGet200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

