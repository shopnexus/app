// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_unread_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Số chưa đọc của Hộp thư, và **chỉ** của Hộp thư: tin nhắn chưa đọc cộng thông
/// báo chưa đọc, đúng hai thứ mà hai tab của nó chứa.
///
/// Không dùng `ActionInbox.total` cho badge này. `total` còn cộng đơn chờ giao và
/// hoàn tiền chờ duyệt — hai thứ không nằm trong Hộp thư — nên một badge "3" đưa
/// người dùng vào Hộp thư để thấy 1 tin nhắn. Badge là kênh thông báo duy nhất ở
/// đây (không push, không SMS), nên nó nói sai ngay lần đầu là mất luôn niềm tin
/// vào mọi lần sau. "Chưa đọc" và "chưa làm" là hai đại lượng khác nhau: con số
/// việc-cần-làm sống trong khối của nó ở trang Tài khoản, sau một lần chạm.
///
/// Mỗi nguồn bọc [countOrZero] riêng: chat hỏng không được xoá số thông báo, vì
/// một badge biến mất và một badge bằng 0 trông giống nhau với người dùng.

@ProviderFor(inboxUnread)
final inboxUnreadProvider = InboxUnreadProvider._();

/// Số chưa đọc của Hộp thư, và **chỉ** của Hộp thư: tin nhắn chưa đọc cộng thông
/// báo chưa đọc, đúng hai thứ mà hai tab của nó chứa.
///
/// Không dùng `ActionInbox.total` cho badge này. `total` còn cộng đơn chờ giao và
/// hoàn tiền chờ duyệt — hai thứ không nằm trong Hộp thư — nên một badge "3" đưa
/// người dùng vào Hộp thư để thấy 1 tin nhắn. Badge là kênh thông báo duy nhất ở
/// đây (không push, không SMS), nên nó nói sai ngay lần đầu là mất luôn niềm tin
/// vào mọi lần sau. "Chưa đọc" và "chưa làm" là hai đại lượng khác nhau: con số
/// việc-cần-làm sống trong khối của nó ở trang Tài khoản, sau một lần chạm.
///
/// Mỗi nguồn bọc [countOrZero] riêng: chat hỏng không được xoá số thông báo, vì
/// một badge biến mất và một badge bằng 0 trông giống nhau với người dùng.

final class InboxUnreadProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  /// Số chưa đọc của Hộp thư, và **chỉ** của Hộp thư: tin nhắn chưa đọc cộng thông
  /// báo chưa đọc, đúng hai thứ mà hai tab của nó chứa.
  ///
  /// Không dùng `ActionInbox.total` cho badge này. `total` còn cộng đơn chờ giao và
  /// hoàn tiền chờ duyệt — hai thứ không nằm trong Hộp thư — nên một badge "3" đưa
  /// người dùng vào Hộp thư để thấy 1 tin nhắn. Badge là kênh thông báo duy nhất ở
  /// đây (không push, không SMS), nên nó nói sai ngay lần đầu là mất luôn niềm tin
  /// vào mọi lần sau. "Chưa đọc" và "chưa làm" là hai đại lượng khác nhau: con số
  /// việc-cần-làm sống trong khối của nó ở trang Tài khoản, sau một lần chạm.
  ///
  /// Mỗi nguồn bọc [countOrZero] riêng: chat hỏng không được xoá số thông báo, vì
  /// một badge biến mất và một badge bằng 0 trông giống nhau với người dùng.
  InboxUnreadProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inboxUnreadProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inboxUnreadHash();

  @$internal
  @override
  $FutureProviderElement<int> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<int> create(Ref ref) {
    return inboxUnread(ref);
  }
}

String _$inboxUnreadHash() => r'956a5a0f1b432d02dc2124a6580c9eab191b81ff';
