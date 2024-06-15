import 'package:agaela_app/common_widgets/agaela_image_appbar.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/scrolleable_widget.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class DefaultHome extends StatelessWidget {
  const DefaultHome({super.key});

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
                  const Icon(Icons.feed),
                  Expanded(
                      child: DefaultButton(
                          function: () => context
                              .goNamed(RoutesNames.editFunctionalState.name),
                          text: AppLocalizations.of(context)!
                              .homeFunctionalState)),
                  const Icon(Icons.contact_page),
                  Expanded(
                      child: DefaultButton(
                          function: () => {},
                          text: AppLocalizations.of(context)!
                              .homeSocialProcedures)),
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
                  const Icon(Icons.notification_important),
                  Expanded(
                      child: DefaultButton(
                          function: () => context
                              .goNamed(RoutesNames.notificationsHome.name),
                          text:
                              AppLocalizations.of(context)!.homeNotifications)),
                  SizedBox(
                    width: width,
                  ),
                  Badge(
                    label: Text(
                        Provider.of<LoggedUserProvider>(context, listen: false)
                            .loggedUser!
                            .getPendingNotificationsNumber()
                            .toString()),
                  ),
                  SizedBox(
                    width: width,
                  ),
                  const Icon(Icons.account_circle),
                  Expanded(
                      child: DefaultButton(
                          function: () =>
                              context.goNamed(RoutesNames.editProfile.name),
                          text: AppLocalizations.of(context)!.homeProfile)),
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
                  const Icon(Icons.receipt),
                  Expanded(
                      child: DefaultButton(
                          function: () =>
                              context.goNamed(RoutesNames.reportIncident.name),
                          text: AppLocalizations.of(context)!
                              .homeReportIncident)),
                  const Expanded(child: SizedBox(child: null)),
                  SizedBox(
                    width: width,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
