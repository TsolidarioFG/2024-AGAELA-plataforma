import 'package:agaela_app/features/edit_profile/models/province.dart';
import 'package:test/test.dart';

void main() {
  test('Province from json method works correctly', () {
    String id = '1';
    String text = 'test';
    String fatherId = '2';
    Map<String, dynamic> json = {'id': id, 'nombre': text, 'idPadre': fatherId};
    Province example = Province.fromJson(json);
    expect(example.provinceCode.toString(), id);
    expect(example.provinceName, text);
    expect(example.countryCode.toString(), fatherId);
  });
}
