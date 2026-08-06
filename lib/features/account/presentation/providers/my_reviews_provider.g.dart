// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_reviews_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Đánh giá người dùng hiện tại nhận được ở một vai.
///
/// Id lấy từ hồ sơ chứ không truyền vào: màn hình này luôn nói về chính mình, và
/// một tham số id ở đây chỉ mở đường cho việc gọi nhầm sang tài khoản khác.

@ProviderFor(myFeedback)
const myFeedbackProvider = MyFeedbackFamily._();

/// Đánh giá người dùng hiện tại nhận được ở một vai.
///
/// Id lấy từ hồ sơ chứ không truyền vào: màn hình này luôn nói về chính mình, và
/// một tham số id ở đây chỉ mở đường cho việc gọi nhầm sang tài khoản khác.

final class MyFeedbackProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Feedback>>,
          List<Feedback>,
          FutureOr<List<Feedback>>
        >
    with $FutureModifier<List<Feedback>>, $FutureProvider<List<Feedback>> {
  /// Đánh giá người dùng hiện tại nhận được ở một vai.
  ///
  /// Id lấy từ hồ sơ chứ không truyền vào: màn hình này luôn nói về chính mình, và
  /// một tham số id ở đây chỉ mở đường cho việc gọi nhầm sang tài khoản khác.
  const MyFeedbackProvider._({
    required MyFeedbackFamily super.from,
    required ReputationRole super.argument,
  }) : super(
         retry: null,
         name: r'myFeedbackProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$myFeedbackHash();

  @override
  String toString() {
    return r'myFeedbackProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<Feedback>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Feedback>> create(Ref ref) {
    final argument = this.argument as ReputationRole;
    return myFeedback(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is MyFeedbackProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$myFeedbackHash() => r'dc1a6efcdd4d3d3285c320336c560901ab176b3f';

/// Đánh giá người dùng hiện tại nhận được ở một vai.
///
/// Id lấy từ hồ sơ chứ không truyền vào: màn hình này luôn nói về chính mình, và
/// một tham số id ở đây chỉ mở đường cho việc gọi nhầm sang tài khoản khác.

final class MyFeedbackFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<Feedback>>, ReputationRole> {
  const MyFeedbackFamily._()
    : super(
        retry: null,
        name: r'myFeedbackProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Đánh giá người dùng hiện tại nhận được ở một vai.
  ///
  /// Id lấy từ hồ sơ chứ không truyền vào: màn hình này luôn nói về chính mình, và
  /// một tham số id ở đây chỉ mở đường cho việc gọi nhầm sang tài khoản khác.

  MyFeedbackProvider call(ReputationRole role) =>
      MyFeedbackProvider._(argument: role, from: this);

  @override
  String toString() => r'myFeedbackProvider';
}
