// Payloads copied verbatim from a dev backend (`alice_shop`), so a parse test
// fails when the contract moves rather than when somebody's guess about it does.

const meJson = <String, dynamic>{
  'id': 'acc_88sxn2txxspd4',
  'email': 'alice@shopnexus.test',
  'email_verified': true,
  'phone': null,
  'username': 'alice_shop',
  'role': 'user',
  'status': 'active',
  'has_password': true,
  'identity_verified': false,
  'profile': {
    'name': "Alice's Corner",
    'description': 'Pre-loved fashion and small home things.',
    'gender': null,
    'date_of_birth': null,
    'avatar': null,
    'country': 'VN',
    'locale': 'vi-VN',
    'timezone': 'Asia/Ho_Chi_Minh',
    'created_at': '2026-08-05T02:34:22.408272Z',
  },
  'created_at': '2026-08-05T02:34:22.408272Z',
};

const contactJson = <String, dynamic>{
  'id': 'ctc_ben6dg1c315mz',
  'full_name': "Alice's Corner",
  'phone': '+84900000001',
  'phone_verified': true,
  'address_type': 'home',
  'is_default_delivery': true,
  'is_default_pickup': true,
  'country': 'VN',
  'province_code': '31',
  'province_name': 'Hai Phong',
  'district_code': null,
  'district_name': null,
  'ward_code': '11365',
  'ward_name': 'May To',
  'postal_code': null,
  'address': 'May To, Hai Phong',
  'address_detail': null,
  'latitude': 20.874824027527453,
  'longitude': 106.66524643065901,
  'created_at': '2026-08-05T02:34:22.408272Z',
};

const orderItemJson = <String, dynamic>{
  'id': 'itm_fa1kdfqze7egn',
  'order_id': 'ord_2ybcv39246zn7',
  'listing_id': 'lst_a60p5qh3t6ry4',
  'variant_id': 'vrn_8vw1sy73ddpkc',
  'seller_id': 'acc_48gmxxfhd8ta3',
  'quantity': 2,
  'currency': 'VND',
  'total_amount': 98000,
  'transport_option': 'standard-delivery',
  'payment_session_id': 'pay_01bp1w1e0bg97',
  'cancelled_at': null,
  'created_at': '2026-08-05T02:47:11.309399Z',
};

const orderJson = <String, dynamic>{
  'id': 'ord_2ybcv39246zn7',
  'draft_id': 'drf_9s9npa0zabx7n',
  'offer_id': null,
  'buyer': {'id': 'acc_88sxn2txxspd4', 'name': "Alice's Corner"},
  'seller': {'id': 'acc_48gmxxfhd8ta3', 'name': 'Bob Electronics'},
  'address': {
    'full_name': "Alice's Corner",
    'phone': '+84900000001',
    'country': 'VN',
    'province_code': '31',
    'ward_code': '11365',
  },
  'pickup_address': {
    'full_name': 'Bob Electronics',
    'phone': '+84900000002',
    'country': 'VN',
    'province_code': '79',
    'ward_code': '26734',
  },
  'items': [orderItemJson],
  'state': 'open',
  'total': 98000,
  'currency': 'VND',
  'transport': {
    'id': 'trp_ep6bh2cqjsxy3',
    'option': 'standard-delivery',
    'status': 'pending',
    'fee': 15000,
    'created_at': '2026-08-05T02:47:38.200063Z',
  },
  'received_at': null,
  'receipt_attachments': <Map<String, dynamic>>[],
  'payout_deadline_at': null,
  'payout_released_at': null,
  'created_at': '2026-08-05T02:47:38.20111Z',
  'completed_at': null,
  'cancelled_at': null,
};

/// `GET /orders/summary?role=seller&tz=Asia/Ho_Chi_Minh` as `bob_store` — the one
/// seeded shop with a sale. `totals` is empty because that sale has not completed:
/// the goods are only counted once the escrow is released.
const orderSummaryJson = <String, dynamic>{
  'from': '2026-07-06T03:31:32.663583553Z',
  'to': '2026-08-05T03:31:32.663583553Z',
  'open': 1,
  'completed': 0,
  'cancelled': 0,
  'totals': <Map<String, dynamic>>[],
  'daily': [
    {'date': '2026-08-05', 'placed': 1, 'completed': 0},
  ],
};

const notificationJson = <String, dynamic>{
  'category': 'order',
  'title': 'Order placed',
  'payload': {'order_id': 'ord_2ybcv39246zn7'},
  'read_at': null,
  'created_at': '2026-08-05T02:47:38.213999Z',
};

