// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(profile)
const profileProvider = ProfileProvider._();

final class ProfileProvider
    extends
        $FunctionalProvider<
          AsyncValue<AccountProfile>,
          AccountProfile,
          FutureOr<AccountProfile>
        >
    with $FutureModifier<AccountProfile>, $FutureProvider<AccountProfile> {
  const ProfileProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'profileProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$profileHash();

  @$internal
  @override
  $FutureProviderElement<AccountProfile> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<AccountProfile> create(Ref ref) {
    return profile(ref);
  }
}

String _$profileHash() => r'6dff79fce6bbff2c7916a56488b501c1f87375c0';

@ProviderFor(publicProfile)
const publicProfileProvider = PublicProfileFamily._();

final class PublicProfileProvider
    extends
        $FunctionalProvider<
          AsyncValue<PublicAccount>,
          PublicAccount,
          FutureOr<PublicAccount>
        >
    with $FutureModifier<PublicAccount>, $FutureProvider<PublicAccount> {
  const PublicProfileProvider._({
    required PublicProfileFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'publicProfileProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$publicProfileHash();

  @override
  String toString() {
    return r'publicProfileProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PublicAccount> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PublicAccount> create(Ref ref) {
    final argument = this.argument as String;
    return publicProfile(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is PublicProfileProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$publicProfileHash() => r'34d64cd73a71c9663e0919fc480853985677a1c2';

final class PublicProfileFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PublicAccount>, String> {
  const PublicProfileFamily._()
    : super(
        retry: null,
        name: r'publicProfileProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  PublicProfileProvider call(String accountId) =>
      PublicProfileProvider._(argument: accountId, from: this);

  @override
  String toString() => r'publicProfileProvider';
}

@ProviderFor(AccountController)
const accountControllerProvider = AccountControllerProvider._();

final class AccountControllerProvider
    extends $AsyncNotifierProvider<AccountController, void> {
  const AccountControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'accountControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$accountControllerHash();

  @$internal
  @override
  AccountController create() => AccountController();
}

String _$accountControllerHash() => r'df471519f63af31022b1d9ec156c87bdf47e264a';

abstract class _$AccountController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
