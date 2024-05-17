import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NoChangesButton extends StatelessWidget {
  const NoChangesButton({super.key, required this.noChangesFunction});

  final VoidCallback? noChangesFunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          overlayColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
          minimumSize: MaterialStateProperty.all<Size>(const Size(200, 100)),
          maximumSize: MaterialStateProperty.all<Size>(const Size(300, 200))),
      onPressed: noChangesFunction,
      child: Text(
          AppLocalizations.of(context)!.editFunctionalStateNoChangesButton),
    );
  }
}
