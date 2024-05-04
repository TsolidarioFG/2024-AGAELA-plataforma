import 'dart:collection';

import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';

class Carer extends LoggedUser {
  final List<Cared> _careds;

  Carer(this._careds, super._name, super._pendingForms, super._isCarer);

  UnmodifiableListView<Cared> get careds => UnmodifiableListView(_careds);
}
