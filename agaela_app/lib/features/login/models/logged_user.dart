import 'dart:collection';

import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/carer.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';

abstract class LoggedUser {
  final int _id;
  final String _name;
  List<PendingForm> _pendingForms;
  final bool _isCarer;
  int _selectedId;
  final String _code;

  LoggedUser(this._id, this._name, this._pendingForms, this._isCarer,
      this._selectedId, this._code);

  int get id => _id;

  String get name => _name;

  UnmodifiableListView<PendingForm> get pendingForms =>
      UnmodifiableListView(_pendingForms);

  set pendingForms(List<PendingForm> pendingForms) =>
      _pendingForms = pendingForms;

  bool get isCarer => _isCarer;

  int get selectedId => _selectedId;

  set selectedId(int id) => _selectedId = id;

  String get code => _code;

  bool isCared() => _id != _selectedId;

  Cared? getActualCared() {
    if (isCared()) {
      return (this as Carer)
          .careds
          .firstWhere((cared) => cared.id == _selectedId);
    } else {
      return null;
    }
  }
}
