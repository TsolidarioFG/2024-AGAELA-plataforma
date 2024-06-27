import 'package:agaela_app/utils/string_utils.dart';
import 'package:test/test.dart';

void main() {
  test('Check is valid email', () {
    String validText = 'a@a.com';
    expect(validText.isValidEmail, true);
  });

  test('Check is valid dni', () {
    String validText = '11111111A';
    expect(validText.isValidDni, true);
  });

  test('Check is valid password', () {
    String validText = '12345678';
    expect(validText.isValidPassword, true);
  });

  test('Check is valid phone', () {
    String validText = '666555444';
    expect(validText.isValidPhone, true);
  });

  test('Check is valid IBAN', () {
    String validText = 'ES9121000418450200051332';
    expect(validText.isValidIban, true);
  });

  test('Check is valid number', () {
    String validText = '10';
    expect(validText.isValidNumber, true);
  });

  test('Check is valid postal code', () {
    String validText = '11111';
    expect(validText.isValidPostalCode, true);
  });

  test('Check is valid percentage', () {
    String validText = '10.5';
    expect(validText.isValidPercentage, true);
  });
}
