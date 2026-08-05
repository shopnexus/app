import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:shopnexus_flutter_app/api/generated/model/administrative_area.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

part 'administrative_areas_provider.g.dart';

/// The area vocabulary the address form writes an address in and the browse
/// filter narrows by. It is public, unauthenticated and changes about once a
/// decade, so each level is held for the session instead of refetched every time
/// a picker opens.
@Riverpod(keepAlive: true)
Future<List<AdministrativeArea>> provinces(Ref ref) {
  return ref.watch(accountRepositoryProvider).getAdministrativeAreas();
}

/// A province answers every one of its wards in one response — up to 549 — which
/// is why the picker searches the list rather than scrolling it.
@Riverpod(keepAlive: true)
Future<List<AdministrativeArea>> wards(Ref ref, String provinceCode) {
  return ref
      .watch(accountRepositoryProvider)
      .getAdministrativeAreas(parent: provinceCode);
}
