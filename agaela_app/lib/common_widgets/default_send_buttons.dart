import 'package:agaela_app/common_widgets/default_action_button.dart';
import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultSendButtons extends StatelessWidget {
  const DefaultSendButtons(
      {super.key, required this.sendFunction, required this.backPage});

  final VoidCallback sendFunction;

  final VoidCallback backPage;

  final double width = 5.0;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      SizedBox(
        width: width,
      ),
      Expanded(
          child: DefaultActionButton(
              function: sendFunction,
              text: AppLocalizations.of(context)!.commonSendButtonText)),
      SizedBox(
        width: width,
      ),
      Expanded(
          child: DefaultBackButton(
        backPage: backPage,
      )),
      SizedBox(
        width: width,
      ),
    ]);
  }
}
