import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:flutter/material.dart';

class LoggedUserProvider extends ChangeNotifier {
  LoggedUser? _loggedUser;

  LoggedUser? get loggedUser => _loggedUser;

  void setLoggedUser(LoggedUser user) {
    _loggedUser = user;
    notifyListeners();
  }
}
