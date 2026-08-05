import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../data/models/chat_model.dart';

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
    super.key,
    required this.message,
    this.counterpartyName,
    this.counterpartyAvatarUrl,
  });

  final ChatMessage message;

  /// A thread has exactly two sides, so the avatar beside an incoming bubble is
  /// always the counterparty's — there is nothing to look up per message.
  final String? counterpartyName;
  final String? counterpartyAvatarUrl;

  String _formatTime(DateTime time) =>
      DateFormat('HH:mm').format(time.toLocal());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMine = message.isMine;

    // A redacted row stays in the thread so it has no unexplained gap, but its
    // body is gone: rendering an emptied bubble would read as an edit.
    if (message.isRedacted) {
      return _Notice(text: 'Tin nhắn đã bị xóa', theme: theme);
    }

    // The desk answers as the platform, and `from_support` is what says so — the
    // absent sender it used to be read from is also how a system row looks.
    if (message.isFromSupport) {
      return _Notice(
        text: message.body,
        theme: theme,
        label: 'Hỗ trợ ShopNexus',
      );
    }

    if (message.isSystem) {
      return _Notice(
        text: message.body.isEmpty ? 'Cập nhật từ hệ thống' : message.body,
        theme: theme,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: isMine
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isMine) ...[
            _CounterpartyAvatar(
              name: counterpartyName,
              avatarUrl: counterpartyAvatarUrl,
            ),
            const SizedBox(width: 8),
          ],
          Flexible(
            child: Column(
              crossAxisAlignment: isMine
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: isMine
                        ? theme.colorScheme.primaryContainer
                        : theme.colorScheme.surface,
                    borderRadius: BorderRadius.only(
                      topLeft: const Radius.circular(16),
                      topRight: const Radius.circular(16),
                      bottomLeft: Radius.circular(isMine ? 16 : 4),
                      bottomRight: Radius.circular(isMine ? 4 : 16),
                    ),
                    border: isMine
                        ? null
                        : Border.all(
                            color: theme.colorScheme.outlineVariant.withValues(
                              alpha: 0.3,
                            ),
                          ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.03),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (final attachment in message.attachments)
                        // `url` is absent until a module can presign one, which
                        // is "not available yet" rather than an empty object.
                        if (attachment.url != null &&
                            attachment.url!.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: attachment.url!,
                                height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                      if (message.body.isNotEmpty)
                        Text(
                          message.body,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isMine
                                ? theme.colorScheme.onPrimaryContainer
                                : theme.colorScheme.onSurface,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _formatTime(message.createdAt),
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 10,
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      if (message.isEdited) ...[
                        const SizedBox(width: 4),
                        Text(
                          'đã sửa',
                          style: theme.textTheme.labelSmall?.copyWith(
                            fontSize: 10,
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                      // A message carries no delivery status of its own: seen is
                      // the thread's read mark reaching this row.
                      if (isMine) ...[
                        const SizedBox(width: 4),
                        if (message.isPending)
                          SizedBox(
                            height: 10,
                            width: 10,
                            child: CircularProgressIndicator(
                              strokeWidth: 1.5,
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          )
                        else
                          Icon(
                            message.isSeen ? Icons.done_all : Icons.done,
                            size: 14,
                            color: message.isSeen
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurfaceVariant,
                          ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (isMine) const SizedBox(width: 24),
        ],
      ),
    );
  }
}

class _CounterpartyAvatar extends StatelessWidget {
  const _CounterpartyAvatar({this.name, this.avatarUrl});

  final String? name;
  final String? avatarUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hasAvatar = avatarUrl != null && avatarUrl!.isNotEmpty;

    return CircleAvatar(
      radius: 14,
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      backgroundImage: hasAvatar
          ? CachedNetworkImageProvider(avatarUrl!)
          : null,
      child: hasAvatar
          ? null
          : Text(
              (name != null && name!.isNotEmpty) ? name![0].toUpperCase() : '?',
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
    );
  }
}

/// A centred, unattributed line: a system update, or a row whose body is gone.
class _Notice extends StatelessWidget {
  const _Notice({required this.text, required this.theme, this.label});

  final String text;
  final ThemeData theme;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 32),
      child: Column(
        children: [
          if (label != null)
            Text(
              label!,
              style: theme.textTheme.labelSmall?.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
