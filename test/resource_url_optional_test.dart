import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing.dart';
import 'package:shopnexus_flutter_app/shared/widgets/shared_product_card.dart';

/// `Resource.url` is a short-lived presigned link, and the contract now says the
/// key is always there: **empty** when the module could not mint one. So "no
/// link" is one value rather than two encodings of it, and the failure this
/// guards against stays guarded — the hand-written model had `url` required and
/// non-empty, so one un-presigned cover threw inside `fromJson` and the whole
/// feed page came back blank.
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
      'checksum': '',
      'url': presigned ? 'https://cdn.example/cover.jpg' : '',
      'url_expires_at': null,
    },
    'rating': 0,
    'review_count': 0,
    'category_id': 'cat_b68877mkawpab',
    'seller': {
      'id': 'acc_48gmxxfhd8ta3',
      'name': 'Bob Electronics',
      'avatar': null,
    },
    'favorited': false,
    'score': null,
    'tags': <String>[],
    'taken_down_at': null,
    'location': null,
    'deleted_at': null,
    'created_at': '2026-08-02T04:55:15.318908Z',
  };

  group('a cover with an empty url still parses', () {
    test('the generated Listing keeps the resource and an empty url', () {
      final listing = Listing.fromJson(card(presigned: false));

      expect(listing.cover, isNotNull);
      expect(listing.cover!.url, isEmpty);
      expect(listing.cover!.objectKey, 'listings/cover.jpg');
    });

    test(
      'a feed page mixing presigned and un-presigned covers parses whole',
      () {
        final page = [
          card(presigned: true),
          card(presigned: false),
        ].map(Listing.fromJson).toList();

        expect(page, hasLength(2));
        expect(page.first.cover?.url, 'https://cdn.example/cover.jpg');
        expect(page.last.cover?.url, isEmpty);
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
