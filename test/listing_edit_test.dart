import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_condition.dart';
import 'package:shopnexus_flutter_app/api/generated/model/listing_status.dart';
import 'package:shopnexus_flutter_app/api/generated/model/price_mode.dart';
import 'package:shopnexus_flutter_app/features/seller/data/models/listing_edit.dart';

const _before = ListingEdit(
  name: 'Ống đựng đũa',
  description: 'Còn mới',
  categoryId: 'cat_1',
  condition: ListingCondition.used,
  priceMode: PriceMode.fixed,
  tags: ['nha-bep'],
);

void main() {
  // Lý do cả file này tồn tại: `PATCH /listings/{id}` trên tin đang bán không sửa
  // tại chỗ — nó tạo `pending_edit` và tin bị gỡ xuống chờ duyệt. Gửi cả form mỗi
  // lần bấm Lưu nghĩa là mở ra rồi đóng lại cũng làm tin biến mất khỏi sàn.
  test('không đổi gì thì không có request nào', () {
    expect(listingEditRequest(_before, _before), isNull);
  });

  test('khoảng trắng thừa không phải là một thay đổi', () {
    final padded = _before.copyWith(
      name: '  Ống đựng đũa  ',
      description: 'Còn mới  ',
    );
    expect(listingEditRequest(_before, padded), isNull);
  });

  test('chỉ gửi field thực sự đổi', () {
    final after = _before.copyWith(name: 'Ống đựng đũa inox');
    final request = listingEditRequest(_before, after)!;

    expect(request.name, 'Ống đựng đũa inox');
    // Những field còn lại phải vắng mặt, không phải gửi kèm giá trị cũ.
    expect(request.description, isNull);
    expect(request.categoryId, isNull);
    expect(request.condition, isNull);
    expect(request.priceMode, isNull);
    expect(request.tags, isNull);
  });

  test('mô tả xoá được: chuỗi rỗng là một giá trị, không phải "bỏ qua"', () {
    final request = listingEditRequest(_before, _before.copyWith(description: ''))!;
    expect(request.description, '');
  });

  test('thẻ được slug hoá, và đổi thứ tự cũng là đổi', () {
    final request = listingEditRequest(
      _before,
      _before.copyWith(tags: ['Nhà Bếp', 'Đồ  Dùng']),
    )!;
    expect(request.tags, ['nha-bep', 'do-dung']);
  });

  test('thẻ viết hoa khác nhau nhưng ra cùng slug thì không phải thay đổi', () {
    expect(
      listingEditRequest(_before, _before.copyWith(tags: ['NHA-BEP'])),
      isNull,
    );
  });

  // Chỉ tin đang bán mới bị gỡ xuống chờ duyệt; nháp và tin đang ẩn thì không,
  // nên cảnh báo phải nói đúng trạng thái chứ không dọa mọi trường hợp.
  test('chỉ tin đang bán mới cần duyệt lại', () {
    expect(editNeedsReview(ListingStatus.active), isTrue);
    for (final status in [
      ListingStatus.draft,
      ListingStatus.pending,
      ListingStatus.hidden,
    ]) {
      expect(editNeedsReview(status), isFalse, reason: 'status $status');
    }
  });

  test('tiêu đề rỗng thì không lưu được', () {
    expect(_before.copyWith(name: '   ').isValid, isFalse);
    expect(_before.isValid, isTrue);
  });
}
