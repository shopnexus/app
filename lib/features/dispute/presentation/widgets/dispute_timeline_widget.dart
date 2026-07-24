import 'package:flutter/material.dart';
import '../../data/models/dispute_model.dart';

/// Widget hiển thị tiến trình dạng Timeline trực quan & đếm ngược 3 ngày
class DisputeTimelineWidget extends StatelessWidget {
  final RefundModel refund;

  const DisputeTimelineWidget({super.key, required this.refund});

  @override
  Widget build(BuildContext context) {
    final status = refund.status.toLowerCase();
    final isDisputed = refund.isDisputed;
    final isResolved = refund.isResolved;

    int currentStep = 1;
    if (status == 'awaitingsellerreview' || status == 'pending') {
      currentStep = 2;
    } else if (isDisputed) {
      currentStep = 3;
    } else if (isResolved) {
      currentStep = 4;
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Tiến trình xử lý',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Color(0xFF0F172A),
              fontFamily: 'Inter',
            ),
          ),
          const SizedBox(height: 16),
          // Timeline Steps Row
          Row(
            children: [
              _buildStepNode(
                stepIndex: 1,
                title: 'Yêu cầu',
                isCompleted: currentStep > 1,
                isActive: currentStep == 1,
              ),
              _buildStepLine(isCompleted: currentStep > 1),
              _buildStepNode(
                stepIndex: 2,
                title: 'Shop duyệt (3 ngày)',
                isCompleted: currentStep > 2,
                isActive: currentStep == 2,
              ),
              _buildStepLine(isCompleted: currentStep > 2),
              _buildStepNode(
                stepIndex: 3,
                title: 'Mod phán quyết',
                isCompleted: currentStep > 3,
                isActive: currentStep == 3,
              ),
              _buildStepLine(isCompleted: currentStep > 3),
              _buildStepNode(
                stepIndex: 4,
                title: 'Kết quả',
                isCompleted: currentStep == 4,
                isActive: currentStep == 4,
              ),
            ],
          ),
          if (refund.isAwaitingSellerReview && refund.expiresAt != null) ...[
            const SizedBox(height: 16),
            _buildCountdownTimerCard(refund.expiresAt!),
          ],
          if (refund.isLockedForInteraction) ...[
            const SizedBox(height: 16),
            _buildLockedInteractionBanner(),
          ],
        ],
      ),
    );
  }

  Widget _buildStepNode({
    required int stepIndex,
    required String title,
    required bool isCompleted,
    required bool isActive,
  }) {
    Color circleBg = const Color(0xFFF1F5F9);
    Color circleBorder = const Color(0xFFCBD5E1);
    Color iconColor = const Color(0xFF94A3B8);

    if (isCompleted) {
      circleBg = const Color(0xFF0F172A);
      circleBorder = const Color(0xFF0F172A);
      iconColor = Colors.white;
    } else if (isActive) {
      circleBg = const Color(0xFFFEF3C7);
      circleBorder = const Color(0xFFD97706);
      iconColor = const Color(0xFFD97706);
    }

    return Expanded(
      child: Column(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: circleBg,
              shape: BoxShape.circle,
              border: Border.all(color: circleBorder, width: 1.5),
            ),
            child: Center(
              child: isCompleted
                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                  : Text(
                      '$stepIndex',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: iconColor,
                        fontFamily: 'Inter',
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10,
              fontWeight: isActive || isCompleted
                  ? FontWeight.w600
                  : FontWeight.w400,
              color: isActive || isCompleted
                  ? const Color(0xFF0F172A)
                  : const Color(0xFF94A3B8),
              fontFamily: 'Inter',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepLine({required bool isCompleted}) {
    return Container(
      width: 20,
      height: 2,
      color: isCompleted ? const Color(0xFF0F172A) : const Color(0xFFE2E8F0),
    );
  }

  Widget _buildCountdownTimerCard(String expiresAtStr) {
    Duration remaining = Duration.zero;
    try {
      final expiryTime = DateTime.parse(expiresAtStr);
      final now = DateTime.now();
      if (expiryTime.isAfter(now)) {
        remaining = expiryTime.difference(now);
      }
    } catch (_) {}

    final hours = remaining.inHours;
    final minutes = remaining.inMinutes.remainder(60);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFBEB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFDE68A)),
      ),
      child: Row(
        children: [
          const Icon(Icons.timer, color: Color(0xFFD97706), size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hạn phản hồi của Shop:',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF92400E),
                    fontFamily: 'Inter',
                  ),
                ),
                Text(
                  'Còn $hours giờ $minutes phút (Nếu không phản hồi sẽ hoàn tiền tự động)',
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFB45309),
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLockedInteractionBanner() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFCA5A5)),
      ),
      child: const Row(
        children: [
          Icon(Icons.gavel, color: Color(0xFFDC2626), size: 20),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Đang trong quá trình Mod phân xử',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF991B1B),
                    fontFamily: 'Inter',
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Trong thời gian chờ phán quyết từ Quản trị viên, cả Buyer và Seller không thể thực hiện thêm thao tác tương tác.',
                  style: TextStyle(
                    fontSize: 11,
                    color: Color(0xFF7F1D1D),
                    fontFamily: 'Inter',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
