import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BankDetailsAndPermissions extends StatefulWidget {
  const BankDetailsAndPermissions({super.key});

  @override
  State<BankDetailsAndPermissions> createState() =>
      _BankDetailsAndPermissionsState();
}

class _BankDetailsAndPermissionsState extends State<BankDetailsAndPermissions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text: AppLocalizations.of(context)!
            .editProfileBankDetailsAndPermissionsTitle,
      ),
    );
  }
}
