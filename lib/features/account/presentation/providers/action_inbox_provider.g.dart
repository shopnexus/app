// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_inbox_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Số việc đang chờ chính người dùng này, gom từ cả hai vai.
///
/// Đây là bản tạm cho phần đơn hàng: `summary.open` đếm mọi đơn còn mở trong cửa
/// sổ thời gian của dashboard, nên nó vừa rộng hơn "chờ tôi giao" vừa bỏ sót đơn
/// cũ hơn cửa sổ đó. Khi `OrderStatus` lên (kế hoạch riêng), đổi nguồn sang
/// `?action_required=true` là con số thành đúng nghĩa và hết phụ thuộc cửa sổ.

@ProviderFor(actionInbox)
const actionInboxProvider = ActionInboxProvider._();

/// Số việc đang chờ chính người dùng này, gom từ cả hai vai.
///
/// Đây là bản tạm cho phần đơn hàng: `summary.open` đếm mọi đơn còn mở trong cửa
/// sổ thời gian của dashboard, nên nó vừa rộng hơn "chờ tôi giao" vừa bỏ sót đơn
/// cũ hơn cửa sổ đó. Khi `OrderStatus` lên (kế hoạch riêng), đổi nguồn sang
/// `?action_required=true` là con số thành đúng nghĩa và hết phụ thuộc cửa sổ.

final class ActionInboxProvider
    extends
        $FunctionalProvider<
          AsyncValue<ActionInbox>,
          ActionInbox,
          FutureOr<ActionInbox>
        >
    with $FutureModifier<ActionInbox>, $FutureProvider<ActionInbox> {
  /// Số việc đang chờ chính người dùng này, gom từ cả hai vai.
  ///
  /// Đây là bản tạm cho phần đơn hàng: `summary.open` đếm mọi đơn còn mở trong cửa
  /// sổ thời gian của dashboard, nên nó vừa rộng hơn "chờ tôi giao" vừa bỏ sót đơn
  /// cũ hơn cửa sổ đó. Khi `OrderStatus` lên (kế hoạch riêng), đổi nguồn sang
  /// `?action_required=true` là con số thành đúng nghĩa và hết phụ thuộc cửa sổ.
  const ActionInboxProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'actionInboxProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$actionInboxHash();

  @$internal
  @override
  $FutureProviderElement<ActionInbox> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<ActionInbox> create(Ref ref) {
    return actionInbox(ref);
  }
}

String _$actionInboxHash() => r'dfd76c86285dbe668b16ca0248d5027f29b0354f';
