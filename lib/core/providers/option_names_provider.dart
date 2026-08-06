import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/api_providers.dart';
import 'package:shopnexus_flutter_app/api/generated/model/option_category_name.dart';

part 'option_names_provider.g.dart';

/// Tên hiển thị của một `option` slug, cho cả hai nhóm dùng nó.
///
/// Một bản ghi đã xong giữ slug làm bằng — `transaction.payment_option`,
/// `transport.option` — nên chỗ nào vẽ nó cũng cần tra tên. Trước đây ba màn in
/// thẳng slug: người mua đọc "sepay-bank-transfer" và "mock-standard" thay vì
/// "Chuyển khoản ngân hàng (SePay)".
///
/// `keepAlive`: danh sách này đổi khi vận hành đổi nó, không đổi theo màn hình, và
/// mỗi lần mở một sheet mà gọi lại là một request cho dữ liệu vừa đọc xong.
@Riverpod(keepAlive: true)
Future<Map<String, String>> optionNames(
  Ref ref,
  OptionCategoryName category,
) async {
  final response = await ref
      .watch(commonApiProvider)
      .optionsGet(category: category);
  final options = response.data?.data.options ?? const [];
  return {for (final option in options) option.id: option.name};
}

/// Tên của một slug, hoặc chính slug khi không tra được.
///
/// Rơi về slug là có thật, không phải phòng xa: `/options` chỉ trả các dòng **đang
/// bật** và có provider được đăng ký, còn một bản ghi cũ vẫn trỏ tới dòng đã tắt.
/// Slug thì xấu nhưng đúng — bịa một cái tên hay để trống chỗ đó thì tệ hơn.
extension OptionNameLookup on AsyncValue<Map<String, String>> {
  String nameOf(String slug) => switch (this) {
    AsyncData(:final value) => value[slug] ?? slug,
    _ => slug,
  };
}
