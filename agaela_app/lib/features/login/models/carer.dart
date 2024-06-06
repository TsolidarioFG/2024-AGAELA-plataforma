import 'dart:collection';

import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';

class Carer extends LoggedUser {
  final List<Cared> _careds;

  Carer(this._careds, super._id, super._name, super._pendingForms,
      super._isCarer, super._selectedId);

  UnmodifiableListView<Cared> get careds => UnmodifiableListView(_careds);

  factory Carer.fromJson(Map<String, dynamic> json) {
    int id = int.parse(json['data']['perfil']['id'] as String);
    String name = json['data']['perfil']['nombre'] as String;
    return Carer([], id, name, [], true, id);
  }
}
