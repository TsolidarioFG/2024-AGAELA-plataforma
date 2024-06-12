import 'package:agaela_app/features/forms/models/question.dart';

abstract class EditFunctionalStateService {
  Future<List<Question>> getFormQuestions(String formId);
  Future<Map<String, String>?> getPreviousAnswers(String formId, int userId);
  Future<void> saveForm(String formId, int userId, Map<String, String> answers);
}
