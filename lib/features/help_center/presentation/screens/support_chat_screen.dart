import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/theme/app_colors.dart';

class SupportChatMessage {
  final String id;
  final String text;
  final bool isUser;
  final String timestamp;
  final String? imagePath;

  const SupportChatMessage({
    required this.id,
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.imagePath,
  });
}

class SupportChatScreen extends StatefulWidget {
  final String ticketId;

  const SupportChatScreen({super.key, required this.ticketId});

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ImagePicker _picker = ImagePicker();

  late final List<SupportChatMessage> _messages;

  @override
  void initState() {
    super.initState();
    _messages = [
      SupportChatMessage(
        id: '1',
        text:
            'Xin chào! Tôi là Alex Rivers - Chuyên viên hỗ trợ ShopNexus. Tôi thấy bạn đang cần hỗ trợ cho Ticket #${widget.ticketId}. Vui lòng cung cấp chi tiết câu hỏi hoặc bằng chứng hình ảnh để tôi xử lý ngay giúp bạn nhé!',
        isUser: false,
        timestamp: '10:42 AM',
      ),
    ];
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _sendMessage({String? imagePath}) {
    final text = _messageController.text.trim();
    if (text.isEmpty && imagePath == null) return;

    final now = TimeOfDay.now();
    final formattedTime =
        '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}';

    setState(() {
      _messages.add(
        SupportChatMessage(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          text: text,
          isUser: true,
          timestamp: formattedTime,
          imagePath: imagePath,
        ),
      );
      _messageController.clear();
    });

    _scrollToBottom();

    // Auto reply mock from moderator after 1.5 seconds
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          _messages.add(
            SupportChatMessage(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              text:
                  'Cảm ơn bạn đã phản hồi. Hệ thống đã tiếp nhận thông tin và sẽ phản hồi kết quả xử lý trong thời gian sớm nhất!',
              isUser: false,
              timestamp:
                  '${TimeOfDay.now().hour.toString().padLeft(2, '0')}:${TimeOfDay.now().minute.toString().padLeft(2, '0')}',
            ),
          );
        });
        _scrollToBottom();
      }
    });
  }

  Future<void> _pickImage() async {
    try {
      final XFile? image = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
      );
      if (image != null) {
        _sendMessage(imagePath: image.path);
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
    }
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {},
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: theme.colorScheme.surface,
          elevation: 0.5,
          scrolledUnderElevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_rounded,
              color: theme.colorScheme.onSurface,
            ),
            onPressed: () => context.pop(),
          ),
          title: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: isDarkMode
                        ? theme.colorScheme.primary.withAlpha(40)
                        : const Color(0xFF0F172A),
                    child: Icon(
                      Icons.support_agent_rounded,
                      color: isDarkMode
                          ? theme.colorScheme.primary
                          : Colors.white,
                      size: 20,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: const Color(0xFF22C55E),
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDarkMode
                              ? AppColors.darkSurface
                              : Colors.white,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Support Moderator',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                    Text(
                      'Alex Rivers • Đang hoạt động',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // NOTE: Clean header with NO 3-dots popup menu as requested
          actions: const [],
        ),
        body: Column(
          children: [
            // Ticket Header Banner
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? AppColors.darkSurface
                    : const Color(0xFFF1F5F9),
                border: Border(
                  bottom: BorderSide(
                    color: isDarkMode
                        ? AppColors.darkPrimary.withAlpha(30)
                        : const Color(0xFFE2E8F0),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.confirmation_number_outlined,
                    size: 18,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Hỗ trợ cho Ticket #${widget.ticketId}',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: isDarkMode
                          ? theme.colorScheme.primary.withAlpha(40)
                          : const Color(0xFF0F172A).withAlpha(15),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'Đang trao đổi',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Messages Stream / List
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(16),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final msg = _messages[index];
                  return _buildMessageBubble(msg, isDarkMode);
                },
              ),
            ),

            // Input Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: isDarkMode ? AppColors.darkSurface : Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(
                      alpha: isDarkMode ? 0.2 : 0.04,
                    ),
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.attach_file_rounded,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                      onPressed: _pickImage,
                    ),
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: theme.colorScheme.onSurface,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Nhập tin nhắn trao đổi...',
                          hintStyle: TextStyle(
                            color: theme.colorScheme.onSurfaceVariant,
                            fontSize: 14,
                          ),
                          filled: true,
                          fillColor: isDarkMode
                              ? theme.colorScheme.surfaceContainerHighest
                              : const Color(0xFFF8FAFC),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 10,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(24),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onSubmitted: (_) => _sendMessage(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    GestureDetector(
                      onTap: () => _sendMessage(),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: theme.colorScheme.primary,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.send_rounded,
                          color: theme.colorScheme.onPrimary,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageBubble(SupportChatMessage msg, bool isDarkMode) {
    final theme = Theme.of(context);
    final isUser = msg.isUser;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: isUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: isUser
                ? MainAxisAlignment.end
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isUser) ...[
                CircleAvatar(
                  radius: 12,
                  backgroundColor: isDarkMode
                      ? theme.colorScheme.primary.withAlpha(40)
                      : const Color(0xFF0F172A),
                  child: Icon(
                    Icons.support_agent_rounded,
                    color: isDarkMode
                        ? theme.colorScheme.primary
                        : Colors.white,
                    size: 14,
                  ),
                ),
                const SizedBox(width: 6),
              ],
              Flexible(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isUser
                        ? theme.colorScheme.primary
                        : (isDarkMode
                              ? AppColors.darkSurface
                              : const Color(0xFFF1F5F9)),
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: isUser
                          ? const Radius.circular(16)
                          : const Radius.circular(4),
                      bottomRight: isUser
                          ? const Radius.circular(4)
                          : const Radius.circular(16),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (msg.imagePath != null) ...[
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.file(
                            File(msg.imagePath!),
                            width: 180,
                            height: 180,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 6),
                      ],
                      if (msg.text.isNotEmpty)
                        Text(
                          msg.text,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            height: 1.4,
                            color: isUser
                                ? theme.colorScheme.onPrimary
                                : theme.colorScheme.onSurface,
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 4,
              left: isUser ? 0 : 30,
              right: isUser ? 4 : 0,
            ),
            child: Text(
              msg.timestamp,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 11,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
