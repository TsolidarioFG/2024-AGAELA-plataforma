import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/carer.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';
import 'package:agaela_app/features/login/models/pending_form_carer.dart';
import 'package:agaela_app/features/login/models/pending_form_person_with_als.dart';
import 'package:agaela_app/features/login/models/person_with_als.dart';
import 'package:agaela_app/features/login/services/login_service.dart';

class LoginServiceMock implements LoginService {
  Future<LoggedUser> loginNormalUser() async {
    const error = 'no';
    const errorText = 'error';
    const exampleName = 'example';
    const exampleFormId = 1;
    const id = 1;
    const exampleIsCarer = false;
    List<PendingForm> pendingForms = [PendingFormPersonWithAls(exampleFormId)];
    await Future.delayed(const Duration(seconds: 1));
    if (error == errorText) throw Exception();
    LoggedUser example =
        PersonWithAls(id, exampleName, pendingForms, exampleIsCarer, id);
    return example;
  }

  Future<LoggedUser> loginCarer() async {
    const error = 'no';
    const errorText = 'error';
    const exampleName = 'example';
    const exampleFormId = 1;
    const id = 1;
    const exampleIsCarer = true;
    List<PendingForm> pendingForms = [PendingFormCarer(2, exampleFormId)];
    List<Cared> careds = [
      Cared(2, 'test2', 'test2'),
      Cared(3, 'test3', 'test3')
    ];
    await Future.delayed(const Duration(seconds: 1));
    if (error == errorText) throw Exception();
    LoggedUser example =
        Carer(careds, id, exampleName, pendingForms, exampleIsCarer, id);
    return example;
  }

  @override
  Future<LoggedUser> login(String dni, String password) async {
    return dni == '11111111A' ? loginNormalUser() : loginCarer();
  }
}
