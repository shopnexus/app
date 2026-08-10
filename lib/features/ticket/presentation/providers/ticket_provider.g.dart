// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ticketDetailHash() => r'aedb9be662d41da101ab3853c2086f542460f3f9';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// Reading a ticket is also what repairs a missing `conversation_id`, so the
/// detail screen asks for it rather than reusing the row from the list.
///
/// Copied from [ticketDetail].
@ProviderFor(ticketDetail)
const ticketDetailProvider = TicketDetailFamily();

/// Reading a ticket is also what repairs a missing `conversation_id`, so the
/// detail screen asks for it rather than reusing the row from the list.
///
/// Copied from [ticketDetail].
class TicketDetailFamily extends Family<AsyncValue<Ticket>> {
  /// Reading a ticket is also what repairs a missing `conversation_id`, so the
  /// detail screen asks for it rather than reusing the row from the list.
  ///
  /// Copied from [ticketDetail].
  const TicketDetailFamily();

  /// Reading a ticket is also what repairs a missing `conversation_id`, so the
  /// detail screen asks for it rather than reusing the row from the list.
  ///
  /// Copied from [ticketDetail].
  TicketDetailProvider call(String id) {
    return TicketDetailProvider(id);
  }

  @override
  TicketDetailProvider getProviderOverride(
    covariant TicketDetailProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ticketDetailProvider';
}

/// Reading a ticket is also what repairs a missing `conversation_id`, so the
/// detail screen asks for it rather than reusing the row from the list.
///
/// Copied from [ticketDetail].
class TicketDetailProvider extends AutoDisposeFutureProvider<Ticket> {
  /// Reading a ticket is also what repairs a missing `conversation_id`, so the
  /// detail screen asks for it rather than reusing the row from the list.
  ///
  /// Copied from [ticketDetail].
  TicketDetailProvider(String id)
    : this._internal(
        (ref) => ticketDetail(ref as TicketDetailRef, id),
        from: ticketDetailProvider,
        name: r'ticketDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$ticketDetailHash,
        dependencies: TicketDetailFamily._dependencies,
        allTransitiveDependencies:
            TicketDetailFamily._allTransitiveDependencies,
        id: id,
      );

  TicketDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    FutureOr<Ticket> Function(TicketDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TicketDetailProvider._internal(
        (ref) => create(ref as TicketDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Ticket> createElement() {
    return _TicketDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TicketDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TicketDetailRef on AutoDisposeFutureProviderRef<Ticket> {
  /// The parameter `id` of this provider.
  String get id;
}

class _TicketDetailProviderElement
    extends AutoDisposeFutureProviderElement<Ticket>
    with TicketDetailRef {
  _TicketDetailProviderElement(super.provider);

  @override
  String get id => (origin as TicketDetailProvider).id;
}

String _$ticketListHash() => r'c40c329790710bac6f2718f4b3e23daedf566a80';

abstract class _$TicketList
    extends BuildlessAutoDisposeAsyncNotifier<List<Ticket>> {
  late final TicketStatus? status;

  FutureOr<List<Ticket>> build({TicketStatus? status});
}

/// The caller's own tickets, newest first. A requester never sees anybody else's,
/// nor which moderator is working theirs.
///
/// Copied from [TicketList].
@ProviderFor(TicketList)
const ticketListProvider = TicketListFamily();

/// The caller's own tickets, newest first. A requester never sees anybody else's,
/// nor which moderator is working theirs.
///
/// Copied from [TicketList].
class TicketListFamily extends Family<AsyncValue<List<Ticket>>> {
  /// The caller's own tickets, newest first. A requester never sees anybody else's,
  /// nor which moderator is working theirs.
  ///
  /// Copied from [TicketList].
  const TicketListFamily();

  /// The caller's own tickets, newest first. A requester never sees anybody else's,
  /// nor which moderator is working theirs.
  ///
  /// Copied from [TicketList].
  TicketListProvider call({TicketStatus? status}) {
    return TicketListProvider(status: status);
  }

  @override
  TicketListProvider getProviderOverride(
    covariant TicketListProvider provider,
  ) {
    return call(status: provider.status);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'ticketListProvider';
}

/// The caller's own tickets, newest first. A requester never sees anybody else's,
/// nor which moderator is working theirs.
///
/// Copied from [TicketList].
class TicketListProvider
    extends AutoDisposeAsyncNotifierProviderImpl<TicketList, List<Ticket>> {
  /// The caller's own tickets, newest first. A requester never sees anybody else's,
  /// nor which moderator is working theirs.
  ///
  /// Copied from [TicketList].
  TicketListProvider({TicketStatus? status})
    : this._internal(
        () => TicketList()..status = status,
        from: ticketListProvider,
        name: r'ticketListProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$ticketListHash,
        dependencies: TicketListFamily._dependencies,
        allTransitiveDependencies: TicketListFamily._allTransitiveDependencies,
        status: status,
      );

  TicketListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.status,
  }) : super.internal();

  final TicketStatus? status;

  @override
  FutureOr<List<Ticket>> runNotifierBuild(covariant TicketList notifier) {
    return notifier.build(status: status);
  }

  @override
  Override overrideWith(TicketList Function() create) {
    return ProviderOverride(
      origin: this,
      override: TicketListProvider._internal(
        () => create()..status = status,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        status: status,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<TicketList, List<Ticket>>
  createElement() {
    return _TicketListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TicketListProvider && other.status == status;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, status.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TicketListRef on AutoDisposeAsyncNotifierProviderRef<List<Ticket>> {
  /// The parameter `status` of this provider.
  TicketStatus? get status;
}

class _TicketListProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<TicketList, List<Ticket>>
    with TicketListRef {
  _TicketListProviderElement(super.provider);

  @override
  TicketStatus? get status => (origin as TicketListProvider).status;
}

String _$raiseTicketHash() => r'03c3e339ec7f4cb8ef6cd3e85e9e68f104c9969a';

/// Raising a ticket, from anywhere: the help centre's form, a listing's report
/// action, a refund the buyer or seller wants staff to decide.
///
/// Gọi bằng `read` chứ không `watch`, nên không gì giữ notifier sống qua cái
/// `await` bên dưới: ghi `state` sau đó ném "Cannot use the Ref ... after it has
/// been disposed" trong khi ticket *đã* được tạo trên server.
/// Không đổi sang `keepAlive`: annotation đó chỉ có hiệu lực sau khi chạy lại
/// codegen. Chặn bằng `ref.mounted` là thay đổi thuần source, và đủ — sheet đã
/// nhận ticket qua giá trị trả về, nên state chỉ còn là thứ để hiển thị.
///
/// Copied from [RaiseTicket].
@ProviderFor(RaiseTicket)
final raiseTicketProvider =
    AutoDisposeNotifierProvider<RaiseTicket, AsyncValue<Ticket?>>.internal(
      RaiseTicket.new,
      name: r'raiseTicketProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$raiseTicketHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$RaiseTicket = AutoDisposeNotifier<AsyncValue<Ticket?>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
