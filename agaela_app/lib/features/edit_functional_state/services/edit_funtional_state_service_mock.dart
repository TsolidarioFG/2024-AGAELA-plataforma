import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart';
import 'package:agaela_app/features/forms/models/answer.dart';
import 'package:agaela_app/features/forms/models/question.dart';

class EditFunctionalStateServiceMock implements EditFunctionalStateService {
  @override
  Future<List<Question>> getFormQuestions(int formId) async {
    const errorText = 'no';
    Answer answer1 = Answer(1, 'Yes');
    Answer answer2 = Answer(2, 'No');
    Answer answer3 = Answer(3, 'Maybe');
    Question firstQuestion = Question(1, 'Test 1', [answer1, answer2, answer3]);
    Answer answer4 = Answer(1, 'Yes');
    Answer answer5 = Answer(2, 'No');
    Answer answer6 = Answer(3, 'Maybe');
    Question secondQuestion =
        Question(2, 'Test 2', [answer4, answer5, answer6]);
    Answer answer7 = Answer(1, 'Yes');
    Answer answer8 = Answer(2, 'No');
    Answer answer9 = Answer(3, 'Maybe');
    Question thirdQuestion = Question(3, 'Test 3', [answer7, answer8, answer9]);
    List<Question> questions = [firstQuestion, secondQuestion, thirdQuestion];
    await Future.delayed(const Duration(seconds: 1));
    if (errorText == 'error') throw Exception();
    return questions;
  }

  @override
  Future<Map<int, int>?> getPreviousAnswers(int formId, int userId) async {
    const errorText = 'no';
    const firstQuestionId = 1;
    const secondQuestionId = 2;
    const thirdQuestionId = 3;
    const firstAnswerId = 1;
    const secondAnswerId = 2;
    const thirdAnswerId = 3;
    Map<int, int> answers = {};
    answers[firstQuestionId] = secondAnswerId;
    answers[secondQuestionId] = firstAnswerId;
    answers[thirdQuestionId] = thirdAnswerId;
    await Future.delayed(const Duration(seconds: 1));
    if (errorText == 'error') throw Exception();
    return answers;
  }

  @override
  Future<void> saveForm(int formId, int userId, Map<int, int> answers) async {
    const errorText = 'no';
    await Future.delayed(const Duration(seconds: 1));
    if (errorText == 'error') throw Exception();
  }
}
