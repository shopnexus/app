import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/help_ticket_model.dart';

part 'help_center_repository.g.dart';

class HelpCenterRepository {
  final List<HelpTicket> _mockTickets = [
    const HelpTicket(
      id: 'TCK-8924',
      title: 'Lỗi thanh toán không thành công qua thẻ tín dụng',
      description:
          'Tôi thực hiện thanh toán cho đơn hàng #ORD-9821 qua thẻ Visa nhưng hệ thống báo lỗi timeout và tiền đã bị trừ.',
      category: 'Thanh toán',
      status: 'in_progress',
      // Đang xử lý
      createdAt: '2026-07-31 18:45',
      updatedAt: '10 phút trước',
      lastMessage:
          'Bộ phận kỹ thuật đang kiểm tra cổng thanh toán với ngân hàng kết nối.',
    ),
    const HelpTicket(
      id: 'TCK-8921',
      title: 'Yêu cầu hoàn tiền đơn hàng #ORD-1234',
      description:
          'Sản phẩm giao đến bị hư hỏng hộp bên ngoài và thiếu phụ kiện đi kèm. Tôi đã chụp ảnh làm bằng chứng.',
      category: 'Hoàn tiền',
      status: 'waiting',
      // Chờ phản hồi
      createdAt: '2026-07-30 14:30',
      updatedAt: 'Hôm qua, 14:30',
      lastMessage:
          'Vui lòng cung cấp thêm video quay lại cảnh mở hộp sản phẩm để đối soát.',
    ),
    const HelpTicket(
      id: 'TCK-8915',
      title: 'Không nhận được mã xác thực OTP qua SMS',
      description:
          'Tôi nhấn gửi lại OTP 3 lần nhưng điện thoại không nhận được tin nhắn SMS xác thực thay đổi số điện thoại.',
      category: 'Tài khoản',
      status: 'resolved',
      // Đã giải quyết
      createdAt: '2026-07-28 09:15',
      updatedAt: '28/07/2026',
      lastMessage:
          'Hệ thống tổng đài SMS đã khắc phục nghẽn mạng. Đã gửi thành công OTP.',
    ),
    const HelpTicket(
      id: 'TCK-8902',
      title: 'Hỏi về chính sách phí vận chuyển vùng sâu vùng xa',
      description:
          'ShopNexus có hỗ trợ mã miễn phí vận chuyển cho khu vực huyện đảo không?',
      category: 'Vận chuyển',
      status: 'resolved',
      createdAt: '2026-07-25 11:20',
      updatedAt: '25/07/2026',
      lastMessage:
          'ShopNexus áp dụng voucher Freeship Extra áp dụng cho mọi tỉnh thành toàn quốc.',
    ),
  ];

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

  /// Lấy số liệu thống kê Ticket
  Future<HelpCenterStats> getStats() async {
    final openCount = _mockTickets
        .where(
          (t) =>
              t.status == 'open' ||
              t.status == 'in_progress' ||
              t.status == 'waiting',
        )
        .length;
    final resolvedCount = _mockTickets
        .where((t) => t.status == 'resolved' || t.status == 'closed')
        .length;
    return HelpCenterStats(
      openCount: openCount,
      resolvedCount: resolvedCount,
      totalCount: _mockTickets.length,
    );
  }

  /// Lấy danh sách Ticket
  Future<List<HelpTicket>> getTickets() async {
    return List.unmodifiable(_mockTickets);
  }

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

  /// Tạo Ticket mới
  Future<HelpTicket> createTicket({
    required String title,
    required String category,
    required String description,
    List<String>? attachments,
  }) async {
    final newId = 'TCK-${8925 + _mockTickets.length}';
    final newTicket = HelpTicket(
      id: newId,
      title: title,
      description: description,
      category: category,
      status: 'open',
      createdAt: 'Vừa xong',
      updatedAt: 'Vừa xong',
      lastMessage: 'Ticket vừa được khởi tạo và chờ tiếp nhận.',
      attachments: attachments,
    );
    _mockTickets.insert(0, newTicket);
    return newTicket;
  }
}

@riverpod
HelpCenterRepository helpCenterRepository(Ref ref) {
  return HelpCenterRepository();
}
