import 'package:agaela_app/common_widgets/default_alert_dialog.dart';
import 'package:agaela_app/common_widgets/default_send_cancel_buttons.dart';
import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form_provider.dart';
import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart';
import 'package:agaela_app/features/edit_functional_state/widgets/list_button.dart';
import 'package:agaela_app/features/forms/models/question.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:agaela_app/utils/get_cared_name.dart';
import 'package:agaela_app/utils/go_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class EditFunctionalStateForm extends StatefulWidget {
  const EditFunctionalStateForm({super.key});

  @override
  State<EditFunctionalStateForm> createState() =>
      _EditFunctionalStateFormState();
}

class _EditFunctionalStateFormState extends State<EditFunctionalStateForm> {
  final EditFunctionalStateService _editFunctionalStateService =
      locator<EditFunctionalStateService>();

  bool _correctValues = false;

  final inexistentId = '-1';
  late String _title;
  late List<Question> _questions;

  Map<String, String>? _answersSelecteds;

  Future<Map<String, String>?>? _previousAnswers;

  Future<void>? _saveForm;

  void _checkCorrectValues() {
    setState(() {
      _correctValues = !_answersSelecteds!.containsValue(inexistentId);
    });
  }

  bool checkUserIsCarer(BuildContext context) {
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    return actualUser.isCarer && actualUser.id == actualUser.selectedId;
  }

  void _startSaveForm() {
    ActualForm actualForm =
        Provider.of<ActualFormProvider>(context, listen: false).actualForm!;
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    setState(() {
      _saveForm = _editFunctionalStateService.saveForm(
          actualForm.formId, actualUser.getActualCode(), _answersSelecteds!);
      _saveForm!.then((_) {
        List<PendingForm> pendingForms = [];
        pendingForms.addAll(actualUser.pendingForms);
        pendingForms.removeWhere(
            (pendingForm) => pendingForm.formId == actualForm.formId);
        Provider.of<LoggedUserProvider>(context, listen: false)
            .loggedUser!
            .pendingForms = pendingForms;
        showDefaultAlertDialog(
            context,
            const Icon(Icons.check),
            AppLocalizations.of(context)!
                .editFunctionalStateFormSuccessfulSaveDescription,
            () => goToHome(context));
      },
          onError: (_) => showDefaultAlertDialog(
              context,
              const Icon(Icons.error),
              AppLocalizations.of(context)!
                  .editFunctionalStateFormErrorSaveDescription,
              () => GoRouter.of(context).pop()));
    });
  }

  @override
  void initState() {
    ActualForm actualForm =
        Provider.of<ActualFormProvider>(context, listen: false).actualForm!;
    LoggedUser actualUser =
        Provider.of<LoggedUserProvider>(context, listen: false).loggedUser!;
    super.initState();
    _title = actualForm.title;
    _questions = actualForm.questions;
    _answersSelecteds = {};
    _previousAnswers = _editFunctionalStateService.getPreviousAnswers(
        actualForm.formId, actualUser.getActualCode());
    _previousAnswers!.then((answers) {
      if (answers == null) {
        for (Question question in _questions) {
          _answersSelecteds![question.code] = inexistentId;
        }
      } else {
        _answersSelecteds!.addAll(answers);
      }
      _checkCorrectValues();
    },
        onError: (_) => showDefaultAlertDialog(
            context,
            const Icon(Icons.error),
            AppLocalizations.of(context)!
                .editFunctionalStateFormErrorAnswersDescription,
            () => goToHome(context)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TextAppbar(text: '$_title ${getCaredName(context)}'),
        body: FutureBuilder(
          future: _previousAnswers,
          builder: (BuildContext context, AsyncSnapshot snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.all(10),
                      itemCount: _questions.length,
                      itemBuilder: (BuildContext context, int questionIndex) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextBoldStyle(
                              text: _questions[questionIndex].title,
                              textMaxLines: 5,
                            ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const ClampingScrollPhysics(),
                                itemCount:
                                    _questions[questionIndex].answers.length,
                                itemBuilder:
                                    (BuildContext context, int answerIndex) {
                                  String questionCode =
                                      _questions[questionIndex].code;
                                  String answerCode = _questions[questionIndex]
                                      .answers[answerIndex]
                                      .code;
                                  String answerText = _questions[questionIndex]
                                      .answers[answerIndex]
                                      .text;
                                  return ListTile(
                                      title: ListButton(
                                    onPressed: () {
                                      setState(() {
                                        _answersSelecteds![questionCode] =
                                            answerCode;
                                        _checkCorrectValues();
                                      });
                                    },
                                    selected:
                                        _answersSelecteds![questionCode] ==
                                            answerCode,
                                    text: answerText,
                                  ));
                                })
                          ],
                        );
                      }),
        ),
        bottomNavigationBar: BottomAppBar(
            child: FutureBuilder(
          future: _saveForm,
          builder: (BuildContext context, AsyncSnapshot snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : DefaultSendCancelButtons(
                      sendFunction:
                          _correctValues ? () => _startSaveForm() : null,
                      cancelFunction: () => checkUserIsCarer(context)
                          ? context.goNamed(RoutesNames.carerHome.name)
                          : GoRouter.of(context).pop(),
                    ),
        )));
  }
}
