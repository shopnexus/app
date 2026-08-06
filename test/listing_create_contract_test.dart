import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/api/account_api.dart';
import 'package:shopnexus_flutter_app/api/generated/api/catalog_api.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/features/seller/data/models/listing_draft.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/listing_composer_repository.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// `POST /listings` refused everything the posting form sent: the single variant
/// went out with `attributes: {}`, and a variant is what `attributes` tells
/// apart, so the API takes none without at least one entry — the seller got
/// "invalid field: Variants[0].Attributes" and no way to act on it.
///
/// The OpenAPI document says only `type: object` there, so a client written
/// against the contract cannot know. These tests are the client's own record of
/// what the route actually accepts.
void main() {
  Map<String, Object?> draftJson({int price = 5000000, int weightG = 350}) =>
      listingDraftRequest(
        name: 'iPhone 12 64GB xanh',
        categoryId: 'cat_b68877mkawpab',
        condition: ListingCondition.used,
        currency: 'VND',
        priceMode: PriceMode.fixed,
        price: price,
        weightG: weightG,
        quantity: 1,
      ).toJson();

  Map<String, Object?> variantOf(Map<String, Object?> body) =>
      ((body['variants'] as List).single as Map).cast<String, Object?>();

  group('the form composes one variant the API will take', () {
    test('the listing carries exactly one variant', () {
      expect((draftJson()['variants'] as List), hasLength(1));
    });

    test('that variant names itself, which is what `attributes` is', () {
      // Empty is what the route rejects. What the entry says is the app's own
      // choice — a used listing has nothing to choose between — but there has
      // to be one.
      expect(variantOf(draftJson())['attributes'], isNotEmpty);
    });

    test('price and parcel weight ride on the variant, not the listing', () {
      final variant = variantOf(draftJson(price: 5000000, weightG: 350));

      expect(variant['price'], 5000000);
      // The key the suggestion route and the shipping quote both use.
      expect(variant['package_details'], {'weight_g': 350});
      expect(draftJson().containsKey('price'), isFalse);
    });

    test('a box the seller left empty is absent, not null', () {
      final body = draftJson();

      // `omitempty` on the wire: the server reads a present `description` as an
      // edit to it, and json_serializable would otherwise send explicit nulls.
      expect(body.containsKey('description'), isFalse);
      expect(body.containsKey('attachments'), isFalse);
      expect(body.containsKey('tags'), isFalse);
      expect(body.containsKey('specifications'), isFalse);
    });
  });

  group('tags leave in the shape the route bounds them to', () {
    List<Object?>? tagsOf(List<String> tags) =>
        listingDraftRequest(
              name: 'iPhone 12 64GB xanh',
              categoryId: 'cat_b68877mkawpab',
              condition: ListingCondition.used,
              currency: 'VND',
              priceMode: PriceMode.fixed,
              price: 5000000,
              weightG: 350,
              quantity: 1,
              tags: tags,
            ).toJson()['tags']
            as List<Object?>?;

    test('ten at most — an eleventh is 422 for the whole listing', () {
      expect(tagsOf(List.generate(12, (i) => 'the-tag-$i')), hasLength(10));
    });

    test('a slug is at most a hundred characters', () {
      final slug =
          (tagsOf([List.filled(40, 'dai').join('-')])!.single) as String;

      expect(slug.length, lessThanOrEqualTo(100));
      // Cut on a boundary: a trailing hyphen is not a slug the route accepts.
      expect(slug.endsWith('-'), isFalse);
    });

    test('blanks and repeats never reach the wire', () {
      // `dive,required` refuses an empty member, and two identical slugs are one
      // tag as far as the listing is concerned.
      expect(tagsOf(['   ', 'do-cu', 'do-cu', '!!!']), ['do-cu']);
    });

    test('no tags at all is an absent key, not an empty list', () {
      expect(tagsOf([]), isNull);
    });
  });

  group('the composer posts that body to /listings', () {
    test('one POST, and the variant it sends has attributes', () async {
      final backend = RecordingBackend((_) => {'data': listingDetailJson});
      final repository = ListingComposerRepository(
        CatalogApi(backend.dio),
        AccountApi(backend.dio),
      );

      await repository.createListing(
        listingDraftRequest(
          name: 'iPhone 12 64GB xanh',
          categoryId: 'cat_b68877mkawpab',
          condition: ListingCondition.used,
          currency: 'VND',
          priceMode: PriceMode.fixed,
          price: 5000000,
          weightG: 350,
          quantity: 1,
        ),
      );

      expect(backend.only.method, 'POST');
      expect(backend.paths.single, 'listings');

      final variant = variantOf(backend.bodyOf(0));
      expect(variant['attributes'], isNotEmpty);
      expect(variant['quantity'], 1);
    });
  });
}
