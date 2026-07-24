import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../data/models/dispute_model.dart';

/// Widget hiển thị danh sách ảnh/bằng chứng đính kèm của Buyer hoặc Seller
class EvidenceGalleryWidget extends StatelessWidget {
  final String title;
  final List<RefundAttachment> attachments;

  const EvidenceGalleryWidget({
    super.key,
    required this.title,
    required this.attachments,
  });

  @override
  Widget build(BuildContext context) {
    if (attachments.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              Icons.collections_outlined,
              size: 16,
              color: Color(0xFF64748B),
            ),
            const SizedBox(width: 6),
            Text(
              '$title (${attachments.length} bằng chứng)',
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF475569),
                fontFamily: 'Inter',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: attachments.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final attachment = attachments[index];
              final imageUrl = attachment.resource?.url ?? '';

              return GestureDetector(
                onTap: () => _showImagePreviewModal(
                  context,
                  imageUrl,
                  attachment.description,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: 90,
                    height: 90,
                    color: const Color(0xFFF8FAFC),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        if (imageUrl.isNotEmpty)
                          CachedNetworkImage(
                            imageUrl: imageUrl,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: const Color(0xFFE2E8F0),
                              highlightColor: const Color(0xFFF1F5F9),
                              child: Container(color: Colors.white),
                            ),
                            errorWidget: (context, url, error) => const Center(
                              child: Icon(
                                Icons.broken_image_outlined,
                                color: Color(0xFF94A3B8),
                              ),
                            ),
                          )
                        else
                          const Center(
                            child: Icon(
                              Icons.image_outlined,
                              color: Color(0xFF94A3B8),
                            ),
                          ),
                        if (attachment.description != null &&
                            attachment.description!.isNotEmpty)
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 4,
                                vertical: 2,
                              ),
                              color: Colors.black.withValues(alpha: 0.6),
                              child: Text(
                                attachment.description!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 9,
                                  color: Colors.white,
                                  fontFamily: 'Inter',
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showImagePreviewModal(
    BuildContext context,
    String url,
    String? description,
  ) {
    if (url.isEmpty) return;
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.black,
        insetPadding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            InteractiveViewer(
              child: CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.contain,
                placeholder: (context, url) => const SizedBox(
                  height: 200,
                  child: Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(
                  Icons.broken_image,
                  color: Colors.white,
                  size: 48,
                ),
              ),
            ),
            if (description != null && description.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontFamily: 'Inter',
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
