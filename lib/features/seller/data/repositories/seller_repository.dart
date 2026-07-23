import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/app_config.dart';
import '../../../catalog/data/models/catalog_model.dart';
import '../data_sources/seller_api_service.dart';
import '../models/seller_model.dart';

part 'seller_repository.g.dart';

class SellerRepository {
  final SellerApiService _apiService;

  SellerRepository(this._apiService);

  /// Synchronous mock getters for instant UI initialization during dev
  List<TProductDetail> getSpuListSync({String? status}) {
    return _filterMockSpuList(status);
  }

  List<SellerPendingItem> getSellerPendingItemsSync() {
    return _mockSellerPendingItems;
  }

  List<SellerOrder> getSellerConfirmedOrdersSync({String? status}) {
    return _filterMockSellerOrders(status);
  }

  /// Fetch dashboard stats for seller
  Future<SellerStats> getSellerDashboard({String? period}) async {
    if (AppConfig.useMockData) {
      return SellerStats(
        pendingOrders: 5,
        shippingOrders: 12,
        completedOrders: 148,
        disputingOrders: 1,
        activeProducts: 24,
        inactiveProducts: 3,
        violatedProducts: 0,
        chartData: const [
          SalesChartPoint(label: 'Oct', value: 42.0, ordersCount: 42),
          SalesChartPoint(label: 'Nov', value: 48.0, ordersCount: 48),
          SalesChartPoint(label: 'Dec', value: 52.0, ordersCount: 52),
        ],
      );
    }
    final response = await _apiService.getSellerDashboard(period: period);
    return response.data;
  }

  /// Upload video to generate AI product template
  Future<VideoToProductResponse> uploadVideoToProduct(
    MultipartFile videoFile,
  ) async {
    final response = await _apiService.uploadVideoToProduct(videoFile);
    return response.data;
  }

  /// Upload audio to extract raw text & AI refined product description
  Future<AudioToDescriptionResponse> uploadAudioToProduct(
    MultipartFile audioFile,
  ) async {
    final response = await _apiService.uploadAudioToProduct(audioFile);
    return response.data;
  }

  /// Refine raw description text using AI with optional tone/prompt
  Future<RefineDescriptionResponse> refineDescription(
    String rawText, {
    String? tone,
    String? prompt,
  }) async {
    final response = await _apiService.refineDescription(
      RefineDescriptionRequest(rawText: rawText, tone: tone, prompt: prompt),
    );
    return response.data;
  }

  /// Get SPU product list
  Future<List<TProductDetail>> getSpuList({
    String? vendorId,
    String? status,
    int? page,
    int? limit,
  }) async {
    if (AppConfig.useMockData) {
      return _filterMockSpuList(status);
    }
    final response = await _apiService.getSpuList(
      vendorId: vendorId,
      status: status,
      page: page,
      limit: limit,
    );
    return response.data;
  }

  /// Create new SPU product
  Future<TProductDetail> createSpu(ProductSpuRequest request) async {
    final response = await _apiService.createSpu(request);
    return response.data;
  }

  /// Get SPU detail by ID
  Future<TProductDetail> getSpuDetail(String id) async {
    if (AppConfig.useMockData) {
      return _mockSpuList.firstWhere(
        (p) => p.id == id,
        orElse: () => _mockSpuList.first,
      );
    }
    final response = await _apiService.getSpuDetail(id);
    return response.data;
  }

  /// Update SPU product
  Future<TProductDetail> updateSpu(String id, ProductSpuRequest request) async {
    final response = await _apiService.updateSpu(id, request);
    return response.data;
  }

  /// Get SKU variant list for an SPU
  Future<List<ProductSku>> getSkuList({
    String? spuId,
    int? page,
    int? limit,
  }) async {
    if (AppConfig.useMockData) {
      return const [
        ProductSku(
          id: 'sku_1_1',
          name: 'Nâu Dark Brown',
          price: 850000,
          stock: 45,
        ),
      ];
    }
    final response = await _apiService.getSkuList(
      spuId: spuId,
      page: page,
      limit: limit,
    );
    return response.data;
  }

  /// Create new SKU variant
  Future<ProductSku> createSku(ProductSkuRequest request) async {
    final response = await _apiService.createSku(request);
    return response.data;
  }

  /// Update SKU variant
  Future<ProductSku> updateSku(String id, ProductSkuRequest request) async {
    final response = await _apiService.updateSku(id, request);
    return response.data;
  }

  /// Delete SKU variant
  Future<bool> deleteSku(String id) async {
    if (AppConfig.useMockData) {
      return true;
    }
    final response = await _apiService.deleteSku(id);
    return response.data.message.isNotEmpty;
  }

  /// Get pending seller items awaiting confirmation
  Future<List<SellerPendingItem>> getSellerPendingItems({
    int? page,
    int? limit,
  }) async {
    if (AppConfig.useMockData) {
      return _mockSellerPendingItems;
    }
    final response = await _apiService.getSellerPendingItems(
      page: page,
      limit: limit,
    );
    return response.data;
  }

