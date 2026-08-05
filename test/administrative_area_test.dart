import 'package:flutter_test/flutter_test.dart';
import 'package:shopnexus_flutter_app/api/generated/model/administrative_area.dart';
import 'package:shopnexus_flutter_app/api/generated/model/administrative_area_list.dart';
import 'package:shopnexus_flutter_app/features/account/data/models/account_model.dart';
import 'package:shopnexus_flutter_app/shared/widgets/area_picker_sheet.dart';

/// A code is a zero-padded string in the column and on the wire. Read as a number
/// anywhere on the way through, `'01'` comes back as `1` and matches no province
/// the backend has — which is the whole reason this endpoint exists.
void main() {
  group('an area code stays the padded string it arrived as', () {
    test('a province keeps its leading zero through a round trip', () {
      final area = AdministrativeArea.fromJson(const {
        'code': '01',
        'name': 'Thành phố Hà Nội',
        'kind': 'province',
      });

      expect(area.code, '01');
      expect(area.code, isA<String>());
      expect(area.toJson()['code'], '01');
    });

    test('a ward keeps its five digits', () {
      final area = AdministrativeArea.fromJson(const {
        'code': '26743',
        'name': 'Phường Bến Thành',
        'kind': 'ward',
      });

      expect(area.code, '26743');
      expect(area.kind, AdministrativeAreaKindEnum.ward);
      expect(area.toJson()['code'], '26743');
    });

    test('the list envelope preserves every code as served', () {
      final list = AdministrativeAreaList.fromJson(const {
        'data': [
          {'code': '01', 'name': 'Thành phố Hà Nội', 'kind': 'province'},
          {'code': '79', 'name': 'Thành phố Hồ Chí Minh', 'kind': 'province'},
        ],
      });

      expect(list.data.map((area) => area.code), ['01', '79']);
    });
  });

  group('a saved address carries the picked codes back unchanged', () {
    final province = AdministrativeArea(
      code: '01',
      name: 'Thành phố Hà Nội',
      kind: AdministrativeAreaKindEnum.province,
    );
    final ward = AdministrativeArea(
      code: '00004',
      name: 'Phường Phúc Xá',
      kind: AdministrativeAreaKindEnum.ward,
    );

    CreateContactRequest request() => CreateContactRequest(
      fullName: 'Nguyễn An',
      phone: '+84901234567',
      address: '1 Lê Lợi',
      addressType: 'home',
      country: 'VN',
      provinceCode: province.code,
      provinceName: province.name,
      wardCode: ward.code,
      wardName: ward.name,
    );

    test('the codes are sent exactly as the endpoint spelled them', () {
      final json = request().toJson();

      expect(json['province_code'], '01');
      expect(json['ward_code'], '00004');
    });

    test('no district is written — Vietnam has two tiers', () {
      final json = request().toJson();

      expect(json['district_code'], isNull);
      expect(json['district_name'], isNull);
    });

    test('an absent coordinate is absent, not the origin', () {
      final json = request().toJson();

      expect(json['latitude'], isNull);
      expect(json['longitude'], isNull);
    });
  });

  group('the picker searches the way the name is typed', () {
    final wards = [
      AdministrativeArea(
        code: '26740',
        name: 'Phường Bến Nghé',
        kind: AdministrativeAreaKindEnum.ward,
      ),
      AdministrativeArea(
        code: '26743',
        name: 'Phường Bến Thành',
        kind: AdministrativeAreaKindEnum.ward,
      ),
    ];

    test('diacritics are optional in the query', () {
      expect(areaMatchesQuery(wards[0], 'ben nghe'), isTrue);
      expect(areaMatchesQuery(wards[1], 'ben nghe'), isFalse);
    });

    test('đ folds to d', () {
      expect(foldDiacritics('Đồng Nai'), 'dong nai');
    });

    test('a code is searchable too', () {
      expect(areaMatchesQuery(wards[1], '26743'), isTrue);
      expect(areaMatchesQuery(wards[0], '26743'), isFalse);
    });

    test('an empty query matches everything', () {
      expect(areaMatchesQuery(wards[0], '   '), isTrue);
    });
  });
}
