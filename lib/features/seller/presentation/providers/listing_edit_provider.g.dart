// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_edit_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Tin đang sửa, đọc nguyên bản từ server chứ không nhận từ thẻ ở màn danh sách.
///
/// Thẻ đó là `Listing` — không mang mô tả, tags hay danh mục — nên một form dựng
/// từ nó sẽ hiện ô trống và người bán bấm Lưu là xoá thật những thứ họ chưa từng
/// thấy.

@ProviderFor(listingToEdit)
final listingToEditProvider = ListingToEditFamily._();

/// Tin đang sửa, đọc nguyên bản từ server chứ không nhận từ thẻ ở màn danh sách.
///
/// Thẻ đó là `Listing` — không mang mô tả, tags hay danh mục — nên một form dựng
/// từ nó sẽ hiện ô trống và người bán bấm Lưu là xoá thật những thứ họ chưa từng
/// thấy.

final class ListingToEditProvider
    extends
        $FunctionalProvider<
          AsyncValue<ListingDetail>,
          ListingDetail,
          FutureOr<ListingDetail>
        >
    with $FutureModifier<ListingDetail>, $FutureProvider<ListingDetail> {
  /// Tin đang sửa, đọc nguyên bản từ server chứ không nhận từ thẻ ở màn danh sách.
  ///
  /// Thẻ đó là `Listing` — không mang mô tả, tags hay danh mục — nên một form dựng
  /// từ nó sẽ hiện ô trống và người bán bấm Lưu là xoá thật những thứ họ chưa từng
  /// thấy.
  ListingToEditProvider._({
    required ListingToEditFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'listingToEditProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$listingToEditHash();

  @override
  String toString() {
    return r'listingToEditProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<ListingDetail> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ListingDetail> create(Ref ref) {
    final argument = this.argument as String;
    return listingToEdit(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ListingToEditProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listingToEditHash() => r'332e141838a36ceb7c7e34bb3d56c74a7ddae795';

/// Tin đang sửa, đọc nguyên bản từ server chứ không nhận từ thẻ ở màn danh sách.
///
/// Thẻ đó là `Listing` — không mang mô tả, tags hay danh mục — nên một form dựng
/// từ nó sẽ hiện ô trống và người bán bấm Lưu là xoá thật những thứ họ chưa từng
/// thấy.

final class ListingToEditFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<ListingDetail>, String> {
  ListingToEditFamily._()
    : super(
        retry: null,
        name: r'listingToEditProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Tin đang sửa, đọc nguyên bản từ server chứ không nhận từ thẻ ở màn danh sách.
  ///
  /// Thẻ đó là `Listing` — không mang mô tả, tags hay danh mục — nên một form dựng
  /// từ nó sẽ hiện ô trống và người bán bấm Lưu là xoá thật những thứ họ chưa từng
  /// thấy.

  ListingToEditProvider call(String id) =>
      ListingToEditProvider._(argument: id, from: this);

  @override
  String toString() => r'listingToEditProvider';
}

/// Cây danh mục cho ô chọn. Nhỏ và gần như không đổi, nên giữ lại giữa các lần mở.

@ProviderFor(editableCategories)
final editableCategoriesProvider = EditableCategoriesProvider._();

/// Cây danh mục cho ô chọn. Nhỏ và gần như không đổi, nên giữ lại giữa các lần mở.

final class EditableCategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Category>>,
          List<Category>,
          FutureOr<List<Category>>
        >
    with $FutureModifier<List<Category>>, $FutureProvider<List<Category>> {
  /// Cây danh mục cho ô chọn. Nhỏ và gần như không đổi, nên giữ lại giữa các lần mở.
  EditableCategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editableCategoriesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editableCategoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<Category>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Category>> create(Ref ref) {
    return editableCategories(ref);
  }
}

String _$editableCategoriesHash() =>
    r'1a84272d8f11c53a8719940ba86b353790ab6c5e';

/// Việc gửi bản sửa đi.
///
/// `keepAlive` vì nó được gọi bằng `read`: autoDispose sẽ vứt notifier ngay khi
/// câu lệnh vừa chạy, rồi lần ghi state sau `await` ném lỗi — nên bản sửa *đã*
/// lưu trên server mà người bán thấy một thông báo thất bại.

@ProviderFor(ListingEditActions)
final listingEditActionsProvider = ListingEditActionsProvider._();

/// Việc gửi bản sửa đi.
///
/// `keepAlive` vì nó được gọi bằng `read`: autoDispose sẽ vứt notifier ngay khi
/// câu lệnh vừa chạy, rồi lần ghi state sau `await` ném lỗi — nên bản sửa *đã*
/// lưu trên server mà người bán thấy một thông báo thất bại.
final class ListingEditActionsProvider
    extends $NotifierProvider<ListingEditActions, ListingEditState> {
  /// Việc gửi bản sửa đi.
  ///
  /// `keepAlive` vì nó được gọi bằng `read`: autoDispose sẽ vứt notifier ngay khi
  /// câu lệnh vừa chạy, rồi lần ghi state sau `await` ném lỗi — nên bản sửa *đã*
  /// lưu trên server mà người bán thấy một thông báo thất bại.
  ListingEditActionsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listingEditActionsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listingEditActionsHash();

  @$internal
  @override
  ListingEditActions create() => ListingEditActions();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListingEditState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListingEditState>(value),
    );
  }
}

String _$listingEditActionsHash() =>
    r'6cdc786333ee3d87ed8c1470ff959d5081c6bc36';

/// Việc gửi bản sửa đi.
///
/// `keepAlive` vì nó được gọi bằng `read`: autoDispose sẽ vứt notifier ngay khi
/// câu lệnh vừa chạy, rồi lần ghi state sau `await` ném lỗi — nên bản sửa *đã*
/// lưu trên server mà người bán thấy một thông báo thất bại.

abstract class _$ListingEditActions extends $Notifier<ListingEditState> {
  ListingEditState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<ListingEditState, ListingEditState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ListingEditState, ListingEditState>,
              ListingEditState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
