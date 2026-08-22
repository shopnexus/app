import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/features/legal/presentation/widgets/content_page.dart';

/// Về ShopNexus. Cùng nội dung với `/about` bên web.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContentPage(
      title: 'Về ShopNexus',
      intro:
          'Một sàn để người dùng mua bán trực tiếp với nhau — và một cơ chế giữ '
          'tiền để việc đó không cần niềm tin mù quáng.',
      sections: [
        ContentSection(
          title: 'Vấn đề chúng tôi giải',
          blocks: [
            ContentParagraph(
              'Mua bán đồ cũ giữa hai người lạ luôn vướng cùng một câu hỏi: ai đưa '
              'trước. Người mua sợ chuyển tiền rồi không nhận được hàng; người bán '
              'sợ gửi hàng rồi không nhận được tiền.',
            ),
            ContentParagraph(
              'ShopNexus đứng giữa. Tiền của người mua được giữ lại từ lúc thanh '
              'toán, và chỉ chuyển cho người bán sau khi hàng đã tới nơi. Không bên '
              'nào phải đưa trước.',
            ),
          ],
        ),
        ContentSection(
          title: 'Cách nó hoạt động',
          blocks: [
            ContentBullets([
              'Người bán đăng tin, đặt giá cố định hoặc cho phép thương lượng.',
              'Người mua thanh toán; ShopNexus giữ tiền và phí vận chuyển.',
              'Người bán xác nhận, kiện hàng được giao cho đơn vị vận chuyển.',
              'Người mua nhận hàng, kiểm tra, xác nhận — rồi tiền mới về người bán.',
              'Có trục trặc thì mở yêu cầu hoàn tiền, và ShopNexus phân xử nếu hai '
                  'bên không thống nhất.',
            ]),
            ContentParagraph(
              'Chi tiết từng mốc thời gian nằm trong điều khoản sử dụng.',
            ),
            ContentLink(label: 'Đọc điều khoản sử dụng', route: '/terms'),
          ],
        ),
        ContentSection(
          title: 'Liên hệ',
          blocks: [
            ContentParagraph(
              'Mọi câu hỏi, góp ý hay báo lỗi, hãy gửi qua Trung tâm hỗ trợ — đó là '
              'kênh duy nhất chúng tôi theo dõi, nên nó cũng là kênh trả lời nhanh '
              'nhất.',
            ),
            ContentLink(
              label: 'Gửi yêu cầu hỗ trợ',
              route: '/chat?tab=support',
            ),
          ],
        ),
      ],
    );
  }
}
