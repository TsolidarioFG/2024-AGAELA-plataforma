import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/default_cancel_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultSendCancelButtons extends StatelessWidget {
  const DefaultSendCancelButtons(
      {super.key, required this.sendFunction, required this.cancelFunction});

  final VoidCallback? sendFunction;

  final VoidCallback cancelFunction;

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      Expanded(
          child: DefaultButton(
              function: sendFunction,
              text: AppLocalizations.of(context)!.commonSendButtonText)),
      Expanded(
          child: DefaultCancelButton(
        cancelFunction: cancelFunction,
      ))
    ]);
  }
}
