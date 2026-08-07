import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/generated/model/category.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/features/seller/data/models/listing_edit.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/listing_composer_repository.dart';
import 'package:shopnexus_flutter_app/features/seller/data/repositories/seller_repository.dart';

part 'listing_edit_provider.g.dart';

/// Tin đang sửa, đọc nguyên bản từ server chứ không nhận từ thẻ ở màn danh sách.
///
/// Thẻ đó là `Listing` — không mang mô tả, tags hay danh mục — nên một form dựng
/// từ nó sẽ hiện ô trống và người bán bấm Lưu là xoá thật những thứ họ chưa từng
/// thấy.
@riverpod
Future<ListingDetail> listingToEdit(Ref ref, String id) =>
    ref.watch(sellerRepositoryProvider).listingDetail(id);

/// Cây danh mục cho ô chọn. Nhỏ và gần như không đổi, nên giữ lại giữa các lần mở.
@Riverpod(keepAlive: true)
Future<List<Category>> editableCategories(Ref ref) =>
    ref.watch(listingComposerRepositoryProvider).categories();

/// Việc gửi bản sửa đi.
///
/// `keepAlive` vì nó được gọi bằng `read`: autoDispose sẽ vứt notifier ngay khi
/// câu lệnh vừa chạy, rồi lần ghi state sau `await` ném lỗi — nên bản sửa *đã*
/// lưu trên server mà người bán thấy một thông báo thất bại.
@Riverpod(keepAlive: true)
class ListingEditActions extends _$ListingEditActions {
  @override
  ListingEditState build() => const ListingEditState();

  /// Trả về `true` khi đã lưu, `null` khi không có gì để lưu.
  Future<bool?> save(String id, ListingEdit before, ListingEdit after) async {
    final request = listingEditRequest(before, after);
    // Không có gì đổi thì không gửi: một PATCH rỗng vẫn đẩy tin đang bán vào
    // hàng đợi kiểm duyệt, và tin biến mất khỏi sàn vì một lần mở ra rồi đóng.
    if (request == null) return null;

    state = const ListingEditState(isSaving: true);
    try {
      await ref.read(sellerRepositoryProvider).updateListing(id, request);
      state = const ListingEditState();
      ref.invalidate(listingToEditProvider(id));
      return true;
    } catch (error) {
      state = ListingEditState(errorMessage: error.toString());
      return false;
    }
  }
}

class ListingEditState {
  const ListingEditState({this.isSaving = false, this.errorMessage});

  final bool isSaving;
  final String? errorMessage;
}
