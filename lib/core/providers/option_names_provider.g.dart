// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'option_names_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$optionNamesHash() => r'c45bbd39552fad0d62ed4779952bbdf06e2c3397';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Tên hiển thị của một `option` slug, cho cả hai nhóm dùng nó.
///
/// Một bản ghi đã xong giữ slug làm bằng — `transaction.payment_option`,
/// `transport.option` — nên chỗ nào vẽ nó cũng cần tra tên. Trước đây ba màn in
/// thẳng slug: người mua đọc "sepay-bank-transfer" và "mock-standard" thay vì
/// "Chuyển khoản ngân hàng (SePay)".
///
/// `keepAlive`: danh sách này đổi khi vận hành đổi nó, không đổi theo màn hình, và
/// mỗi lần mở một sheet mà gọi lại là một request cho dữ liệu vừa đọc xong.
///
/// Copied from [optionNames].
@ProviderFor(optionNames)
const optionNamesProvider = OptionNamesFamily();

/// Tên hiển thị của một `option` slug, cho cả hai nhóm dùng nó.
///
/// Một bản ghi đã xong giữ slug làm bằng — `transaction.payment_option`,
/// `transport.option` — nên chỗ nào vẽ nó cũng cần tra tên. Trước đây ba màn in
/// thẳng slug: người mua đọc "sepay-bank-transfer" và "mock-standard" thay vì
/// "Chuyển khoản ngân hàng (SePay)".
///
/// `keepAlive`: danh sách này đổi khi vận hành đổi nó, không đổi theo màn hình, và
/// mỗi lần mở một sheet mà gọi lại là một request cho dữ liệu vừa đọc xong.
///
/// Copied from [optionNames].
class OptionNamesFamily extends Family<AsyncValue<Map<String, String>>> {
  /// Tên hiển thị của một `option` slug, cho cả hai nhóm dùng nó.
  ///
  /// Một bản ghi đã xong giữ slug làm bằng — `transaction.payment_option`,
  /// `transport.option` — nên chỗ nào vẽ nó cũng cần tra tên. Trước đây ba màn in
  /// thẳng slug: người mua đọc "sepay-bank-transfer" và "mock-standard" thay vì
  /// "Chuyển khoản ngân hàng (SePay)".
  ///
  /// `keepAlive`: danh sách này đổi khi vận hành đổi nó, không đổi theo màn hình, và
  /// mỗi lần mở một sheet mà gọi lại là một request cho dữ liệu vừa đọc xong.
  ///
  /// Copied from [optionNames].
  const OptionNamesFamily();

  /// Tên hiển thị của một `option` slug, cho cả hai nhóm dùng nó.
  ///
  /// Một bản ghi đã xong giữ slug làm bằng — `transaction.payment_option`,
  /// `transport.option` — nên chỗ nào vẽ nó cũng cần tra tên. Trước đây ba màn in
  /// thẳng slug: người mua đọc "sepay-bank-transfer" và "mock-standard" thay vì
  /// "Chuyển khoản ngân hàng (SePay)".
  ///
  /// `keepAlive`: danh sách này đổi khi vận hành đổi nó, không đổi theo màn hình, và
  /// mỗi lần mở một sheet mà gọi lại là một request cho dữ liệu vừa đọc xong.
  ///
  /// Copied from [optionNames].
  OptionNamesProvider call(OptionCategoryName category) {
    return OptionNamesProvider(category);
  }

  @override
  OptionNamesProvider getProviderOverride(
    covariant OptionNamesProvider provider,
  ) {
    return call(provider.category);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'optionNamesProvider';
}

/// Tên hiển thị của một `option` slug, cho cả hai nhóm dùng nó.
///
/// Một bản ghi đã xong giữ slug làm bằng — `transaction.payment_option`,
/// `transport.option` — nên chỗ nào vẽ nó cũng cần tra tên. Trước đây ba màn in
/// thẳng slug: người mua đọc "sepay-bank-transfer" và "mock-standard" thay vì
/// "Chuyển khoản ngân hàng (SePay)".
///
/// `keepAlive`: danh sách này đổi khi vận hành đổi nó, không đổi theo màn hình, và
/// mỗi lần mở một sheet mà gọi lại là một request cho dữ liệu vừa đọc xong.
///
/// Copied from [optionNames].
class OptionNamesProvider extends FutureProvider<Map<String, String>> {
  /// Tên hiển thị của một `option` slug, cho cả hai nhóm dùng nó.
  ///
  /// Một bản ghi đã xong giữ slug làm bằng — `transaction.payment_option`,
  /// `transport.option` — nên chỗ nào vẽ nó cũng cần tra tên. Trước đây ba màn in
  /// thẳng slug: người mua đọc "sepay-bank-transfer" và "mock-standard" thay vì
  /// "Chuyển khoản ngân hàng (SePay)".
  ///
  /// `keepAlive`: danh sách này đổi khi vận hành đổi nó, không đổi theo màn hình, và
  /// mỗi lần mở một sheet mà gọi lại là một request cho dữ liệu vừa đọc xong.
  ///
  /// Copied from [optionNames].
  OptionNamesProvider(OptionCategoryName category)
    : this._internal(
        (ref) => optionNames(ref as OptionNamesRef, category),
        from: optionNamesProvider,
        name: r'optionNamesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$optionNamesHash,
        dependencies: OptionNamesFamily._dependencies,
        allTransitiveDependencies: OptionNamesFamily._allTransitiveDependencies,
        category: category,
      );

  OptionNamesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final OptionCategoryName category;

  @override
  Override overrideWith(
    FutureOr<Map<String, String>> Function(OptionNamesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: OptionNamesProvider._internal(
        (ref) => create(ref as OptionNamesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  FutureProviderElement<Map<String, String>> createElement() {
    return _OptionNamesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is OptionNamesProvider && other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin OptionNamesRef on FutureProviderRef<Map<String, String>> {
  /// The parameter `category` of this provider.
  OptionCategoryName get category;
}

class _OptionNamesProviderElement
    extends FutureProviderElement<Map<String, String>>
    with OptionNamesRef {
  _OptionNamesProviderElement(super.provider);

  @override
  OptionCategoryName get category => (origin as OptionNamesProvider).category;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
