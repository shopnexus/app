import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

/// Một video trong ô nhỏ: khung hình đầu của chính nó, kèm badge play.
///
/// Khung hình đầu do `video_player` dựng ra từ link đã ký chứ không do một
/// package thumbnail nào — `video_thumbnail` là code native, không chạy trên
/// web, và web là nơi ô trống trước đây đã xuất hiện. Dựng bằng player thì một
/// đường chạy đúng ở cả ba nơi.
///
/// Không autoplay: mười ô cùng chạy là mười luồng giải mã cho một màn hình
/// người dùng chưa nhìn tới. Chạm vào mới mở [VideoPlayerDialog], nơi có điều
/// khiển thật.
class VideoPreview extends StatefulWidget {
  const VideoPreview({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
  });

  /// Link đã ký. Rỗng nghĩa là bytes chưa lên tới nơi — chưa có gì để dựng
  /// khung hình, nên ô hiện trạng thái đang tải.
  final String url;

  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  State<VideoPreview> createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> {
  VideoPlayerController? _controller;
  bool _ready = false;

  @override
  void initState() {
    super.initState();
    _open();
  }

  @override
  void didUpdateWidget(VideoPreview oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Link đã ký hết hạn rồi được cấp lại là chuyện thường; ô phải bám theo
    // link mới chứ không giữ mãi controller của link cũ.
    if (oldWidget.url != widget.url) {
      _controller?.dispose();
      _controller = null;
      _ready = false;
      _open();
    }
  }

  Future<void> _open() async {
    if (widget.url.isEmpty) return;
    final controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.url),
    );
    _controller = controller;
    try {
      await controller.initialize();
    } catch (_) {
      // Link hỏng, hết hạn, codec máy không mở được: ô rơi về badge play. Một
      // ô đọc được vẫn hơn một khung đỏ, và video vẫn gửi đi được.
      return;
    }
    if (!mounted) {
      controller.dispose();
      return;
    }
    setState(() => _ready = true);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(
            color: Colors.black,
            child: _ready && controller != null
                ? FittedBox(
                    fit: widget.fit,
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      width: controller.value.size.width,
                      height: controller.value.size.height,
                      child: VideoPlayer(controller),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          const Center(child: _PlayBadge()),
        ],
      ),
    );
  }
}

class _PlayBadge extends StatelessWidget {
  const _PlayBadge();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Colors.black.withValues(alpha: 0.55),
      shape: BoxShape.circle,
    ),
    child: const Icon(
      Icons.play_arrow_rounded,
      color: Colors.white,
      size: 22,
    ),
  );
}

/// Video mở hết cỡ, có điều khiển.
///
/// Cùng khuôn với hộp xem ảnh trong thread: nền tối, một nút đóng ở góc, chạm
/// ra ngoài thì thoát.
class VideoPlayerDialog extends StatefulWidget {
  const VideoPlayerDialog({super.key, required this.url});

  final String url;

  static Future<void> show(BuildContext context, String url) {
    if (url.isEmpty) return Future.value();
    return showDialog<void>(
      context: context,
      barrierColor: Colors.black87,
      builder: (_) => VideoPlayerDialog(url: url),
    );
  }

  @override
  State<VideoPlayerDialog> createState() => _VideoPlayerDialogState();
}

class _VideoPlayerDialogState extends State<VideoPlayerDialog> {
  late final VideoPlayerController _controller = VideoPlayerController.networkUrl(
    Uri.parse(widget.url),
  );
  bool _ready = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _open();
  }

  Future<void> _open() async {
    try {
      await _controller.initialize();
      if (!mounted) return;
      setState(() => _ready = true);
      await _controller.play();
    } catch (_) {
      if (!mounted) return;
      setState(() => _error = 'Không mở được video này');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final error = _error;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: const EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (error != null)
            Text(
              error,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            )
          else if (!_ready)
            const CircularProgressIndicator(color: Colors.white)
          else
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  VideoPlayer(_controller),
                  VideoProgressIndicator(_controller, allowScrubbing: true),
                  Center(
                    child: _PlayPauseButton(controller: _controller),
                  ),
                ],
              ),
            ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayPauseButton extends StatelessWidget {
  const _PlayPauseButton({required this.controller});

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) => ValueListenableBuilder(
    valueListenable: controller,
    builder: (context, value, _) => IconButton(
      iconSize: 56,
      icon: Icon(
        value.isPlaying
            ? Icons.pause_circle_filled
            : Icons.play_circle_fill,
        color: Colors.white70,
      ),
      onPressed: () =>
          value.isPlaying ? controller.pause() : controller.play(),
    ),
  );
}
