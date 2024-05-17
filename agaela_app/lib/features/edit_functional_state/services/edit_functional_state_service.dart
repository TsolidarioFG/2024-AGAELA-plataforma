import 'package:agaela_app/features/forms/models/question.dart';

abstract class EditFunctionalStateService {
  Future<List<Question>> getFormQuestions(int formId);
  Future<Map<int, int>?> getPreviousAnswers(int formId, int userId);
}
