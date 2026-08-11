// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_uploader.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(resourceUploader)
const resourceUploaderProvider = ResourceUploaderProvider._();

final class ResourceUploaderProvider
    extends
        $FunctionalProvider<
          ResourceUploader,
          ResourceUploader,
          ResourceUploader
        >
    with $Provider<ResourceUploader> {
  const ResourceUploaderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'resourceUploaderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$resourceUploaderHash();

  @$internal
  @override
  $ProviderElement<ResourceUploader> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ResourceUploader create(Ref ref) {
    return resourceUploader(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ResourceUploader value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ResourceUploader>(value),
    );
  }
}

String _$resourceUploaderHash() => r'75099405081cd5863cb27e902ebe13d4566a89db';
