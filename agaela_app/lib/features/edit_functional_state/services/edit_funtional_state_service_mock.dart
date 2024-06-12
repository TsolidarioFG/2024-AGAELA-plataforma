import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart';
import 'package:agaela_app/features/forms/models/answer.dart';
import 'package:agaela_app/features/forms/models/question.dart';

class EditFunctionalStateServiceMock implements EditFunctionalStateService {
  List<Question> ratingScale() {
    Answer answer1 = Answer(1, 'Habla normal', 'cdccdsccd');
    Answer answer2 =
        Answer(2, 'Alteraciones en el habla detectables', 'cdccdsccd');
    Answer answer3 =
        Answer(3, 'Habla inteligible con repeticiones', 'cdccdsccd');
    Answer answer4 = Answer(
        4,
        'Uso lenguaje verbal combinado con comunicación no verbal',
        'cdccdsccd');
    Answer answer5 = Answer(5, 'Pérdida de habla útil', 'cdccdsccd');
    Question firstQuestion = Question(1, 'cdscdsacdsac', 'Lenguaje',
        [answer1, answer2, answer3, answer4, answer5]);
    Answer answer6 = Answer(1, 'Normal', 'cdccdsccd');
    Answer answer7 = Answer(
        2,
        'Exceso de saliva leve (pero claro) en boca; posible babeo nocturno',
        'cdccdsccd');
    Answer answer8 = Answer(
        3, 'Exceso de saliva moderado; posible babeo mínimo', 'cdccdsccd');
    Answer answer9 =
        Answer(4, 'Exceso de saliva marcado con algo de babeo', 'cdccdsccd');
    Answer answer10 = Answer(
        5, 'Babeo marcado; que requiere uso de pañuelo constante', 'cdccdsccd');
    Question secondQuestion = Question(2, 'cdscdsacdsac', 'Salivación',
        [answer6, answer7, answer8, answer9, answer10]);
    Answer answer11 =
        Answer(1, 'Hábitos de alimentación normales', 'cdccdsccd');
    Answer answer12 = Answer(
        2,
        'Problemas precoces para tragar (atragantamiento ocasional)',
        'cdccdsccd');
    Answer answer13 = Answer(
        3, 'Precisa cambios en la consistencia de la dieta', 'cdccdsccd');
    Answer answer14 = Answer(
        4, 'Necesidad de alimentación suplementaria por sonda', 'cdccdsccd');
    Answer answer15 =
        Answer(5, 'Alimentación exclusiva por sonda', 'cdccdsccd');
    Question thirdQuestion = Question(3, 'cdscdsacdsac', 'Tragar',
        [answer11, answer12, answer13, answer14, answer15]);
    Answer answer16 = Answer(1, 'Normal', 'cdccdsccd');
    Answer answer17 =
        Answer(2, 'Lenta; pero todas las palabras son legibles', 'cdccdsccd');
    Answer answer18 =
        Answer(3, 'No todas las palabras son legibles', 'cdccdsccd');
    Answer answer19 = Answer(
        4,
        'Es capaz de sujetar el lápiz, pero no es capaz de escribir',
        'cdccdsccd');
    Answer answer20 = Answer(5, 'Incapaz de sujetar el lápiz', 'cdccdsccd');
    Question fourthQuestion = Question(4, 'cdscdsacdsac', 'Escritura',
        [answer16, answer17, answer18, answer19, answer20]);
    Answer answer21 = Answer(1, 'No', 'cdccdsccd');
    Answer answer22 = Answer(2, 'Ocurre solo cuando camina', 'cdccdsccd');
    Answer answer23 = Answer(
        3,
        'Ocurre en una o más de las siguientes actividades diarias: comer, asearse, vestirse',
        'cdccdsccd');
    Answer answer24 = Answer(
        4,
        'Ocurre en reposo, dificultad respiratoria sentado o tumbado',
        'cdccdsccd');
    Answer answer25 = Answer(
        5,
        'Dificultad importe, se ha considera el uso de soporte respiratorio o ventilatorio mecánico',
        'cdccdsccd');
    Question fifthQuestion = Question(5, 'cdscdsacdsac', 'Disnea',
        [answer21, answer22, answer23, answer24, answer25]);
    Answer answer26 = Answer(1, 'No', 'cdccdsccd');
    Answer answer27 = Answer(
        2,
        'Alguna dificultad para dormir por la noche. Necesita más de 2 almohadas',
        'cdccdsccd');
    Answer answer28 =
        Answer(3, 'Necesita más de 2 almohadas para poder dormir', 'cdccdsccd');
    Answer answer29 = Answer(4, 'Solo puede dormir sentado', 'cdccdsccd');
    Answer answer30 = Answer(
        5, 'Incapaz de dormir por sensación de falta da aire', 'cdccdsccd');
    Question sixthQuestion = Question(
        6,
        'cdscdsacdsac',
        'Ortopnea (falta de aire acos-tado)',
        [answer26, answer27, answer28, answer29, answer30]);
    Answer answer31 = Answer(1, 'No', 'cdccdsccd');
    Answer answer32 = Answer(2, 'Uso intermitente BIPAP', 'cdccdsccd');
    Answer answer33 =
        Answer(3, 'Uso continuo BIPAP durante la noche', 'cdccdsccd');
    Answer answer34 =
        Answer(4, 'Uso continuo de BIPAP, noche y día', 'cdccdsccd');
    Answer answer35 = Answer(
        5,
        'Precisa ventilación mecánica invasiva por intubación o traqueostomía',
        'cdccdsccd');
    Question seventhQuestion = Question(
        7,
        'cdscdsacdsac',
        ' Insuficiencia respiratoria',
        [answer31, answer32, answer33, answer34, answer35]);
    return [
      firstQuestion,
      secondQuestion,
      thirdQuestion,
      fourthQuestion,
      fifthQuestion,
      sixthQuestion,
      seventhQuestion
    ];
  }

