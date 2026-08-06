import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/cart_item.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/features/cart/presentation/providers/cart_provider.dart';

/// A cart row is `{id, listing_id, variant_id, quantity, created_at}` and nothing
/// else — no price. The old state read `item.sku?.price`, a field the server has
/// never sent, so every subtotal was zero. The price belongs to the variant the
/// row points at, which only the listing read publishes.
void main() {
  // Captured from GET /cart-items on the dev backend.
  const cartRow = {
    'id': 'crt_43wwzanmczq7y',
    'listing_id': 'lst_a60p5qh3t6ry4',
    'variant_id': 'vrn_8vw1sy73ddpkc',
    'quantity': 2,
    'created_at': '2026-08-05T02:46:58.461696Z',
  };

  // Captured from GET /listings/{id} on the dev backend, with two edits so the
  // assertions can tell the fields apart: the second variant is dearer than the
  // cheapest, and carries a photo of its own.
  const listing = {
    'id': 'lst_a60p5qh3t6ry4',
    'slug':
        'ke-ong-dung-dua-muong-co-khay-thoat-nuoc-phong-cach-chau-au-tien-loi',
    'name':
        'Kệ ống đựng đũa muỗng có khay thoát nước phong cách châu Âu tiện lợi',
    'description': 'Hộp đựng đũa muỗng phong cách Châu Âu siêu xinh.',
    'status': 'active',
    'condition': 'new',
    'price_mode': 'fixed',
    'currency': 'VND',
    'specifications': {
      'Hạn bảo hành': 'Không bảo hành',
      'Xuất xứ': 'Trung Quốc',
    },
    'images': [
      {
        'id': 'res_cnzz61t6cr7pf',
        'provider': 'remote',
        'object_key':
            'https://down-cl.img.susercontent.com/file/342847e9f89669cb6fe702a8c08a7a42_tn',
        'mime': 'image/jpeg',
        'size': 0,
        'checksum': '',
        'url_expires_at': null,
        'url':
            'https://down-cl.img.susercontent.com/file/342847e9f89669cb6fe702a8c08a7a42_tn',
      },
    ],
    'category': {
      'id': 'cat_b68877mkawpab',
      'parent_id': null,
      'name': 'Trang trí nhà cửa & Đèn chiếu sáng',
      'description':
          'Tranh treo tường, khung ảnh, bình hoa, nến, gương, thảm, rèm cửa, gối tựa, đèn trần, đèn bàn, đèn sàn và các vật dụng trang trí',
      'score': null,
    },
    'tags': ['bo-do-an', 'dung-cu-an-uong', 'nha-cua-va-doi-song'],
    'variants': [
      {
        'id': 'vrn_0ev7apet9dsq8',
        'price': 49000,
        'attributes': {'Màu sắc': 'Màu Be'},
        'package_details': {
          'chiều cao (cm)': 28,
          'chiều dài (cm)': 36,
          'chiều rộng (cm)': 15,
          'cân nặng (g)': 420,
        },
        'images': <Object>[],
        'is_featured': true,
        'stock': {'quantity': 62, 'reserved': 0, 'sold': 0, 'available': 62},
        'created_at': '2026-08-02T04:55:15.318908Z',
      },
      {
        'id': 'vrn_8vw1sy73ddpkc',
        'price': 71000,
        'attributes': {'Màu sắc': 'Xanh dương'},
        'package_details': {
          'chiều cao (cm)': 42,
          'chiều dài (cm)': 12,
          'chiều rộng (cm)': 17,
          'cân nặng (g)': 520,
        },
        'images': [
          {
            'id': 'res_variantblue',
            'provider': 'remote',
            'object_key': 'https://img.example/blue.jpg',
            'mime': 'image/jpeg',
            'size': 0,
            'checksum': '',
            'url_expires_at': null,
            'url': 'https://img.example/blue.jpg',
          },
        ],
        'is_featured': false,
        'stock': {'quantity': 62, 'reserved': 0, 'sold': 2, 'available': 60},
        'created_at': '2026-08-02T04:55:15.318908Z',
      },
    ],
    'featured_variant_id': 'vrn_0ev7apet9dsq8',
    'sold': 2,
    'rating': 0,
    'review_count': 0,
    'seller': {
      'id': 'acc_48gmxxfhd8ta3',
      'name': 'Bob Electronics',
      'avatar': null,
    },
    'favorited': false,
    'favorite_count': 0,
    'pending_edit': null,
    'taken_down_at': null,
    'takedown_reason': null,
    'location': {
      'province_code': '01',
      'province_name': 'Ha Noi',
      'district_code': '007',
      'district_name': 'Hai Ba Trung',
      'ward_code': '00091',
      'ward_name': 'Bach Khoa',
      'distance_km': null,
    },
    'created_at': '2026-08-02T04:55:15.318908Z',
    'deleted_at': null,
  };

  CartState state() => CartState(
    items: [CartItem.fromJson(Map<String, dynamic>.from(cartRow))],
    listings: {
      'lst_a60p5qh3t6ry4': ListingDetail.fromJson(
        Map<String, dynamic>.from(listing),
      ),
    },
  );

  group('a cart line is priced by the variant it points at', () {
    test('the subtotal is that variant price times the quantity', () {
      expect(state().subtotal, 142000);
    });

    test('the line takes the variant price, not the cheapest one', () {
      expect(state().lines.single.unitPrice, 71000);
      expect(state().lines.single.lineTotal, 142000);
    });

    test('the line names the listing and shows the variant photo', () {
      final line = state().lines.single;

      expect(
        line.name,
        'Kệ ống đựng đũa muỗng có khay thoát nước phong cách châu Âu tiện lợi',
      );
      expect(line.imageUrl, 'https://img.example/blue.jpg');
      expect(line.currency, 'VND');
    });

    test('a line whose listing has not resolved yet contributes nothing', () {
      final unresolved = CartState(
        items: [CartItem.fromJson(Map<String, dynamic>.from(cartRow))],
      );

      expect(unresolved.subtotal, 0);
      expect(unresolved.lines.single.unitPrice, isNull);
    });
  });
}
