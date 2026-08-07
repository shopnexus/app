// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selling_gate_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Server chặn đăng tin nếu chưa định danh (`identity_required`, 422). App phải
/// biết điều đó *trước* khi mở form: chụp ảnh, tải lên, ghi âm, đợi model chạy
/// rồi mới bị từ chối là bắt người ta trả toàn bộ công sức cho một câu "không".
///
/// `identity_verified` là nguồn duy nhất cho "được bán", đúng cái cờ server đọc.
/// Trạng thái hồ sơ chỉ dùng để *nói* — vì một hồ sơ `verified` nhưng đã hết hạn
/// vẫn làm `identity_verified` false, và lúc đó việc cần làm là nộp lại.

@ProviderFor(sellingEligibility)
const sellingEligibilityProvider = SellingEligibilityProvider._();

/// Server chặn đăng tin nếu chưa định danh (`identity_required`, 422). App phải
/// biết điều đó *trước* khi mở form: chụp ảnh, tải lên, ghi âm, đợi model chạy
/// rồi mới bị từ chối là bắt người ta trả toàn bộ công sức cho một câu "không".
///
/// `identity_verified` là nguồn duy nhất cho "được bán", đúng cái cờ server đọc.
/// Trạng thái hồ sơ chỉ dùng để *nói* — vì một hồ sơ `verified` nhưng đã hết hạn
/// vẫn làm `identity_verified` false, và lúc đó việc cần làm là nộp lại.

final class SellingEligibilityProvider
    extends
        $FunctionalProvider<
          AsyncValue<SellingEligibility>,
          SellingEligibility,
          FutureOr<SellingEligibility>
        >
    with
        $FutureModifier<SellingEligibility>,
        $FutureProvider<SellingEligibility> {
  /// Server chặn đăng tin nếu chưa định danh (`identity_required`, 422). App phải
  /// biết điều đó *trước* khi mở form: chụp ảnh, tải lên, ghi âm, đợi model chạy
  /// rồi mới bị từ chối là bắt người ta trả toàn bộ công sức cho một câu "không".
  ///
  /// `identity_verified` là nguồn duy nhất cho "được bán", đúng cái cờ server đọc.
  /// Trạng thái hồ sơ chỉ dùng để *nói* — vì một hồ sơ `verified` nhưng đã hết hạn
  /// vẫn làm `identity_verified` false, và lúc đó việc cần làm là nộp lại.
  const SellingEligibilityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sellingEligibilityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sellingEligibilityHash();

  @$internal
  @override
  $FutureProviderElement<SellingEligibility> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SellingEligibility> create(Ref ref) {
    return sellingEligibility(ref);
  }
}

String _$sellingEligibilityHash() =>
    r'62b70742a11ba31e8cedd99a4dfbb4b62269326a';