  /// Confirm pending items for order consolidation
  Future<SellerConfirmResponse> confirmPendingItems(
    List<String> itemIds,
  ) async {
    if (AppConfig.useMockData) {
      _mockSellerPendingItems.removeWhere((item) => itemIds.contains(item.id));
      return const SellerConfirmResponse(
        sessionId: 'session_mock_123',
        amount: 20000,
        paymentUrl: 'https://payment.shopnexus.com/confirm',
      );
    }
    final response = await _apiService.confirmPendingItems(
      ConfirmSellerPendingRequest(itemIds: itemIds),
    );
    return response.data;
  }

  /// Cancel confirmation session
  Future<bool> cancelConfirmPendingSession(String sessionId) async {
    if (AppConfig.useMockData) {
      return true;
    }
    final response = await _apiService.cancelConfirmPendingSession(sessionId);
    return response.data.message.isNotEmpty;
  }

  /// Get payment URL for confirmation fee
  Future<SellerConfirmResponse> getConfirmPaymentUrl(String sessionId) async {
    if (AppConfig.useMockData) {
      return const SellerConfirmResponse(
        sessionId: 'session_mock_123',
        amount: 20000,
        paymentUrl: 'https://payment.shopnexus.com/confirm',
      );
    }
    final response = await _apiService.getConfirmPaymentUrl(sessionId);
    return response.data;
  }

  /// Reject pending item
  Future<bool> rejectPendingItem(String itemId, {String? reason}) async {
    if (AppConfig.useMockData) {
      _mockSellerPendingItems.removeWhere((item) => item.id == itemId);
      return true;
    }
    final response = await _apiService.rejectPendingItem(
      RejectSellerPendingRequest(itemId: itemId, reason: reason),
    );
    return response.data.message.isNotEmpty;
  }

  /// Get confirmed seller orders
  Future<List<SellerOrder>> getSellerConfirmedOrders({
    String? status,
    int? page,
    int? limit,
  }) async {
    if (AppConfig.useMockData) {
      return _filterMockSellerOrders(status);
    }
    final response = await _apiService.getSellerConfirmedOrders(
      status: status,
      page: page,
      limit: limit,
    );
    return response.data;
  }

  /// Get seller order detail
  Future<SellerOrder> getSellerOrderDetail(String id) async {
    if (AppConfig.useMockData) {
      return _mockSellerConfirmedOrders.firstWhere(
        (o) => o.id == id,
        orElse: () => _mockSellerConfirmedOrders.first,
      );
    }
    final response = await _apiService.getSellerOrderDetail(id);
    return response.data;
  }

  // --- Static Mock Data Helpers ---
  static List<TProductDetail> _filterMockSpuList(String? status) {
    if (status == null || status.isEmpty) return _mockSpuList;
    if (status == 'active') {
      return _mockSpuList
          .where(
            (p) =>
                (p.soldCount ?? 0) > 0 &&
                p.skus != null &&
                p.skus!.any((s) => s.stock > 0),
          )
          .toList();
    } else if (status == 'inactive') {
      return _mockSpuList
          .where((p) => p.skus != null && p.skus!.every((s) => s.stock == 0))
          .toList();
    } else if (status == 'violated') {
      return _mockSpuList
          .where(
            (p) =>
                p.id.contains('violated') || p.skus == null || p.skus!.isEmpty,
          )
          .toList();
    }
    return _mockSpuList;
  }

  static List<SellerOrder> _filterMockSellerOrders(String? status) {
    if (status == null || status.isEmpty) return _mockSellerConfirmedOrders;
    if (status == 'disputing') {
      return _mockSellerConfirmedOrders
          .where((o) => o.status == 'disputing' || o.status == 'cancelled')
          .toList();
    }
    return _mockSellerConfirmedOrders.where((o) => o.status == status).toList();
  }

