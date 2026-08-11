import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shopnexus_flutter_app/api/generated/model/resource.dart';
import 'package:shopnexus_flutter_app/core/upload/upload_media.dart';
import 'package:shopnexus_flutter_app/features/chat/data/models/chat_model.dart';
import 'package:shopnexus_flutter_app/shared/widgets/video_preview.dart';

class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
    super.key,
    required this.message,
    this.counterpartyName,
    this.counterpartyAvatarUrl,
  });

  final ChatMessage message;
  final String? counterpartyName;
  final String? counterpartyAvatarUrl;

  String _formatTime(DateTime time) =>
      DateFormat('HH:mm').format(time.toLocal());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isMine = message.isMine;

    if (message.isRedacted) {
      return _Notice(text: 'Tin nhắn đã bị xóa', theme: theme);
    }

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

    final validAttachments = message.attachments
        .where((a) => a.url.isNotEmpty)
        .toList();
    final hasAttachments = validAttachments.isNotEmpty;
    final hasBody = message.body.trim().isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
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
                _buildBubbleContent(
                  context: context,
                  theme: theme,
                  isMine: isMine,
                  hasAttachments: hasAttachments,
                  hasBody: hasBody,
                  validAttachments: validAttachments,
                ),
                const SizedBox(height: 3),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        _formatTime(message.createdAt),
                        style: theme.textTheme.labelSmall?.copyWith(
                          fontSize: 11,
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
          if (isMine) const SizedBox(width: 16),
        ],
      ),
    );
  }

  Widget _buildBubbleContent({
    required BuildContext context,
    required ThemeData theme,
    required bool isMine,
    required bool hasAttachments,
    required bool hasBody,
    required List<dynamic> validAttachments,
  }) {
    final borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(18),
      topRight: const Radius.circular(18),
      bottomLeft: Radius.circular(isMine ? 18 : 4),
      bottomRight: Radius.circular(isMine ? 4 : 18),
    );

    // Trường hợp 1: Chỉ có hình ảnh (không có văn bản) -> Render ảnh tràn khung vừa vặn, không viền bọc thừa
    if (hasAttachments && !hasBody) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: borderRadius,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            for (int i = 0; i < validAttachments.length; i++)
              _Attachment(
                attachment: validAttachments[i],
                borderRadius: borderRadius,
                isSingle: validAttachments.length == 1,
              ),
          ],
        ),
      );
    }

    // Trường hợp 2: Có tin nhắn văn bản (hoặc vừa có văn bản vừa có hình ảnh)
    final bubbleBgColor = isMine
        ? theme.colorScheme.primary
        : theme.colorScheme.surfaceContainerHigh;

    final textColor = isMine
        ? theme.colorScheme.onPrimary
        : theme.colorScheme.onSurface;

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: bubbleBgColor,
        borderRadius: borderRadius,
        border: isMine
            ? null
            : Border.all(
                color: theme.colorScheme.outlineVariant.withValues(alpha: 0.25),
              ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasAttachments)
            for (final attachment in validAttachments)
              _Attachment(
                attachment: attachment,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(18),
                ),
                isSingle: false,
              ),
          if (hasBody)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              child: Text(
                message.body,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontFamily: 'Inter',
                  fontSize: 14.5,
                  height: 1.35,
                  color: textColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Một tệp đính kèm trong thread — ảnh hay video, quyết định bởi `mime` của
/// chính resource chứ không bởi chỗ nó xuất hiện.
///
/// Trước đây mọi attachment đều đi qua `CachedNetworkImage`, nên một video về
/// đúng cái icon ảnh vỡ.
class _Attachment extends StatelessWidget {
  const _Attachment({
    required this.attachment,
    required this.borderRadius,
    required this.isSingle,
  });

  final Resource attachment;
  final BorderRadius borderRadius;
  final bool isSingle;

  String get url => attachment.url;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageWidth = (screenWidth * 0.72).clamp(200.0, 280.0);

    if (UploadMedia.isVideo(attachment.mime)) {
      return GestureDetector(
        onTap: () => VideoPlayerDialog.show(context, url),
        child: ClipRRect(
          borderRadius: borderRadius,
          child: VideoPreview(url: url, width: imageWidth, height: 200),
        ),
      );
    }

    return GestureDetector(
      onTap: () => _showImagePreviewDialog(context, url),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          color: Theme.of(context).colorScheme.surfaceContainerHighest,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 280, minHeight: 120),
            child: CachedNetworkImage(
              imageUrl: url,
              width: imageWidth,
              fit: BoxFit.cover,
              placeholder: (context, url) => SizedBox(
                width: imageWidth,
                height: 180,
                child: const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => SizedBox(
                width: imageWidth,
                height: 140,
                child: const Center(
                  child: Icon(Icons.broken_image_outlined, size: 32),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showImagePreviewDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.9),
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: EdgeInsets.zero,
        child: Stack(
          alignment: Alignment.center,
          children: [
            InteractiveViewer(
              minScale: 0.5,
              maxScale: 4.0,
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.contain,
              ),
            ),
            Positioned(
              top: MediaQuery.of(ctx).padding.top + 16,
              right: 16,
              child: IconButton(
                onPressed: () => Navigator.of(ctx).pop(),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black.withValues(alpha: 0.6),
                  foregroundColor: Colors.white,
                ),
                icon: const Icon(Icons.close_rounded, size: 24),
              ),
            ),
          ],
        ),
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
      radius: 16,
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      backgroundImage: hasAvatar
          ? CachedNetworkImageProvider(avatarUrl!)
          : null,
      child: hasAvatar
          ? null
          : Text(
              (name != null && name!.isNotEmpty) ? name![0].toUpperCase() : '?',
              style: theme.textTheme.labelMedium?.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
    );
  }
}

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
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primary,
              ),
            ),
          Container(
            margin: const EdgeInsets.only(top: 4),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHighest.withValues(
                alpha: 0.6,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodySmall?.copyWith(
                fontFamily: 'Inter',
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
