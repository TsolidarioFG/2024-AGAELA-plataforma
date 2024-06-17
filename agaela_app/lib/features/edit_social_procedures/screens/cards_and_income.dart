import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class CardsAndIncome extends StatefulWidget {
  const CardsAndIncome({super.key});

  @override
  State<CardsAndIncome> createState() => _CardsAndIncomeState();
}

class _CardsAndIncomeState extends State<CardsAndIncome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text:
            '${AppLocalizations.of(context)!.editSocialProceduresCardsAndIncomeTitle} ${Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!.getCaredName()}',
      ),
    );
  }
}
