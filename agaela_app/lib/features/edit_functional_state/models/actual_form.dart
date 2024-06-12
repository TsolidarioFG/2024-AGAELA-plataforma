import 'dart:collection';

import 'package:agaela_app/features/forms/models/question.dart';

class ActualForm {
  final String _formId;
  final String _title;
  final List<Question> _questions;

  ActualForm(this._formId, this._title, this._questions);

  String get title => _title;

  UnmodifiableListView<Question> get questions =>
      UnmodifiableListView(_questions);

  String get formId => _formId;
}
