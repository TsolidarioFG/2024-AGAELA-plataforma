import 'package:agaela_app/common_widgets/agaela_image_appbar.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/form_request_widget.dart';
import 'package:agaela_app/common_widgets/scrolleable_widget.dart';
import 'package:agaela_app/constants/global_constants.dart';
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

  final ValueNotifier<String> _formId = ValueNotifier<String>('');
  final ValueNotifier<String> _title = ValueNotifier<String>('');
  final ValueNotifier<bool> _startRequest = ValueNotifier<bool>(false);

  void _startFormRequest(String formId, String title) {
    setState(() {
      _formId.value = formId;
      _title.value = title;
      _startRequest.value = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AgaelaImageAppbar(),
        body: FormRequestWidget(
            title: _title,
            formId: _formId,
            started: _startRequest,
            child: ScrolleableWidget(
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
                          text:
                              AppLocalizations.of(context)!.carerHomeCaredForms,
                        ),
                      ),
                      const Icon(Icons.supervisor_account),
                      Expanded(
                        child: DefaultButton(
                            function: () => _startFormRequest(
                                caregiverOverloadFormId,
                                AppLocalizations.of(context)!
                                    .carerHomeCaregiverOverloadTitle),
                            text: AppLocalizations.of(context)!
                                .carerHomeCaregiverOverload),
                      ),
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
                              text: AppLocalizations.of(context)!
                                  .carerHomeNotifications)),
                      SizedBox(
                        width: width,
                      ),
                      Badge(
                        label: Text(Provider.of<LoggedUserProvider>(context,
                                listen: false)
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
                              text: AppLocalizations.of(context)!
                                  .carerHomeProfile)),
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
                              function: () => context
                                  .goNamed(RoutesNames.reportIncident.name),
                              text: AppLocalizations.of(context)!
                                  .carerHomeReportIncident)),
                      const Expanded(child: SizedBox(child: null)),
                      SizedBox(
                        width: width,
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}
