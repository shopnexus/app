import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/help_ticket_model.dart';

part 'help_center_repository.g.dart';

/// FAQ content only. Tickets come from `TicketRepository`, which talks to
/// `/tickets`; there is no FAQ endpoint to talk to.
class HelpCenterRepository {
  final List<FaqItem> _mockFaqs = const [
    FaqItem(
      id: 'faq_1',
      question: 'Bao lâu thì tôi nhận được phản hồi cho Ticket của mình?',
      answer:
          'Thông thường, đội ngũ hỗ trợ của ShopNexus sẽ phản hồi Ticket trong vòng 24 giờ làm việc. Các vấn đề khẩn cấp liên quan đến thanh toán hoặc sự cố bảo mật sẽ được ưu tiên xử lý nhanh hơn.',
      category: 'Thanh toán',
    ),
    FaqItem(
      id: 'faq_2',
      question: 'Làm thế nào để đính kèm hình ảnh và bằng chứng vào Ticket?',
      answer:
          'Khi xem chi tiết Ticket hoặc khi bấm "Trao đổi trực tiếp", bạn có thể sử dụng biểu tượng đính kèm tệp để chọn ảnh/video bằng chứng từ thiết bị của bạn.',
      category: 'Hoàn tiền',
    ),
    FaqItem(
      id: 'faq_3',
      question: 'Quy trình hoàn tiền và trả hàng diễn ra trong bao lâu?',
      answer:
          'Sau khi người bán nhận lại hàng và xác nhận điều kiện trả hàng (hoặc sau khi Trọng tài ShopNexus duyệt tranh chấp), tiền refund sẽ được trả lại ví ShopNexus hoặc tài khoản ngân hàng trong 3 - 5 ngày làm việc.',
      category: 'Hoàn tiền',
    ),
    FaqItem(
      id: 'faq_4',
      question:
          'Làm sao để thay đổi địa chỉ giao hàng cho đơn hàng đang vận chuyển?',
      answer:
          'Nếu đơn hàng chưa ở trạng thái "Đang giao hàng", bạn có thể vào mục Đơn hàng > Chi tiết đơn hàng > Nhấn "Thay đổi địa chỉ". Nếu đã đang giao, vui lòng liên hệ nhân viên giao hàng hoặc tạo Ticket.',
      category: 'Vận chuyển',
    ),
    FaqItem(
      id: 'faq_5',
      question: 'ShopNexus hỗ trợ những phương thức thanh toán nào?',
      answer:
          'ShopNexus hỗ trợ thanh toán qua Ví nội bộ ShopNexus, Thẻ ATM nội bộ / Internet Banking, Thẻ tín dụng/ghi nợ (Visa, MasterCard, JCB), và Thanh toán khi nhận hàng (COD).',
      category: 'Thanh toán',
    ),
    FaqItem(
      id: 'faq_6',
      question: 'Tôi bị quên mật khẩu tài khoản thì cần xử lý thế nào?',
      answer:
          'Tại màn hình Đăng nhập, bạn bấm vào "Quên mật khẩu", nhập Email hoặc Số điện thoại đã đăng ký. Chúng tôi sẽ gửi mã khôi phục kèm liên kết tạo mật khẩu mới.',
      category: 'Tài khoản',
    ),
    FaqItem(
      id: 'faq_7',
      question: 'Làm thế nào để liên hệ trực tiếp với Người bán (Seller)?',
      answer:
          'Tại trang Chi tiết sản phẩm hoặc trong mục Đơn hàng của tôi, bạn bấm vào nút "Chat ngay" để mở cửa sổ trò chuyện trực tiếp với Người bán.',
      category: 'Tài khoản',
    ),
    FaqItem(
      id: 'faq_8',
      question: 'Chính sách bảo vệ người mua ShopNexus Guarantee là gì?',
      answer:
          'ShopNexus giữ tiền thanh toán an toàn cho đến khi Người mua xác nhận đã nhận đúng hàng và không có khiếu nại trong vòng 3 ngày kể từ khi giao hàng thành công.',
      category: 'Quy định',
    ),
  ];

  /// Lấy danh sách FAQ với bộ lọc category và query
  Future<List<FaqItem>> getFaqs({String? category, String? query}) async {
    return _mockFaqs.where((faq) {
      final matchesCategory =
          (category == null ||
          category == 'Tất cả' ||
          category.isEmpty ||
          faq.category.toLowerCase() == category.toLowerCase());
      final matchesQuery =
          (query == null ||
          query.isEmpty ||
          faq.question.toLowerCase().contains(query.toLowerCase()) ||
          faq.answer.toLowerCase().contains(query.toLowerCase()));
      return matchesCategory && matchesQuery;
    }).toList();
  }

}

@riverpod
HelpCenterRepository helpCenterRepository(Ref ref) {
  return HelpCenterRepository();
}
