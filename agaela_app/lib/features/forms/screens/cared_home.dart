import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/scrolleable_widget.dart';
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

  final double height = 20.0;
  final double width = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ScrolleableWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          SizedBox(
            height: height,
          ),
          const Center(
            child: CaredsDropdown(),
          ),
          SizedBox(
            height: height,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width,
              ),
              const Icon(Icons.feed),
              Expanded(
                  child: DefaultButton(
                      function: () =>
                          context.goNamed(RoutesNames.editFunctionalState.name),
                      text: AppLocalizations.of(context)!
                          .caredHomeFunctionalState)),
              const Icon(Icons.contact_page),
              Expanded(
                  child: DefaultButton(
                      function: () => context
                          .goNamed(RoutesNames.editSocialProcedures.name),
                      text: AppLocalizations.of(context)!
                          .caredHomeSocialProcedures)),
              SizedBox(
                width: width,
              ),
            ],
          ),
          SizedBox(
            height: height,
          ),
          Row(
            children: <Widget>[
              SizedBox(
                width: width,
              ),
              const Icon(Icons.account_circle),
              Expanded(
                  child: DefaultButton(
                      function: () =>
                          context.goNamed(RoutesNames.editProfile.name),
                      text: AppLocalizations.of(context)!.caredHomeProfile)),
              const Icon(Icons.receipt),
              Expanded(
                  child: DefaultButton(
                      function: () =>
                          context.goNamed(RoutesNames.reportIncident.name),
                      text: AppLocalizations.of(context)!
                          .caredHomeReportIncident)),
              SizedBox(
                width: width,
              ),
            ],
          ),
          SizedBox(
            height: height,
          ),
          DefaultBackButton(backPage: () {
            Carer carer =
                Provider.of<LoggedUserProvider>(context, listen: false)
                    .loggedUser! as Carer;
            Carer newCarer = Carer(carer.careds, carer.id, carer.name,
                carer.pendingForms, carer.isCarer, carer.id, carer.code);
            Provider.of<LoggedUserProvider>(context, listen: false)
                .setLoggedUser(newCarer);
            GoRouter.of(context).pop();
          })
        ],
      ),
    ));
  }
}
