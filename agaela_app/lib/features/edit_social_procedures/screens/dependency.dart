import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/default_text_field.dart';
import 'package:agaela_app/common_widgets/list_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_social_procedures/models/dependency_model.dart';
import 'package:agaela_app/features/edit_social_procedures/models/edit_social_procedures_saved_types.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/features/edit_social_procedures/widgets/common_fields.dart';
import 'package:agaela_app/features/edit_social_procedures/widgets/yes_no_list_button.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Dependency extends StatefulWidget {
  const Dependency({super.key});

  @override
  State<Dependency> createState() => _DependencyState();
}

class _DependencyState extends State<Dependency> {
  final _dependencyFormKey = GlobalKey<FormState>();

  final EditSocialProceduresService _editSocialProceduresService =
      locator<EditSocialProceduresService>();

  final double padding = 10.0;

  final _serviceClarifications = TextEditingController();

  late DependencyModel _dependencyModel;

  Future<DependencyModel>? _dependencyFieldsRequest;

  Future<void>? _setDependencyRequest;

  bool _validFields = false;

  void _checkCorrectField() {
    setState(() {
      _validFields = _dependencyModel.processedTypeSelected != null &&
              !_dependencyModel.resolutionSelected
          ? _dependencyModel.unresolvedProcedureSelected != null
          : _dependencyModel.dependencyLevelSelected != null;
    });
  }

