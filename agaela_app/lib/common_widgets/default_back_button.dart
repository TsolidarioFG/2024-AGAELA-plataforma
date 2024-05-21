import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton({super.key, required this.backPage});

  final VoidCallback backPage;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
            overlayColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
            minimumSize: MaterialStateProperty.all<Size>(const Size(200, 70)),
            maximumSize: MaterialStateProperty.all<Size>(const Size(300, 200))),
        onPressed: backPage,
        child: Text(AppLocalizations.of(context)!.commonBackButtonText));
  }
}
