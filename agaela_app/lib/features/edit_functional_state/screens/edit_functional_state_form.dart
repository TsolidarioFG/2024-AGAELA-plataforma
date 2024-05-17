import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form_provider.dart';
import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart';
import 'package:agaela_app/features/edit_functional_state/widgets/edit_functional_state_form_footer.dart';
import 'package:agaela_app/features/forms/models/question.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/locators.dart';
import 'package:flutter/material.dart';
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

  bool _changed = false;

  bool _correctValues = false;

  final inexistentId = -1;
  late String _title;
  late List<Question> _questions;

  Map<int, int>? _answersSelecteds;

  Future<Map<int, int>?>? _previousAnswers;

  void _checkCorrectValues() {
    setState(() {
      _correctValues = !_answersSelecteds!.containsValue(inexistentId);
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
        actualForm.formId, actualUser.selectedId);
    _previousAnswers!.then((answers) {
      if (answers == null) {
        for (Question question in _questions) {
          _answersSelecteds![question.id] = inexistentId;
        }
      } else {
        _answersSelecteds!.addAll(answers);
      }
      _checkCorrectValues();
    }, onError: (_) => {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(text: _title),
      body: FutureBuilder(
        future: _previousAnswers,
        builder: (BuildContext context, AsyncSnapshot snapshot) => snapshot
                    .connectionState ==
                ConnectionState.waiting
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
                        textMaxLines: 3,
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemCount: _questions[questionIndex].answers.length,
                          itemBuilder: (BuildContext context, int answerIndex) {
                            int questionId = _questions[questionIndex].id;
                            int answerId = _questions[questionIndex]
                                .answers[answerIndex]
                                .id;
                            String answerText = _questions[questionIndex]
                                .answers[answerIndex]
                                .text;
                            return ListTile(
                              title: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _answersSelecteds![questionId] = answerId;
                                      _changed = true;
                                      _checkCorrectValues();
                                    });
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                        _answersSelecteds![questionId] ==
                                                answerId
                                            ? MaterialStateProperty.all<Color>(
                                                Colors.deepPurple)
                                            : MaterialStateProperty.all<Color>(
                                                Colors.grey),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    overlayColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.purple),
                                  ),
                                  child: Text(
                                    answerText,
                                    maxLines: 5,
                                  )),
                            );
                          })
                    ],
                  );
                }),
      ),
      bottomNavigationBar: EditFunctionalStateFormFooter(
          sendFunction: _correctValues ? () => {} : null,
          noChangesFunction: !_changed && _correctValues ? () => {} : null),
    );
  }
}
