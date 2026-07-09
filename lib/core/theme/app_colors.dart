import 'package:flutter/material.dart';

/// Màu sắc ứng dụng với phong cách Minimalist & Trustworthy
class AppColors {
  // --- Light Theme Colors (Stitch Ethos Minimalist Commerce) ---
  /// Màu chủ đạo (Charcoal Navy)
  static const Color primary = Color(0xFF0F172A);

  /// Điểm nhấn / Màu phụ (Slate Grey)
  static const Color accent = Color(0xFF64748B);

  /// Nền (Soft Grey)
  static const Color background = Color(0xFFF8FAFC);

  /// Surface - Thường dùng cho các Card, BottomSheet
  static const Color surface = Colors.white;

  /// Màu chữ chính
  static const Color textPrimary = Color(0xFF0F172A);

  /// Màu chữ phụ
  static const Color textSecondary = Color(0xFF64748B);

  // --- Dark Theme Colors ---
  /// Màu chủ đạo tối (Thường dùng trắng nhạt để nổi bật trên nền tối)
  static const Color darkPrimary = Color(0xFFF8FAFC);
  static const Color darkBackground = Color(
    0xFF0F172A,
  ); // Sử dụng Charcoal làm màu nền tối
  static const Color darkSurface = Color(
    0xFF1E293B,
  ); // Surface sáng hơn nền một chút
  static const Color darkTextPrimary = Color(0xFFF8FAFC);
  static const Color darkTextSecondary = Color(0xFF94A3B8);
}

/// ThemeExtension cho E-commerce (Màu đặc thù không thuộc Material)
class EcommerceColors extends ThemeExtension<EcommerceColors> {
  final Color? statusDelivering;
  final Color? statusCanceled;
  final Color? freeshipBadge;
  final Color? freeshipText;
  final Color? saleBadge;

  const EcommerceColors({
    this.statusDelivering,
    this.statusCanceled,
    this.freeshipBadge,
    this.freeshipText,
    this.saleBadge,
  });

  @override
  ThemeExtension<EcommerceColors> copyWith({
    Color? statusDelivering,
    Color? statusCanceled,
    Color? freeshipBadge,
    Color? freeshipText,
    Color? saleBadge,
  }) {
    return EcommerceColors(
      statusDelivering: statusDelivering ?? this.statusDelivering,
      statusCanceled: statusCanceled ?? this.statusCanceled,
      freeshipBadge: freeshipBadge ?? this.freeshipBadge,
      freeshipText: freeshipText ?? this.freeshipText,
      saleBadge: saleBadge ?? this.saleBadge,
    );
  }

  @override
  ThemeExtension<EcommerceColors> lerp(
    ThemeExtension<EcommerceColors>? other,
    double t,
  ) {
    if (other is! EcommerceColors) return this;
    return EcommerceColors(
      statusDelivering: Color.lerp(statusDelivering, other.statusDelivering, t),
      statusCanceled: Color.lerp(statusCanceled, other.statusCanceled, t),
      freeshipBadge: Color.lerp(freeshipBadge, other.freeshipBadge, t),
      freeshipText: Color.lerp(freeshipText, other.freeshipText, t),
      saleBadge: Color.lerp(saleBadge, other.saleBadge, t),
    );
  }

  // Khai báo sẵn các hằng số màu cho Light mode
  static const light = EcommerceColors(
    statusDelivering: Color(0xFF2196F3),
    // Xanh lam
    statusCanceled: Color(0xFFE53935),
    // Đỏ
    freeshipBadge: Color(0xFFE8F5E9),
    // Nền xanh lá nhạt
    freeshipText: Color(0xFF2E7D32),
    // Chữ xanh lá đậm
    saleBadge: AppColors.accent, // Coral Red
  );

  // Khai báo sẵn các hằng số màu cho Dark mode
  static const dark = EcommerceColors(
    statusDelivering: Color(0xFF64B5F6),
    statusCanceled: Color(0xFFEF5350),
    freeshipBadge: Color(0xFF1B5E20),
    freeshipText: Color(0xFFA5D6A7),
    saleBadge: Color(0xFFFF8A65),
  );
}
