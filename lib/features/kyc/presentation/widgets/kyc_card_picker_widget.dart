import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/theme/app_colors.dart';

class KycCardPickerWidget extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final String? localPath;
  final String? networkUrl;
  final bool isUploading;
  final Function(ImageSource source) onPickImage;

  const KycCardPickerWidget({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    this.localPath,
    this.networkUrl,
    required this.isUploading,
    required this.onPickImage,
  });

  void _showImageSourceDialog(BuildContext context) {
    final theme = Theme.of(context);
    showModalBottomSheet(
      context: context,
      backgroundColor: theme.colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Chọn nguồn ảnh - $title',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Manrope',
                color: theme.colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 16),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt_rounded,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
              ),
              title: Text(
                'Chụp ảnh từ Camera',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  color: theme.colorScheme.onSurface,
                ),
              ),
              subtitle: const Text(
                'Dùng máy ảnh trực tiếp để chụp giấy tờ',
                style: TextStyle(fontSize: 12, fontFamily: 'Inter'),
              ),
              onTap: () {
                Navigator.pop(ctx);
                onPickImage(ImageSource.camera);
              },
            ),
            const SizedBox(height: 8),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.photo_library_rounded,
                  color: theme.colorScheme.onSecondaryContainer,
                ),
              ),
              title: Text(
                'Chọn ảnh từ Bộ sưu tập',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Inter',
                  color: theme.colorScheme.onSurface,
                ),
              ),
              subtitle: const Text(
                'Tải ảnh có sẵn trong thư viện thiết bị',
                style: TextStyle(fontSize: 12, fontFamily: 'Inter'),
              ),
              onTap: () {
                Navigator.pop(ctx);
                onPickImage(ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    Widget previewContent;
    final hasImage =
        (localPath != null && localPath!.isNotEmpty) ||
        (networkUrl != null && networkUrl!.isNotEmpty);

    if (localPath != null && localPath!.isNotEmpty) {
      previewContent = Image.file(
        File(localPath!),
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      );
    } else if (networkUrl != null && networkUrl!.isNotEmpty) {
      previewContent = Image.network(
        networkUrl!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) =>
            Icon(icon, size: 48, color: theme.colorScheme.onSurfaceVariant),
      );
    } else {
      previewContent = SizedBox.expand(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 10,
            left: 24,
            right: 24,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDarkMode
                      ? theme.colorScheme.surfaceContainerHighest
                      : const Color(0xFFF1F5F9),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 26, color: theme.colorScheme.primary),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Manrope',
                  color: theme.colorScheme.onSurface,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  color: theme.colorScheme.onSurfaceVariant,
                  fontFamily: 'Inter',
                  height: 1.3,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: hasImage
              ? const Color(0xFF10B981)
              : (isDarkMode
                    ? AppColors.darkPrimary.withValues(alpha: 0.3)
                    : const Color(0xFFE2E8F0)),
          width: hasImage ? 2 : 1,
        ),
      ),
      color: isDarkMode ? AppColors.darkSurface : Colors.white,
      child: InkWell(
        onTap: isUploading ? null : () => _showImageSourceDialog(context),
        child: Container(
          height: 160,
          width: double.infinity,
          padding: const EdgeInsets.all(8),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: previewContent,
              ),
              if (isUploading)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 2.5,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Đang tải ảnh...',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              if (hasImage && !isUploading)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFF10B981),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.check_rounded,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        hasImage
                            ? Icons.replay_rounded
                            : Icons.add_a_photo_rounded,
                        size: 14,
                        color: theme.colorScheme.onPrimary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        hasImage ? 'Đổi ảnh' : 'Tải ảnh',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: theme.colorScheme.onPrimary,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
