import 'package:flutter/material.dart';

/// Màu sắc ứng dụng theo hệ thống Stitch mới nhất (Nexus Human-Centric Interface)
class AppColors {
  // --- Light Theme Colors ---
  /// Màu chủ đạo (Trustworthy Teal)
  static const Color primary = Color(0xFF005049); 
  
  /// Màu phụ / Muted Teal
  static const Color accent = Color(0xFF216963); 
  
  /// Nền (Warm Off-white)
  static const Color background = Color(0xFFF9F9F7); 
  
  /// Surface - Nền cho Card, BottomSheet (Sử dụng Pure White atop Base)
  static const Color surface = Colors.white;
  
  /// Màu chữ chính (On-Surface)
  static const Color textPrimary = Color(0xFF1A1C1B);
  
  /// Màu chữ phụ (On-Surface-Variant)
  static const Color textSecondary = Color(0xFF3E4947);

  // --- Dark Theme Colors ---
  /// Màu chủ đạo tối (Soft Teal)
  static const Color darkPrimary = Color(0xFF85D5C9); 
  
  /// Nền tối (Teal-tinted Near Black)
  static const Color darkBackground = Color(0xFF00201D); 
  
  /// Surface tối (Slightly lighter Teal)
  static const Color darkSurface = Color(0xFF00302C);    
  
  /// Màu chữ chính tối (Off-white)
  static const Color darkTextPrimary = Color(0xFFF1F1EF);
  
  /// Màu chữ phụ tối (Slate Teal)
  static const Color darkTextSecondary = Color(0xFFBEC9C6);
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
    statusDelivering: Color(0xFF005049), // Đồng nhất với brand primary
    statusCanceled: Color(0xFFBA1A1A), // Màu lỗi từ Stitch
    freeshipBadge: Color(0xFFE6F4EA), 
    freeshipText: Color(0xFF005049), 
    saleBadge: Color(0xFF773115), // Tông màu tertiary của Stitch
  );

  // Khai báo sẵn các hằng số màu cho Dark mode
  static const dark = EcommerceColors(
    statusDelivering: Color(0xFF85D5C9),
    statusCanceled: Color(0xFFEF4444),
    freeshipBadge: Color(0xFF00302C),
    freeshipText: Color(0xFF85D5C9),
    saleBadge: Color(0xFFBEC9C6),
  );
}
