//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/admin_account.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_accounts_id_suspension_post200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AdminAccountsIdSuspensionPost200Response {
  /// Returns a new [AdminAccountsIdSuspensionPost200Response] instance.
  AdminAccountsIdSuspensionPost200Response({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final AdminAccount data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AdminAccountsIdSuspensionPost200Response &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory AdminAccountsIdSuspensionPost200Response.fromJson(Map<String, dynamic> json) => _$AdminAccountsIdSuspensionPost200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AdminAccountsIdSuspensionPost200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

