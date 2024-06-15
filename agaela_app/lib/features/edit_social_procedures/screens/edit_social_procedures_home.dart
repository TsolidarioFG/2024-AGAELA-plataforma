import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/utils/go_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class EditSocialProceduresHome extends StatelessWidget {
  const EditSocialProceduresHome({super.key});

  final double _width = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text:
            '${AppLocalizations.of(context)!.editSocialProceduresHomeTitle} ${Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!.getCaredName()}',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              SizedBox(
                width: _width,
              ),
              const Icon(Icons.payment),
              Expanded(
                  child: DefaultButton(
                function: () => {},
                text: AppLocalizations.of(context)!
                    .editSocialProceduresCardsAndIncome,
              )),
              const Icon(Icons.recent_actors),
              Expanded(
                  child: DefaultButton(
                function: () => {},
                text: AppLocalizations.of(context)!
                    .editSocialProceduresDisability,
              )),
              SizedBox(
                width: _width,
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: _width,
              ),
              const Icon(Icons.supervisor_account),
              Expanded(
                  child: DefaultButton(
                function: () => {},
                text: AppLocalizations.of(context)!
                    .editSocialProceduresDependency,
              )),
              const Icon(Icons.personal_injury),
              Expanded(
                  child: DefaultButton(
                function: () => {},
                text: AppLocalizations.of(context)!
                    .editSocialProceduresPermanentWorkDisability,
              )),
              SizedBox(
                width: _width,
              ),
            ],
          ),
          DefaultBackButton(backPage: () => goToHome(context))
        ],
      ),
    );
  }
}
