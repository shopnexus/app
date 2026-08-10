// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_edit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listingToEditHash() => r'332e141838a36ceb7c7e34bb3d56c74a7ddae795';

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

/// Tin đang sửa, đọc nguyên bản từ server chứ không nhận từ thẻ ở màn danh sách.
///
/// Thẻ đó là `Listing` — không mang mô tả, tags hay danh mục — nên một form dựng
/// từ nó sẽ hiện ô trống và người bán bấm Lưu là xoá thật những thứ họ chưa từng
/// thấy.
///
/// Copied from [listingToEdit].
@ProviderFor(listingToEdit)
const listingToEditProvider = ListingToEditFamily();

/// Tin đang sửa, đọc nguyên bản từ server chứ không nhận từ thẻ ở màn danh sách.
///
/// Thẻ đó là `Listing` — không mang mô tả, tags hay danh mục — nên một form dựng
/// từ nó sẽ hiện ô trống và người bán bấm Lưu là xoá thật những thứ họ chưa từng
/// thấy.
///
/// Copied from [listingToEdit].
class ListingToEditFamily extends Family<AsyncValue<ListingDetail>> {
  /// Tin đang sửa, đọc nguyên bản từ server chứ không nhận từ thẻ ở màn danh sách.
  ///
  /// Thẻ đó là `Listing` — không mang mô tả, tags hay danh mục — nên một form dựng
  /// từ nó sẽ hiện ô trống và người bán bấm Lưu là xoá thật những thứ họ chưa từng
  /// thấy.
  ///
  /// Copied from [listingToEdit].
  const ListingToEditFamily();

  /// Tin đang sửa, đọc nguyên bản từ server chứ không nhận từ thẻ ở màn danh sách.
  ///
  /// Thẻ đó là `Listing` — không mang mô tả, tags hay danh mục — nên một form dựng
  /// từ nó sẽ hiện ô trống và người bán bấm Lưu là xoá thật những thứ họ chưa từng
  /// thấy.
  ///
  /// Copied from [listingToEdit].
  ListingToEditProvider call(String id) {
    return ListingToEditProvider(id);
  }

  @override
  ListingToEditProvider getProviderOverride(
    covariant ListingToEditProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listingToEditProvider';
}

/// Tin đang sửa, đọc nguyên bản từ server chứ không nhận từ thẻ ở màn danh sách.
///
/// Thẻ đó là `Listing` — không mang mô tả, tags hay danh mục — nên một form dựng
/// từ nó sẽ hiện ô trống và người bán bấm Lưu là xoá thật những thứ họ chưa từng
/// thấy.
///
/// Copied from [listingToEdit].
class ListingToEditProvider extends AutoDisposeFutureProvider<ListingDetail> {
  /// Tin đang sửa, đọc nguyên bản từ server chứ không nhận từ thẻ ở màn danh sách.
  ///
  /// Thẻ đó là `Listing` — không mang mô tả, tags hay danh mục — nên một form dựng
  /// từ nó sẽ hiện ô trống và người bán bấm Lưu là xoá thật những thứ họ chưa từng
  /// thấy.
  ///
  /// Copied from [listingToEdit].
  ListingToEditProvider(String id)
    : this._internal(
        (ref) => listingToEdit(ref as ListingToEditRef, id),
        from: listingToEditProvider,
        name: r'listingToEditProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$listingToEditHash,
        dependencies: ListingToEditFamily._dependencies,
        allTransitiveDependencies:
            ListingToEditFamily._allTransitiveDependencies,
        id: id,
      );

  ListingToEditProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<ListingDetail> Function(ListingToEditRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListingToEditProvider._internal(
        (ref) => create(ref as ListingToEditRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ListingDetail> createElement() {
    return _ListingToEditProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListingToEditProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ListingToEditRef on AutoDisposeFutureProviderRef<ListingDetail> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ListingToEditProviderElement
    extends AutoDisposeFutureProviderElement<ListingDetail>
    with ListingToEditRef {
  _ListingToEditProviderElement(super.provider);

  @override
  String get id => (origin as ListingToEditProvider).id;
}

String _$editableCategoriesHash() =>
    r'1a84272d8f11c53a8719940ba86b353790ab6c5e';

/// Cây danh mục cho ô chọn. Nhỏ và gần như không đổi, nên giữ lại giữa các lần mở.
///
/// Copied from [editableCategories].
@ProviderFor(editableCategories)
final editableCategoriesProvider = FutureProvider<List<Category>>.internal(
  editableCategories,
  name: r'editableCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$editableCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef EditableCategoriesRef = FutureProviderRef<List<Category>>;
String _$listingEditActionsHash() =>
    r'6cdc786333ee3d87ed8c1470ff959d5081c6bc36';

/// Việc gửi bản sửa đi.
///
/// `keepAlive` vì nó được gọi bằng `read`: autoDispose sẽ vứt notifier ngay khi
/// câu lệnh vừa chạy, rồi lần ghi state sau `await` ném lỗi — nên bản sửa *đã*
/// lưu trên server mà người bán thấy một thông báo thất bại.
///
/// Copied from [ListingEditActions].
@ProviderFor(ListingEditActions)
final listingEditActionsProvider =
    NotifierProvider<ListingEditActions, ListingEditState>.internal(
      ListingEditActions.new,
      name: r'listingEditActionsProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$listingEditActionsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ListingEditActions = Notifier<ListingEditState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
