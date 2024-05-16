import 'package:agaela_app/features/edit_functional_state/models/actual_form.dart';
import 'package:flutter/material.dart';

class ActualFormProvider extends ChangeNotifier {
  ActualForm? _actualForm;

  ActualForm? get actualForm => _actualForm;

  void setActualForm(ActualForm? actualForm) {
    _actualForm = actualForm;
    notifyListeners();
  }
}
