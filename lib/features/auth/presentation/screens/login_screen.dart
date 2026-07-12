import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _idController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(authProvider.notifier)
          .login(_idController.text.trim(), _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = GoRouterState.of(context);
    final from = state.uri.queryParameters['from'];
    final target = state.uri.queryParameters['target'];

    // Lắng nghe AuthState để tự động chuyển hướng sang trang chủ hoặc trang đích
    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeWhen(
        authenticated: (_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đăng nhập thành công!'),
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

    final primaryColor = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final secondaryColor = Theme.of(context).colorScheme.onSurfaceVariant;

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
                        // Logo & Brand Name
                        Center(
                          child: Column(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color(0x0D000000),
                                      blurRadius: 20,
                                      offset: Offset(0, 10),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/logo_shopnexus.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'ShopNexus',
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
                                'Đăng nhập để tiếp tục mua sắm',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: secondaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 48),

                        // Identifier Input
                        CustomTextField(
                          label: 'TÊN ĐĂNG NHẬP / EMAIL / SỐ ĐIỆN THOẠI',
                          hintText:
                              'Nhập tên đăng nhập, email hoặc số điện thoại',
                          controller: _idController,
                          prefixIcon: Icon(
                            Icons.person_outline,
                            color: secondaryColor,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Vui lòng nhập thông tin tài khoản';
                            }
                            return null;
                          },
                          enabled: !isLoading,
                        ),
                        const SizedBox(height: 20),

                        // Password Input
                        CustomTextField(
                          label: 'MẬT KHẨU',
                          hintText: 'Nhập mật khẩu',
                          controller: _passwordController,
                          isPassword: true,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: secondaryColor,
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

                        // Forgot Password Link
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: isLoading
                                ? null
                                : () => context.push(
                                      '/forgot-password?from=${Uri.encodeComponent(from ?? '/home')}&target=${Uri.encodeComponent(target ?? '/home')}',
                                    ),
                            child: Text(
                              'Quên mật khẩu?',
                              style: TextStyle(
                                color: secondaryColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),

                        // Login Button
                        CustomButton(
                          text: 'Đăng nhập',
                          onPressed: _onLogin,
                          isLoading: isLoading,
                        ),
                        const SizedBox(height: 24),

                        // Register Link
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Chưa có tài khoản? ',
                              style: TextStyle(
                                color: secondaryColor,
                                fontSize: 14,
                              ),
                            ),
                            GestureDetector(
                              onTap: isLoading
                                  ? null
                                  : () => context.push(
                                        '/register?from=${Uri.encodeComponent(from ?? '/home')}&target=${Uri.encodeComponent(target ?? '/home')}',
                                      ),
                              child: Text(
                                'Đăng ký ngay',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
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
