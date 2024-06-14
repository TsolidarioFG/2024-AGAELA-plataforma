import 'package:agaela_app/features/forms/models/question.dart';

abstract class EditFunctionalStateService {
  Future<List<Question>> getFormQuestions(
      String formId, Map<String, List<Question>?> cachedQuestions);
  Future<Map<String, String>?> getPreviousAnswers(
      String formId, String partnerCode);
  Future<void> saveForm(
      String formId, String partnerCode, Map<String, String> answers);
}
