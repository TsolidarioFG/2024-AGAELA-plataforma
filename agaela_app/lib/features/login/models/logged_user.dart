import 'dart:collection';

import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/carer.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';

abstract class LoggedUser {
  final int _id;
  final String _name;
  final List<PendingForm> _pendingForms;
  final bool _isCarer;
  final int _selectedId;

  LoggedUser(this._id, this._name, this._pendingForms, this._isCarer,
      this._selectedId);

  int get id => _id;

  String get name => _name;

  UnmodifiableListView<PendingForm> get pendingForms =>
      UnmodifiableListView(_pendingForms);

  bool get isCarer => _isCarer;

  int get selectedId => _selectedId;

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
