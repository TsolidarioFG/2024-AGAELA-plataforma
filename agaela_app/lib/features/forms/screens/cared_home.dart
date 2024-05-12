import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/features/forms/widgets/careds_dropdown.dart';
import 'package:agaela_app/features/login/models/carer.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CaredHome extends StatelessWidget {
  const CaredHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Center(
            child: CaredsDropdown(),
          ),
          Row(
            children: <Widget>[
              const Icon(Icons.feed),
              Expanded(
                  child: DefaultButton(
                      function: () => {},
                      text: AppLocalizations.of(context)!
                          .caredHomeFunctionalState)),
              const Icon(Icons.contact_page),
              Expanded(
                  child: DefaultButton(
                      function: () => {},
                      text: AppLocalizations.of(context)!
                          .caredHomeSocialProcedures))
            ],
          ),
          Row(
            children: <Widget>[
              const Icon(Icons.account_circle),
              Expanded(
                  child: DefaultButton(
                      function: () =>
                          context.goNamed(RoutesNames.editProfile.name),
                      text: AppLocalizations.of(context)!.caredHomeProfile)),
              const Icon(Icons.receipt),
              Expanded(
                  child: DefaultButton(
                      function: () => {},
                      text: AppLocalizations.of(context)!
                          .caredHomeReportIncident)),
            ],
          ),
          DefaultBackButton(backPage: () {
            Carer carer =
                Provider.of<LoggedUserProvider>(context, listen: false)
                    .loggedUser! as Carer;
            Carer newCarer = Carer(carer.careds, carer.id, carer.name,
                carer.pendingForms, carer.isCarer, carer.id);
            Provider.of<LoggedUserProvider>(context, listen: false)
                .setLoggedUser(newCarer);
            GoRouter.of(context).pop();
          })
        ],
      ),
    );
  }
}
