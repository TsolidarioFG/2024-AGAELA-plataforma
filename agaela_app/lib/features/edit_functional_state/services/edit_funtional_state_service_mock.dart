import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart';
import 'package:agaela_app/features/forms/models/answer.dart';
import 'package:agaela_app/features/forms/models/question.dart';

class EditFunctionalStateServiceMock implements EditFunctionalStateService {
  List<Question> ratingScale() {
    Answer answer1 = Answer(1, 'Habla normal');
    Answer answer2 = Answer(2, 'Alteraciones en el habla detectables');
    Answer answer3 = Answer(3, 'Habla inteligible con repeticiones');
    Answer answer4 =
        Answer(4, 'Uso lenguaje verbal combinado con comunicación no verbal');
    Answer answer5 = Answer(5, 'Pérdida de habla útil');
    Question firstQuestion =
        Question(1, 'Lenguaje', [answer1, answer2, answer3, answer4, answer5]);
    Answer answer6 = Answer(1, 'Normal');
    Answer answer7 = Answer(2,
        'Exceso de saliva leve (pero claro) en boca; posible babeo nocturno');
    Answer answer8 =
        Answer(3, 'Exceso de saliva moderado; posible babeo mínimo');
    Answer answer9 = Answer(4, 'Exceso de saliva marcado con algo de babeo');
    Answer answer10 =
        Answer(5, 'Babeo marcado; que requiere uso de pañuelo constante');
    Question secondQuestion = Question(
        2, 'Salivación', [answer6, answer7, answer8, answer9, answer10]);
    Answer answer11 = Answer(1, 'Hábitos de alimentación normales');
    Answer answer12 =
        Answer(2, 'Problemas precoces para tragar (atragantamiento ocasional)');
    Answer answer13 =
        Answer(3, 'Precisa cambios en la consistencia de la dieta');
    Answer answer14 =
        Answer(4, 'Necesidad de alimentación suplementaria por sonda');
    Answer answer15 = Answer(5, 'Alimentación exclusiva por sonda');
    Question thirdQuestion = Question(
        3, 'Tragar', [answer11, answer12, answer13, answer14, answer15]);
    Answer answer16 = Answer(1, 'Normal');
    Answer answer17 = Answer(2, 'Lenta; pero todas las palabras son legibles');
    Answer answer18 = Answer(3, 'No todas las palabras son legibles');
    Answer answer19 =
        Answer(4, 'Es capaz de sujetar el lápiz, pero no es capaz de escribir');
    Answer answer20 = Answer(5, 'Incapaz de sujetar el lápiz');
    Question fourthQuestion = Question(
        4, 'Escritura', [answer16, answer17, answer18, answer19, answer20]);
    Answer answer21 = Answer(1, 'No');
    Answer answer22 = Answer(2, 'Ocurre solo cuando camina');
    Answer answer23 = Answer(3,
        'Ocurre en una o más de las siguientes actividades diarias: comer, asearse, vestirse');
    Answer answer24 = Answer(
        4, 'Ocurre en reposo, dificultad respiratoria sentado o tumbado');
    Answer answer25 = Answer(5,
        'Dificultad importe, se ha considera el uso de soporte respiratorio o ventilatorio mecánico');
    Question fifthQuestion = Question(
        5, 'Disnea', [answer21, answer22, answer23, answer24, answer25]);
    Answer answer26 = Answer(1, 'No');
    Answer answer27 = Answer(2,
        'Alguna dificultad para dormir por la noche. Necesita más de 2 almohadas');
    Answer answer28 =
        Answer(3, 'Necesita más de 2 almohadas para poder dormir');
    Answer answer29 = Answer(4, 'Solo puede dormir sentado');
    Answer answer30 =
        Answer(5, 'Incapaz de dormir por sensación de falta da aire');
    Question sixthQuestion = Question(6, 'Ortopnea (falta de aire acos-tado)',
        [answer26, answer27, answer28, answer29, answer30]);
    Answer answer31 = Answer(1, 'No');
    Answer answer32 = Answer(2, 'Uso intermitente BIPAP');
    Answer answer33 = Answer(3, 'Uso continuo BIPAP durante la noche');
    Answer answer34 = Answer(4, 'Uso continuo de BIPAP, noche y día');
    Answer answer35 = Answer(5,
        'Precisa ventilación mecánica invasiva por intubación o traqueostomía');
    Question seventhQuestion = Question(7, ' Insuficiencia respiratoria',
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
    Answer answer1 = Answer(1, 'Nunca');
    Answer answer2 = Answer(2, 'Casi nunca');
    Answer answer3 = Answer(3, 'Ás veces');
    Answer answer4 = Answer(4, 'Bastantes veces');
    Answer answer5 = Answer(5, 'Case sempre');
    Question question1 = Question(
        1,
        'Sente que o seu familiar solicita máis axuda da que realmente necesita?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question2 = Question(
        2,
        'Sente que debido ao tempo que adica ao seu familiar xa non dispón de tempo suficiente para vostede?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question3 = Question(
        3,
        'Séntese tenso/a cando ten que coidar o seu famliar e atender ademáis outras responsabilidades?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question4 = Question(
        4,
        'Séntese avergoñado pola conduta do seu familiar?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question5 = Question(
        5,
        'Cree que a situación actual afecta de maneira negativa a súa relación con amigos e outros membros da familia?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question6 = Question(
        6,
        'Sente temor polo futuro que lle espera á súa familia?',
        [answer1, answer2, answer3, answer4, answer5]);
    Question question7 = Question(
        7,
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
    if (formId == 1) questions = ratingScale();
    if (formId == 3) questions = caregiverOverload();
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
    const fourthQuestionId = 4;
    const fifthQuestionId = 5;
    const sixthQuestionId = 6;
    const seventhQuestionId = 7;
    const firstAnswerId = 1;
    const secondAnswerId = 2;
    const thirdAnswerId = 3;
    const fourthAnswerId = 4;
    const fifthAnswerId = 5;
    Map<int, int> answers = {};
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
  Future<void> saveForm(int formId, int userId, Map<int, int> answers) async {
    const errorText = 'no';
    await Future.delayed(const Duration(seconds: 1));
    if (errorText == 'error') throw Exception();
  }
}
