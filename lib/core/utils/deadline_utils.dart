/// Thời gian còn lại của một hạn, viết ra thành chữ.
///
/// Mọi cái chờ trên sàn này đều có hạn nằm sẵn trong đơn — `confirmation_deadline_at`,
/// `payout_deadline_at`, hạn hoàn tiền — và một cái hạn không được vẽ ra thì
/// người dùng chỉ biết là "đang chờ", không biết chờ đến bao giờ.
class DeadlineUtils {
  const DeadlineUtils._();

  /// "còn 31 giờ", "còn 45 phút", "đã quá hạn". Null khi không có hạn nào.
  ///
  /// Hạn null là một sự thật, không phải dữ liệu thiếu: server bỏ
  /// `confirmation_deadline_at` ngay khi người bán đã xác nhận. Còn hạn đã qua
  /// vẫn phải nói ra — quá hạn *không* huỷ đơn, hệ thống mở ticket cho mod, nên
  /// ẩn dòng này đi là làm người mua tưởng mọi thứ vẫn đúng lịch.
  ///
  /// Làm tròn xuống, và xuống đơn vị nhỏ hơn khi đơn vị lớn đã thành 0: "còn 0
  /// giờ" là câu không ai đọc được, và làm tròn lên thì hứa nhiều hơn thật.
  static String? remaining(DateTime? deadline, {DateTime? now}) {
    if (deadline == null) return null;

    final left = deadline.difference(now ?? DateTime.now());
    if (!left.isNegative && left.inMinutes < 1) return 'còn dưới 1 phút';
    if (left.isNegative) return 'đã quá hạn';
    if (left.inHours < 1) return 'còn ${left.inMinutes} phút';
    return 'còn ${left.inHours} giờ';
  }

  /// True khi hạn đã qua — cái quyết định dòng đếm ngược vẽ màu cảnh báo.
  static bool isPast(DateTime? deadline, {DateTime? now}) =>
      deadline != null && deadline.isBefore(now ?? DateTime.now());
}
