import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/default_text_field.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_social_procedures/models/disability_model.dart';
import 'package:agaela_app/features/edit_social_procedures/models/edit_social_procedures_saved_types.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/features/edit_social_procedures/widgets/common_fields.dart';
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

  bool _validFields = false;

  void _checkCorrectField() {
    setState(() {
      _validFields = _disabilityModel.processedTypeSelected != null &&
              !_disabilityModel.resolutionSelected
          ? _disabilityModel.unresolvedProcedureSelected != null
          : true;
    });
  }

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
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    EditSocialProceduresSavedTypes savedTypes =
        Provider.of<EditSocialProceduresSavedTypes>(context, listen: false);
    Map<String, String>? processedTypes = savedTypes.processedTypes;
    Map<String, String>? unresolvedProceduresTypes =
        savedTypes.unresolvedProceduresTypes;
    _disabilityFieldsRequest = _editSocialProceduresService.getDisabilityFields(
        actualUser.getActualCode(), processedTypes, unresolvedProceduresTypes);
    _disabilityFieldsRequest!.then((disabilityFields) {
      _disabilityModel = disabilityFields;
      _disabilityPercentage.text = _disabilityModel.disabilityPercentage ?? '';
      savedTypes.processedTypes = _disabilityModel.processedTypes;
      savedTypes.unresolvedProceduresTypes =
          _disabilityModel.unresolvedProceduresTypes;
      _checkCorrectField();
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
              : Form(
                  key: _disabilityFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: CommonFields(
                    commonFieldsModel: _disabilityModel,
                    onChanged: () => _checkCorrectField(),
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
                    ),
                  ));
        },
      ),
      bottomNavigationBar: BottomAppBar(
          child: FutureBuilder(
        future: _setDisabilityRequest,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.connectionState == ConnectionState.waiting
              ? const Center(child: CircularProgressIndicator())
              : DefaultSendCancelButtons(
                  sendFunction: _validFields
                      ? () {
                          if (_disabilityFormKey.currentState!.validate()) {
                            _setDisability();
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