  List<Question> caregiverOverload() {
    Answer answer1 = Answer(1, 'Nunca', 'cdccdsccd');
    Answer answer2 = Answer(2, 'Casi nunca', 'cdccdsccd');
    Answer answer3 = Answer(3, 'Ás veces', 'cdccdsccd');
    Answer answer4 = Answer(4, 'Bastantes veces', 'cdccdsccd');
    Answer answer5 = Answer(5, 'Case sempre', 'cdccdsccd');
    Question question1 = Question(
        1,
        'cdscdsacdsac',
        'Sente que o seu familiar solicita máis axuda da que realmente necesita?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question2 = Question(
        2,
        'cdscdsacdsac',
        'Sente que debido ao tempo que adica ao seu familiar xa non dispón de tempo suficiente para vostede?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question3 = Question(
        3,
        'cdscdsacdsac',
        'Séntese tenso/a cando ten que coidar o seu famliar e atender ademáis outras responsabilidades?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question4 = Question(
        4,
        'cdscdsacdsac',
        'Séntese avergoñado pola conduta do seu familiar?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question5 = Question(
        5,
        'cdscdsacdsac',
        'Cree que a situación actual afecta de maneira negativa a súa relación con amigos e outros membros da familia?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question6 = Question(
        6,
        'cdscdsacdsac',
        'Sente temor polo futuro que lle espera á súa familia?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question7 = Question(
        7,
        'cdscdsacdsac',
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
  Future<List<Question>> getFormQuestions(String formId) async {
    const errorText = 'no';
    Answer answer1 = Answer(1, 'Yes', 'cdccdsccd');
    Answer answer2 = Answer(2, 'No', 'cdccdsccd');
    Answer answer3 = Answer(3, 'Maybe', 'cdccdsccd');
    Question firstQuestion =
        Question(1, 'dsacsdcsadcds', 'Test 1', [answer1, answer2, answer3]);
    Answer answer4 = Answer(1, 'Yes', 'cdccdsccd');
    Answer answer5 = Answer(2, 'No', 'cdccdsccd');
    Answer answer6 = Answer(3, 'Maybe', 'cdccdsccd');
    Question secondQuestion =
        Question(2, 'cdscdsacdsac', 'Test 2', [answer4, answer5, answer6]);
    Answer answer7 = Answer(1, 'Yes', 'cdccdsccd');
    Answer answer8 = Answer(2, 'No', 'cdccdsccd');
    Answer answer9 = Answer(3, 'Maybe', 'cdccdsccd');
    Question thirdQuestion =
        Question(3, 'cdsacscsad', 'Test 3', [answer7, answer8, answer9]);
    List<Question> questions = [firstQuestion, secondQuestion, thirdQuestion];
    if (formId == ratingScaleFormId) questions = ratingScale();
    if (formId == caregiverOverloadFormId) questions = caregiverOverload();
    await Future.delayed(const Duration(seconds: 1));
    if (errorText == 'error') throw Exception();
    return questions;
  }

  @override
  Future<Map<String, String>?> getPreviousAnswers(
      String formId, int userId) async {
    const errorText = 'no';
    const firstQuestionId = 'a';
    const secondQuestionId = 'b';
    const thirdQuestionId = 'c';
    const fourthQuestionId = 'd';
    const fifthQuestionId = 'e';
    const sixthQuestionId = 'f';
    const seventhQuestionId = 'g';
    const firstAnswerId = 'aa';
    const secondAnswerId = 'bb';
    const thirdAnswerId = 'cc';
    const fourthAnswerId = 'dd';
    const fifthAnswerId = 'ee';
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
      String formId, int userId, Map<String, String> answers) async {
    const errorText = 'no';
    await Future.delayed(const Duration(seconds: 1));
    if (errorText == 'error') throw Exception();
  }
}
