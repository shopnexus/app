// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// The caller's own tickets, newest first. A requester never sees anybody else's,
/// nor which moderator is working theirs.

@ProviderFor(TicketList)
final ticketListProvider = TicketListFamily._();

/// The caller's own tickets, newest first. A requester never sees anybody else's,
/// nor which moderator is working theirs.
final class TicketListProvider
    extends $AsyncNotifierProvider<TicketList, List<Ticket>> {
  /// The caller's own tickets, newest first. A requester never sees anybody else's,
  /// nor which moderator is working theirs.
  TicketListProvider._({
    required TicketListFamily super.from,
    required TicketStatus? super.argument,
  }) : super(
         retry: null,
         name: r'ticketListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ticketListHash();

  @override
  String toString() {
    return r'ticketListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  TicketList create() => TicketList();

  @override
  bool operator ==(Object other) {
    return other is TicketListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ticketListHash() => r'c40c329790710bac6f2718f4b3e23daedf566a80';

/// The caller's own tickets, newest first. A requester never sees anybody else's,
/// nor which moderator is working theirs.

final class TicketListFamily extends $Family
    with
        $ClassFamilyOverride<
          TicketList,
          AsyncValue<List<Ticket>>,
          List<Ticket>,
          FutureOr<List<Ticket>>,
          TicketStatus?
        > {
  TicketListFamily._()
    : super(
        retry: null,
        name: r'ticketListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// The caller's own tickets, newest first. A requester never sees anybody else's,
  /// nor which moderator is working theirs.

  TicketListProvider call({TicketStatus? status}) =>
      TicketListProvider._(argument: status, from: this);

  @override
  String toString() => r'ticketListProvider';
}

/// The caller's own tickets, newest first. A requester never sees anybody else's,
/// nor which moderator is working theirs.

abstract class _$TicketList extends $AsyncNotifier<List<Ticket>> {
  late final _$args = ref.$arg as TicketStatus?;
  TicketStatus? get status => _$args;

  FutureOr<List<Ticket>> build({TicketStatus? status});
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Ticket>>, List<Ticket>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Ticket>>, List<Ticket>>,
              AsyncValue<List<Ticket>>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, () => build(status: _$args));
  }
}

/// Reading a ticket is also what repairs a missing `conversation_id`, so the
/// detail screen asks for it rather than reusing the row from the list.

@ProviderFor(ticketDetail)
final ticketDetailProvider = TicketDetailFamily._();

/// Reading a ticket is also what repairs a missing `conversation_id`, so the
/// detail screen asks for it rather than reusing the row from the list.

final class TicketDetailProvider
    extends $FunctionalProvider<AsyncValue<Ticket>, Ticket, FutureOr<Ticket>>
    with $FutureModifier<Ticket>, $FutureProvider<Ticket> {
  /// Reading a ticket is also what repairs a missing `conversation_id`, so the
  /// detail screen asks for it rather than reusing the row from the list.
  TicketDetailProvider._({
    required TicketDetailFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'ticketDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$ticketDetailHash();

  @override
  String toString() {
    return r'ticketDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Ticket> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Ticket> create(Ref ref) {
    final argument = this.argument as String;
    return ticketDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is TicketDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$ticketDetailHash() => r'aedb9be662d41da101ab3853c2086f542460f3f9';

/// Reading a ticket is also what repairs a missing `conversation_id`, so the
/// detail screen asks for it rather than reusing the row from the list.

final class TicketDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Ticket>, String> {
  TicketDetailFamily._()
    : super(
        retry: null,
        name: r'ticketDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Reading a ticket is also what repairs a missing `conversation_id`, so the
  /// detail screen asks for it rather than reusing the row from the list.

  TicketDetailProvider call(String id) =>
      TicketDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'ticketDetailProvider';
}

/// Raising a ticket, from anywhere: the help centre's form, a listing's report
/// action, a refund the buyer or seller wants staff to decide.

@ProviderFor(RaiseTicket)
final raiseTicketProvider = RaiseTicketProvider._();

/// Raising a ticket, from anywhere: the help centre's form, a listing's report
/// action, a refund the buyer or seller wants staff to decide.
final class RaiseTicketProvider
    extends $NotifierProvider<RaiseTicket, AsyncValue<Ticket?>> {
  /// Raising a ticket, from anywhere: the help centre's form, a listing's report
  /// action, a refund the buyer or seller wants staff to decide.
  RaiseTicketProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'raiseTicketProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$raiseTicketHash();

  @$internal
  @override
  RaiseTicket create() => RaiseTicket();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AsyncValue<Ticket?> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AsyncValue<Ticket?>>(value),
    );
  }
}

String _$raiseTicketHash() => r'ec491da591f8c71c5c42b474d5a309fff98edfe6';

/// Raising a ticket, from anywhere: the help centre's form, a listing's report
/// action, a refund the buyer or seller wants staff to decide.

abstract class _$RaiseTicket extends $Notifier<AsyncValue<Ticket?>> {
  AsyncValue<Ticket?> build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Ticket?>, AsyncValue<Ticket?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Ticket?>, AsyncValue<Ticket?>>,
              AsyncValue<Ticket?>,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
