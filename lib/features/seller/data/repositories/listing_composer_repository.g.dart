// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_composer_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(listingComposerRepository)
const listingComposerRepositoryProvider = ListingComposerRepositoryProvider._();

final class ListingComposerRepositoryProvider
    extends
        $FunctionalProvider<
          ListingComposerRepository,
          ListingComposerRepository,
          ListingComposerRepository
        >
    with $Provider<ListingComposerRepository> {
  const ListingComposerRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listingComposerRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listingComposerRepositoryHash();

  @$internal
  @override
  $ProviderElement<ListingComposerRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ListingComposerRepository create(Ref ref) {
    return listingComposerRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListingComposerRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListingComposerRepository>(value),
    );
  }
}

String _$listingComposerRepositoryHash() =>
    r'2d6423f930f769dc5d50df17fc59d744ad91acb4';
