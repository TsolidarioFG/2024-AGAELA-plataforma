import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_send_buttons.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/features/report_incident/services/report_incident_service.dart';
import 'package:agaela_app/features/report_incident/widgets/report_incident_text_field.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/utils/go_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ReportIncident extends StatefulWidget {
  const ReportIncident({super.key});

  @override
  State<ReportIncident> createState() => _ReportIncidentState();
}

class _ReportIncidentState extends State<ReportIncident> {
  final ReportIncidentService _reportIncidentService =
      locator<ReportIncidentService>();

  final _reportIncidentFormKey = GlobalKey<FormState>();

  final _incidentTextController = TextEditingController();

  Future<void>? _request;

  void _startReportIncident() {
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    setState(() {
      _request = _reportIncidentService.reportIncident(
          actualUser.selectedId, _incidentTextController.text);
      _request!.then(
          (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.check),
              AppLocalizations.of(context)!.reportIncidentSuccessfulDescription,
              () => goToHome(context)),
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.error),
              AppLocalizations.of(context)!.reportIncidentErrorDescription,
              () => GoRouter.of(context).pop()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppbar(
          text: AppLocalizations.of(context)!.reportIncidentTitle,
        ),
        body: Form(
          key: _reportIncidentFormKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ReportIncidentTextField(
                controller: _incidentTextController,
              ),
              FutureBuilder(
                  future: _request,
                  builder:
                      (BuildContext context, AsyncSnapshot<void> snapshot) =>
                          snapshot.connectionState == ConnectionState.waiting
                              ? const CircularProgressIndicator()
                              : DefaultSendButtons(
                                  sendFunction: () => {
                                        if (_reportIncidentFormKey.currentState!
                                            .validate())
                                          _startReportIncident(),
                                      },
                                  backPage: () => goToHome(context)))
            ],
          ),
        ));
  }
}
