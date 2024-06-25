import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart';
import 'package:agaela_app/features/forms/models/answer.dart';
import 'package:agaela_app/features/forms/models/question.dart';

class EditFunctionalStateServiceMock implements EditFunctionalStateService {
  List<Question> ratingScale() {
    const first = '1';
    const second = '2';
    const third = '3';
    const fourth = '4';
    const fifth = '5';
    Answer answer1 = Answer(1, first, 'Habla normal');
    Answer answer2 = Answer(2, second, 'Alteraciones en el habla detectables');
    Answer answer3 = Answer(3, third, 'Habla inteligible con repeticiones');
    Answer answer4 = Answer(
        4, fourth, 'Uso lenguaje verbal combinado con comunicación no verbal');
    Answer answer5 = Answer(5, fifth, 'Pérdida de habla útil');
    Question firstQuestion = Question(
        1, first, 'Lenguaje', [answer1, answer2, answer3, answer4, answer5]);
    Answer answer6 = Answer(1, first, 'Normal');
    Answer answer7 = Answer(2, second,
        'Exceso de saliva leve (pero claro) en boca; posible babeo nocturno');
    Answer answer8 =
        Answer(3, third, 'Exceso de saliva moderado; posible babeo mínimo');
    Answer answer9 =
        Answer(4, fourth, 'Exceso de saliva marcado con algo de babeo');
    Answer answer10 = Answer(
        5, fifth, 'Babeo marcado; que requiere uso de pañuelo constante');
    Question secondQuestion = Question(2, second, 'Salivación',
        [answer6, answer7, answer8, answer9, answer10]);
    Answer answer11 = Answer(1, first, 'Hábitos de alimentación normales');
    Answer answer12 = Answer(2, second,
        'Problemas precoces para tragar (atragantamiento ocasional)');
    Answer answer13 =
        Answer(3, third, 'Precisa cambios en la consistencia de la dieta');
    Answer answer14 =
        Answer(4, fourth, 'Necesidad de alimentación suplementaria por sonda');
    Answer answer15 = Answer(5, fifth, 'Alimentación exclusiva por sonda');
    Question thirdQuestion = Question(
        3, third, 'Tragar', [answer11, answer12, answer13, answer14, answer15]);

    return [
      firstQuestion,
      secondQuestion,
      thirdQuestion,
    ];
  }

  List<Question> caregiverOverload() {
    const first = '1';
    const second = '2';
    const third = '3';
    const fourth = '4';
    const fifth = '5';
    const sixth = '6';
    const seventh = '7';
    Answer answer1 = Answer(1, first, 'Nunca');
    Answer answer2 = Answer(2, second, 'Casi nunca');
    Answer answer3 = Answer(3, third, 'Ás veces');
    Answer answer4 = Answer(4, fourth, 'Bastantes veces');
    Answer answer5 = Answer(5, fifth, 'Case sempre');
    Question question1 = Question(
        1,
        first,
        'Sente que o seu familiar solicita máis axuda da que realmente necesita?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question2 = Question(
        2,
        second,
        'Sente que debido ao tempo que adica ao seu familiar xa non dispón de tempo suficiente para vostede?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question3 = Question(
        3,
        third,
        'Séntese tenso/a cando ten que coidar o seu famliar e atender ademáis outras responsabilidades?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question4 = Question(
        4,
        fourth,
        'Séntese avergoñado pola conduta do seu familiar?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question5 = Question(
        5,
        fifth,
        'Cree que a situación actual afecta de maneira negativa a súa relación con amigos e outros membros da familia?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question6 = Question(
        6,
        sixth,
        'Sente temor polo futuro que lle espera á súa familia?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question7 = Question(
        7,
        seventh,
        'Cree que non dispón de cartos suficientes para coidar do seu familiar ademáis dos seus outros gastos?',
        [answer1, answer2, answer3, answer4, answer5]);
    return [
      question1,
      question2,
      question3,
      question4,
      question5,
      question6,
      question7
    ];
  }

  @override
  Future<List<Question>> getFormQuestions(
      String formId, Map<String, List<Question>?> cachedQuestions) async {
    const errorText = 'no';
    Answer answer1 = Answer(1, '1', 'Yes');
    Answer answer2 = Answer(2, '2', 'No');
    Answer answer3 = Answer(3, '3', 'Maybe');
    Question firstQuestion =
        Question(1, '1', 'Test 1', [answer1, answer2, answer3]);
    Answer answer4 = Answer(1, '1', 'Yes');
    Answer answer5 = Answer(2, '2', 'No');
    Answer answer6 = Answer(3, '3', 'Maybe');
    Question secondQuestion =
        Question(2, '2', 'Test 2', [answer4, answer5, answer6]);
    Answer answer7 = Answer(1, '1', 'Yes');
    Answer answer8 = Answer(2, '2', 'No');
    Answer answer9 = Answer(3, '3', 'Maybe');
    Question thirdQuestion =
        Question(3, '3', 'Test 3', [answer7, answer8, answer9]);
    List<Question> questions = [firstQuestion, secondQuestion, thirdQuestion];
    if (formId == ratingScaleFormId) questions = ratingScale();
    if (formId == caregiverOverloadFormId) questions = caregiverOverload();
    await Future.delayed(const Duration(seconds: 1));
    if (errorText == 'error') throw Exception();
    return questions;
  }

  @override
  Future<Map<String, String>?> getPreviousAnswers(
      String formId, String partnerCode) async {
    const errorText = 'no';
    const firstQuestionId = '1';
    const secondQuestionId = '2';
    const thirdQuestionId = '3';
    const fourthQuestionId = '4';
    const fifthQuestionId = '5';
    const sixthQuestionId = '6';
    const seventhQuestionId = '7';
    const firstAnswerId = '1';
    const secondAnswerId = '2';
    const thirdAnswerId = '3';
    const fourthAnswerId = '4';
    const fifthAnswerId = '5';
    Map<String, String> answers = {};
    answers[firstQuestionId] = secondAnswerId;
    answers[secondQuestionId] = firstAnswerId;
    answers[thirdQuestionId] = thirdAnswerId;
    answers[fourthQuestionId] = fifthAnswerId;
    answers[fifthQuestionId] = fourthAnswerId;
    answers[sixthQuestionId] = firstAnswerId;
    answers[seventhQuestionId] = secondAnswerId;
    await Future.delayed(const Duration(seconds: 1));
    if (errorText == 'error') throw Exception();
    return answers;
  }

  @override
  Future<void> saveForm(
      String formId, String partnerCode, Map<String, String> answers) async {
    const errorText = 'no';
    await Future.delayed(const Duration(seconds: 1));
    if (errorText == 'error') throw Exception();
  }
}
