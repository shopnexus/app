import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/features/catalog/data/models/catalog_model.dart';
import 'package:shopnexus_flutter_app/shared/widgets/shared_product_card.dart';

/// `Resource.required` is `[id, provider, object_key, mime, size]`: `url` is a
/// short-lived presigned link and is simply absent when the module could not
/// mint one. The hand-written model had it `required`, so one un-presigned cover
/// threw inside `fromJson` and the whole feed page came back blank.
void main() {
  Map<String, dynamic> card({required bool presigned}) => {
    'id': 'lst_a60p5qh3t6ry4',
    'slug': 'ke-ong-dung-dua-muong',
    'name': 'Kệ ống đựng đũa muỗng',
    'status': 'active',
    'condition': 'new',
    'price_mode': 'fixed',
    'currency': 'VND',
    'price': 49000,
    'sold': 0,
    'cover': {
      'id': 'res_cnzz61t6cr7pf',
      'provider': 'minio',
      'object_key': 'listings/cover.jpg',
      'mime': 'image/jpeg',
      'size': 12345,
      if (presigned) 'url': 'https://cdn.example/cover.jpg',
    },
    'rating': 0,
    'review_count': 0,
    'category_id': 'cat_b68877mkawpab',
    'seller': {'id': 'acc_48gmxxfhd8ta3', 'name': 'Bob Electronics'},
    'favorited': false,
    'deleted_at': null,
    'created_at': '2026-08-02T04:55:15.318908Z',
  };

  group('a cover with no url still parses', () {
    test('the generated Listing keeps the resource and a null url', () {
      final listing = Listing.fromJson(card(presigned: false));

      expect(listing.cover, isNotNull);
      expect(listing.cover!.url, isNull);
      expect(listing.cover!.objectKey, 'listings/cover.jpg');
    });

    test(
      'a feed page mixing presigned and un-presigned covers parses whole',
      () {
        final page = [
          card(presigned: true),
          card(presigned: false),
        ].map(TProductCard.fromJson).toList();

        expect(page, hasLength(2));
        expect(page.first.effectiveThumbnail, 'https://cdn.example/cover.jpg');
        expect(page.last.effectiveThumbnail, isNull);
      },
    );

    testWidgets('the card draws a placeholder instead of throwing', (
      tester,
    ) async {
      final view = ProductCardView.fromListing(
        Listing.fromJson(card(presigned: false)),
      );

      await tester.pumpWidget(
        MaterialApp(
          // A grid cell, so the card is not asked to fill the whole screen.
          home: Scaffold(
            body: Center(
              child: SizedBox(
                width: 180,
                child: SharedProductCard(product: view),
              ),
            ),
          ),
        ),
      );

      expect(find.byIcon(Icons.image_outlined), findsOneWidget);
      expect(find.text('Kệ ống đựng đũa muỗng'), findsOneWidget);
      expect(find.textContaining('Bob Electronics'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  });
}
