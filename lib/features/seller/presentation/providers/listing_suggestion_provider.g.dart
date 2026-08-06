// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_suggestion_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ListingSuggestionNotifier)
final listingSuggestionProvider = ListingSuggestionNotifierProvider._();

final class ListingSuggestionNotifierProvider
    extends
        $NotifierProvider<ListingSuggestionNotifier, ListingSuggestionState> {
  ListingSuggestionNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listingSuggestionProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listingSuggestionNotifierHash();

  @$internal
  @override
  ListingSuggestionNotifier create() => ListingSuggestionNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ListingSuggestionState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ListingSuggestionState>(value),
    );
  }
}

String _$listingSuggestionNotifierHash() =>
    r'40f1a065ee46a740963cb04b643065f64b1ac5d5';

abstract class _$ListingSuggestionNotifier
    extends $Notifier<ListingSuggestionState> {
  ListingSuggestionState build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref =
        this.ref as $Ref<ListingSuggestionState, ListingSuggestionState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ListingSuggestionState, ListingSuggestionState>,
              ListingSuggestionState,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
