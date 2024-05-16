import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_back_button.dart';
import 'package:agaela_app/common_widgets/default_button.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form_provider.dart';
import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart';
import 'package:agaela_app/features/forms/models/question.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:agaela_app/utils/go_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditFunctionalStateHome extends StatefulWidget {
  const EditFunctionalStateHome({super.key});

  @override
  State<EditFunctionalStateHome> createState() =>
      _EditFunctionalStateHomeState();
}

class _EditFunctionalStateHomeState extends State<EditFunctionalStateHome> {
  final EditFunctionalStateService _editFunctionalStateService =
      locator<EditFunctionalStateService>();

  Future<List<Question>>? _request;

  void _startForm(String title, int formId) {
    setState(() {
      _request = _editFunctionalStateService.getFormQuestions(formId);
      _request!.then((questions) {
        ActualForm actualForm = ActualForm(title, questions);
        Provider.of<ActualFormProvider>(context, listen: false)
            .setActualForm(actualForm);
        context.goNamed(RoutesNames.editFunctionalStateForm.name);
      },
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.error),
              AppLocalizations.of(context)!
                  .editFunctionalStateHomeErrorDescription,
              () => GoRouter.of(context).pop()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppbar(
          text: AppLocalizations.of(context)!.editFunctionalStateHomeTitle,
        ),
        body: FutureBuilder(
          future: _request,
          builder:
              (BuildContext context, AsyncSnapshot<List<Question>> snapshot) =>
                  snapshot.connectionState == ConnectionState.waiting
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const Icon(Icons.library_add_check),
                                Expanded(
                                  child: DefaultButton(
                                    function: () => _startForm(
                                        AppLocalizations.of(context)!
                                            .editFunctionalStateRatingScaleTitle,
                                        1),
                                    text: AppLocalizations.of(context)!
                                        .editFunctionalStateRatingScale,
                                  ),
                                ),
                                const Icon(Icons.edit_document),
                                Expanded(
                                    child: DefaultButton(
                                  function: () => _startForm(
                                      AppLocalizations.of(context)!
                                          .editFunctionalStateBarthelIndexTitle,
                                      2),
                                  text: AppLocalizations.of(context)!
                                      .editFunctionalStateBarthelIndex,
                                ))
                              ],
                            ),
                            DefaultBackButton(backPage: () => goToHome(context))
                          ],
                        ),
        ));
  }
}
