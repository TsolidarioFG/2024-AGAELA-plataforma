import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String getCaredName(BuildContext context) {
  LoggedUser actualUser =
      Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
  Cared? actualCared = actualUser.getActualCared();
  if (actualCared != null) {
    return actualCared.name;
  } else {
    return '';
  }
}
