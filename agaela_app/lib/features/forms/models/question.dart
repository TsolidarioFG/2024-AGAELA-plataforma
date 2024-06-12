import 'dart:collection';

import 'package:agaela_app/features/forms/models/answer.dart';

class Question {
  final int _id;
  final String _code;
  final String _title;
  final List<Answer> _answers;

  Question(this._id, this._code, this._title, this._answers);

  int get id => _id;

  String get code => _code;

  String get title => _title;

  UnmodifiableListView<Answer> get answers => UnmodifiableListView(_answers);

  factory Question.fromJson(Map<String, dynamic> json) {
    int id = int.parse(json['id'] as String);
    String code = json['codigo'] as String;
    String text = json['texto'] as String;
    Iterable answersJson = json['respuestas'];
    List<Answer> answers =
        List<Answer>.from(answersJson.map((answer) => Answer.fromJson(answer)));
    return Question(id, code, text, answers);
  }
}
