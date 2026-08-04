//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/page_meta.dart';
import 'package:shopnexus_flutter_app/api/generated/model/account_summary.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_summary_page.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AccountSummaryPage {
  /// Returns a new [AccountSummaryPage] instance.
  AccountSummaryPage({

    required  this.data,

    required  this.meta,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<AccountSummary> data;



  @JsonKey(
    
    name: r'meta',
    required: true,
    includeIfNull: false,
  )


  final PageMeta meta;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AccountSummaryPage &&
      other.data == data &&
      other.meta == meta;

    @override
    int get hashCode =>
        data.hashCode +
        meta.hashCode;

  factory AccountSummaryPage.fromJson(Map<String, dynamic> json) => _$AccountSummaryPageFromJson(json);

  Map<String, dynamic> toJson() => _$AccountSummaryPageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

