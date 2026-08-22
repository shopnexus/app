import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopnexus_flutter_app/features/chat/data/models/chat_model.dart';

class ChatItemWidget extends StatelessWidget {
  final Conversation conversation;
  final VoidCallback onTap;

  /// Tên hàng, khi tên đối phương không phải câu trả lời: thread hỗ trợ được đặt
  /// tên bằng chủ đề của yêu cầu, vì bên kia là cả sàn.
  final String? title;

  /// Thread hỗ trợ: một cái huy hiệu thay cho ảnh đại diện, vì cả sàn không có
  /// một cái mặt.
  final bool isSupport;

  /// Chữ ngắn đứng cạnh dòng tin cuối — trạng thái của yêu cầu, ở chỗ mà một
  /// thread mua bán nói giá.
  final String? badge;

  const ChatItemWidget({
    super.key,
    required this.conversation,
    required this.onTap,
    this.title,
    this.isSupport = false,
    this.badge,
  });

  String _formatTime(DateTime? time) {
    if (time == null) return '';
    final now = DateTime.now();
    final difference = now.difference(time);

    if (difference.inDays == 0 && time.day == now.day) {
      return DateFormat('h:mm a').format(time);
    } else if (difference.inDays < 2 && now.day - time.day == 1) {
      return 'Yesterday';
    } else if (difference.inDays < 7) {
      return DateFormat('E').format(time);
    } else {
      return DateFormat('MMM d').format(time);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasUnread = conversation.unreadCount > 0;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          children: [
            // Avatar với chỉ báo online status
            Stack(
              children: [
                if (isSupport)
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: theme.colorScheme.primaryContainer,
                    child: Icon(
                      Icons.support_agent_rounded,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  )
                else
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: theme.colorScheme.surfaceContainerHighest,
                    backgroundImage:
                        conversation.participantAvatar != null &&
                            conversation.participantAvatar!.isNotEmpty
                        ? CachedNetworkImageProvider(
                            conversation.participantAvatar!,
                          )
                        : null,
                    child:
                        conversation.participantAvatar == null ||
                            conversation.participantAvatar!.isEmpty
                        ? Text(
                            conversation.participantName.isNotEmpty
                                ? conversation.participantName[0].toUpperCase()
                                : '?',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          )
                        : null,
                  ),
              ],
            ),
            const SizedBox(width: 12),
            // Tên, role, nội dung tin nhắn cuối cùng
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          title ?? conversation.participantName,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: hasUnread
                                ? FontWeight.bold
                                : FontWeight.w600,
                            color: theme.colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        _formatTime(conversation.lastMessageTime),
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: hasUnread
                              ? theme.colorScheme.primary
                              : theme.colorScheme.onSurfaceVariant,
                          fontWeight: hasUnread
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          conversation.lastMessageText ??
                              'Bắt đầu cuộc trò chuyện',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: hasUnread
                                ? theme.colorScheme.onSurface
                                : theme.colorScheme.onSurfaceVariant,
                            fontWeight: hasUnread
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (badge != null) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            badge!,
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                      if (hasUnread) ...[
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            '${conversation.unreadCount}',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
