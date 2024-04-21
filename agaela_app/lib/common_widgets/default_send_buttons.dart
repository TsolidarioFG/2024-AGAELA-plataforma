import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultSendButtons extends StatelessWidget {
  const DefaultSendButtons(
      {super.key, required this.sendFunction, required this.backPage});

  final VoidCallback sendFunction;

  final VoidCallback backPage;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: DefaultButton(
              function: sendFunction,
              text: AppLocalizations.of(context)!.commonSendButtonText)),
      Expanded(
          child: DefaultBackButton(
        backPage: backPage,
      ))
    ]);
  }
}
