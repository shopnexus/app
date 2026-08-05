import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_contact_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_contact_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact.dart';
import 'package:shopnexus_flutter_app/features/account/data/repositories/account_repository.dart';

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

  Future<void> updateContact(
    String contactId,
    UpdateContactRequest request,
  ) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final repository = ref.read(accountRepositoryProvider);
      await repository.updateContact(contactId, request);
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
