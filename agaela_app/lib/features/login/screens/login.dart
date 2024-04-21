import 'package:agaela_app/common_widgets/agaela_image_appbar.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/default_icon_form_field.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _loginFormKey = GlobalKey<FormState>();

  final _dniController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AgaelaImageAppbar(),
      body: Form(
        key: _loginFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DefaultIconFormField(
                controller: _dniController,
                icon: const Icon(Icons.perm_identity),
                text: AppLocalizations.of(context)!.loginDniField,
                sensitiveInformation: false),
            DefaultIconFormField(
                controller: _passwordController,
                icon: const Icon(Icons.lock),
                text: AppLocalizations.of(context)!.loginPasswordField,
                sensitiveInformation: true),
            DefaultButton(
                function: () => {},
                text: AppLocalizations.of(context)!.loginButton),
            TextButton(
                onPressed: () =>
                    context.goNamed(RoutesNames.passwordRecovery.name),
                child:
                    Text(AppLocalizations.of(context)!.loginPasswordRecovery))
          ],
        ),
      ),
    );
  }
}