const listingJson = <String, dynamic>{
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
    'url': 'https://cdn.example/cover.jpg',
  },
  'rating': 0,
  'review_count': 0,
  'category_id': 'cat_b68877mkawpab',
  'seller': {'id': 'acc_48gmxxfhd8ta3', 'name': 'Bob Electronics'},
  'favorited': false,
  'deleted_at': null,
  'created_at': '2026-08-02T04:55:15.318908Z',
};

/// `GET /listings/lst_a60p5qh3t6ry4` verbatim, trimmed to two images and two
/// variants. Also what every route answering a `ListingDetail` is stubbed with.
const listingDetailJson = <String, dynamic>{
  'id': 'lst_a60p5qh3t6ry4',
  'slug':
      'ke-ong-dung-dua-muong-co-khay-thoat-nuoc-phong-cach-chau-au-tien-loi',
  'name':
      'Kệ ống đựng đũa muỗng có khay thoát nước phong cách châu Âu tiện lợi',
  'description':
      'Hộp đựng đũa muỗng phong cách Châu Âu siêu xinh, có khay hứng nước cực kì sạch sẽ và hợp vệ sinh.',
  'status': 'active',
  'condition': 'new',
  'price_mode': 'fixed',
  'currency': 'VND',
  'specifications': {'Hạn bảo hành': 'Không bảo hành', 'Xuất xứ': 'Trung Quốc'},
  'images': [
    {
      'id': 'res_cnzz61t6cr7pf',
      'provider': 'remote',
      'object_key':
          'https://down-cl.img.susercontent.com/file/342847e9f89669cb6fe702a8c08a7a42_tn',
      'mime': 'image/jpeg',
      'size': 0,
      'url':
          'https://down-cl.img.susercontent.com/file/342847e9f89669cb6fe702a8c08a7a42_tn',
    },
    {
      'id': 'res_dcqj7cpbeet18',
      'provider': 'remote',
      'object_key':
          'https://down-cl.img.susercontent.com/file/538fcf6b96fbbb3cc874405f5c19a562_tn',
      'mime': 'image/jpeg',
      'size': 0,
      'url':
          'https://down-cl.img.susercontent.com/file/538fcf6b96fbbb3cc874405f5c19a562_tn',
    },
  ],
  'category': {
    'id': 'cat_b68877mkawpab',
    'parent_id': null,
    'name': 'Trang trí nhà cửa & Đèn chiếu sáng',
    'description': 'Tranh treo tường, khung ảnh, bình hoa, nến, gương, thảm',
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
      'images': <Map<String, dynamic>>[],
      'is_featured': true,
      'stock': {'quantity': 62, 'reserved': 0, 'sold': 0, 'available': 62},
      'created_at': '2026-08-02T04:55:15.318908Z',
    },
    {
      'id': 'vrn_8vw1sy73ddpkc',
      'price': 49000,
      'attributes': {'Màu sắc': 'Xanh dương'},
      'package_details': {
        'chiều cao (cm)': 42,
        'chiều dài (cm)': 12,
        'chiều rộng (cm)': 17,
        'cân nặng (g)': 520,
      },
      'images': <Map<String, dynamic>>[],
      'is_featured': false,
      'stock': {'quantity': 62, 'reserved': 0, 'sold': 2, 'available': 60},
      'created_at': '2026-08-02T04:55:15.318908Z',
    },
  ],
  'featured_variant_id': 'vrn_0ev7apet9dsq8',
  'sold': 2,
  'rating': 0,
  'review_count': 0,
  'seller': {'id': 'acc_48gmxxfhd8ta3', 'name': 'Bob Electronics'},
  'favorited': false,
  'favorite_count': 0,
  'pending_edit': null,
  'location': {
    'province_code': '01',
    'province_name': 'Ha Noi',
    'district_code': '007',
    'district_name': 'Hai Ba Trung',
    'ward_code': '00091',
    'ward_name': 'Bach Khoa',
  },
  'created_at': '2026-08-02T04:55:15.318908Z',
  'deleted_at': null,
};

/// `GET /orders/{id}/transport`. The shape a checkpoint POST answers with too.
const transportJson = <String, dynamic>{
  'id': 'trp_ep6bh2cqjsxy3',
  'option': 'standard-delivery',
  'status': 'pending',
  'fee': 15000,
  'created_at': '2026-08-05T02:47:38.200063Z',
};
