import 'package:agaela_app/common_widgets/text_appbar.dart';
import 'package:agaela_app/common_widgets/text_bold_style.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form.dart';
import 'package:agaela_app/features/edit_functional_state/models/actual_form_provider.dart';
import 'package:agaela_app/features/edit_functional_state/widgets/edit_functional_state_form_footer.dart';
import 'package:agaela_app/features/forms/models/question.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditFunctionalStateForm extends StatefulWidget {
  const EditFunctionalStateForm({super.key});

  @override
  State<EditFunctionalStateForm> createState() =>
      _EditFunctionalStateFormState();
}

class _EditFunctionalStateFormState extends State<EditFunctionalStateForm> {
  final inexistentId = -1;
  late String _title;
  late List<Question> _questions;

  Map<int, int>? _answersSelecteds;

  @override
  void initState() {
    ActualForm actualForm =
        Provider.of<ActualFormProvider>(context, listen: false).actualForm!;
    super.initState();
    _title = actualForm.title;
    _questions = actualForm.questions;
    _answersSelecteds = {};
    for (Question question in _questions) {
      _answersSelecteds![question.id] = inexistentId;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TextAppbar(text: _title),
      body: ListView.builder(
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
                      int answerId =
                          _questions[questionIndex].answers[answerIndex].id;
                      String answerText =
                          _questions[questionIndex].answers[answerIndex].text;
                      return ListTile(
                        title: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _answersSelecteds![questionId] = answerId;
                              });
                            },
                            style: ButtonStyle(
                              backgroundColor:
                                  _answersSelecteds![questionId] == answerId
                                      ? MaterialStateProperty.all<Color>(
                                          Colors.deepPurple)
                                      : MaterialStateProperty.all<Color>(
                                          Colors.grey),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              overlayColor: MaterialStateProperty.all<Color>(
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
      bottomNavigationBar: EditFunctionalStateFormFooter(
          sendFunction:
              _answersSelecteds!.containsValue(inexistentId) ? null : () => {},
          noChangesFunction: null),
    );
  }
}
