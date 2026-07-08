import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String _selectedCountry = 'VN';
  bool _agreeToTerms = false;

  final List<Map<String, String>> _countries = [
    {'code': 'VN', 'name': 'Việt Nam'},
    {'code': 'US', 'name': 'United States (Mỹ)'},
    {'code': 'JP', 'name': 'Japan (Nhật Bản)'},
    {'code': 'KR', 'name': 'South Korea (Hàn Quốc)'},
    {'code': 'CN', 'name': 'China (Trung Quốc)'},
    {'code': 'SG', 'name': 'Singapore'},
  ];

  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _onRegister() {
    if (!_agreeToTerms) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Bạn phải đồng ý với Điều khoản dịch vụ và Chính sách bảo mật.',
          ),
          backgroundColor: Color(0xFFBA1A1A),
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      ref
          .read(authProvider.notifier)
          .register(
            username: _fullNameController.text.trim(),
            email: _emailController.text.trim(),
            password: _passwordController.text,
            country: _selectedCountry,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeWhen(
        authenticated: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đăng ký tài khoản thành công!'),
              backgroundColor: Colors.green,
            ),
          );
          context.go('/home');
        },
        error: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message.replaceAll('Exception: ', '')),
              backgroundColor: const Color(0xFFBA1A1A),
            ),
          );
        },
        orElse: () {},
      );
    });

    final authState = ref.watch(authProvider);
    final isLoading = authState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    const primaryColor = Color(0xFF0F172A);
    const backgroundColor = Color(0xFFF8FAFC);
    const labelColor = Color(0xFF64748B);

    return Scaffold(
      backgroundColor: isDarkMode ? const Color(0xFF121212) : Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryColor),
          onPressed: isLoading ? null : () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 24.0,
            ),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 400),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Title
                      Text(
                        'Tạo tài khoản',
                        style:
                            Theme.of(
                              context,
                            ).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ) ??
                            const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Đăng ký tài khoản để bắt đầu trải nghiệm mua sắm không giới hạn.',
                        style: TextStyle(fontSize: 14, color: labelColor),
                      ),
                      const SizedBox(height: 36),

                      // Country Selection
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'QUỐC GIA (BẮT BUỘC)',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: labelColor,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 8),
                          DropdownButtonFormField<String>(
                            initialValue: _selectedCountry,
                            items: _countries.map((country) {
                              return DropdownMenuItem<String>(
                                value: country['code'],
                                child: Text(
                                  country['name']!,
                                  style: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 16,
                                    color: primaryColor,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: isLoading
                                ? null
                                : (value) {
                                    if (value != null) {
                                      setState(() {
                                        _selectedCountry = value;
                                      });
                                    }
                                  },
                            decoration: InputDecoration(
                              fillColor: backgroundColor,
                              filled: true,
                              prefixIcon: const Icon(
                                Icons.public,
                                color: labelColor,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Full Name
                      CustomTextField(
                        label: 'HỌ VÀ TÊN',
                        hintText: 'Nhập họ và tên của bạn',
                        controller: _fullNameController,
                        prefixIcon: const Icon(
                          Icons.person_outline,
                          color: labelColor,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Vui lòng nhập họ và tên';
                          }
                          return null;
                        },
                        enabled: !isLoading,
                      ),
                      const SizedBox(height: 16),

                      // Email Address
                      CustomTextField(
                        label: 'ĐỊA CHỈ EMAIL',
                        hintText: 'john@example.com',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: const Icon(
                          Icons.mail_outline,
                          color: labelColor,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Vui lòng nhập địa chỉ email';
                          }
                          final emailRegex = RegExp(
                            r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                          );
                          if (!emailRegex.hasMatch(value.trim())) {
                            return 'Định dạng email không hợp lệ';
                          }
                          return null;
                        },
                        enabled: !isLoading,
                      ),
                      const SizedBox(height: 16),

                      // Password
                      CustomTextField(
                        label: 'MẬT KHẨU',
                        hintText: '••••••••',
                        controller: _passwordController,
                        isPassword: true,
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: labelColor,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập mật khẩu';
                          }
                          if (value.length < 6) {
                            return 'Mật khẩu phải dài tối thiểu 6 ký tự';
                          }
                          return null;
                        },
                        enabled: !isLoading,
                      ),
                      const SizedBox(height: 16),

                      // Confirm Password
                      CustomTextField(
                        label: 'NHẬP LẠI MẬT KHẨU',
                        hintText: '••••••••',
                        controller: _confirmPasswordController,
                        isPassword: true,
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: labelColor,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập lại mật khẩu';
                          }
                          if (value != _passwordController.text) {
                            return 'Mật khẩu nhập lại không trùng khớp';
                          }
                          return null;
                        },
                        enabled: !isLoading,
                      ),
                      const SizedBox(height: 16),

                      // Terms and Conditions checkbox
                      Row(
                        children: [
                          Checkbox(
                            value: _agreeToTerms,
                            activeColor: primaryColor,
                            onChanged: isLoading
                                ? null
                                : (value) {
                                    if (value != null) {
                                      setState(() {
                                        _agreeToTerms = value;
                                      });
                                    }
                                  },
                          ),
                          Expanded(
                            child: Text(
                              'Tôi đồng ý với Điều khoản dịch vụ và Chính sách bảo mật',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                color: isDarkMode ? Colors.white70 : labelColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),

                      // Register Button
                      CustomButton(
                        text: 'Đăng ký tài khoản',
                        onPressed: _onRegister,
                        isLoading: isLoading,
                      ),
                      const SizedBox(height: 24),

                      // Back to Login Link
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Đã có tài khoản? ',
                            style: TextStyle(color: labelColor, fontSize: 14),
                          ),
                          GestureDetector(
                            onTap: isLoading ? null : () => context.pop(),
                            child: const Text(
                              'Đăng nhập ngay',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
