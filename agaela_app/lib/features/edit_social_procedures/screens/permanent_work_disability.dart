import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/list_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_social_procedures/models/permanent_work_disability_model.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class PermanentWorkDisability extends StatefulWidget {
  const PermanentWorkDisability({super.key});

  @override
  State<PermanentWorkDisability> createState() =>
      _PermanentWorkDisabilityState();
}

class _PermanentWorkDisabilityState extends State<PermanentWorkDisability> {
  final EditSocialProceduresService _editSocialProceduresService =
      locator<EditSocialProceduresService>();

  Future<PermanentWorkDisabilityModel>? _permanentWorkDisabilityFieldsRequest;

  late PermanentWorkDisabilityModel _permanentWorkDisabilityModel;

  @override
  void initState() {
    super.initState();
    _permanentWorkDisabilityFieldsRequest =
        _editSocialProceduresService.getPermanentWorkDisabilityField();
    _permanentWorkDisabilityFieldsRequest!.then((permanentWorkDisabilityModel) {
      _permanentWorkDisabilityModel = permanentWorkDisabilityModel;
    },
        onError: (_) => showDefaultAlertDialog(
            context,
            const Icon(Icons.error),
            AppLocalizations.of(context)!
                .editSocialProceduresErrorPermanentWorkDisability,
            () => context.goNamed(RoutesNames.editSocialProcedures.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text:
            '${AppLocalizations.of(context)!.editSocialProceduresPermanentWorkDisabilityTitle} ${Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!.getCaredName()}',
      ),
      body: FutureBuilder(
        future: _permanentWorkDisabilityFieldsRequest,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  children: <Widget>[
                    TextBoldStyle(
                        text: AppLocalizations.of(context)!
                            .editSocialProceduresProcessedTitle),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        itemCount:
                            _permanentWorkDisabilityModel.processedTypes.length,
                        itemBuilder: (BuildContext context, int index) {
                          String text = _permanentWorkDisabilityModel
                              .processedTypes.values
                              .elementAt(index);
                          return ListTile(
                            title: ListButton(
                              onPressed: () => {},
                              selected: false,
                              text: text,
                            ),
                          );
                        }),
                  ],
                );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: DefaultSendCancelButtons(
          sendFunction: () => {},
          cancelFunction: () => GoRouter.of(context).pop(),
        ),
      ),
    );
  }
}
