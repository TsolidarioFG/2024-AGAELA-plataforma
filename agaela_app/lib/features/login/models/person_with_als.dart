import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';

class PersonWithAls extends LoggedUser {
  PersonWithAls(super._id, super._name, super._pendingForms, super._isCarer,
      super._selectedId, super._code);

  factory PersonWithAls.fromJson(Map<String, dynamic> json, String partnerCode,
      List<PendingForm> pendingForms) {
    int id = int.parse(json['data']['perfil']['id'] as String);
    String name = json['data']['perfil']['nombre'] as String;
    return PersonWithAls(id, name, pendingForms, false, id, partnerCode);
  }
}
