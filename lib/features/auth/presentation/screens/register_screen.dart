import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shopnexus_flutter_app/shared/widgets/custom_button.dart';
import 'package:shopnexus_flutter_app/shared/widgets/custom_text_field.dart';
import 'package:shopnexus_flutter_app/features/auth/presentation/providers/auth_provider.dart';

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

  bool _agreeToTerms = false;

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
            name: _fullNameController.text.trim(),
            email: _emailController.text.trim(),
            password: _passwordController.text,
            country: 'VN',
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = GoRouterState.of(context);
    final from = state.uri.queryParameters['from'];
    final target = state.uri.queryParameters['target'];

    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeWhen(
        authenticated: (_, _) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đăng ký tài khoản thành công!'),
              backgroundColor: Colors.green,
            ),
          );
          context.go(target ?? '/home');
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

    final theme = Theme.of(context);
    final primaryColor = theme.colorScheme.primary;
    final textColor = theme.colorScheme.onSurface;
    final labelColor = theme.colorScheme.onSurfaceVariant;

    return BackButtonListener(
      onBackButtonPressed: () async {
        if (Navigator.canPop(context)) {
          context.pop();
          return true;
        } else {
          context.go(from ?? '/home');
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: textColor),
            onPressed: isLoading
                ? null
                : () {
                    if (Navigator.canPop(context)) {
                      context.pop();
                    } else {
                      context.go(from ?? '/home');
                    }
                  },
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
                                color: textColor,
                              ) ??
                              TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: textColor,
                              ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Đăng ký tài khoản để bắt đầu trải nghiệm mua sắm không giới hạn.',
                          style: TextStyle(fontSize: 14, color: labelColor),
                        ),
                        const SizedBox(height: 36),

                        // Full Name
                        CustomTextField(
                          label: 'HỌ VÀ TÊN',
                          hintText: 'Nhập họ và tên của bạn',
                          controller: _fullNameController,
                          prefixIcon: Icon(
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
                          prefixIcon: Icon(
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
                          prefixIcon: Icon(
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
                          prefixIcon: Icon(
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
                            // Hai cái tên này giờ mở ra được. Bắt người ta đồng ý
                            // với một văn bản không có đường nào đọc là xin một cái
                            // tick chứ không phải xin sự đồng ý.
                            Expanded(
                              child: Text.rich(
                                TextSpan(
                                  style: TextStyle(
                                    fontFamily: 'Inter',
                                    fontSize: 14,
                                    color: labelColor,
                                  ),
                                  children: [
                                    const TextSpan(text: 'Tôi đồng ý với '),
                                    TextSpan(
                                      text: 'Điều khoản sử dụng',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => context.push('/terms'),
                                    ),
                                    const TextSpan(text: ' và '),
                                    TextSpan(
                                      text: 'Chính sách bảo mật',
                                      style: TextStyle(
                                        color: primaryColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () =>
                                            context.push('/privacy'),
                                    ),
                                  ],
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
                            Text(
                              'Đã có tài khoản? ',
                              style: TextStyle(color: labelColor, fontSize: 14),
                            ),
                            GestureDetector(
                              onTap: isLoading
                                  ? null
                                  : () {
                                      if (Navigator.canPop(context)) {
                                        context.pop();
                                      } else {
                                        context.go(
                                          '/login?from=${Uri.encodeComponent(from ?? '/home')}&target=${Uri.encodeComponent(target ?? '/home')}',
                                        );
                                      }
                                    },
                              child: Text(
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
      ),
    );
  }
}
