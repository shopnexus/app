import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/api/generated/model/ticket.dart';
import 'package:shopnexus_flutter_app/features/ticket/presentation/providers/ticket_provider.dart';

/// Mở một yêu cầu hỗ trợ — nghĩa là mở *cuộc trò chuyện* của nó.
///
/// Một ticket **là** một cuộc trò chuyện: chữ của người gửi nằm ở đó, và nhân
/// viên trả lời cũng ở đó. Trước đây app có một màn riêng cho ticket, và trả lời
/// một yêu cầu là một chuyến đi ra khỏi hộp thư rồi lại vào — thứ mà website đã
/// bỏ khi xoá route `/support` của nó. Giờ chỉ còn một chỗ đọc, và cái ticket
/// thêm vào đó đúng hai thứ nó có mà một cuộc trò chuyện thường không có: trạng
/// thái và kết quả xử lý — cả hai nằm trên tấm băng đầu thread.
///
/// `conversation_id` có thể còn trống ngay sau khi tạo: ticket và thread nằm ở hai
/// schema, một cái về trước. Đọc lại ticket là đúng cái sửa chỗ trống đó, nên chỗ
/// này đọc lại thay vì bỏ mặc người dùng ở một liên kết chết. Vẫn chưa có thì về
/// tab Hỗ trợ, nơi câu trả lời sẽ tới.
Future<void> openTicketThread(
  BuildContext context,
  WidgetRef ref,
  Ticket ticket,
) async {
  var conversationId = ticket.conversationId;

  if (conversationId == null || conversationId.isEmpty) {
    try {
      final fresh = await ref.read(ticketDetailProvider(ticket.id).future);
      conversationId = fresh.conversationId;
    } catch (_) {
      // Đọc lại chỉ là để *sửa* một chỗ trống; hỏng thì vẫn còn tab Hỗ trợ.
    }
  }
  if (!context.mounted) return;

  if (conversationId != null && conversationId.isNotEmpty) {
    context.push('/chat/$conversationId');
    return;
  }

  context.push('/chat?tab=support');
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Cuộc trò chuyện đang được tạo, sẽ hiện ở tab Hỗ trợ.'),
    ),
  );
}
