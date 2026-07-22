import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../catalog/data/models/catalog_model.dart';
import '../data_sources/seller_api_service.dart';
import '../models/seller_model.dart';

part 'seller_repository.g.dart';

class SellerRepository {
  final SellerApiService _apiService;

  SellerRepository(this._apiService);

  /// Fetch dashboard stats for seller
  Future<SellerStats> getSellerDashboard({String? period}) async {
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
    final response = await _apiService.deleteSku(id);
    return response.data.message.isNotEmpty;
  }

  /// Get pending seller items awaiting confirmation
  Future<List<SellerPendingItem>> getSellerPendingItems({
    int? page,
    int? limit,
  }) async {
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
    final response = await _apiService.confirmPendingItems(
      ConfirmSellerPendingRequest(itemIds: itemIds),
    );
    return response.data;
  }

  /// Cancel confirmation session
  Future<bool> cancelConfirmPendingSession(String sessionId) async {
    final response = await _apiService.cancelConfirmPendingSession(sessionId);
    return response.data.message.isNotEmpty;
  }

  /// Get payment URL for confirmation fee
  Future<SellerConfirmResponse> getConfirmPaymentUrl(String sessionId) async {
    final response = await _apiService.getConfirmPaymentUrl(sessionId);
    return response.data;
  }

  /// Reject pending item
  Future<bool> rejectPendingItem(String itemId, {String? reason}) async {
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
    final response = await _apiService.getSellerConfirmedOrders(
      status: status,
      page: page,
      limit: limit,
    );
    return response.data;
  }

  /// Get seller order detail
  Future<SellerOrder> getSellerOrderDetail(String id) async {
    final response = await _apiService.getSellerOrderDetail(id);
    return response.data;
  }
}

@riverpod
SellerRepository sellerRepository(Ref ref) {
  final apiService = ref.watch(sellerApiServiceProvider);
  return SellerRepository(apiService);
}
