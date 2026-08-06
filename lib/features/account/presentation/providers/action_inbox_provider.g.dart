// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_inbox_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Số việc đang chờ chính người dùng này, gom từ cả hai vai.
///
/// Mỗi con số hỏi đúng cái nó nói. `summary.open` từng là nguồn cho phần đơn
/// hàng và sai hai lần: `open` là đơn *đã* được xác nhận — nên việc gấp nhất,
/// đơn chờ xác nhận, không nằm trong đó — và summary chỉ tính trong cửa sổ thời
/// gian của nó, nên một đơn cũ hơn cửa sổ đơn giản là biến mất khỏi badge.

@ProviderFor(actionInbox)
const actionInboxProvider = ActionInboxProvider._();

/// Số việc đang chờ chính người dùng này, gom từ cả hai vai.
///
/// Mỗi con số hỏi đúng cái nó nói. `summary.open` từng là nguồn cho phần đơn
/// hàng và sai hai lần: `open` là đơn *đã* được xác nhận — nên việc gấp nhất,
/// đơn chờ xác nhận, không nằm trong đó — và summary chỉ tính trong cửa sổ thời
/// gian của nó, nên một đơn cũ hơn cửa sổ đơn giản là biến mất khỏi badge.

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
  /// Mỗi con số hỏi đúng cái nó nói. `summary.open` từng là nguồn cho phần đơn
  /// hàng và sai hai lần: `open` là đơn *đã* được xác nhận — nên việc gấp nhất,
  /// đơn chờ xác nhận, không nằm trong đó — và summary chỉ tính trong cửa sổ thời
  /// gian của nó, nên một đơn cũ hơn cửa sổ đơn giản là biến mất khỏi badge.
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

String _$actionInboxHash() => r'e1e06d40811a945dd8c4ac6ad23ccea2ba41c956';
