import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_icon_form_field.dart';
import 'package:agaela_app/common_widgets/default_send_buttons.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/edit_password/services/edit_password_service.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final EditPasswordService _editPasswordService =
      locator<EditPasswordService>();

  final _editPasswordFormKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _repeatNewPasswordController = TextEditingController();

  Future<void>? _request;

  bool _arePasswordsTheSame() {
    if (_newPasswordController.text != _repeatNewPasswordController.text) {
      showDefaultAlertDialog(
          context,
          const Icon(Icons.no_encryption),
          AppLocalizations.of(context)!.editPasswordErrorPasswordsNotMatch,
          () => GoRouter.of(context).pop());
      return false;
    }
    return true;
  }

  void _startEditPassword() {
    if (_arePasswordsTheSame()) {
      setState(() {
        _request = _editPasswordService.editPassword(
            _oldPasswordController.text, _newPasswordController.text);
        _request!.then(
            (_) => showDefaultAlertDialog(
                context,
                const Icon(Icons.done),
                AppLocalizations.of(context)!.editPasswordSuccessfulDescription,
                () => Provider.of<LoggedUserProvider>(context, listen: false)
                        .loggedUser!
                        .isCarer
                    ? () => {}
                    : context.goNamed(RoutesNames.home.name)),
            onError: (_) => showDefaultAlertDialog(
                context,
                const Icon(Icons.priority_high),
                AppLocalizations.of(context)!.editPasswordErrorDescription,
                () => GoRouter.of(context).pop()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppbar(
          text: AppLocalizations.of(context)!.editPasswordTitle,
        ),
        body: Form(
          key: _editPasswordFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              DefaultIconFormField(
                  controller: _oldPasswordController,
                  icon: const Icon(Icons.lock),
                  text: AppLocalizations.of(context)!
                      .editPasswordOldPasswordField,
                  sensitiveInformation: true),
              DefaultIconFormField(
                  controller: _newPasswordController,
                  icon: const Icon(Icons.lock),
                  text: AppLocalizations.of(context)!
                      .editPasswordNewPasswordField,
                  sensitiveInformation: true),
              DefaultIconFormField(
                  controller: _repeatNewPasswordController,
                  icon: const Icon(Icons.lock),
                  text: AppLocalizations.of(context)!
                      .editPasswordRepeatNewPassword,
                  sensitiveInformation: true),
              FutureBuilder(
                  future: _request,
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) =>
                          snapshot.connectionState == ConnectionState.waiting
                              ? const CircularProgressIndicator()
                              : DefaultSendButtons(
                                  sendFunction: () => _startEditPassword(),
                                  backPage: () => GoRouter.of(context).pop())),
            ],
          ),
        ));
  }
}
