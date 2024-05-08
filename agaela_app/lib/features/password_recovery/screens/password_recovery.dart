import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_icon_form_field.dart';
import 'package:agaela_app/common_widgets/default_send_buttons.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/constants/string_utils.dart';
import 'package:agaela_app/features/password_recovery/services/password_recovery_service.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class PasswordRecovery extends StatefulWidget {
  const PasswordRecovery({super.key});

  @override
  State<PasswordRecovery> createState() => _PasswordRecoveryState();
}

class _PasswordRecoveryState extends State<PasswordRecovery> {
  final PasswordRecoveryService _passwordRecoveryService =
      locator<PasswordRecoveryService>();

  final _passwordRecoveryFormKey = GlobalKey<FormState>();

  final _dniController = TextEditingController();

  Future<void>? _request;

  void _startPasswordRecovery() {
    setState(() {
      _request = _passwordRecoveryService.restorePassword(_dniController.text);
      _request!.then(
          (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.check),
              AppLocalizations.of(context)!
                  .passwordRecoverySuccessfulDescription,
              () => context.goNamed(RoutesNames.login.name)),
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.perm_identity),
              AppLocalizations.of(context)!.passwordRecoveryErrorDescription,
              () => GoRouter.of(context).pop()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text: AppLocalizations.of(context)!.passwordRecoveryTitle,
      ),
      body: Form(
        key: _passwordRecoveryFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            DefaultIconFormField(
              controller: _dniController,
              icon: const Icon(Icons.perm_identity),
              text: AppLocalizations.of(context)!.passwordRecoveryDniField,
              sensitiveInformation: false,
              validator: (String? dni) {
                return !dni!.isValidDni
                    ? AppLocalizations.of(context)!.errorDniNotValid
                    : null;
              },
            ),
            FutureBuilder(
                future: _request,
                builder: (BuildContext context, AsyncSnapshot<void> snapshot) =>
                    snapshot.connectionState == ConnectionState.waiting
                        ? const CircularProgressIndicator()
                        : DefaultSendButtons(
                            sendFunction: () => {
                                  if (_passwordRecoveryFormKey.currentState!
                                      .validate())
                                    _startPasswordRecovery()
                                },
                            backPage: () =>
                                context.goNamed(RoutesNames.login.name))),
          ],
        ),
      ),
    );
  }
}
