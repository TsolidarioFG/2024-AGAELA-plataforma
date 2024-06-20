import 'package:agaela_app/features/edit_social_procedures/models/cards_and_income_model.dart';
import 'package:agaela_app/features/edit_social_procedures/models/dependency_model.dart';
import 'package:agaela_app/features/edit_social_procedures/models/disability_model.dart';
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

  Future<PermanentWorkDisabilityModel> getPermanentWorkDisabilityField(
      String partnerCode);

  Future<PermanentWorkDisabilityModel>
      getPreviousPermanentWorkDisabilityAnswers(String partnerCode);

  Future<void> setPermanentWorkDisability(
      String partnerCode, PermanentWorkDisabilityModel permanentWorkDisability);

  Future<DisabilityModel> getDisabilityFields(String partnerCode);

  Future<void> setDisability(String partnerCode, DisabilityModel disability);

  Future<DisabilityModel> getPreviousDisabilityAnswers(String partnerCode);

  Future<DependencyModel> getDependencyFields(String partnerCode);

  Future<Map<String, String>> getDependencyLevelsTypes();

  Future<void> setDependency(String partnerCode, DependencyModel dependency);
}
