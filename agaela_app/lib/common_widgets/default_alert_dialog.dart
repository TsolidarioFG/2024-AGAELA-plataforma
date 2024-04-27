import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void showDefaultAlertDialog(BuildContext context, Icon icon, String description,
    VoidCallback onPressed) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: icon,
          content: Text(description),
          actions: <Widget>[
            Center(
              child: ElevatedButton(
                onPressed: onPressed,
                child: Text(AppLocalizations.of(context)!.commonOkText),
              ),
            )
          ],
        );
      });
}
