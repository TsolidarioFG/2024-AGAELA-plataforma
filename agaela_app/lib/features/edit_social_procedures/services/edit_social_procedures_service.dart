import 'package:agaela_app/features/edit_social_procedures/models/cards_and_income_model.dart';
import 'package:agaela_app/features/edit_social_procedures/models/permanent_work_disability_model.dart';

abstract class EditSocialProceduresService {
  Future<Map<String, String>> getHealthCardTypes();

  Future<Map<String, String>> getParkingCardTypes();

  Future<Map<String, String>> getNetIncomeCardTypes();

  Future<CardsAndIncomeModel> getCardsAndIncomeTypes(String partnerCode);

  Future<CardsAndIncomeModel> getPreviousCardsAndIncomeAnswers(
      String partnerCode);

  Future<void> setCardsAndIncome(
      String partnerCode, CardsAndIncomeModel cardsAndIncomeTypes);

  Future<Map<String, String>> getProcessedTypes();

  Future<Map<String, String>> getResolvedDisabilityTypes();

  Future<Map<String, String>> getUnresolvedProceduresTypes();

  Future<PermanentWorkDisabilityModel> getPermanentWorkDisabilityField();

  Future<void> setPermanentWorkDisability(
      String partnerCode, PermanentWorkDisabilityModel permanentWorkDisability);
}
