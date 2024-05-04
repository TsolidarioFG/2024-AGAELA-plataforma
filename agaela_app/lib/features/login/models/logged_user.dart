import 'dart:collection';

import 'package:agaela_app/features/login/models/pending_form.dart';

abstract class LoggedUser {
  final String _name;
  final List<PendingForm> _pendingForms;
  final bool _isCarer;

  LoggedUser(this._name, this._pendingForms, this._isCarer);

  String get name => _name;

  UnmodifiableListView<PendingForm> get pendingForms =>
      UnmodifiableListView(_pendingForms);

  bool get isCarer => _isCarer;
}
