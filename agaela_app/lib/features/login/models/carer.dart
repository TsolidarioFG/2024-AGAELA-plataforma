import 'dart:collection';

import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';

class Carer extends LoggedUser {
  final List<Cared> _careds;

  Carer(this._careds, super._id, super._name, super._pendingForms,
      super._isCarer, super._selectedId, super._code);

  UnmodifiableListView<Cared> get careds => UnmodifiableListView(_careds);

  factory Carer.fromJson(Map<String, dynamic> json, List<Cared> careds,
      List<PendingForm> pendingForms) {
    int id = int.parse(json['id'] as String);
    String name = json['nombre'] as String;
    String code = json['codigo'] as String;
    return Carer(careds, id, name, pendingForms, true, id, code);
  }
}
