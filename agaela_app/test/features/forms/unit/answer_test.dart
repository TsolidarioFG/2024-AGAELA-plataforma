import 'package:agaela_app/features/forms/models/answer.dart';
import 'package:test/test.dart';

void main() {
  test('Question from json method works correctly', () {
    String id = '1';
    String text = 'test';
    String code = 'testing';
    Map<String, dynamic> json = {'id': id, 'texto': text, 'codigo': code};
    Answer example = Answer.fromJson(json);
    expect(example.id.toString(), id);
    expect(example.text, text);
    expect(example.code, code);
  });
}
