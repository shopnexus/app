import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/app_config.dart';
import '../../../../core/storage/hive_storage.dart';
import '../../../../shared/models/rating_model.dart';
import '../../../../shared/models/resource_model.dart';
import '../data_sources/catalog_api_service.dart';
import '../models/catalog_model.dart';

part 'catalog_repository.g.dart';

class CatalogRepository {
  final CatalogApiService _apiService;
  final HiveService _hiveService;

  CatalogRepository(this._apiService, this._hiveService);

  Future<List<TProductCard>> getProductCards({
    String? keyword,
    String? categoryId,
    String? vendorId,
    int? priceMin,
    int? priceMax,
    List<String>? tags,
    String? sort,
    String? location,
    int? page,
    int? size,
  }) async {
    if (AppConfig.useMockData) {
      var list = List<TProductCard>.from(_mockProductCards);

      if (keyword != null && keyword.trim().isNotEmpty) {
        final kw = keyword.trim().toLowerCase();
        list = list.where((p) => p.name.toLowerCase().contains(kw)).toList();
      }

      if (categoryId != null && categoryId.isNotEmpty) {
        list = list.where((p) {
          final detail = _mockProductDetails.firstWhere(
            (d) => d.id == p.id,
            orElse: () => _mockProductDetails.first,
          );
          return detail.categoryId == categoryId;
        }).toList();
      }

      if (vendorId != null && vendorId.isNotEmpty) {
        list = list.where((p) => p.vendorId == vendorId).toList();
      }

      if (priceMin != null) {
        list = list.where((p) => p.price >= priceMin).toList();
      }

      if (priceMax != null) {
        list = list.where((p) => p.price <= priceMax).toList();
      }

      if (sort != null) {
        if (sort == 'price_asc') {
          list.sort((a, b) => a.price.compareTo(b.price));
        } else if (sort == 'price_desc') {
          list.sort((a, b) => b.price.compareTo(a.price));
        } else if (sort == 'sold_count_desc') {
          list.sort((a, b) => (b.soldCount ?? 0).compareTo(a.soldCount ?? 0));
        }
      }

      return list;
    }

    try {
      final response = await _apiService.getProductCards(
        keyword: keyword,
        search: keyword,
        categoryId: categoryId,
        vendorId: vendorId,
        sellerId: vendorId,
        priceMin: priceMin,
        priceMax: priceMax,
        tags: tags,
        sort: sort,
        location: location,
        page: page,
        size: size,
        limit: size,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<TProductCard> getProductCardDetail(String id) async {
    if (AppConfig.useMockData) {
      return _mockProductCards.firstWhere(
        (p) => p.id == id,
        orElse: () => _mockProductCards.first,
      );
    }
    try {
      final response = await _apiService.getProductCardDetail(id);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  /// Lấy chi tiết sản phẩm và tự động lưu vào danh sách sản phẩm vừa xem (recentBox)
  Future<TProductDetail> getProductDetail({String? id, String? slug}) async {
    if (AppConfig.useMockData) {
      final productDetail = _mockProductDetails.firstWhere(
        (p) => p.id == id || p.slug == slug,
        orElse: () => _mockProductDetails.first,
      );

      final productCard = TProductCard(
        id: productDetail.id,
        name: productDetail.name,
        slug: productDetail.slug,
        thumbnail: productDetail.images?.firstOrNull?.url,
        price: productDetail.price,
        originalPrice: productDetail.originalPrice,
        rating: productDetail.rating,
        soldCount: productDetail.soldCount,
        vendorId: productDetail.vendorId,
        vendorName: productDetail.vendorName,
      );

      await addToRecentlyViewed(productCard);
      return productDetail;
    }

    try {
      final response = await _apiService.getProductDetail(id: id, slug: slug);
      final productDetail = response.data;

      // Chuyển đổi thông tin SPU Detail sang dạng SPU Card để lưu cache
      final productCard = TProductCard(
        id: productDetail.id,
        name: productDetail.name,
        slug: productDetail.slug,
        thumbnail: productDetail.images?.firstOrNull?.url,
        price: productDetail.price,
        originalPrice: productDetail.originalPrice,
        rating: productDetail.rating,
        soldCount: productDetail.soldCount,
        vendorId: productDetail.vendorId,
        vendorName: productDetail.vendorName,
      );

      // Lưu sản phẩm vào Hive recentBox
      await addToRecentlyViewed(productCard);

      return productDetail;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Category>> getCategories() async {
    if (AppConfig.useMockData) {
      return _mockCategories;
    }
    try {
      final response = await _apiService.getCategories();
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<ProductComment>> getComments({
    String? spuId,
    int? page,
    int? size,
  }) async {
    if (AppConfig.useMockData) {
      return _mockComments;
    }
    try {
      final response = await _apiService.getComments(
        refType: 'ProductSpu',
        refId: spuId ?? '',
        page: page,
        size: size,
      );
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  /// Thêm sản phẩm vào danh sách vừa xem (tối đa 10 sản phẩm, đẩy lên đầu, xóa trùng lặp)
  Future<void> addToRecentlyViewed(TProductCard product) async {
    try {
      final box = _hiveService.recentBox;
      final rawList = box.get('recently_viewed') as List?;
      final list = rawList != null
          ? List<Map<String, dynamic>>.from(
              rawList.map((e) => Map<String, dynamic>.from(e as Map)),
            )
          : <Map<String, dynamic>>[];

      // Xóa sản phẩm nếu đã tồn tại để tránh trùng lặp và cập nhật vị trí mới nhất
      list.removeWhere((item) => item['id'] == product.id);

      // Đưa sản phẩm mới lên đầu danh sách
      list.insert(0, product.toJson());

      // Giới hạn danh sách tối đa 10 sản phẩm
      if (list.length > 10) {
        list.removeRange(10, list.length);
      }

      await box.put('recently_viewed', list);
    } catch (e) {
      // Không ném ngoại lệ để tránh làm crash UI khi truy cập chi tiết sản phẩm nếu Hive bị lỗi
    }
  }

  /// Lấy danh sách sản phẩm xem gần đây từ Hive
  Future<List<TProductCard>> getRecentlyViewed() async {
    try {
      final box = _hiveService.recentBox;
      final rawList = box.get('recently_viewed') as List?;
      if (rawList == null) return [];
      return rawList
          .map(
            (e) => TProductCard.fromJson(Map<String, dynamic>.from(e as Map)),
          )
          .toList();
    } catch (e) {
      return [];
    }
  }

  // --- Static Mock Data Collections ---
  static final List<Category> _mockCategories = const [
    Category(
      id: 'cat_1',
      name: 'Thời trang & Phụ kiện',
      slug: 'thoi-trang-phu-kien',
    ),
    Category(
      id: 'cat_2',
      name: 'Đồ gia dụng & Lifestyle',
      slug: 'do-gia-dung-lifestyle',
    ),
    Category(id: 'cat_3', name: 'Thiết bị Điện tử', slug: 'thiet-bi-dien-tu'),
    Category(id: 'cat_4', name: 'Thủ công Mỹ nghệ', slug: 'thu-cong-my-nghe'),
    Category(
      id: 'cat_5',
      name: 'Mỹ phẩm & Chăm sóc da',
      slug: 'my-pham-cham-soc-da',
    ),
  ];

  static final List<TProductCard> _mockProductCards = const [
    TProductCard(
      id: 'spu_1',
      name: 'Ví da bò sáp thủ công Classic',
      slug: 'vi-da-bo-sap-thu-cong-classic',
      thumbnail:
          'https://images.unsplash.com/photo-1627123424574-724758594e93?w=600',
      price: 850000,
      originalPrice: 1200000,
      discountRate: 29.1,
      rating: RatingModel(score: 4.8, count: 120),
      soldCount: 120,
      vendorId: 'vendor_mock_01',
      vendorName: 'Craft & Wood Studio',
    ),
    TProductCard(
      id: 'spu_2',
      name: 'Bình giữ nhiệt Titan 750ml Matte Black',
      slug: 'binh-giu-nhiet-titan-750ml',
      thumbnail:
          'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=600',
      price: 420000,
      originalPrice: 550000,
      discountRate: 23.6,
      rating: RatingModel(score: 4.9, count: 89),
      soldCount: 89,
      vendorId: 'vendor_mock_01',
      vendorName: 'Craft & Wood Studio',
    ),
    TProductCard(
      id: 'spu_3',
      name: 'Set Tinh dầu thiên nhiên Relax Organics',
      slug: 'set-tinh-dau-thien-nhien-relax',
      thumbnail:
          'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=600',
      price: 350000,
      originalPrice: 450000,
      discountRate: 22.2,
      rating: RatingModel(score: 4.7, count: 45),
      soldCount: 45,
      vendorId: 'vendor_mock_01',
      vendorName: 'Craft & Wood Studio',
    ),
    TProductCard(
      id: 'spu_4',
      name: 'Khay để bàn bằng gỗ sồi tự nhiên, thiết kế module',
      slug: 'khay-de-ban-go-soi-tu-nhien',
      thumbnail:
          'https://images.unsplash.com/photo-1538688525198-9b88f6f53126?w=600',
      price: 450000,
      originalPrice: 600000,
      discountRate: 25.0,
      rating: RatingModel(score: 4.9, count: 64),
      soldCount: 64,
      vendorId: 'vendor_mock_01',
      vendorName: 'Craft & Wood Studio',
    ),
    TProductCard(
      id: 'spu_5',
      name: 'Tai nghe Bluetooth Pro ANC 2026',
      slug: 'tai-nghe-bluetooth-pro-anc-2026',
      thumbnail:
          'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600',
      price: 1250000,
      originalPrice: 1800000,
      discountRate: 30.5,
      rating: RatingModel(score: 4.6, count: 210),
      soldCount: 210,
      vendorId: 'vendor_mock_02',
      vendorName: 'TechZone Official',
    ),
    TProductCard(
      id: 'spu_6',
      name: 'Cốc gốm thủ công tráng men xanh ngọc bích',
      slug: 'coc-gom-thu-cong-trang-men-xanh',
      thumbnail:
          'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=600',
      price: 150000,
      originalPrice: 200000,
      discountRate: 25.0,
      rating: RatingModel(score: 5.0, count: 32),
      soldCount: 32,
      vendorId: 'vendor_mock_01',
      vendorName: 'Craft & Wood Studio',
    ),
  ];

  static final List<TProductDetail> _mockProductDetails = const [
    TProductDetail(
      id: 'spu_1',
      name: 'Ví da bò sáp thủ công Classic',
      slug: 'vi-da-bo-sap-thu-cong-classic',
      description:
          'Ví da thật 100% may thủ công tinh tế, bề mặt mài xước patina thời thượng. Sản phẩm phù hợp cho ca hai giới với 6 ngăn đựng thẻ và 2 ngăn đựng tiền mặt.',
      price: 850000,
      originalPrice: 1200000,
      rating: RatingModel(score: 4.8, count: 120),
      soldCount: 120,
      categoryId: 'cat_1',
      vendorId: 'vendor_mock_01',
      vendorName: 'Craft & Wood Studio',
      vendorAvatar:
          'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=400',
      images: [
        ResourceModel(
          id: 'res_1_1',
          url:
              'https://images.unsplash.com/photo-1627123424574-724758594e93?w=600',
        ),
      ],
      specifications: [
        ProductSpecification(key: 'Chất liệu', value: 'Da bò sáp nhập khẩu'),
        ProductSpecification(key: 'Kích thước', value: '11.5cm x 9cm'),
        ProductSpecification(key: 'Xuất xứ', value: 'Việt Nam'),
      ],
      skus: [
        ProductSku(
          id: 'sku_1_1',
          spuId: 'spu_1',
          name: 'Nâu Dark Brown',
          price: 850000,
          originalPrice: 1200000,
          stock: 45,
          attributes: [SkuAttribute(key: 'Màu sắc', value: 'Nâu Dark Brown')],
        ),
      ],
    ),
    TProductDetail(
      id: 'spu_2',
      name: 'Bình giữ nhiệt Titan 750ml Matte Black',
      slug: 'binh-giu-nhiet-titan-750ml',
      description:
          'Lõi inox 316 giữ nhiệt 24h, lớp phủ sơn tĩnh điện nhám cao cấp chống bám vân tay.',
      price: 420000,
      originalPrice: 550000,
      rating: RatingModel(score: 4.9, count: 89),
      soldCount: 89,
      categoryId: 'cat_2',
      vendorId: 'vendor_mock_01',
      vendorName: 'Craft & Wood Studio',
      images: [
        ResourceModel(
          id: 'res_2_1',
          url:
              'https://images.unsplash.com/photo-1602143407151-7111542de6e8?w=600',
        ),
      ],
      skus: [
        ProductSku(
          id: 'sku_2_1',
          spuId: 'spu_2',
          name: 'Đen Nhám 750ml',
          price: 420000,
          stock: 30,
          attributes: [SkuAttribute(key: 'Dung tích', value: '750ml')],
        ),
      ],
    ),
    TProductDetail(
      id: 'spu_3',
      name: 'Set Tinh dầu thiên nhiên Relax Organics',
      slug: 'set-tinh-dau-thien-nhien-relax',
      description:
          'Chiết xuất 100% thảo mộc hữu cơ kèm khay gỗ sồi bài trí sang trọng.',
      price: 350000,
      originalPrice: 450000,
      rating: RatingModel(score: 4.7, count: 45),
      soldCount: 45,
      categoryId: 'cat_5',
      vendorId: 'vendor_mock_01',
      vendorName: 'Craft & Wood Studio',
      images: [
        ResourceModel(
          id: 'res_3_1',
          url:
              'https://images.unsplash.com/photo-1608571423902-eed4a5ad8108?w=600',
        ),
      ],
      skus: [
        ProductSku(
          id: 'sku_3_1',
          spuId: 'spu_3',
          name: 'Combo 3 chai 10ml',
          price: 350000,
          stock: 120,
          attributes: [SkuAttribute(key: 'Quy cách', value: 'Combo 3 chai')],
        ),
      ],
    ),
    TProductDetail(
      id: 'spu_4',
      name: 'Khay để bàn bằng gỗ sồi tự nhiên, thiết kế module',
      slug: 'khay-de-ban-go-soi-tu-nhien',
      description:
          'Gỗ sồi nguyên khối gia công CNC sắc nét, sơn phủ PU mờ bảo vệ.',
      price: 450000,
      originalPrice: 600000,
      rating: RatingModel(score: 4.9, count: 64),
      soldCount: 64,
      categoryId: 'cat_2',
      vendorId: 'vendor_mock_01',
      vendorName: 'Craft & Wood Studio',
      images: [
        ResourceModel(
          id: 'res_4_1',
          url:
              'https://images.unsplash.com/photo-1538688525198-9b88f6f53126?w=600',
        ),
      ],
      skus: [
        ProductSku(
          id: 'sku_4_1',
          spuId: 'spu_4',
          name: 'Gỗ sồi Natural',
          price: 450000,
          stock: 30,
        ),
      ],
    ),
    TProductDetail(
      id: 'spu_5',
      name: 'Tai nghe Bluetooth Pro ANC 2026',
      slug: 'tai-nghe-bluetooth-pro-anc-2026',
      description:
          'Chống ồn chủ động ANC thế hệ mới, pin 30 giờ liên tục, âm thanh hifi sắc nét.',
      price: 1250000,
      originalPrice: 1800000,
      rating: RatingModel(score: 4.6, count: 210),
      soldCount: 210,
      categoryId: 'cat_3',
      vendorId: 'vendor_mock_02',
      vendorName: 'TechZone Official',
      images: [
        ResourceModel(
          id: 'res_5_1',
          url:
              'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600',
        ),
      ],
      skus: [
        ProductSku(
          id: 'sku_5_1',
          spuId: 'spu_5',
          name: 'Trắng Pearl',
          price: 1250000,
          stock: 15,
        ),
      ],
    ),
    TProductDetail(
      id: 'spu_6',
      name: 'Cốc gốm thủ công tráng men xanh ngọc bích',
      slug: 'coc-gom-thu-cong-trang-men-xanh',
      description:
          'Cốc gốm nung ở 1300 độ C, lớp men xanh ngọc mịn màng, cầm chắc tay.',
      price: 150000,
      originalPrice: 200000,
      rating: RatingModel(score: 5.0, count: 32),
      soldCount: 32,
      categoryId: 'cat_4',
      vendorId: 'vendor_mock_01',
      vendorName: 'Craft & Wood Studio',
      images: [
        ResourceModel(
          id: 'res_6_1',
          url:
              'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=600',
        ),
      ],
      skus: [
        ProductSku(
          id: 'sku_6_1',
          spuId: 'spu_6',
          name: '350ml - Xanh Ngọc Bích',
          price: 150000,
          stock: 50,
        ),
      ],
    ),
  ];

  static final List<ProductComment> _mockComments = const [
    ProductComment(
      id: 'cm_1',
      refId: 'spu_1',
      refType: 'ProductSpu',
      score: 5.0,
      body:
          'Chất liệu da vô cùng xịn xịn, may chắc chắn tỉ mỉ từng đường chỉ. Đóng gói cẩn thận!',
      dateCreated: '2026-07-20T10:00:00Z',
      profile: CommentProfile(
        id: 'u_1',
        name: 'Trần Minh Anh',
        avatarUrl:
            'https://images.unsplash.com/photo-1534528741775-53994a69daeb?w=400',
      ),
    ),
    ProductComment(
      id: 'cm_2',
      refId: 'spu_1',
      refType: 'ProductSpu',
      score: 4.5,
      body:
          'Giao hàng hỏa tốc trong 24h, sản phẩm giống mô tả 100%. Rất đáng tiền.',
      dateCreated: '2026-07-18T14:20:00Z',
      profile: CommentProfile(
        id: 'u_2',
        name: 'Lê Hoàng Nam',
        avatarUrl:
            'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
      ),
    ),
  ];
}

@riverpod
CatalogRepository catalogRepository(Ref ref) {
  final apiService = ref.watch(catalogApiServiceProvider);
  final hiveService = ref.watch(hiveServiceProvider);
  return CatalogRepository(apiService, hiveService);
}
