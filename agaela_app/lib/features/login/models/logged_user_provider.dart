import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:flutter/material.dart';

class LoggedUserProvider extends ChangeNotifier {
  LoggedUser? loggedUser;
  LoggedUserProvider({this.loggedUser});

  void setLoggedUser(LoggedUser user) {
    loggedUser = user;
    notifyListeners();
  }
}
