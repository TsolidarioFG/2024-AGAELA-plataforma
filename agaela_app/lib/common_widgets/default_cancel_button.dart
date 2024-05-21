import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultCancelButton extends StatelessWidget {
  const DefaultCancelButton({super.key, required this.cancelFunction});

  final VoidCallback cancelFunction;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            overlayColor: MaterialStateProperty.all<Color>(Colors.redAccent),
            minimumSize: MaterialStateProperty.all<Size>(const Size(200, 70)),
            maximumSize: MaterialStateProperty.all<Size>(const Size(300, 200))),
        onPressed: cancelFunction,
        child: Text(AppLocalizations.of(context)!.commonErrorButtonText));
  }
}
