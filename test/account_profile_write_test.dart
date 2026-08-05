import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/profile_gender.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_account_request.dart';
import 'package:shopnexus_flutter_app/api/generated/model/update_profile_request.dart';

import 'support/fixtures.dart';
import 'support/recording_backend.dart';

/// `httpx` sets `DisallowUnknownFields`, so one key the contract does not have
/// makes the whole save a 400 `bad_request_body` — which is what every profile
/// edit did while the request carried `username`, `phone`, `email`,
/// `avatar_rs_id` and `default_contact_id`. The identifiers are a different
/// route (`PATCH /me`), not extra fields on this one.
void main() {
  const contractKeys = {
    'name',
    'description',
    'gender',
    'date_of_birth',
    'avatar_resource_id',
    'country',
    'locale',
    'timezone',
    'clear_description',
    'clear_gender',
    'clear_date_of_birth',
    'clear_avatar_resource_id',
  };

  group('PATCH /me/profile', () {
    test('sends only the keys it changes, and only contract keys', () async {
      final backend = RecordingBackend();

      await backend.repository.updateProfile(
        UpdateProfileRequest(
          name: 'Alice Nguyen',
          gender: ProfileGender.female,
        ),
      );

      expect(backend.paths.single, 'me/profile');
      expect(backend.only.method, 'PATCH');
      final body = backend.bodyOf(0);
      expect(body.keys, everyElement(isIn(contractKeys)));
      expect(body, {'name': 'Alice Nguyen', 'gender': 'female'});
    });

    test('gender is the contract enum, never the UI label', () async {
      final backend = RecordingBackend();

      await backend.repository.updateProfile(
        UpdateProfileRequest(gender: ProfileGender.male),
      );

      expect(backend.bodyOf(0)['gender'], 'male');
    });

    test(
      'a birth date goes as a plain day, which is what the route takes',
      () async {
        final backend = RecordingBackend();

        await backend.repository.updateProfile(
          UpdateProfileRequest(dateOfBirth: '1995-04-02'),
        );

        // `format: date` is mapped to String in tool/gen_api.sh: a DateTime field
        // serialises as a full instant, which the route refuses with `rule: date`.
        expect(backend.bodyOf(0)['date_of_birth'], '1995-04-02');
      },
    );

    test('the avatar is avatar_resource_id', () async {
      final backend = RecordingBackend();

      await backend.repository.updateProfile(
        UpdateProfileRequest(avatarResourceId: 'res_cnzz61t6cr7pf'),
      );

      expect(backend.bodyOf(0), {'avatar_resource_id': 'res_cnzz61t6cr7pf'});
    });

    test('a cleared field is the flag, not a null', () async {
      final backend = RecordingBackend();

      await backend.repository.updateProfile(
        UpdateProfileRequest(clearGender: true, clearDateOfBirth: true),
      );

      expect(backend.bodyOf(0), {
        'clear_gender': true,
        'clear_date_of_birth': true,
      });
    });
  });

  group('PATCH /me', () {
    test('an identifier change is its own route and its own body', () async {
      final backend = RecordingBackend((_) => const {'data': meJson});

      await backend.repository.updateAccount(
        UpdateAccountRequest(username: 'alice_shop', phone: '+84900000001'),
      );

      expect(backend.paths.single, 'me');
      expect(backend.only.method, 'PATCH');
      expect(backend.bodyOf(0), {
        'username': 'alice_shop',
        'phone': '+84900000001',
      });
    });
  });
}
