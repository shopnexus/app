// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_feedback_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Đánh giá giao dịch của một đơn: của mình, và của bên kia nếu đã tới lúc hiện.
///
/// `mine == null` là "mình chưa đánh giá" — thứ quyết định có mời đánh giá hay
/// không. Đọc từ server chứ không đoán từ trạng thái đơn: một đơn hoàn tất mà đã
/// đánh giá rồi thì mời lần nữa là mời vào một biểu mẫu trả 409.

@ProviderFor(orderFeedback)
const orderFeedbackProvider = OrderFeedbackFamily._();

/// Đánh giá giao dịch của một đơn: của mình, và của bên kia nếu đã tới lúc hiện.
///
/// `mine == null` là "mình chưa đánh giá" — thứ quyết định có mời đánh giá hay
/// không. Đọc từ server chứ không đoán từ trạng thái đơn: một đơn hoàn tất mà đã
/// đánh giá rồi thì mời lần nữa là mời vào một biểu mẫu trả 409.

final class OrderFeedbackProvider
    extends
        $FunctionalProvider<
          AsyncValue<OrderFeedback>,
          OrderFeedback,
          FutureOr<OrderFeedback>
        >
    with $FutureModifier<OrderFeedback>, $FutureProvider<OrderFeedback> {
  /// Đánh giá giao dịch của một đơn: của mình, và của bên kia nếu đã tới lúc hiện.
  ///
  /// `mine == null` là "mình chưa đánh giá" — thứ quyết định có mời đánh giá hay
  /// không. Đọc từ server chứ không đoán từ trạng thái đơn: một đơn hoàn tất mà đã
  /// đánh giá rồi thì mời lần nữa là mời vào một biểu mẫu trả 409.
  const OrderFeedbackProvider._({
    required OrderFeedbackFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'orderFeedbackProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$orderFeedbackHash();

  @override
  String toString() {
    return r'orderFeedbackProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<OrderFeedback> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<OrderFeedback> create(Ref ref) {
    final argument = this.argument as String;
    return orderFeedback(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is OrderFeedbackProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$orderFeedbackHash() => r'649496e4e9a2b5ec1bc6f47bbecab16aadf30a2b';

/// Đánh giá giao dịch của một đơn: của mình, và của bên kia nếu đã tới lúc hiện.
///
/// `mine == null` là "mình chưa đánh giá" — thứ quyết định có mời đánh giá hay
/// không. Đọc từ server chứ không đoán từ trạng thái đơn: một đơn hoàn tất mà đã
/// đánh giá rồi thì mời lần nữa là mời vào một biểu mẫu trả 409.

final class OrderFeedbackFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<OrderFeedback>, String> {
  const OrderFeedbackFamily._()
    : super(
        retry: null,
        name: r'orderFeedbackProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Đánh giá giao dịch của một đơn: của mình, và của bên kia nếu đã tới lúc hiện.
  ///
  /// `mine == null` là "mình chưa đánh giá" — thứ quyết định có mời đánh giá hay
  /// không. Đọc từ server chứ không đoán từ trạng thái đơn: một đơn hoàn tất mà đã
  /// đánh giá rồi thì mời lần nữa là mời vào một biểu mẫu trả 409.

  OrderFeedbackProvider call(String orderId) =>
      OrderFeedbackProvider._(argument: orderId, from: this);

  @override
  String toString() => r'orderFeedbackProvider';
}

/// Những đơn đã mời đánh giá trong phiên này.
///
/// `keepAlive` vì đây là *ký ức của phiên*, không phải state của một màn: người
/// dùng đóng hộp thoại rồi mở lại đúng cái đơn đó thì không được bị hỏi lần nữa,
/// mà provider của màn thì chết theo màn. Không lưu xuống ổ đĩa: mở app lại là
/// một phiên khác, và một lời mời mỗi phiên cho một đơn chưa đánh giá là lời mời
/// chứ không phải cái nag.

@ProviderFor(RateInvitesShown)
const rateInvitesShownProvider = RateInvitesShownProvider._();

/// Những đơn đã mời đánh giá trong phiên này.
///
/// `keepAlive` vì đây là *ký ức của phiên*, không phải state của một màn: người
/// dùng đóng hộp thoại rồi mở lại đúng cái đơn đó thì không được bị hỏi lần nữa,
/// mà provider của màn thì chết theo màn. Không lưu xuống ổ đĩa: mở app lại là
/// một phiên khác, và một lời mời mỗi phiên cho một đơn chưa đánh giá là lời mời
/// chứ không phải cái nag.
final class RateInvitesShownProvider
    extends $NotifierProvider<RateInvitesShown, Set<String>> {
  /// Những đơn đã mời đánh giá trong phiên này.
  ///
  /// `keepAlive` vì đây là *ký ức của phiên*, không phải state của một màn: người
  /// dùng đóng hộp thoại rồi mở lại đúng cái đơn đó thì không được bị hỏi lần nữa,
  /// mà provider của màn thì chết theo màn. Không lưu xuống ổ đĩa: mở app lại là
  /// một phiên khác, và một lời mời mỗi phiên cho một đơn chưa đánh giá là lời mời
  /// chứ không phải cái nag.
  const RateInvitesShownProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'rateInvitesShownProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$rateInvitesShownHash();

  @$internal
  @override
  RateInvitesShown create() => RateInvitesShown();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Set<String> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Set<String>>(value),
    );
  }
}

String _$rateInvitesShownHash() => r'773e883740a288c0c9f3312b02525cdb7030f33b';

/// Những đơn đã mời đánh giá trong phiên này.
///
/// `keepAlive` vì đây là *ký ức của phiên*, không phải state của một màn: người
/// dùng đóng hộp thoại rồi mở lại đúng cái đơn đó thì không được bị hỏi lần nữa,
/// mà provider của màn thì chết theo màn. Không lưu xuống ổ đĩa: mở app lại là
/// một phiên khác, và một lời mời mỗi phiên cho một đơn chưa đánh giá là lời mời
/// chứ không phải cái nag.

abstract class _$RateInvitesShown extends $Notifier<Set<String>> {
  Set<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Set<String>, Set<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Set<String>, Set<String>>,
              Set<String>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
