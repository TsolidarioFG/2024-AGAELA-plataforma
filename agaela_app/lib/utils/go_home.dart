import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void goToHome(BuildContext context) {
  LoggedUser actualUser =
      Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
  if (actualUser.isCarer) {
    if (actualUser.id != actualUser.selectedId) {
      context.goNamed(RoutesNames.caredHome.name);
    } else {
      context.goNamed(RoutesNames.carerHome.name);
    }
  } else {
    context.goNamed(RoutesNames.home.name);
  }
}
