import 'package:agaela_app/common_widgets/agaela_image_appbar.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class CarerHome extends StatelessWidget {
  const CarerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AgaelaImageAppbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
            children: <Widget>[
              const Icon(Icons.edit),
              Expanded(
                child: DefaultButton(
                  function: () => {},
                  text: AppLocalizations.of(context)!.carerHomeCaredForms,
                ),
              ),
              const Icon(Icons.supervisor_account),
              Expanded(
                child: DefaultButton(
                    function: () => {},
                    text: AppLocalizations.of(context)!
                        .carerHomeCaregiverOverload),
              )
            ],
          ),
          Row(
            children: <Widget>[
              const Icon(Icons.notification_important),
              Expanded(
                  child: DefaultButton(
                      function: () => {},
                      text: AppLocalizations.of(context)!
                          .carerHomeNotifications)),
              const Icon(Icons.account_circle),
              Expanded(
                  child: DefaultButton(
                      function: () =>
                          context.goNamed(RoutesNames.editProfile.name),
                      text: AppLocalizations.of(context)!.carerHomeProfile))
            ],
          ),
          Row(
            children: <Widget>[
              const Icon(Icons.receipt),
              Expanded(
                  child: DefaultButton(
                      function: () => {},
                      text: AppLocalizations.of(context)!
                          .carerHomeReportIncident)),
            ],
          ),
        ],
      ),
    );
  }
}
