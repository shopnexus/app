import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// Trang của cổng thanh toán, mở **trong** app.
///
/// SePay và Stripe đều là rail chuyển hướng: chúng trả về một URL và người trả
/// tiền phải tới đó thì mới có gì xảy ra. Trước đây app in cái URL ra dưới dạng
/// chữ để người dùng tự chép sang trình duyệt — nghĩa là rời khỏi app giữa lúc
/// trả tiền, và quay lại bằng cách nào là chuyện của họ.
///
/// Trang này **không** quyết định kết quả. Nơi người trả tiền đáp xuống là một
/// tuyên bố ai cũng giả được; chỉ callback của cổng mới settle một chặng. Nên khi
/// WebView chạm tới `returnUrl`, màn này chỉ đóng lại, và cái đang poll phiên
/// thanh toán mới là thứ nói đơn đã trả xong hay chưa.
class PaymentWebViewScreen extends StatefulWidget {
  const PaymentWebViewScreen({
    super.key,
    required this.checkoutUrl,
    required this.returnUrl,
  });

  final String checkoutUrl;

  /// Địa chỉ cổng thanh toán sẽ đẩy người dùng về. Chạm tới nó là dấu hiệu "đã
  /// xong phần trên trang của họ", không phải "đã trả tiền".
  final String returnUrl;

  static Future<void> show(
    BuildContext context, {
    required String checkoutUrl,
    required String returnUrl,
  }) {
    return Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (_) => PaymentWebViewScreen(
          checkoutUrl: checkoutUrl,
          returnUrl: returnUrl,
        ),
      ),
    );
  }

  @override
  State<PaymentWebViewScreen> createState() => _PaymentWebViewScreenState();
}

class _PaymentWebViewScreenState extends State<PaymentWebViewScreen> {
  late final WebViewController _controller;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    final returnPrefix = _origin(widget.returnUrl);

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            if (mounted) setState(() => _loading = true);
          },
          onPageFinished: (_) {
            if (mounted) setState(() => _loading = false);
          },
          onNavigationRequest: (request) {
            // So theo origin + path, không so cả chuỗi: cổng thanh toán gắn thêm
            // tham số của nó vào đường về (Stripe gắn id phiên, SePay gắn id
            // chặng), nên một phép so bằng sẽ không bao giờ khớp.
            if (returnPrefix != null && request.url.startsWith(returnPrefix)) {
              Navigator.of(context).maybePop();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.checkoutUrl));
  }

  /// `scheme://host/path` của đường về, bỏ query đi.
  static String? _origin(String raw) {
    final uri = Uri.tryParse(raw);
    if (uri == null || uri.host.isEmpty) return null;
    return '${uri.scheme}://${uri.host}${uri.path}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Thanh toán'),
        leading: IconButton(
          icon: const Icon(Icons.close_rounded),
          // Đóng không huỷ gì cả: phiên thanh toán vẫn sống ở server và màn thanh
          // toán vẫn đang hỏi nó. Nói vậy để đóng nhầm không thành mất tiền.
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        bottom: _loading
            ? const PreferredSize(
                preferredSize: Size.fromHeight(2),
                child: LinearProgressIndicator(minHeight: 2),
              )
            : null,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: theme.colorScheme.surfaceContainerHighest,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              // Người dùng cần biết mình đang ở trang của ai khi sắp nhập thẻ.
              Uri.tryParse(widget.checkoutUrl)?.host ?? '',
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(child: WebViewWidget(controller: _controller)),
        ],
      ),
    );
  }
}
