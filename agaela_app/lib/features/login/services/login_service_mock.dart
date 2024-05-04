import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';
import 'package:agaela_app/features/login/models/pending_form_person_with_als.dart';
import 'package:agaela_app/features/login/models/person_with_als.dart';
import 'package:agaela_app/features/login/services/login_service.dart';

class LoginServiceMock implements LoginService {
  @override
  Future<LoggedUser> login(String dni, String password) async {
    const errorText = 'error';
    const exampleName = 'example';
    const exampleFormId = 1;
    const exampleIsCarer = false;
    List<PendingForm> pendingForms = [PendingFormPersonWithAls(exampleFormId)];
    await Future.delayed(const Duration(seconds: 1));
    if (dni == errorText) throw Exception();
    LoggedUser example =
        PersonWithAls(exampleName, pendingForms, exampleIsCarer);
    return example;
  }
}
