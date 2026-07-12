import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../shared/widgets/custom_button.dart';
import '../../../../shared/widgets/custom_text_field.dart';
import '../providers/auth_provider.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    if (_formKey.currentState!.validate()) {
      ref
          .read(authProvider.notifier)
          .forgotPassword(_emailController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AuthState>(authProvider, (previous, next) {
      next.maybeWhen(
        unauthenticated: () {
          // If we transitioned to unauthenticated after loading, it means forgot password request succeeded!
          if (previous != null &&
              previous.maybeWhen(loading: () => true, orElse: () => false)) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Yêu cầu khôi phục mật khẩu đã được gửi! Vui lòng kiểm tra email.',
                ),
                backgroundColor: Colors.green,
              ),
            );
            context.pop();
          }
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

    final state = GoRouterState.of(context);
    final from = state.uri.queryParameters['from'];

    final authState = ref.watch(authProvider);
    final isLoading = authState.maybeWhen(
      loading: () => true,
      orElse: () => false,
    );

    final theme = Theme.of(context);
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
                          'Quên mật khẩu',
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
                          'Nhập địa chỉ email đã đăng ký của bạn và chúng tôi sẽ gửi liên kết để khôi phục lại mật khẩu.',
                          style: TextStyle(fontSize: 14, color: labelColor),
                        ),
                        const SizedBox(height: 36),
  
                        // Email Input
                        CustomTextField(
                          label: 'ĐỊA CHỈ EMAIL',
                          hintText: 'Nhập địa chỉ email của bạn',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          prefixIcon: Icon(Icons.mail_outline, color: labelColor),
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
                        const SizedBox(height: 32),
  
                        // Submit Button
                        CustomButton(
                          text: 'Gửi yêu cầu khôi phục',
                          onPressed: _onSubmit,
                          isLoading: isLoading,
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
