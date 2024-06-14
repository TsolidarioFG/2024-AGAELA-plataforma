import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart';
import 'package:agaela_app/features/forms/models/question.dart';
import 'package:agaela_app/utils/common_headers.dart';
import 'package:http/http.dart' as http;

String _getFormQuestionsPath(formCode) => '/formularioEscala/$formCode';

String _getPreviousAnswersAndSendAnswersPath(formCode, partnerCode) =>
    '/formularioEscala/$formCode/$partnerCode';

Object _saveFormBody(Map<String, String> answers) {
  List<Map<String, String>> questions = [];
  answers.forEach((key, value) {
    questions.add(<String, String>{'pregunta': key, 'respuesta': value});
  });
  return jsonEncode(<String, dynamic>{'preguntas': questions});
}

class EditFunctionalStateServiceImpl implements EditFunctionalStateService {
  @override
  Future<List<Question>> getFormQuestions(
      String formId, Map<String, List<Question>?> cachedQuestions) async {
    List<Question>? questions = cachedQuestions[formId];
    if (questions == null) {
      final response = await http.get(
          Uri.parse('$baseUrl${_getFormQuestionsPath(formId)}'),
          headers: await authHeaders());
      if (response.statusCode == 200) {
        Map<String, dynamic> json =
            jsonDecode(response.body) as Map<String, dynamic>;
        Iterable questions = json['data']['preguntas'];
        return List<Question>.from(
            questions.map((question) => Question.fromJson(question)));
      } else {
        throw Exception();
      }
    } else {
      return questions;
    }
  }

  @override
  Future<Map<String, String>?> getPreviousAnswers(
      String formId, String partnerCode) async {
    final response = await http.get(
        Uri.parse(
            '$baseUrl${_getPreviousAnswersAndSendAnswersPath(formId, partnerCode)}'),
        headers: await authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      if (json['data'] == null) {
        return null;
      }
      Iterable questions = json['data']['preguntas'];
      Map<String, String> previousAnswers = <String, String>{};
      for (Map<String, dynamic> question in questions) {
        previousAnswers[question['pregunta']['codigo']] =
            question['respuestaSeleccionada']['codigo'];
      }
      return previousAnswers;
    } else {
      return null;
    }
  }

  @override
  Future<void> saveForm(
      String formId, String partnerCode, Map<String, String> answers) async {
    final response = await http.post(
        Uri.parse(
            '$baseUrl${_getPreviousAnswersAndSendAnswersPath(formId, partnerCode)}'),
        headers: await headersAuthAndJson(),
        body: _saveFormBody(answers));
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
