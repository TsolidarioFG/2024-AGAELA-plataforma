import 'package:agaela_app/common_widgets/default_send_buttons.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/utils/go_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ReportIncident extends StatefulWidget {
  const ReportIncident({super.key});

  @override
  State<ReportIncident> createState() => _ReportIncidentState();
}

class _ReportIncidentState extends State<ReportIncident> {
  final _reportIncidentFormKey = GlobalKey<FormState>();

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
              TextFormField(
                  minLines: 5,
                  maxLines: 5,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(), errorMaxLines: 3),
                  validator: (String? incident) {
                    return incident == null || incident.isEmpty
                        ? AppLocalizations.of(context)!.errorEmptyField
                        : null;
                  }),
              DefaultSendButtons(
                  sendFunction: () => {}, backPage: () => goToHome(context))
            ],
          ),
        ));
  }
}
