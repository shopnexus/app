import 'package:intl/intl.dart';

class MoneyUtils {
  /// Định dạng số nguyên từ Backend thành chuỗi hiển thị tiền tệ tương ứng.
  /// - VND: Giữ nguyên số nguyên và định dạng vi_VN (ví dụ: 299000 VND -> ₫299.000)
  /// - USD: Chia cho 100 để lấy phần thập phân (ví dụ: 1250 -> $12.50)
  static String format(int amount, {String currency = 'VND'}) {
    final currencyUpper = currency.toUpperCase();
    if (currencyUpper == 'USD') {
      final formatter = NumberFormat.simpleCurrency(name: 'USD');
      return formatter.format(amount / 100.0);
    } else {
      // Mặc định định dạng VND
      final formatter = NumberFormat.currency(
        locale: 'vi_VN',
        symbol: '₫',
        decimalDigits: 0,
      );
      return formatter.format(amount);
    }
  }
}
