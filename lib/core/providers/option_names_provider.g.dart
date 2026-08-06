// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_names_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Tên hiển thị của một `option` slug, cho cả hai nhóm dùng nó.
///
/// Một bản ghi đã xong giữ slug làm bằng — `transaction.payment_option`,
/// `transport.option` — nên chỗ nào vẽ nó cũng cần tra tên. Trước đây ba màn in
/// thẳng slug: người mua đọc "sepay-bank-transfer" và "mock-standard" thay vì
/// "Chuyển khoản ngân hàng (SePay)".
///
/// `keepAlive`: danh sách này đổi khi vận hành đổi nó, không đổi theo màn hình, và
/// mỗi lần mở một sheet mà gọi lại là một request cho dữ liệu vừa đọc xong.

@ProviderFor(optionNames)
final optionNamesProvider = OptionNamesFamily._();

/// Tên hiển thị của một `option` slug, cho cả hai nhóm dùng nó.
///
/// Một bản ghi đã xong giữ slug làm bằng — `transaction.payment_option`,
/// `transport.option` — nên chỗ nào vẽ nó cũng cần tra tên. Trước đây ba màn in
/// thẳng slug: người mua đọc "sepay-bank-transfer" và "mock-standard" thay vì
/// "Chuyển khoản ngân hàng (SePay)".
///
/// `keepAlive`: danh sách này đổi khi vận hành đổi nó, không đổi theo màn hình, và
/// mỗi lần mở một sheet mà gọi lại là một request cho dữ liệu vừa đọc xong.

final class OptionNamesProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, String>>,
          Map<String, String>,
          FutureOr<Map<String, String>>
        >
    with
        $FutureModifier<Map<String, String>>,
        $FutureProvider<Map<String, String>> {
  /// Tên hiển thị của một `option` slug, cho cả hai nhóm dùng nó.
  ///
  /// Một bản ghi đã xong giữ slug làm bằng — `transaction.payment_option`,
  /// `transport.option` — nên chỗ nào vẽ nó cũng cần tra tên. Trước đây ba màn in
  /// thẳng slug: người mua đọc "sepay-bank-transfer" và "mock-standard" thay vì
  /// "Chuyển khoản ngân hàng (SePay)".
  ///
  /// `keepAlive`: danh sách này đổi khi vận hành đổi nó, không đổi theo màn hình, và
  /// mỗi lần mở một sheet mà gọi lại là một request cho dữ liệu vừa đọc xong.
  OptionNamesProvider._({
    required OptionNamesFamily super.from,
    required OptionCategoryName super.argument,
  }) : super(
         retry: null,
         name: r'optionNamesProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$optionNamesHash();

  @override
  String toString() {
    return r'optionNamesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Map<String, String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, String>> create(Ref ref) {
    final argument = this.argument as OptionCategoryName;
    return optionNames(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is OptionNamesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$optionNamesHash() => r'c45bbd39552fad0d62ed4779952bbdf06e2c3397';

/// Tên hiển thị của một `option` slug, cho cả hai nhóm dùng nó.
///
/// Một bản ghi đã xong giữ slug làm bằng — `transaction.payment_option`,
/// `transport.option` — nên chỗ nào vẽ nó cũng cần tra tên. Trước đây ba màn in
/// thẳng slug: người mua đọc "sepay-bank-transfer" và "mock-standard" thay vì
/// "Chuyển khoản ngân hàng (SePay)".
///
/// `keepAlive`: danh sách này đổi khi vận hành đổi nó, không đổi theo màn hình, và
/// mỗi lần mở một sheet mà gọi lại là một request cho dữ liệu vừa đọc xong.

final class OptionNamesFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<Map<String, String>>,
          OptionCategoryName
        > {
  OptionNamesFamily._()
    : super(
        retry: null,
        name: r'optionNamesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  /// Tên hiển thị của một `option` slug, cho cả hai nhóm dùng nó.
  ///
  /// Một bản ghi đã xong giữ slug làm bằng — `transaction.payment_option`,
  /// `transport.option` — nên chỗ nào vẽ nó cũng cần tra tên. Trước đây ba màn in
  /// thẳng slug: người mua đọc "sepay-bank-transfer" và "mock-standard" thay vì
  /// "Chuyển khoản ngân hàng (SePay)".
  ///
  /// `keepAlive`: danh sách này đổi khi vận hành đổi nó, không đổi theo màn hình, và
  /// mỗi lần mở một sheet mà gọi lại là một request cho dữ liệu vừa đọc xong.

  OptionNamesProvider call(OptionCategoryName category) =>
      OptionNamesProvider._(argument: category, from: this);

  @override
  String toString() => r'optionNamesProvider';
}
