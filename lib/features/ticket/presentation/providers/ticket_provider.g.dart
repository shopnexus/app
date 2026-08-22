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
const ticketListProvider = TicketListFamily._();

/// The caller's own tickets, newest first. A requester never sees anybody else's,
/// nor which moderator is working theirs.
final class TicketListProvider
    extends $AsyncNotifierProvider<TicketList, List<Ticket>> {
  /// The caller's own tickets, newest first. A requester never sees anybody else's,
  /// nor which moderator is working theirs.
  const TicketListProvider._({
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
  const TicketListFamily._()
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
  void runBuild() {
    final created = build(status: _$args);
    final ref = this.ref as $Ref<AsyncValue<List<Ticket>>, List<Ticket>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Ticket>>, List<Ticket>>,
              AsyncValue<List<Ticket>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Reading a ticket is also what repairs a missing `conversation_id`, so the
/// detail screen asks for it rather than reusing the row from the list.

@ProviderFor(ticketDetail)
const ticketDetailProvider = TicketDetailFamily._();

/// Reading a ticket is also what repairs a missing `conversation_id`, so the
/// detail screen asks for it rather than reusing the row from the list.

final class TicketDetailProvider
    extends $FunctionalProvider<AsyncValue<Ticket>, Ticket, FutureOr<Ticket>>
    with $FutureModifier<Ticket>, $FutureProvider<Ticket> {
  /// Reading a ticket is also what repairs a missing `conversation_id`, so the
  /// detail screen asks for it rather than reusing the row from the list.
  const TicketDetailProvider._({
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
  const TicketDetailFamily._()
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
///
/// Gọi bằng `read` chứ không `watch`, nên không gì giữ notifier sống qua cái
/// `await` bên dưới: ghi `state` sau đó ném "Cannot use the Ref ... after it has
/// been disposed" trong khi ticket *đã* được tạo trên server.
/// Không đổi sang `keepAlive`: annotation đó chỉ có hiệu lực sau khi chạy lại
/// codegen. Chặn bằng `ref.mounted` là thay đổi thuần source, và đủ — sheet đã
/// nhận ticket qua giá trị trả về, nên state chỉ còn là thứ để hiển thị.

@ProviderFor(RaiseTicket)
const raiseTicketProvider = RaiseTicketProvider._();

/// Raising a ticket, from anywhere: the help centre's form, a listing's report
/// action, a refund the buyer or seller wants staff to decide.
///
/// Gọi bằng `read` chứ không `watch`, nên không gì giữ notifier sống qua cái
/// `await` bên dưới: ghi `state` sau đó ném "Cannot use the Ref ... after it has
/// been disposed" trong khi ticket *đã* được tạo trên server.
/// Không đổi sang `keepAlive`: annotation đó chỉ có hiệu lực sau khi chạy lại
/// codegen. Chặn bằng `ref.mounted` là thay đổi thuần source, và đủ — sheet đã
/// nhận ticket qua giá trị trả về, nên state chỉ còn là thứ để hiển thị.
final class RaiseTicketProvider
    extends $NotifierProvider<RaiseTicket, AsyncValue<Ticket?>> {
  /// Raising a ticket, from anywhere: the help centre's form, a listing's report
  /// action, a refund the buyer or seller wants staff to decide.
  ///
  /// Gọi bằng `read` chứ không `watch`, nên không gì giữ notifier sống qua cái
  /// `await` bên dưới: ghi `state` sau đó ném "Cannot use the Ref ... after it has
  /// been disposed" trong khi ticket *đã* được tạo trên server.
  /// Không đổi sang `keepAlive`: annotation đó chỉ có hiệu lực sau khi chạy lại
  /// codegen. Chặn bằng `ref.mounted` là thay đổi thuần source, và đủ — sheet đã
  /// nhận ticket qua giá trị trả về, nên state chỉ còn là thứ để hiển thị.
  const RaiseTicketProvider._()
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

abstract class _$RaiseTicket extends $Notifier<AsyncValue<Ticket?>> {
  AsyncValue<Ticket?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<Ticket?>, AsyncValue<Ticket?>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Ticket?>, AsyncValue<Ticket?>>,
              AsyncValue<Ticket?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Ticket theo thread của nó, để một hàng trong hộp thư tự gọi được tên mình.
///
/// Bên kia của một thread hỗ trợ là cả sàn, nên tên đối phương không nói được gì:
/// hàng ấy phải mang chủ đề của yêu cầu và trạng thái của nó. Một lượt đọc cho cả
/// danh sách — ticket là một hàng ở module khác, còn cuộc trò chuyện chỉ mang id
/// của nó.
///
/// Ticket chưa có `conversation_id` thì không vào map: nó chưa có thread nào để
/// đặt tên cho.

@ProviderFor(ticketsByConversation)
const ticketsByConversationProvider = TicketsByConversationProvider._();

/// Ticket theo thread của nó, để một hàng trong hộp thư tự gọi được tên mình.
///
/// Bên kia của một thread hỗ trợ là cả sàn, nên tên đối phương không nói được gì:
/// hàng ấy phải mang chủ đề của yêu cầu và trạng thái của nó. Một lượt đọc cho cả
/// danh sách — ticket là một hàng ở module khác, còn cuộc trò chuyện chỉ mang id
/// của nó.
///
/// Ticket chưa có `conversation_id` thì không vào map: nó chưa có thread nào để
/// đặt tên cho.

final class TicketsByConversationProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, Ticket>>,
          Map<String, Ticket>,
          FutureOr<Map<String, Ticket>>
        >
    with
        $FutureModifier<Map<String, Ticket>>,
        $FutureProvider<Map<String, Ticket>> {
  /// Ticket theo thread của nó, để một hàng trong hộp thư tự gọi được tên mình.
  ///
  /// Bên kia của một thread hỗ trợ là cả sàn, nên tên đối phương không nói được gì:
  /// hàng ấy phải mang chủ đề của yêu cầu và trạng thái của nó. Một lượt đọc cho cả
  /// danh sách — ticket là một hàng ở module khác, còn cuộc trò chuyện chỉ mang id
  /// của nó.
  ///
  /// Ticket chưa có `conversation_id` thì không vào map: nó chưa có thread nào để
  /// đặt tên cho.
  const TicketsByConversationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ticketsByConversationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ticketsByConversationHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, Ticket>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, Ticket>> create(Ref ref) {
    return ticketsByConversation(ref);
  }
}

String _$ticketsByConversationHash() =>
    r'5a0e793f4abb1dd48c1dfc0b89f65a6c8c162caa';
