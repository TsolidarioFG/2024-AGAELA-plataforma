import 'package:agaela_app/common_widgets/default_icon_form_field.dart';
import 'package:agaela_app/common_widgets/default_send_buttons.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class EditPassword extends StatefulWidget {
  const EditPassword({super.key});

  @override
  State<EditPassword> createState() => _EditPasswordState();
}

class _EditPasswordState extends State<EditPassword> {
  final _editPasswordFormKey = GlobalKey<FormState>();
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _repeatNewPasswordController = TextEditingController();

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
              DefaultSendButtons(
                  sendFunction: () => {},
                  backPage: () => GoRouter.of(context).pop())
            ],
          ),
        ));
  }
}
