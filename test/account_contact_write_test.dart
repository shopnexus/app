import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/contact_address_type.dart';
import 'package:shopnexus_flutter_app/api/generated/model/create_contact_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_contact_request.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// The address book could create but never edit: `contact_id` and
/// `phone_verified` are not fields of `PATCH /contacts/{id}`, and the form
/// always filled the first one in, so every save was a 400 `bad_request_body`.
/// The id belongs in the path.
void main() {
  const id = 'ctc_ben6dg1c315mz';

  group('PATCH /contacts/{id}', () {
    test('the id is the path and nothing else travels in the body', () async {
      final backend = RecordingBackend((_) => const {'data': contactJson});

      await backend.repository.updateContact(
        id,
        UpdateContactRequest(fullName: 'Alice Nguyen'),
      );

      expect(backend.paths.single, 'contacts/$id');
      expect(backend.only.method, 'PATCH');
      expect(backend.bodyOf(0), {'full_name': 'Alice Nguyen'});
    });

    test('emptying a nullable line sends the clear flag, not a null', () async {
      final backend = RecordingBackend((_) => const {'data': contactJson});

      // A null reads as "leave alone" on the way in, so a null here would keep
      // the old unit-and-floor line and answer 200 while nothing changed.
      await backend.repository.updateContact(
        id,
        UpdateContactRequest(clearAddressDetail: true),
      );

      expect(backend.bodyOf(0), {'clear_address_detail': true});
    });

    test(
      'a default is a flag on the contact, not a field on the profile',
      () async {
        final backend = RecordingBackend((_) => const {'data': contactJson});

        await backend.repository.updateContact(
          id,
          UpdateContactRequest(isDefaultDelivery: true),
        );

        expect(backend.paths.single, 'contacts/$id');
        expect(backend.bodyOf(0), {'is_default_delivery': true});
      },
    );
  });

  group('POST /contacts', () {
    test('the address type is the contract enum', () async {
      final backend = RecordingBackend((_) => const {'data': contactJson});

      await backend.repository.createContact(
        CreateContactRequest(
          fullName: 'Alice Nguyen',
          phone: '+84900000001',
          address: 'May To, Hai Phong',
          addressType: ContactAddressType.work,
          country: 'VN',
          provinceCode: '31',
          provinceName: 'Hai Phong',
          wardCode: '11365',
          wardName: 'May To',
        ),
      );

      expect(backend.paths.single, 'contacts');
      expect(backend.only.method, 'POST');
      final body = backend.bodyOf(0);
      expect(body['address_type'], 'work');
      // Vietnam goes province to ward, so nothing invents a district tier.
      expect(body.containsKey('district_code'), isFalse);
      expect(body.containsKey('phone_verified'), isFalse);
    });
  });
}
