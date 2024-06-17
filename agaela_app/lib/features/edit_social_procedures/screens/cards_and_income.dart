import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CardsAndIncome extends StatefulWidget {
  const CardsAndIncome({super.key});

  @override
  State<CardsAndIncome> createState() => _CardsAndIncomeState();
}

class _CardsAndIncomeState extends State<CardsAndIncome> {
  final _cardsAndIncomeFormKey = GlobalKey<FormState>();

  bool _formChanged = false;

  void _changeForm() {
    setState(() {
      _formChanged = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text:
            '${AppLocalizations.of(context)!.editSocialProceduresCardsAndIncomeTitle} ${Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!.getCaredName()}',
      ),
      body: Form(
        key: _cardsAndIncomeFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: () => _changeForm,
        child: ListView(
          children: const <Widget>[],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: DefaultSendCancelButtons(
          sendFunction: _formChanged
              ? () =>
                  {if (_cardsAndIncomeFormKey.currentState!.validate()) null}
              : null,
          cancelFunction: () => GoRouter.of(context).pop(),
        ),
      ),
    );
  }
}
