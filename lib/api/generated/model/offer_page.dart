//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:shopnexus_flutter_app/api/generated/model/cursor_meta.dart';
import 'package:shopnexus_flutter_app/api/generated/model/offer.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_page.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class OfferPage {
  /// Returns a new [OfferPage] instance.
  OfferPage({

    required  this.data,

    required  this.meta,
  });

  @JsonKey(
    
    name: r'data',
    required: true,
    includeIfNull: false,
  )


  final List<Offer> data;



  @JsonKey(
    
    name: r'meta',
    required: true,
    includeIfNull: false,
  )


  final CursorMeta meta;





    @override
    bool operator ==(Object other) => identical(this, other) || other is OfferPage &&
      other.data == data &&
      other.meta == meta;

    @override
    int get hashCode =>
        data.hashCode +
        meta.hashCode;

  factory OfferPage.fromJson(Map<String, dynamic> json) => _$OfferPageFromJson(json);

  Map<String, dynamic> toJson() => _$OfferPageToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

