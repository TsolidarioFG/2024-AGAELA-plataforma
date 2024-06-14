import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form_provider.dart';
import 'package:agaela_app/features/edit_functional_state/models/cached_questions.dart';
import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart';
import 'package:agaela_app/features/forms/models/question.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FormRequestWidget extends StatefulWidget {
  const FormRequestWidget(
      {super.key,
      required this.child,
      required this.title,
      required this.formId,
      required this.started});

  final Widget child;

  final ValueNotifier<String> title;

  final ValueNotifier<String> formId;

  final ValueNotifier<bool> started;

  @override
  State<FormRequestWidget> createState() => _FormRequestWidgetState();
}

class _FormRequestWidgetState extends State<FormRequestWidget> {
  final EditFunctionalStateService _editFunctionalStateService =
      locator<EditFunctionalStateService>();

  Future<List<Question>>? _request;

  void _saveQuestions(String formId, List<Question> questions) {
    Provider.of<CachedQuestions>(context, listen: false).formQuestions[formId] =
        questions;
  }

  void _startForm(String title, String formId) {
    setState(() {
      Map<String, List<Question>?> cachedQuestions =
          Provider.of<CachedQuestions>(context, listen: false).formQuestions;
      _request =
          _editFunctionalStateService.getFormQuestions(formId, cachedQuestions);
      _request!.then((questions) {
        ActualForm actualForm = ActualForm(formId, title, questions);
        Provider.of<ActualFormProvider>(context, listen: false)
            .setActualForm(actualForm);
        _saveQuestions(formId, questions);
        context.goNamed(RoutesNames.editFunctionalStateForm.name);
      },
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.error),
              AppLocalizations.of(context)!.errorGettingForm,
              () => GoRouter.of(context).pop()));
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.started.value) {
      _startForm(widget.title.value, widget.formId.value);
    }
    return FutureBuilder(
        future: _request,
        builder:
            (BuildContext context, AsyncSnapshot<List<Question>> snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : widget.child);
  }
}
