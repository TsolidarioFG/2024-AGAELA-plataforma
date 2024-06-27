import 'package:agaela_app/features/forms/models/question.dart';
import 'package:test/test.dart';

void main() {
  test('Question from json method works correctly', () {
    String id = '1';
    String text = 'test';
    String code = 'testing';
    Map<String, dynamic> json = {
      'id': id,
      'texto': text,
      'codigo': code,
      'respuestas': []
    };
    Question example = Question.fromJson(json);
    expect(example.id.toString(), id);
    expect(example.title, text);
    expect(example.code, code);
    expect(example.answers, []);
  });
}
