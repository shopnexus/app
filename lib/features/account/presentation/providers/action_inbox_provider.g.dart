// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'action_inbox_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$actionInboxHash() => r'de580754fcd882769ce2681ea5d8007ea374c112';

/// Số việc đang chờ chính người dùng này, gom từ cả hai vai.
///
/// Mỗi con số hỏi đúng cái nó nói. `summary.open` từng là nguồn cho phần đơn
/// hàng và sai hai lần: `open` là đơn *đã* được xác nhận — nên việc gấp nhất,
/// đơn chờ xác nhận, không nằm trong đó — và summary chỉ tính trong cửa sổ thời
/// gian của nó, nên một đơn cũ hơn cửa sổ đơn giản là biến mất khỏi badge.
///
/// Copied from [actionInbox].
@ProviderFor(actionInbox)
final actionInboxProvider = AutoDisposeFutureProvider<ActionInbox>.internal(
  actionInbox,
  name: r'actionInboxProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$actionInboxHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ActionInboxRef = AutoDisposeFutureProviderRef<ActionInbox>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
