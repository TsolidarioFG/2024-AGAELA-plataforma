import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/list_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_social_procedures/models/edit_social_procedures_saved_types.dart';
import 'package:agaela_app/features/edit_social_procedures/models/permanent_work_disability_model.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/features/edit_social_procedures/widgets/common_fields.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
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

  Future<void>? _setPermanentWorkDisabilityRequest;

  bool _validFields = false;

  void _checkCorrectField() {
    setState(() {
      _validFields = _permanentWorkDisabilityModel.processedTypeSelected !=
              null &&
          (_permanentWorkDisabilityModel.unresolvedProcedureSelected != null ||
              _permanentWorkDisabilityModel.resolvedDisabilitySelected != null);
    });
  }

  void _setPermanentWorkDisability() {
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    setState(() {
      _setPermanentWorkDisabilityRequest =
          _editSocialProceduresService.setPermanentWorkDisability(
              actualUser.getActualCode(), _permanentWorkDisabilityModel);
      _setPermanentWorkDisabilityRequest!.then(
          (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.check),
              AppLocalizations.of(context)!
                  .editSocialProceduresPermanentWorkDisabilitySavedChanges,
              () => context.goNamed(RoutesNames.editSocialProcedures.name)),
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.error),
              AppLocalizations.of(context)!
                  .editSocialProceduresPermanentWorkDisabilityErrorSavingChanges,
              () => GoRouter.of(context).pop()));
    });
  }

  @override
  void initState() {
    super.initState();
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    EditSocialProceduresSavedTypes savedTypes =
        Provider.of<EditSocialProceduresSavedTypes>(context, listen: false);
    Map<String, String>? processedTypes = savedTypes.processedTypes;
    Map<String, String>? resolvedDisabilityTypes =
        savedTypes.resolvedDisabilityTypes;
    Map<String, String>? unresolvedProceduresTypes =
        savedTypes.unresolvedProceduresTypes;
    _permanentWorkDisabilityFieldsRequest =
        _editSocialProceduresService.getPermanentWorkDisabilityField(
            actualUser.getActualCode(),
            processedTypes,
            resolvedDisabilityTypes,
            unresolvedProceduresTypes);
    _permanentWorkDisabilityFieldsRequest!.then((permanentWorkDisabilityModel) {
      _permanentWorkDisabilityModel = permanentWorkDisabilityModel;
      savedTypes.processedTypes = _permanentWorkDisabilityModel.processedTypes;
      savedTypes.resolvedDisabilityTypes =
          _permanentWorkDisabilityModel.resolvedDisabilityTypes;
      savedTypes.unresolvedProceduresTypes =
          _permanentWorkDisabilityModel.unresolvedProceduresTypes;
      _checkCorrectField();
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
              : CommonFields(
                  commonFieldsModel: _permanentWorkDisabilityModel,
                  onChanged: () => _checkCorrectField(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextBoldStyle(
                          text: AppLocalizations.of(context)!
                              .editSocialProceduresPermanentWorkDisabilityAffirmativeResolutionTitle),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: _permanentWorkDisabilityModel
                              .resolvedDisabilityTypes.length,
                          itemBuilder: (BuildContext context, int index) {
                            String title = _permanentWorkDisabilityModel
                                .resolvedDisabilityTypes.values
                                .elementAt(index);
                            String key = _permanentWorkDisabilityModel
                                .resolvedDisabilityTypes.keys
                                .elementAt(index);
                            return ListTile(
                              title: ListButton(
                                onPressed: () => setState(() {
                                  _permanentWorkDisabilityModel
                                      .resolvedDisabilitySelected = key;
                                  _checkCorrectField();
                                }),
                                selected: _permanentWorkDisabilityModel
                                        .resolvedDisabilitySelected ==
                                    key,
                                text: title,
                              ),
                            );
                          })
                    ],
                  ));
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: FutureBuilder(
        future: _setPermanentWorkDisabilityRequest,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : DefaultSendCancelButtons(
                  sendFunction:
                      _validFields ? () => _setPermanentWorkDisability() : null,
                  cancelFunction: () => GoRouter.of(context).pop(),
                );
        },
      )),
    );
  }
}
