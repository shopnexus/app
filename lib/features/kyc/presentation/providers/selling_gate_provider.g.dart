// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selling_gate_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sellingEligibilityHash() =>
    r'62b70742a11ba31e8cedd99a4dfbb4b62269326a';

/// Server chặn đăng tin nếu chưa định danh (`identity_required`, 422). App phải
/// biết điều đó *trước* khi mở form: chụp ảnh, tải lên, ghi âm, đợi model chạy
/// rồi mới bị từ chối là bắt người ta trả toàn bộ công sức cho một câu "không".
///
/// `identity_verified` là nguồn duy nhất cho "được bán", đúng cái cờ server đọc.
/// Trạng thái hồ sơ chỉ dùng để *nói* — vì một hồ sơ `verified` nhưng đã hết hạn
/// vẫn làm `identity_verified` false, và lúc đó việc cần làm là nộp lại.
///
/// Copied from [sellingEligibility].
@ProviderFor(sellingEligibility)
final sellingEligibilityProvider =
    AutoDisposeFutureProvider<SellingEligibility>.internal(
      sellingEligibility,
      name: r'sellingEligibilityProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$sellingEligibilityHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SellingEligibilityRef =
    AutoDisposeFutureProviderRef<SellingEligibility>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
