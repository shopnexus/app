//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/o_auth_identity.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'o_auth_identity_list.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OAuthIdentityList {
  /// Returns a new [OAuthIdentityList] instance.
  OAuthIdentityList({

    required  this.data,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<OAuthIdentity> data;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OAuthIdentityList &&
      other.data == data;

    @override
    int get hashCode =>
        data.hashCode;

  factory OAuthIdentityList.fromJson(Map<String, dynamic> json) => _$OAuthIdentityListFromJson(json);

  Map<String, dynamic> toJson() => _$OAuthIdentityListToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

