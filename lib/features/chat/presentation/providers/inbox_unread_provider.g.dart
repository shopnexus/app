// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inbox_unread_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Số tin nhắn Chat chưa đọc.

@ProviderFor(inboxUnread)
const inboxUnreadProvider = InboxUnreadProvider._();

/// Số tin nhắn Chat chưa đọc.

final class InboxUnreadProvider
    extends $FunctionalProvider<AsyncValue<int>, int, FutureOr<int>>
    with $FutureModifier<int>, $FutureProvider<int> {
  /// Số tin nhắn Chat chưa đọc.
  const InboxUnreadProvider._()
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

String _$inboxUnreadHash() => r'9c0a4e3432ce08effdd9912be9735a45a98d9cbc';