  void _setDependency() {
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    _dependencyModel.serviceClarifications = _serviceClarifications.text;
    setState(() {
      _setDependencyRequest = _editSocialProceduresService.setDependency(
          actualUser.getActualCode(), _dependencyModel);
      _setDependencyRequest!.then(
          (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.check),
              AppLocalizations.of(context)!
                  .editSocialProceduresDependencySavedChanges,
              () => context.goNamed(RoutesNames.editSocialProcedures.name)),
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.error),
              AppLocalizations.of(context)!
                  .editSocialProceduresDependencyErrorSavingChanges,
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
    Map<String, String>? unresolvedProceduresTypes =
        savedTypes.unresolvedProceduresTypes;
    Map<String, String>? dependencyLevelsTypes =
        savedTypes.dependencyLevelsTypes;
    Map<String, String>? dependencyServicesTypes =
        savedTypes.dependencyServices;
    Map<String, String>? dependencyOrdersOfPaymentTypes =
        savedTypes.dependencyOrdersOfPayment;
    _dependencyFieldsRequest = _editSocialProceduresService.getDependencyFields(
        actualUser.getActualCode(),
        processedTypes,
        unresolvedProceduresTypes,
        dependencyLevelsTypes,
        dependencyServicesTypes,
        dependencyOrdersOfPaymentTypes);
    _dependencyFieldsRequest!.then((dependencyFields) {
      _dependencyModel = dependencyFields;
      _serviceClarifications.text =
          _dependencyModel.serviceClarifications ?? '';
      savedTypes.processedTypes = _dependencyModel.processedTypes;
      savedTypes.unresolvedProceduresTypes =
          _dependencyModel.unresolvedProceduresTypes;
      savedTypes.dependencyLevelsTypes = _dependencyModel.dependencyLevelsTypes;
      savedTypes.dependencyServices = _dependencyModel.dependencyServices;
      savedTypes.dependencyOrdersOfPayment =
          _dependencyModel.dependencyOrdersOfPaymentTypes;
      _checkCorrectField();
    },
        onError: (_) => showDefaultAlertDialog(
            context,
            const Icon(Icons.error),
            AppLocalizations.of(context)!.editSocialProceduresErrorDependency,
            () => context.goNamed(RoutesNames.editSocialProcedures.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(
        text:
            '${AppLocalizations.of(context)!.editSocialProceduresDependencyTitle} ${Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!.getCaredName()}',
      ),
      body: FutureBuilder(
        future: _dependencyFieldsRequest,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Form(
                  key: _dependencyFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: CommonFields(
                    commonFieldsModel: _dependencyModel,
                    onChanged: () => _checkCorrectField(),
                    endingChild: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextBoldStyle(
                            text: AppLocalizations.of(context)!
                                .editSocialProceduresDependencyRequestedServicesTitle),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount:
                                _dependencyModel.dependencyServices.length,
                            itemBuilder: (BuildContext context, int index) {
                              String title = _dependencyModel
                                  .dependencyServices.values
                                  .elementAt(index);
                              String key = _dependencyModel
                                  .dependencyServices.keys
                                  .elementAt(index);
                              return ListTile(
                                title: ListButton(
                                  onPressed: () => setState(() {
                                    _dependencyModel.dependencyServicesSelected
                                            .contains(key)
                                        ? _dependencyModel
                                            .dependencyServicesSelected
                                            .remove(key)
                                        : _dependencyModel
                                            .dependencyServicesSelected
                                            .add(key);
                                  }),
                                  selected: _dependencyModel
                                      .dependencyServicesSelected
                                      .contains(key),
                                  text: title,
                                ),
                              );
                            }),
                        TextBoldStyle(
                            text: AppLocalizations.of(context)!
                                .editSocialProceduresDependencyOrdersOfPaymentTitle),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount: _dependencyModel
                                .dependencyOrdersOfPaymentTypes.length,
                            itemBuilder: (BuildContext context, int index) {
                              String title = _dependencyModel
                                  .dependencyOrdersOfPaymentTypes.values
                                  .elementAt(index);
                              String key = _dependencyModel
                                  .dependencyOrdersOfPaymentTypes.keys
                                  .elementAt(index);
                              return ListTile(
                                title: ListButton(
                                  onPressed: () => setState(() {
                                    _dependencyModel
                                            .dependencyOrdersOfPaymentSelected
                                            .contains(key)
                                        ? _dependencyModel
                                            .dependencyOrdersOfPaymentSelected
                                            .remove(key)
                                        : _dependencyModel
                                            .dependencyOrdersOfPaymentSelected
                                            .add(key);
                                  }),
                                  selected: _dependencyModel
                                      .dependencyOrdersOfPaymentSelected
                                      .contains(key),
                                  text: title,
                                ),
                              );
                            }),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextBoldStyle(
                            text: AppLocalizations.of(context)!
                                .editSocialProceduresDependencyDependencyLevelTitle),
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const ClampingScrollPhysics(),
                            itemCount:
                                _dependencyModel.dependencyLevelsTypes.length,
                            itemBuilder: (BuildContext context, int index) {
                              String title = _dependencyModel
                                  .dependencyLevelsTypes.values
                                  .elementAt(index);
                              String key = _dependencyModel
                                  .dependencyLevelsTypes.keys
                                  .elementAt(index);
                              return ListTile(
                                title: ListButton(
                                  onPressed: () => setState(() {
                                    _dependencyModel.dependencyLevelSelected =
                                        key;
                                    _checkCorrectField();
                                  }),
                                  selected: _dependencyModel
                                          .dependencyLevelSelected ==
                                      key,
                                  text: title,
                                ),
                              );
                            }),
                        YesNoListButton(
                          onPressed: () => setState(() {
                            _dependencyModel.individualizedAttentionPlan =
                                !_dependencyModel.individualizedAttentionPlan;
                          }),
                          selected:
                              _dependencyModel.individualizedAttentionPlan,
                          title: AppLocalizations.of(context)!
                              .editSocialProceduresDependencyIndividualizedAttentionPlanTitle,
                        ),
                        YesNoListButton(
                          onPressed: () => setState(() {
                            _dependencyModel.gettingServices =
                                !_dependencyModel.gettingServices;
                          }),
                          selected: _dependencyModel.gettingServices,
                          title: AppLocalizations.of(context)!
                              .editSocialProceduresDependencyGettingServicesTitle,
                        ),
                        TextBoldStyle(
                            text: AppLocalizations.of(context)!
                                .editSocialProceduresDependencyServiceClarificationsTitle),
                        Padding(
                          padding: EdgeInsets.all(padding),
                          child: DefaultTextField(
                            controller: _serviceClarifications,
                            text: AppLocalizations.of(context)!
                                .editSocialProceduresDependencyServiceClarificationsTitleTextField,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: FutureBuilder(
        future: _setDependencyRequest,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : DefaultSendCancelButtons(
                  sendFunction: _validFields
                      ? () {
                          if (_dependencyFormKey.currentState!.validate()) {
                            _setDependency();
                          }
                        }
                      : null,
                  cancelFunction: () => GoRouter.of(context).pop(),
                );
        },
      )),
    );
  }
}
