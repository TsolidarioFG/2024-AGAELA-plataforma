import 'package:agaela_app/common_widgets/agaela_image_appbar.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/scrolleable_widget.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CarerHome extends StatefulWidget {
  const CarerHome({super.key});

  @override
  State<CarerHome> createState() => _CarerHomeState();
}

class _CarerHomeState extends State<CarerHome> {
  final double height = 20.0;

  final double width = 5.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AgaelaImageAppbar(),
        body: ScrolleableWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              SizedBox(
                height: height,
              ),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: width,
                  ),
                  const Icon(Icons.edit),
                  Expanded(
                    child: DefaultButton(
                      function: () =>
                          context.goNamed(RoutesNames.caredHome.name),
                      text: AppLocalizations.of(context)!.carerHomeCaredForms,
                    ),
                  ),
                  Badge(
                    label: Text(
                        Provider.of<LoggedUserProvider>(context, listen: false)
                            .loggedUser!
                            .getPendingNotificationsNumber()
                            .toString()),
                    child: const Icon(Icons.notification_important),
                  ),
                  SizedBox(
                    width: width,
                  ),
                  Expanded(
                      child: DefaultButton(
                          function: () => context
                              .goNamed(RoutesNames.notificationsHome.name),
                          text: AppLocalizations.of(context)!
                              .carerHomeNotifications)),
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
                              context.goNamed(RoutesNames.editPassword.name),
                          text: AppLocalizations.of(context)!
                              .editPasswordButton)),
                  const Icon(Icons.receipt),
                  Expanded(
                      child: DefaultButton(
                          function: () =>
                              context.goNamed(RoutesNames.reportIncident.name),
                          text: AppLocalizations.of(context)!
                              .carerHomeReportIncident)),
                  SizedBox(
                    width: width,
                  ),
                ],
              ),
              SizedBox(
                height: height,
              ),
            ],
          ),
        ));
  }
}
