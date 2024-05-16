import 'dart:collection';

import 'package:agaela_app/features/forms/models/answer.dart';

class Question {
  final int _id;
  final String _title;
  final List<Answer> _answers;

  Question(this._id, this._title, this._answers);

  int get id => _id;

  String get title => _title;

  UnmodifiableListView<Answer> get answers => UnmodifiableListView(_answers);
}
