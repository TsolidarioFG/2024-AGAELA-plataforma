import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/default_text_field.dart';
import 'package:agaela_app/common_widgets/list_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_social_procedures/models/disability_model.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/features/edit_social_procedures/widgets/yes_no_list_button.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:agaela_app/utils/string_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Disability extends StatefulWidget {
  const Disability({super.key});

  @override
  State<Disability> createState() => _DisabilityState();
}

class _DisabilityState extends State<Disability> {
  final _disabilityFormKey = GlobalKey<FormState>();

  final EditSocialProceduresService _editSocialProceduresService =
      locator<EditSocialProceduresService>();

  final double padding = 10.0;

  Future<DisabilityModel>? _disabilityFieldsRequest;

  late DisabilityModel _disabilityModel;

  final _disabilityPercentage = TextEditingController();

  Future<void>? _setDisabilityRequest;

  void _setDisability() {
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    _disabilityModel.disabilityPercentage = _disabilityPercentage.text;
    setState(() {
      _setDisabilityRequest = _editSocialProceduresService.setDisability(
          actualUser.getActualCode(), _disabilityModel);
      _setDisabilityRequest!.then(
          (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.check),
              AppLocalizations.of(context)!
                  .editSocialProceduresDisabilitySavedChanges,
              () => context.goNamed(RoutesNames.editSocialProcedures.name)),
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.error),
              AppLocalizations.of(context)!
                  .editSocialProceduresDisabilityErrorSavingChanges,
              () => GoRouter.of(context).pop()));
    });
  }

  @override
  void initState() {
    super.initState();
    _disabilityFieldsRequest =
        _editSocialProceduresService.getDisabilityFields();
    _disabilityFieldsRequest!.then((disabilityFields) {
      _disabilityModel = disabilityFields;
    },
        onError: (_) => showDefaultAlertDialog(
            context,
            const Icon(Icons.error),
            AppLocalizations.of(context)!.editSocialProceduresErrorDisability,
            () => context.goNamed(RoutesNames.editSocialProcedures.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text:
            '${AppLocalizations.of(context)!.editSocialProceduresDisabilityTitle} ${Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!.getCaredName()}',
      ),
      body: FutureBuilder(
        future: _disabilityFieldsRequest,
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
                        itemCount: _disabilityModel.processedTypes.length,
                        itemBuilder: (BuildContext context, int index) {
                          String text = _disabilityModel.processedTypes.values
                              .elementAt(index);
                          String key = _disabilityModel.processedTypes.keys
                              .elementAt(index);
                          return ListTile(
                            title: ListButton(
                              onPressed: () => setState(() {
                                _disabilityModel.processedTypeSelected = key;
                              }),
                              selected:
                                  _disabilityModel.processedTypeSelected == key,
                              text: text,
                            ),
                          );
                        }),
                    YesNoListButton(
                      onPressed: () => setState(() {
                        _disabilityModel.notifiedUrgently =
                            !_disabilityModel.notifiedUrgently;
                      }),
                      selected: _disabilityModel.notifiedUrgently,
                      title: AppLocalizations.of(context)!
                          .editSocialProceduresNotifiedUrgentlyTitle,
                    ),
                    YesNoListButton(
                        onPressed: () => setState(() {
                              _disabilityModel.resolutionSelected =
                                  !_disabilityModel.resolutionSelected;
                            }),
                        selected: _disabilityModel.resolutionSelected,
                        title: AppLocalizations.of(context)!
                            .editSocialProceduresResolutionTitle),
                    _disabilityModel.resolutionSelected
                        ? Form(
                            key: _disabilityFormKey,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                TextBoldStyle(
                                    text: AppLocalizations.of(context)!
                                        .editSocialProceduresDisabilityPercentageTitle),
                                Padding(
                                  padding: EdgeInsets.all(padding),
                                  child: DefaultTextField(
                                    controller: _disabilityPercentage,
                                    text: AppLocalizations.of(context)!
                                        .editSocialProceduresDisabilityPercentageTitleTextField,
                                    validator: (String? dni) {
                                      return !dni!.isValidPercentage
                                          ? AppLocalizations.of(context)!
                                              .errorPercentageNotValid
                                          : null;
                                    },
                                  ),
                                ),
                                YesNoListButton(
                                    onPressed: () => setState(() {
                                          _disabilityModel.mobilityScale =
                                              !_disabilityModel.mobilityScale;
                                        }),
                                    selected: _disabilityModel.mobilityScale,
                                    title: AppLocalizations.of(context)!
                                        .editSocialProceduresDisabilityMobilityScaleTitle),
                                YesNoListButton(
                                    onPressed: () => setState(() {
                                          _disabilityModel.thirdPartyScale =
                                              !_disabilityModel.thirdPartyScale;
                                        }),
                                    selected: _disabilityModel.thirdPartyScale,
                                    title: AppLocalizations.of(context)!
                                        .editSocialProceduresDisabilityThirdPartyScaleTitle),
                              ],
                            ))
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextBoldStyle(
                                  text: AppLocalizations.of(context)!
                                      .editSocialProceduresNoResolutionTitle),
                              ListView.builder(
                                  shrinkWrap: true,
                                  physics: const ClampingScrollPhysics(),
                                  itemCount: _disabilityModel
                                      .unresolvedProceduresTypes.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String title = _disabilityModel
                                        .unresolvedProceduresTypes.values
                                        .elementAt(index);
                                    String key = _disabilityModel
                                        .unresolvedProceduresTypes.keys
                                        .elementAt(index);
                                    return ListTile(
                                      title: ListButton(
                                        onPressed: () => setState(() {
                                          _disabilityModel
                                                  .unresolvedProcedureSelected =
                                              key;
                                        }),
                                        selected: _disabilityModel
                                                .unresolvedProcedureSelected ==
                                            key,
                                        text: title,
                                      ),
                                    );
                                  })
                            ],
                          )
                  ],
                );
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: FutureBuilder(
        future: _setDisabilityRequest,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : DefaultSendCancelButtons(
                  sendFunction: () => {
                    if (_disabilityFormKey.currentState!.validate())
                      _setDisability()
                  },
                  cancelFunction: () => GoRouter.of(context).pop(),
                );
        },
      )),
    );
  }
}
