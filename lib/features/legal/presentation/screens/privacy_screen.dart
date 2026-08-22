import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/features/legal/presentation/widgets/content_page.dart';

/// Chính sách bảo mật.
///
/// Viết theo đúng những gì hệ thống lưu và gửi đi, kể cả cái mà phần lớn chính
/// sách khác nói sai bằng cách bỏ qua: số thẻ không bao giờ đi qua máy chủ này,
/// còn ảnh giấy tờ thì *có* được giữ. Nói ra chỗ thứ hai mới là điểm của trang
/// này — nó phải chạy theo cái code làm, không thì tệ hơn là không có.
///
/// Cùng nội dung với `/privacy` bên web.
class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContentPage(
      title: 'Chính sách bảo mật',
      intro: 'Những gì ShopNexus lưu, vì sao, và ai khác nhìn thấy.',
      updated: '2026-08-07',
      draft: true,
      sections: [
        ContentSection(
          title: '1. Dữ liệu chúng tôi lưu',
          blocks: [
            ContentBullets([
              'Tài khoản: email, số điện thoại, tên đăng nhập, tên hiển thị, ảnh '
                  'đại diện, và các thông tin bạn tự điền như ngày sinh, giới tính, '
                  'mô tả.',
              'Địa chỉ: địa chỉ nhận và lấy hàng. Khi một đơn được tạo, địa chỉ '
                  'được sao chép vào đơn đó — sửa thông tin liên lạc về sau không làm '
                  'thay đổi nơi một kiện hàng cũ đã được gửi tới.',
              'Giao dịch: đơn hàng, thương lượng, hoàn tiền, sổ cái ví, và ảnh bằng '
                  'chứng bạn tải lên.',
              'Tin nhắn: nội dung trò chuyện giữa bạn và người bạn giao dịch.',
              'Ảnh giấy tờ khi xác minh danh tính: ảnh mặt trước, mặt sau và ảnh '
                  'chân dung bạn gửi lên. Chúng được giữ lại vì kết quả của đối tác '
                  'eKYC không phải là quyết định cuối cùng — nhân viên ShopNexus có '
                  'thể xem xét lại, và một quyết định về việc bạn có được rút tiền '
                  'hay không thì phải dựa trên bằng chứng.',
              'Nhật ký kỹ thuật: thời gian, đường dẫn và mã trạng thái của các yêu '
                  'cầu tới máy chủ, để vận hành và tìm lỗi.',
            ]),
          ],
        ),
        ContentSection(
          title: '2. Những gì chúng tôi KHÔNG lưu',
          blocks: [
            ContentBullets([
              'Thông tin thẻ. Thanh toán do cổng thanh toán xử lý trên trang của '
                  'họ. Số thẻ không bao giờ đi qua máy chủ ShopNexus.',
              'Số giấy tờ tuỳ thân. Việc xác minh do đối tác eKYC thực hiện; chúng '
                  'tôi nhận lại kết quả (đạt/không đạt) và ngày hết hạn, không nhận số '
                  'trên giấy tờ. Nghĩa là dữ liệu này không đủ để mạo danh bạn ở nơi '
                  'khác.',
            ]),
          ],
        ),
        ContentSection(
          title: '3. Bên thứ ba',
          blocks: [
            ContentBullets([
              'Cổng thanh toán — để nhận tiền và hoàn tiền.',
              'Đơn vị vận chuyển — nhận tên, số điện thoại và địa chỉ của bên nhận, '
                  'vì đó là thứ cần để giao hàng.',
              'Đối tác eKYC — nhận ảnh giấy tờ bạn gửi khi xác minh danh tính.',
              'Nhà cung cấp email và SMS — để gửi mã xác minh và thông báo.',
              'Công cụ đo lường lượt truy cập, do chúng tôi tự vận hành trên hạ '
                  'tầng riêng.',
            ]),
          ],
        ),
        ContentSection(
          title: '4. Ai nhìn thấy gì',
          blocks: [
            ContentParagraph(
              'Người bạn giao dịch nhìn thấy tên hiển thị, ảnh đại diện, đánh giá '
              'công khai, và — khi đã có đơn — địa chỉ nhận hàng. Họ không thấy email '
              'hay số điện thoại của bạn trừ khi bạn tự cung cấp.',
            ),
            ContentParagraph(
              'Nhân viên hỗ trợ đọc được nội dung của yêu cầu hỗ trợ mà bạn mở, để '
              'xử lý vụ việc. Với bạn, họ hiện diện dưới danh nghĩa bộ phận hỗ trợ '
              'chứ không phải tài khoản cá nhân.',
            ),
            ContentParagraph(
              'Ảnh giấy tờ tuỳ thân chỉ nhân viên kiểm duyệt xem được, và chỉ trong '
              'màn xét duyệt hồ sơ xác minh. Người bạn giao dịch không bao giờ nhìn '
              'thấy chúng, và chúng cũng không xuất hiện trong phần lịch sử xác minh '
              'của chính bạn.',
            ),
          ],
        ),
        ContentSection(
          title: '5. Phiên đăng nhập',
          blocks: [
            ContentParagraph(
              'Mỗi phiên đăng nhập tồn tại tối đa 30 ngày và được kiểm tra ở mọi '
              'yêu cầu. Nghĩa là đăng xuất, đổi mật khẩu hoặc bị khoá tài khoản có '
              'hiệu lực ngay, kể cả với thiết bị đang mở sẵn.',
            ),
            ContentLink(
              label: 'Xem thiết bị đang đăng nhập',
              route: '/account/security',
            ),
          ],
        ),
        ContentSection(
          title: '6. Quyền của bạn',
          blocks: [
            ContentParagraph(
              'Bạn xem và sửa hồ sơ, địa chỉ, phương thức đăng nhập trong phần quản '
              'lý tài khoản. Với yêu cầu xoá dữ liệu, hãy mở một yêu cầu qua Trung '
              'tâm hỗ trợ.',
            ),
            ContentParagraph(
              'Một số dữ liệu phải được giữ lại sau khi bạn rời đi: hồ sơ giao dịch '
              'và sổ cái tiền, vì đó là bằng chứng của những khoản tiền đã chuyển '
              'giữa các bên.',
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
