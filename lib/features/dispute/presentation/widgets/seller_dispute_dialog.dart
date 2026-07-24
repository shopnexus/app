import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import '../providers/dispute_provider.dart';

/// Modal Form hỗ trợ Seller khiếu nại đối chất lên Admin Mod
class SellerDisputeDialog extends ConsumerStatefulWidget {
  final String refundId;

  const SellerDisputeDialog({super.key, required this.refundId});

  static Future<bool?> show(BuildContext context, String refundId) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => SellerDisputeDialog(refundId: refundId),
    );
  }

  @override
  ConsumerState<SellerDisputeDialog> createState() =>
      _SellerDisputeDialogState();
}

class _SellerDisputeDialogState extends ConsumerState<SellerDisputeDialog> {
  final TextEditingController _reasonController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(sellerDisputeFormProvider.notifier).init(widget.refundId);
    });
  }

  @override
  void dispose() {
    _reasonController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );
    if (pickedFile != null) {
      await ref
          .read(sellerDisputeFormProvider.notifier)
          .uploadAndAddAttachment(pickedFile.path);
    }
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(sellerDisputeFormProvider);
    final isFormValid = formState.isValid;

    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.gavel, color: Color(0xFFDC2626), size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Khiếu nại lên Admin Mod',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F172A),
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Color(0xFF64748B)),
                    onPressed: () => Navigator.of(context).pop(false),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Alert Banner
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color(0xFFFCA5A5)),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Color(0xFFDC2626),
                      size: 16,
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Khi tạo khiếu nại, đơn hàng sẽ chuyển sang trạng thái chờ Mod phán quyết và cả 2 bên sẽ không thể thao tác thêm.',
                        style: TextStyle(
                          fontSize: 11,
                          color: Color(0xFF7F1D1D),
                          fontFamily: 'Inter',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // Dispute reason input
              const Text(
                'Lý do từ chối & đối chất *',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF334155),
                  fontFamily: 'Inter',
                ),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: _reasonController,
                maxLines: 3,
                onChanged: (val) {
                  ref.read(sellerDisputeFormProvider.notifier).setReason(val);
                },
                decoration: InputDecoration(
                  hintText:
                      'Giải thích lý do shop từ chối (ví dụ: video đóng gói hàng chuẩn, tráo hàng...)',
                  hintStyle: const TextStyle(
                    fontSize: 13,
                    color: Color(0xFF94A3B8),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF8FAFC),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Color(0xFF0F172A),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Mandatory Evidence Photos Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: const TextSpan(
                      text: 'Ảnh bằng chứng đối chất ',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF334155),
                        fontFamily: 'Inter',
                      ),
                      children: [
                        TextSpan(
                          text: '*(Bắt buộc ít nhất 1 ảnh)',
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFDC2626),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${formState.attachments.length} ảnh',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Image list & picker button
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: formState.attachments.length + 1,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    if (index == formState.attachments.length) {
                      return InkWell(
                        onTap: formState.isUploadingMedia ? null : _pickImage,
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: const Color(0xFFCBD5E1)),
                          ),
                          child: Center(
                            child: formState.isUploadingMedia
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                    ),
                                  )
                                : const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_a_photo_outlined,
                                        color: Color(0xFF64748B),
                                        size: 24,
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Thêm ảnh',
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Color(0xFF64748B),
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      );
                    }

                    final attachment = formState.attachments[index];
                    final imageUrl = attachment.resource?.url ?? '';

                    return Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 80,
                            height: 80,
                            color: const Color(0xFFF1F5F9),
                            child: CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.broken_image),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 2,
                          right: 2,
                          child: GestureDetector(
                            onTap: () {
                              ref
                                  .read(sellerDisputeFormProvider.notifier)
                                  .removeAttachment(index);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.7),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.close,
                                size: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),

              if (formState.errorMessage != null) ...[
                const SizedBox(height: 12),
                Text(
                  formState.errorMessage!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFFDC2626),
                  ),
                ),
              ],

              const SizedBox(height: 20),

              // Submit button (Guarded by isFormValid)
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: isFormValid && !formState.isSubmitting
                      ? () async {
                          final navigator = Navigator.of(context);
                          final result = await ref
                              .read(sellerDisputeFormProvider.notifier)
                              .submit();
                          if (result != null && mounted) {
                            navigator.pop(true);
                          }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDC2626),
                    disabledBackgroundColor: const Color(0xFFE2E8F0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: formState.isSubmitting
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : Text(
                          isFormValid
                              ? 'Gửi khiếu nại lên Admin Mod'
                              : 'Bắt buộc ít nhất 1 ảnh đối chất',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isFormValid
                                ? Colors.white
                                : const Color(0xFF94A3B8),
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
  }
}
