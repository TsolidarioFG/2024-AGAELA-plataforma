import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/forms/models/question.dart';
import 'package:flutter/material.dart';

class CachedQuestions extends ChangeNotifier {
  Map<String, List<Question>?> formQuestions = {
    ratingScaleFormId: null,
    barthelIndexFormId: null,
    caregiverOverloadFormId: null
  };
}
