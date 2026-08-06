// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Một đơn sinh ra **hai** thứ chấm điểm, và một nhà cho cả hai vì người dùng thấy
/// một việc:
///
/// - **Feedback** (`/orders/{id}/feedback`) là đánh giá *giao dịch*: **kín** cho tới
///   khi cả hai bên gửi hoặc hết cửa sổ mù, hai bên chấm nhau, và nó cộng vào uy tín
///   của account. Chiều được suy từ việc người gọi đứng ở phía nào của đơn — không
///   ai gửi nó lên.
/// - **Review** (`/listings/{id}/reviews`) là đánh giá *sản phẩm*: công khai ngay, và
///   nó cộng vào `cached_rating` của tin.
///
/// Server đếm chúng ở hai cặp cột riêng trên cùng một hàng, đúng vì một đơn có thể
/// sinh ra cả hai và cộng chung sẽ tính đơn đó hai lần.

@ProviderFor(ratingRepository)
final ratingRepositoryProvider = RatingRepositoryProvider._();

/// Một đơn sinh ra **hai** thứ chấm điểm, và một nhà cho cả hai vì người dùng thấy
/// một việc:
///
/// - **Feedback** (`/orders/{id}/feedback`) là đánh giá *giao dịch*: **kín** cho tới
///   khi cả hai bên gửi hoặc hết cửa sổ mù, hai bên chấm nhau, và nó cộng vào uy tín
///   của account. Chiều được suy từ việc người gọi đứng ở phía nào của đơn — không
///   ai gửi nó lên.
/// - **Review** (`/listings/{id}/reviews`) là đánh giá *sản phẩm*: công khai ngay, và
///   nó cộng vào `cached_rating` của tin.
///
/// Server đếm chúng ở hai cặp cột riêng trên cùng một hàng, đúng vì một đơn có thể
/// sinh ra cả hai và cộng chung sẽ tính đơn đó hai lần.

final class RatingRepositoryProvider
    extends
        $FunctionalProvider<
          RatingRepository,
          RatingRepository,
          RatingRepository
        >
    with $Provider<RatingRepository> {
  /// Một đơn sinh ra **hai** thứ chấm điểm, và một nhà cho cả hai vì người dùng thấy
  /// một việc:
  ///
  /// - **Feedback** (`/orders/{id}/feedback`) là đánh giá *giao dịch*: **kín** cho tới
  ///   khi cả hai bên gửi hoặc hết cửa sổ mù, hai bên chấm nhau, và nó cộng vào uy tín
  ///   của account. Chiều được suy từ việc người gọi đứng ở phía nào của đơn — không
  ///   ai gửi nó lên.
  /// - **Review** (`/listings/{id}/reviews`) là đánh giá *sản phẩm*: công khai ngay, và
  ///   nó cộng vào `cached_rating` của tin.
  ///
  /// Server đếm chúng ở hai cặp cột riêng trên cùng một hàng, đúng vì một đơn có thể
  /// sinh ra cả hai và cộng chung sẽ tính đơn đó hai lần.
  RatingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ratingRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ratingRepositoryHash();

  @$internal
  @override
  $ProviderElement<RatingRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RatingRepository create(Ref ref) {
    return ratingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RatingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RatingRepository>(value),
    );
  }
}

String _$ratingRepositoryHash() => r'cbc43fddacb0629e7ccc4e15b64b879b5204895b';