  static final List<TProductDetail> _mockSpuList = [
    const TProductDetail(
      id: 'spu_1',
      name: 'Ví da bò sáp thủ công Classic',
      slug: 'vi-da-bo-sap-thu-cong-classic',
      description:
          'Ví da thật 100% may thủ công tinh tế, bề mặt mài xước patina thời thượng.',
      price: 850000,
      originalPrice: 1200000,
      soldCount: 120,
      skus: [
        ProductSku(
          id: 'sku_1_1',
          name: 'Nâu Dark Brown',
          price: 850000,
          stock: 45,
        ),
      ],
    ),
    const TProductDetail(
      id: 'spu_2',
      name: 'Bình giữ nhiệt Titan 750ml Matte Black',
      slug: 'binh-giu-nhiet-titan-750ml',
      description:
          'Lõi inox 316 giữ nhiệt 24h, lớp phủ sơn tĩnh điện nhám cao cấp.',
      price: 420000,
      originalPrice: 550000,
      soldCount: 89,
      skus: [
        ProductSku(
          id: 'sku_2_1',
          name: 'Đen Nhám 750ml',
          price: 420000,
          stock: 0,
        ),
      ],
    ),
    const TProductDetail(
      id: 'spu_3',
      name: 'Set Tinh dầu thiên nhiên Relax Organics',
      slug: 'set-tinh-dau-thien-nhien-relax',
      description:
          'Chiết xuất 100% thảo mộc hữu cơ kèm khay gỗ sồi bài trí sang trọng.',
      price: 350000,
      originalPrice: 450000,
      soldCount: 45,
      skus: [
        ProductSku(
          id: 'sku_3_1',
          name: 'Combo 3 chai 10ml',
          price: 350000,
          stock: 120,
        ),
      ],
    ),
    const TProductDetail(
      id: 'spu_4',
      name: 'Khay để bàn bằng gỗ sồi tự nhiên, thiết kế module',
      slug: 'khay-de-ban-go-soi-tu-nhien',
      description:
          'Gỗ sồi nguyên khối gia công CNC sắc nét, sơn phủ PU mờ bảo vệ.',
      price: 450000,
      originalPrice: 600000,
      soldCount: 64,
      skus: [
        ProductSku(
          id: 'sku_4_1',
          name: 'Gỗ sồi Natural',
          price: 450000,
          stock: 30,
        ),
      ],
    ),
    const TProductDetail(
      id: 'spu_violated_1',
      name: 'Áo sơ mi Linen cúc thô Vintage (Cần bổ sung nhãn chứng nhận)',
      slug: 'ao-so-mi-linen-cuc-tho-vintage',
      description: 'Sản phẩm tạm thời bị tạm ẩn do thiếu chứng nhận xuất xứ.',
      price: 350000,
      originalPrice: 450000,
      soldCount: 0,
      skus: [
        ProductSku(id: 'sku_v_1', name: 'Trắng M', price: 350000, stock: 10),
      ],
    ),
  ];

  static final List<SellerPendingItem> _mockSellerPendingItems = [
    const SellerPendingItem(
      id: 'pending_1',
      orderId: 'DH8472',
      buyerName: 'Minh Anh',
      productName:
          'Cốc gốm thủ công tráng men xanh ngọc bích, phong cách tối giản',
      skuName: 'Xanh Ngọc Bích - 350ml',
      quantity: 2,
      price: 150000,
      status: 'pending',
    ),
    const SellerPendingItem(
      id: 'pending_2',
      orderId: 'DH8475',
      buyerName: 'Hoàng Nam',
      productName: 'Ví da bò sáp thủ công Classic',
      skuName: 'Nâu Dark Brown',
      quantity: 1,
      price: 850000,
      status: 'pending',
    ),
  ];

  static final List<SellerOrder> _mockSellerConfirmedOrders = [
    const SellerOrder(
      id: 'DH8474',
      buyerName: 'Nguyễn Hoàng Nam',
      totalAmount: 850000,
      status: 'processing',
      shippingAddress: '12 Đường 3/2, Q.10, TP.HCM',
      items: [
        SellerPendingItem(
          id: 'pi_0',
          productName: 'Ví da bò sáp thủ công Classic',
          quantity: 1,
          price: 850000,
        ),
      ],
    ),
    const SellerOrder(
      id: 'DH8470',
      buyerName: 'Thanh Tùng',
      totalAmount: 450000,
      status: 'shipping',
      shippingAddress: '123 Nguyễn Huệ, Q.1, TP.HCM',
      items: [
        SellerPendingItem(
          id: 'pi_1',
          productName: 'Khay để bàn bằng gỗ sồi tự nhiên, thiết kế module',
          quantity: 1,
          price: 450000,
        ),
      ],
    ),
    const SellerOrder(
      id: 'DH8468',
      buyerName: 'Trần Thu Hà',
      totalAmount: 850000,
      status: 'completed',
      shippingAddress: '45 Lê Duẩn, Q.1, TP.HCM',
      items: [
        SellerPendingItem(
          id: 'pi_2',
          productName: 'Ví da bò sáp thủ công Classic',
          quantity: 1,
          price: 850000,
        ),
      ],
    ),
    const SellerOrder(
      id: 'DH8465',
      buyerName: 'Phạm Đức Long',
      totalAmount: 350000,
      status: 'disputing',
      shippingAddress: '78 Võ Văn Tần, Q.3, TP.HCM',
      items: [
        SellerPendingItem(
          id: 'pi_3',
          productName: 'Set Tinh dầu thiên nhiên Relax Organics',
          quantity: 1,
          price: 350000,
        ),
      ],
    ),
    const SellerOrder(
      id: 'DH8460',
      buyerName: 'Lê Quốc Bảo',
      totalAmount: 520000,
      status: 'cancelled',
      shippingAddress: '99 Điện Biên Phủ, Q. Bình Thạnh, TP.HCM',
      items: [
        SellerPendingItem(
          id: 'pi_4',
          productName: 'Bình giữ nhiệt Titan 750ml Matte Black',
          quantity: 1,
          price: 420000,
        ),
      ],
    ),
  ];
}

@riverpod
SellerRepository sellerRepository(Ref ref) {
  final apiService = ref.watch(sellerApiServiceProvider);
  return SellerRepository(apiService);
}
