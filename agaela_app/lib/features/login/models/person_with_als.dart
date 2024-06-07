import 'package:agaela_app/features/login/models/logged_user.dart';

class PersonWithAls extends LoggedUser {
  PersonWithAls(super._id, super._name, super._pendingForms, super._isCarer,
      super._selectedId, super._code);

  factory PersonWithAls.fromJson(Map<String, dynamic> json) {
    int id = int.parse(json['data']['perfil']['id'] as String);
    String name = json['data']['perfil']['nombre'] as String;
    String code = json['data']['perfil']['codigo'] as String;
    return PersonWithAls(id, name, [], false, id, code);
  }
}
