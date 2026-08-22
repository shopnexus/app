import 'package:flutter/material.dart';
import 'package:shopnexus_flutter_app/features/legal/presentation/widgets/content_page.dart';

/// Điều khoản sử dụng.
///
/// Mọi con số ở đây đọc ra từ hệ thống đang chạy, không phải bịa: 48 giờ xác nhận
/// đơn, 72 giờ giải ngân, 12 giờ hiệu lực một đề nghị giá, 30 phút giữ giá, 14
/// ngày mở đánh giá — đều là các mốc mà route thực sự áp. Một trang điều khoản mô
/// tả một sàn khác với cái sàn người ta đang dùng thì tệ hơn là không có.
///
/// Cùng nội dung với `/terms` bên web: hai client không được nói hai điều lệ khác
/// nhau về cùng một hệ thống.
class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ContentPage(
      title: 'Điều khoản sử dụng',
      intro:
          'ShopNexus là sàn giao dịch giữa người dùng với người dùng. Trang này '
          'mô tả quyền và nghĩa vụ của các bên, và cách nền tảng giữ tiền cho tới '
          'khi hàng tới nơi.',
      updated: '2026-08-07',
      draft: true,
      sections: [
        ContentSection(
          title: '1. Tài khoản',
          blocks: [
            ContentParagraph(
              'Bạn cần một tài khoản để mua hoặc bán. Mỗi tài khoản phải luôn còn '
              'ít nhất một cách đăng nhập — mật khẩu hoặc một nhà cung cấp đã liên '
              'kết — nên yêu cầu gỡ bỏ cách cuối cùng sẽ bị từ chối.',
            ),
            ContentParagraph(
              'Để rút tiền bán hàng, bạn cần xác minh danh tính. Việc xác minh do '
              'một bên thứ ba thực hiện; ShopNexus không lưu số giấy tờ, chỉ lưu '
              'kết quả và thời hạn của giấy tờ.',
            ),
          ],
        ),
        ContentSection(
          title: '2. Mua hàng và tiền tạm giữ',
          blocks: [
            ContentParagraph(
              'Khi bạn thanh toán, ShopNexus giữ số tiền đó — bao gồm cả phí vận '
              'chuyển — chứ không chuyển ngay cho người bán. Đây là điểm cốt lõi '
              'của sàn: người bán chỉ nhận được tiền sau khi hàng đã tới tay bạn.',
            ),
            ContentBullets([
              'Người bán có 48 giờ để xác nhận đơn. Nếu họ từ chối, bạn được hoàn '
                  'lại toàn bộ, kể cả phí vận chuyển, vì kiện hàng chưa rời kho.',
              'Nếu họ không trả lời trong 48 giờ, ShopNexus mở một yêu cầu hỗ trợ '
                  'để nhân viên liên hệ. Sàn không tự huỷ đơn và cũng không gửi hàng '
                  'thay người bán.',
              'Bạn huỷ đơn được chừng nào kiện hàng chưa được đơn vị vận chuyển lấy '
                  'đi. Sau thời điểm đó, đường duy nhất là yêu cầu hoàn tiền.',
              'Sau khi bạn xác nhận đã nhận hàng, tiền chuyển cho người bán sau 72 '
                  'giờ — trừ khi trong khoảng đó có một yêu cầu hoàn tiền đang mở.',
            ]),
            ContentParagraph(
              'Xác nhận nhận hàng cần ít nhất một ảnh mở hộp. Đó là bằng chứng mà '
              'một yêu cầu hoàn tiền về sau được xét trên, và nó không bổ sung được '
              'sau thời điểm xác nhận.',
            ),
          ],
        ),
        ContentSection(
          title: '3. Hoàn tiền',
          blocks: [
            ContentParagraph(
              'Chỉ người mua mở được yêu cầu hoàn tiền. Người bán không có quyền từ '
              'chối — họ chỉ có hai lựa chọn: chấp nhận, hoặc chuyển vụ việc cho '
              'ShopNexus xem xét. Im lặng quá 48 giờ cũng đồng nghĩa chuyển cho '
              'ShopNexus.',
            ),
            ContentBullets([
              'Chấp nhận thì hàng được gửi trả trước; tiền chưa chuyển ngay.',
              'Khi người bán xác nhận đã nhận lại hàng, họ có 48 giờ để kiểm tra và '
                  'khiếu nại. Hết thời hạn mà không khiếu nại, tiền tự động về người '
                  'mua.',
              'Nếu người mua báo đã trả hàng nhưng người bán chưa xác nhận, vụ việc '
                  'chuyển thẳng cho ShopNexus thay vì mở cửa sổ kiểm hàng.',
            ]),
          ],
        ),
        ContentSection(
          title: '4. Thương lượng giá',
          blocks: [
            ContentParagraph(
              'Với tin đăng cho phép thương lượng, người mua gửi đề nghị giá và hai '
              'bên trả giá qua lại trong cuộc trò chuyện. Mỗi đề nghị có hiệu lực '
              '12 giờ. Khi một bên đồng ý, mức giá được giữ trong 30 phút để người '
              'mua thanh toán — hết thời gian đó thì phải thương lượng lại.',
            ),
            ContentParagraph(
              'Đồng ý giá không phải là đã bán. Đơn hàng chỉ hình thành khi người '
              'mua thanh toán.',
            ),
          ],
        ),
        ContentSection(
          title: '5. Đánh giá',
          blocks: [
            ContentParagraph(
              'Đánh giá giữa hai bên của một đơn là ẩn: không ai thấy đánh giá của '
              'bên kia cho tới khi cả hai cùng gửi, hoặc sau 14 ngày. Điều này để '
              'một đánh giá không thể là hành động trả đũa. Mỗi bên gửi được đúng '
              'một lần và không sửa lại được.',
            ),
          ],
        ),
        ContentSection(
          title: '6. Nội dung bị cấm và xử lý vi phạm',
          blocks: [
            ContentParagraph(
              'Không đăng hàng cấm theo pháp luật Việt Nam, hàng giả, hàng nhái, '
              'hoặc nội dung xâm phạm quyền của người khác. Tin đăng có thể bị gỡ và '
              'tài khoản có thể bị tạm ngưng — có thời hạn hoặc vĩnh viễn — sau khi '
              'được kiểm duyệt viên xem xét.',
            ),
            ContentParagraph(
              'Mọi khiếu nại đều đi qua Trung tâm hỗ trợ. Đừng chuyển khoản trực '
              'tiếp cho người bán: tiền đi ngoài sàn là tiền sàn không giữ được, và '
              'cũng không hoàn lại được.',
            ),
            ContentLink(
              label: 'Mở Trung tâm hỗ trợ',
              route: '/account/help-center',
            ),
          ],
        ),
        ContentSection(
          title: '7. Liên hệ',
          blocks: [
            ContentParagraph(
              'Mọi câu hỏi về các điều khoản này, hãy gửi qua Trung tâm hỗ trợ.',
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
