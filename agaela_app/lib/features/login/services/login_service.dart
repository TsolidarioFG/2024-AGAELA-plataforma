import 'package:agaela_app/features/login/models/logged_user.dart';

abstract class LoginService {
  Future<LoggedUser> login(String dni, String password);
}
