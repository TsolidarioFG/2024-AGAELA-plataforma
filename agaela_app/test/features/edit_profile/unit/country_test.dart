import 'package:agaela_app/features/edit_profile/models/country.dart';
import 'package:test/test.dart';

void main() {
  test('Question from json method works correctly', () {
    String id = '1';
    String text = 'test';
    Map<String, dynamic> json = {'id': id, 'nombre': text};
    Country example = Country.fromJson(json);
    expect(example.countryCode.toString(), id);
    expect(example.countryName, text);
  });
}
