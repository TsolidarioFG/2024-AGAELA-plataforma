import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IdentificationAndContact extends StatefulWidget {
  const IdentificationAndContact({super.key});

  @override
  State<IdentificationAndContact> createState() =>
      _IdentificationAndContactState();
}

class _IdentificationAndContactState extends State<IdentificationAndContact> {
  final _identificationAndContactFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text: AppLocalizations.of(context)!
            .editProfileIdentificationAndContactTitle,
      ),
      body: Form(
        key: _identificationAndContactFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[],
        ),
      ),
    );
  }
}
