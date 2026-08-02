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

  /// Mở cuộc hội thoại mới với tài khoản khác
  @POST(ApiEndpoints.conversations)
  Future<DataResponse<ChatConversation>> startConversation(
    @Body() StartConversationRequest request,
  );

  /// Đọc thông tin cuộc hội thoại
  @GET(ApiEndpoints.conversationDetailTemplate)
  Future<DataResponse<ChatConversation>> getConversationDetail(
    @Path('id') String id,
  );

  /// Lấy lịch sử tin nhắn của một cuộc hội thoại cụ thể
  @GET(ApiEndpoints.conversationMessagesTemplate)
  Future<DataResponse<List<ChatMessage>>> getMessages(
    @Path('id') String conversationId,
    @Query('page') int? page,
    @Query('limit') int? limit,
  );

  /// Gửi tin nhắn mới trong hội thoại
  @POST(ApiEndpoints.conversationMessagesTemplate)
  Future<DataResponse<ChatMessage>> sendMessage(
    @Path('id') String conversationId,
    @Body() SendMessageRequest request,
  );

  /// Đánh dấu tin nhắn đã đọc đến mốc thời gian 'before'
  @POST(ApiEndpoints.conversationReadTemplate)
  Future<DataResponse<ChatConversation>> markAsRead(
    @Path('id') String conversationId,
    @Body() MarkConversationReadRequest request,
  );

  /// Lấy số lượng hội thoại chưa đọc
  @GET(ApiEndpoints.chatUnreadCount)
  Future<DataResponse<ChatUnreadCount>> getUnreadCount();

  /// Thu hồi / Xóa tin nhắn
  @DELETE(ApiEndpoints.messageDetailTemplate)
  Future<void> deleteMessage(@Path('id') String id);

  /// Chỉnh sửa tin nhắn
  @PATCH(ApiEndpoints.messageDetailTemplate)
  Future<DataResponse<ChatMessage>> editMessage(
    @Path('id') String id,
    @Body() UpdateMessageRequest request,
  );
}

@riverpod
ChatApiService chatApiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return ChatApiService(dioInstance);
}
