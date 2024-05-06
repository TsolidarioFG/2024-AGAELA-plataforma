import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LocalizationAndProfession extends StatefulWidget {
  const LocalizationAndProfession({super.key});

  @override
  State<LocalizationAndProfession> createState() =>
      _LocalizationAndProfessionState();
}

class _LocalizationAndProfessionState extends State<LocalizationAndProfession> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
          text: AppLocalizations.of(context)!
              .editProfileLocalizationAndProfessionTitle),
    );
  }
}
