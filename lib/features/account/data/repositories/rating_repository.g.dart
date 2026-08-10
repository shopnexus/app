// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$ratingRepositoryHash() => r'cbc43fddacb0629e7ccc4e15b64b879b5204895b';

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
///
/// Copied from [ratingRepository].
@ProviderFor(ratingRepository)
final ratingRepositoryProvider = AutoDisposeProvider<RatingRepository>.internal(
  ratingRepository,
  name: r'ratingRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$ratingRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef RatingRepositoryRef = AutoDisposeProviderRef<RatingRepository>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
