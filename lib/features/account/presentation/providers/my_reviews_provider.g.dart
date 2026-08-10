// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_reviews_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myFeedbackHash() => r'dc1a6efcdd4d3d3285c320336c560901ab176b3f';

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

/// Đánh giá người dùng hiện tại nhận được ở một vai.
///
/// Id lấy từ hồ sơ chứ không truyền vào: màn hình này luôn nói về chính mình, và
/// một tham số id ở đây chỉ mở đường cho việc gọi nhầm sang tài khoản khác.
///
/// Copied from [myFeedback].
@ProviderFor(myFeedback)
const myFeedbackProvider = MyFeedbackFamily();

/// Đánh giá người dùng hiện tại nhận được ở một vai.
///
/// Id lấy từ hồ sơ chứ không truyền vào: màn hình này luôn nói về chính mình, và
/// một tham số id ở đây chỉ mở đường cho việc gọi nhầm sang tài khoản khác.
///
/// Copied from [myFeedback].
class MyFeedbackFamily extends Family<AsyncValue<List<Feedback>>> {
  /// Đánh giá người dùng hiện tại nhận được ở một vai.
  ///
  /// Id lấy từ hồ sơ chứ không truyền vào: màn hình này luôn nói về chính mình, và
  /// một tham số id ở đây chỉ mở đường cho việc gọi nhầm sang tài khoản khác.
  ///
  /// Copied from [myFeedback].
  const MyFeedbackFamily();

  /// Đánh giá người dùng hiện tại nhận được ở một vai.
  ///
  /// Id lấy từ hồ sơ chứ không truyền vào: màn hình này luôn nói về chính mình, và
  /// một tham số id ở đây chỉ mở đường cho việc gọi nhầm sang tài khoản khác.
  ///
  /// Copied from [myFeedback].
  MyFeedbackProvider call(ReputationRole role) {
    return MyFeedbackProvider(role);
  }

  @override
  MyFeedbackProvider getProviderOverride(
    covariant MyFeedbackProvider provider,
  ) {
    return call(provider.role);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'myFeedbackProvider';
}

/// Đánh giá người dùng hiện tại nhận được ở một vai.
///
/// Id lấy từ hồ sơ chứ không truyền vào: màn hình này luôn nói về chính mình, và
/// một tham số id ở đây chỉ mở đường cho việc gọi nhầm sang tài khoản khác.
///
/// Copied from [myFeedback].
class MyFeedbackProvider extends AutoDisposeFutureProvider<List<Feedback>> {
  /// Đánh giá người dùng hiện tại nhận được ở một vai.
  ///
  /// Id lấy từ hồ sơ chứ không truyền vào: màn hình này luôn nói về chính mình, và
  /// một tham số id ở đây chỉ mở đường cho việc gọi nhầm sang tài khoản khác.
  ///
  /// Copied from [myFeedback].
  MyFeedbackProvider(ReputationRole role)
    : this._internal(
        (ref) => myFeedback(ref as MyFeedbackRef, role),
        from: myFeedbackProvider,
        name: r'myFeedbackProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$myFeedbackHash,
        dependencies: MyFeedbackFamily._dependencies,
        allTransitiveDependencies: MyFeedbackFamily._allTransitiveDependencies,
        role: role,
      );

  MyFeedbackProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.role,
  }) : super.internal();

  final ReputationRole role;

  @override
  Override overrideWith(
    FutureOr<List<Feedback>> Function(MyFeedbackRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyFeedbackProvider._internal(
        (ref) => create(ref as MyFeedbackRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        role: role,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Feedback>> createElement() {
    return _MyFeedbackProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyFeedbackProvider && other.role == role;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, role.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MyFeedbackRef on AutoDisposeFutureProviderRef<List<Feedback>> {
  /// The parameter `role` of this provider.
  ReputationRole get role;
}

class _MyFeedbackProviderElement
    extends AutoDisposeFutureProviderElement<List<Feedback>>
    with MyFeedbackRef {
  _MyFeedbackProviderElement(super.provider);

  @override
  ReputationRole get role => (origin as MyFeedbackProvider).role;
}

String _$sellerReputationHash() => r'dba7f9d761f633ebcfb4afdca4fd825b6ea133ef';

/// Uy tín người bán của một tài khoản bất kỳ — cái trang sản phẩm giới thiệu
/// người bán bằng, thay cho một câu quảng cáo viết cứng.
///
/// Copied from [sellerReputation].
@ProviderFor(sellerReputation)
const sellerReputationProvider = SellerReputationFamily();

/// Uy tín người bán của một tài khoản bất kỳ — cái trang sản phẩm giới thiệu
/// người bán bằng, thay cho một câu quảng cáo viết cứng.
///
/// Copied from [sellerReputation].
class SellerReputationFamily extends Family<AsyncValue<Reputation>> {
  /// Uy tín người bán của một tài khoản bất kỳ — cái trang sản phẩm giới thiệu
  /// người bán bằng, thay cho một câu quảng cáo viết cứng.
  ///
  /// Copied from [sellerReputation].
  const SellerReputationFamily();

  /// Uy tín người bán của một tài khoản bất kỳ — cái trang sản phẩm giới thiệu
  /// người bán bằng, thay cho một câu quảng cáo viết cứng.
  ///
  /// Copied from [sellerReputation].
  SellerReputationProvider call(String accountId) {
    return SellerReputationProvider(accountId);
  }

  @override
  SellerReputationProvider getProviderOverride(
    covariant SellerReputationProvider provider,
  ) {
    return call(provider.accountId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sellerReputationProvider';
}

/// Uy tín người bán của một tài khoản bất kỳ — cái trang sản phẩm giới thiệu
/// người bán bằng, thay cho một câu quảng cáo viết cứng.
///
/// Copied from [sellerReputation].
class SellerReputationProvider extends AutoDisposeFutureProvider<Reputation> {
  /// Uy tín người bán của một tài khoản bất kỳ — cái trang sản phẩm giới thiệu
  /// người bán bằng, thay cho một câu quảng cáo viết cứng.
  ///
  /// Copied from [sellerReputation].
  SellerReputationProvider(String accountId)
    : this._internal(
        (ref) => sellerReputation(ref as SellerReputationRef, accountId),
        from: sellerReputationProvider,
        name: r'sellerReputationProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$sellerReputationHash,
        dependencies: SellerReputationFamily._dependencies,
        allTransitiveDependencies:
            SellerReputationFamily._allTransitiveDependencies,
        accountId: accountId,
      );

  SellerReputationProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.accountId,
  }) : super.internal();

  final String accountId;

  @override
  Override overrideWith(
    FutureOr<Reputation> Function(SellerReputationRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SellerReputationProvider._internal(
        (ref) => create(ref as SellerReputationRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        accountId: accountId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Reputation> createElement() {
    return _SellerReputationProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SellerReputationProvider && other.accountId == accountId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, accountId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SellerReputationRef on AutoDisposeFutureProviderRef<Reputation> {
  /// The parameter `accountId` of this provider.
  String get accountId;
}

class _SellerReputationProviderElement
    extends AutoDisposeFutureProviderElement<Reputation>
    with SellerReputationRef {
  _SellerReputationProviderElement(super.provider);

  @override
  String get accountId => (origin as SellerReputationProvider).accountId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
