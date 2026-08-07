import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shopnexus_flutter_app/api/generated/model/tax_code_type.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tax_info.dart';
import 'package:shopnexus_flutter_app/api/generated/model/tax_verification_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/upsert_tax_info_request.dart';
import 'package:shopnexus_flutter_app/core/utils/error_handler.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

/// Mã số thuế của người nhận tiền — một bản đăng ký cho mỗi tài khoản.
///
/// Ghi đè cả bản chứ không sửa từng trường: một mã số mới làm verdict cũ hết giá
/// trị, nên mỗi lần lưu là một lần xét lại từ đầu (`pending`). Màn này nói ra
/// điều đó trước khi người bán bấm lưu, vì đổi một chữ trong tên pháp lý cũng đủ
/// để mất trạng thái "đã xác minh" đang có.
class TaxInfoScreen extends ConsumerStatefulWidget {
  const TaxInfoScreen({super.key});

  @override
  ConsumerState<TaxInfoScreen> createState() => _TaxInfoScreenState();
}

class _TaxInfoScreenState extends ConsumerState<TaxInfoScreen> {
  late Future<TaxInfo?> _future;

  @override
  void initState() {
    super.initState();
    _future = ref.read(sellerRepositoryProvider).taxInfo();
  }

  void _reload() {
    setState(() {
      _future = ref.read(sellerRepositoryProvider).taxInfo();
    });
  }

  static const _typeLabels = {
    TaxCodeType.individual: 'Cá nhân',
    TaxCodeType.business: 'Doanh nghiệp',
    TaxCodeType.household: 'Hộ kinh doanh',
  };

  static const _statusLabels = {
    TaxVerificationStatus.pending: 'Đang chờ xác minh',
    TaxVerificationStatus.verified: 'Đã xác minh',
    TaxVerificationStatus.rejected: 'Bị từ chối',
  };

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Thông tin thuế')),
      body: FutureBuilder<TaxInfo?>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ErrorHandler.getErrorMessage(snapshot.error),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: _reload,
                      child: const Text('Thử lại'),
                    ),
                  ],
                ),
              ),
            );
          }

          // `null` là "chưa khai", không phải lỗi: server trả 404 cho tài khoản
          // chưa đăng ký, và đó là trạng thái mặc định của mọi người bán mới.
          final info = snapshot.data;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              if (info == null)
                Text(
                  'Bạn chưa khai mã số thuế. Khai ở đây để sàn xuất chứng từ '
                  'đúng tên khi chi trả doanh thu.',
                  style: theme.textTheme.bodyMedium,
                )
              else ...[
                _statusBanner(info),
                const SizedBox(height: 16),
                _row('Tên pháp lý', info.legalName),
                _row('Mã số thuế', info.taxCode),
                _row(
                  'Loại',
                  _typeLabels[info.taxCodeType] ?? info.taxCodeType.value,
                ),
                _row('Cập nhật lần cuối', _date(info.updatedAt)),
                if (info.verifiedAt != null)
                  _row('Xác minh lúc', _date(info.verifiedAt!)),
              ],
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: () => _showForm(info),
                  child: Text(
                    info == null ? 'Khai mã số thuế' : 'Thay đổi đăng ký',
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _statusBanner(TaxInfo info) {
    final theme = Theme.of(context);
    final color = switch (info.verificationStatus) {
      TaxVerificationStatus.verified => const Color(0xFF10B981),
      TaxVerificationStatus.pending => const Color(0xFFF59E0B),
      TaxVerificationStatus.rejected => const Color(0xFFEF4444),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(Icons.verified_user_outlined, color: color, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              _statusLabels[info.verificationStatus] ??
                  info.verificationStatus.value,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _row(String label, String value) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showForm(TaxInfo? current) async {
    final saved = await showModalBottomSheet<TaxInfo>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => _TaxInfoFormSheet(current: current),
    );
    if (saved == null || !mounted) return;

    _reload();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Đã lưu. Sàn sẽ xác minh lại mã số thuế này.'),
      ),
    );
  }

  static String _date(DateTime value) {
    final local = value.toLocal();
    String two(int n) => n.toString().padLeft(2, '0');
    return '${two(local.day)}/${two(local.month)}/${local.year}';
  }
}

class _TaxInfoFormSheet extends ConsumerStatefulWidget {
  const _TaxInfoFormSheet({required this.current});

  final TaxInfo? current;

  @override
  ConsumerState<_TaxInfoFormSheet> createState() => _TaxInfoFormSheetState();
}

class _TaxInfoFormSheetState extends ConsumerState<_TaxInfoFormSheet> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _legalName;
  late final TextEditingController _taxCode;
  late TaxCodeType _type;
  bool _saving = false;
  String? _error;

  /// Mã số thuế Việt Nam: mười chữ số, hoặc mười cộng ba chữ số chi nhánh. Cùng
  /// biểu thức server dùng — sai định dạng thì hỏng ngay tại ô nhập, không phải
  /// sau một vòng mạng.
  static final _taxCodePattern = RegExp(r'^\d{10}(-\d{3})?$');

  @override
  void initState() {
    super.initState();
    _legalName = TextEditingController(text: widget.current?.legalName ?? '');
    _taxCode = TextEditingController(text: widget.current?.taxCode ?? '');
    _type = widget.current?.taxCodeType ?? TaxCodeType.individual;
  }

  @override
  void dispose() {
    _legalName.dispose();
    _taxCode.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() {
      _saving = true;
      _error = null;
    });
    try {
      final saved = await ref
          .read(sellerRepositoryProvider)
          .saveTaxInfo(
            UpsertTaxInfoRequest(
              legalName: _legalName.text.trim(),
              taxCode: _taxCode.text.trim(),
              taxCodeType: _type,
            ),
          );
      if (!mounted) return;
      Navigator.pop(context, saved);
    } catch (error) {
      if (!mounted) return;
      // 409 là "mã này đã được xác minh dưới một tài khoản khác" — một câu chỉ
      // server nói được, vì nó là thứ duy nhất thấy các tài khoản còn lại.
      setState(() => _error = ErrorHandler.getErrorMessage(error));
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 24,
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.current == null ? 'Khai mã số thuế' : 'Thay đổi đăng ký',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Lưu lại sẽ đặt trạng thái xác minh về "đang chờ": bản xét duyệt '
                'cũ là về mã số cũ.',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _legalName,
                decoration: const InputDecoration(
                  labelText: 'Tên pháp lý',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  final name = value?.trim() ?? '';
                  if (name.isEmpty) return 'Nhập tên trên đăng ký thuế';
                  if (name.length > 200) return 'Tối đa 200 ký tự';
                  return null;
                },
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _taxCode,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Mã số thuế',
                  hintText: '0123456789 hoặc 0123456789-001',
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    _taxCodePattern.hasMatch(value?.trim() ?? '')
                    ? null
                    : 'Mười chữ số, có thể kèm ba số chi nhánh',
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<TaxCodeType>(
                initialValue: _type,
                decoration: const InputDecoration(
                  labelText: 'Loại đăng ký',
                  border: OutlineInputBorder(),
                ),
                items: [
                  for (final type in TaxCodeType.values)
                    DropdownMenuItem(
                      value: type,
                      child: Text(
                        _TaxInfoScreenState._typeLabels[type] ?? type.value,
                      ),
                    ),
                ],
                onChanged: (value) {
                  if (value != null) setState(() => _type = value);
                },
              ),
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(
                  _error!,
                  style: TextStyle(
                    fontSize: 13,
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  onPressed: _saving ? null : _submit,
                  child: _saving
                      ? const SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Text('Lưu'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
