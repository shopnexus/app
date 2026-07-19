import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/data_sources/common_api_service.dart';
import '../../../../shared/models/geocode_model.dart';
import '../../data/models/account_model.dart';
import '../../data/repositories/account_repository.dart';

part 'addresses_provider.g.dart';

@riverpod
Future<List<Contact>> buyerContacts(Ref ref) async {
  final repository = ref.watch(accountRepositoryProvider);
  return repository.getContacts();
}

@riverpod
class AddressesController extends _$AddressesController {
  @override
  FutureOr<void> build() {}

  Future<void> createContact(CreateContactRequest request) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(accountRepositoryProvider);
      await repository.createContact(request);
      ref.invalidate(buyerContactsProvider);
    });
  }

  Future<void> updateContact(UpdateContactRequest request) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(accountRepositoryProvider);
      await repository.updateContact(request);
      ref.invalidate(buyerContactsProvider);
    });
  }

  Future<void> deleteContact(String contactId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(accountRepositoryProvider);
      await repository.deleteContact(contactId);
      ref.invalidate(buyerContactsProvider);
    });
  }
}

// Geocoding Async Actions
@riverpod
Future<List<GeocodeSuggestion>> searchGeocode(Ref ref, String query) async {
  if (query.isEmpty) return [];
  final apiService = ref.watch(commonApiServiceProvider);
  final response = await apiService.searchGeocode(query, 5);
  return response.data;
}

@riverpod
Future<String> reverseGeocode(
  Ref ref,
  double latitude,
  double longitude,
) async {
  final apiService = ref.watch(commonApiServiceProvider);
  final response = await apiService.reverseGeocode(
    ReverseGeocodeRequest(latitude: latitude, longitude: longitude),
  );
  return response.data;
}
