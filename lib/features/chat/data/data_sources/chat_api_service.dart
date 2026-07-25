import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../shared/models/data_response.dart';
import '../models/chat_model.dart';

part 'chat_api_service.g.dart';

@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ChatApiService {
  factory ChatApiService(Dio dio, {String baseUrl}) = _ChatApiService;

  /// Lấy danh sách các cuộc hội thoại chat
  @GET(ApiEndpoints.conversations)
  Future<DataResponse<List<ChatConversation>>> getConversations(
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  /// Lấy lịch sử tin nhắn của một cuộc hội thoại cụ thể
  @GET(ApiEndpoints.conversationMessagesTemplate)
  Future<DataResponse<List<ChatMessage>>> getMessages(
    @Path('id') String conversationId,
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  /// Gửi tin nhắn mới qua REST API
  @POST(ApiEndpoints.sendMessage)
  Future<DataResponse<ChatMessage>> sendMessage(
    @Body() Map<String, dynamic> body,
  );

  /// Đánh dấu tin nhắn đã đọc trong hội thoại
  @POST(ApiEndpoints.markRead)
  Future<DataResponse<bool>> markAsRead(@Body() Map<String, dynamic> body);
}

@riverpod
ChatApiService chatApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return ChatApiService(dioInstance);
}
