import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_detail.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_listing_request.dart';
import 'package:shopnexus_flutter_app/features/seller/data/models/listing_draft.dart';

/// Những gì màn sửa tin đang giữ, tách khỏi widget để một test cầm được cái
/// body thật sự gửi đi.
///
/// Giá và tồn kho **không** ở đây: chúng thuộc về variant, sửa qua một route
/// khác, và đã có sheet riêng. Gộp vào đây sẽ thành một nút "Lưu" gửi hai
/// request mà một cái hỏng thì người bán không biết nửa nào đã lưu.
class ListingEdit {
  const ListingEdit({
    required this.name,
    required this.description,
    required this.categoryId,
    required this.condition,
    required this.priceMode,
    required this.tags,
  });

  /// Đọc tin hiện tại thành trạng thái ban đầu của form.
  factory ListingEdit.of(ListingDetail listing) => ListingEdit(
    name: listing.name,
    description: listing.description,
    categoryId: listing.category.id,
    condition: listing.condition,
    priceMode: listing.priceMode,
    tags: List.unmodifiable(listing.tags),
  );

  final String name;
  final String description;
  final String categoryId;
  final ListingCondition condition;
  final PriceMode priceMode;
  final List<String> tags;

  ListingEdit copyWith({
    String? name,
    String? description,
    String? categoryId,
    ListingCondition? condition,
    PriceMode? priceMode,
    List<String>? tags,
  }) => ListingEdit(
    name: name ?? this.name,
    description: description ?? this.description,
    categoryId: categoryId ?? this.categoryId,
    condition: condition ?? this.condition,
    priceMode: priceMode ?? this.priceMode,
    tags: tags ?? this.tags,
  );

  /// Tên là thứ duy nhất route đòi phải có.
  bool get isValid => name.trim().isNotEmpty;
}

/// Chỉ những field **thực sự đổi**, hoặc null khi không có gì đổi.
///
/// Đây là toàn bộ lý do hàm này tồn tại: `PATCH /listings/{id}` trên một tin
/// đang bán không sửa tại chỗ — nó tạo một `pending_edit` và tin bị giữ lại chờ
/// kiểm duyệt. Gửi cả form mỗi lần bấm Lưu sẽ đẩy tin vào hàng đợi duyệt kể cả
/// khi người bán chỉ mở ra xem rồi đóng lại, và tin của họ biến mất khỏi sàn vì
/// một thao tác không thay đổi gì.
UpdateListingRequest? listingEditRequest(
  ListingEdit before,
  ListingEdit after,
) {
  final tags = listingTags(after.tags);
  final tagsChanged = !_sameOrder(listingTags(before.tags), tags);

  final name = after.name.trim();
  final description = after.description.trim();

  final request = UpdateListingRequest(
    name: name == before.name.trim() ? null : name,
    // Mô tả xoá được: chuỗi rỗng là một giá trị hợp lệ, không phải "bỏ qua".
    description: description == before.description.trim() ? null : description,
    categoryId: after.categoryId == before.categoryId ? null : after.categoryId,
    condition: after.condition == before.condition ? null : after.condition,
    priceMode: after.priceMode == before.priceMode ? null : after.priceMode,
    tags: tagsChanged ? tags : null,
  );

  return _isEmpty(request) ? null : request;
}

bool _isEmpty(UpdateListingRequest r) =>
    r.name == null &&
    r.description == null &&
    r.categoryId == null &&
    r.condition == null &&
    r.priceMode == null &&
    r.tags == null;

bool _sameOrder(List<String> a, List<String> b) {
  if (a.length != b.length) return false;
  for (var i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}

/// Sửa một tin **đang bán** không hiện ra ngay: nó thành `pending_edit` và tin
/// bị giữ chờ duyệt lại. Người bán phải biết trước khi bấm, chứ không phát hiện
/// khi tin đã rời khỏi sàn.
bool editNeedsReview(ListingStatus status) => status == ListingStatus.active;
