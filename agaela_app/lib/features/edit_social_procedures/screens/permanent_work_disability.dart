import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/list_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_social_procedures/models/permanent_work_disability_model.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/features/edit_social_procedures/widgets/yes_no_list_button.dart';
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
    _permanentWorkDisabilityFieldsRequest = _editSocialProceduresService
        .getPermanentWorkDisabilityField(actualUser.getActualCode());
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
                          String key = _permanentWorkDisabilityModel
                              .processedTypes.keys
                              .elementAt(index);
                          return ListTile(
                            title: ListButton(
                              onPressed: () => setState(() {
                                _permanentWorkDisabilityModel
                                    .processedTypeSelected = key;
                                _checkCorrectField();
                              }),
                              selected: _permanentWorkDisabilityModel
                                      .processedTypeSelected ==
                                  key,
                              text: text,
                            ),
                          );
                        }),
                    YesNoListButton(
                      onPressed: () => setState(() {
                        _permanentWorkDisabilityModel.notifiedUrgently =
                            !_permanentWorkDisabilityModel.notifiedUrgently;
                      }),
                      selected: _permanentWorkDisabilityModel.notifiedUrgently,
                      title: AppLocalizations.of(context)!
                          .editSocialProceduresNotifiedUrgentlyTitle,
                    ),
                    YesNoListButton(
                        onPressed: () => setState(() {
                              _permanentWorkDisabilityModel.resolutionSelected =
                                  !_permanentWorkDisabilityModel
                                      .resolutionSelected;
                              _permanentWorkDisabilityModel.resolutionSelected
                                  ? _permanentWorkDisabilityModel
                                      .unresolvedProcedureSelected = null
                                  : _permanentWorkDisabilityModel
                                      .resolvedDisabilitySelected = null;
                              _checkCorrectField();
                            }),
                        selected:
                            _permanentWorkDisabilityModel.resolutionSelected,
                        title: AppLocalizations.of(context)!
                            .editSocialProceduresResolutionTitle),
                    TextBoldStyle(
                        text: _permanentWorkDisabilityModel.resolutionSelected
                            ? AppLocalizations.of(context)!
                                .editSocialProceduresPermanentWorkDisabilityAffirmativeResolutionTitle
                            : AppLocalizations.of(context)!
                                .editSocialProceduresNoResolutionTitle),
                    _permanentWorkDisabilityModel.resolutionSelected
                        ? ListView.builder(
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
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: _permanentWorkDisabilityModel
                                .unresolvedProceduresTypes.length,
                            itemBuilder: (BuildContext context, int index) {
                              String title = _permanentWorkDisabilityModel
                                  .unresolvedProceduresTypes.values
                                  .elementAt(index);
                              String key = _permanentWorkDisabilityModel
                                  .unresolvedProceduresTypes.keys
                                  .elementAt(index);
                              return ListTile(
                                title: ListButton(
                                  onPressed: () => setState(() {
                                    _permanentWorkDisabilityModel
                                        .unresolvedProcedureSelected = key;
                                    _checkCorrectField();
                                  }),
                                  selected: _permanentWorkDisabilityModel
                                          .unresolvedProcedureSelected ==
                                      key,
                                  text: title,
                                ),
                              );
                            })
                  ],
                );
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
