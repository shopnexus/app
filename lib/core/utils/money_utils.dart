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

  /// Định dạng hiển thị song song tiền gốc sản phẩm và tiền ưu tiên quy đổi.
  /// (Dùng khi người dùng thay đổi cấu hình tiền tệ ưu tiên)
  static String formatWithConversion(
    int amount, {
    required String originalCurrency,
    String? preferredCurrency,
    double exchangeRate = 1.0,
  }) {
    final origStr = format(amount, currency: originalCurrency);
    if (preferredCurrency == null ||
        preferredCurrency.toUpperCase() == originalCurrency.toUpperCase()) {
      return origStr;
    }

    // Tính toán lượng tiền quy đổi
    double convertedAmount = amount.toDouble();
    if (originalCurrency.toUpperCase() == 'USD') {
      // Chuyển USD sang giá trị thực
      convertedAmount = amount / 100.0;
    }

    // Nhân tỷ giá
    convertedAmount = convertedAmount * exchangeRate;

    int finalAmount = convertedAmount.round();
    if (preferredCurrency.toUpperCase() == 'USD') {
      finalAmount = (convertedAmount * 100).round();
    }

    final prefStr = format(finalAmount, currency: preferredCurrency);
    return '$origStr ($prefStr)';
  }
}
