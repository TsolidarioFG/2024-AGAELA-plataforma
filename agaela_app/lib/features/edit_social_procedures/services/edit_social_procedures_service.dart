import 'package:agaela_app/features/edit_social_procedures/models/cards_and_income_model.dart';
import 'package:agaela_app/features/edit_social_procedures/models/dependency_model.dart';
import 'package:agaela_app/features/edit_social_procedures/models/disability_model.dart';
import 'package:agaela_app/features/edit_social_procedures/models/permanent_work_disability_model.dart';

abstract class EditSocialProceduresService {
  Future<CardsAndIncomeModel> getCardsAndIncomeTypes(
      String partnerCode,
      Map<String, String>? healthCardTypes,
      Map<String, String>? parkingCardTypes,
      Map<String, String>? netIncomeTypes);

  Future<CardsAndIncomeModel> getPreviousCardsAndIncomeAnswers(
      String partnerCode);

  Future<void> setCardsAndIncome(
      String partnerCode, CardsAndIncomeModel cardsAndIncomeTypes);

  Future<PermanentWorkDisabilityModel> getPermanentWorkDisabilityField(
      String partnerCode,
      Map<String, String>? processedTypes,
      Map<String, String>? resolvedDisabilityTypes,
      Map<String, String>? unresolvedProceduresTypes);

  Future<PermanentWorkDisabilityModel>
      getPreviousPermanentWorkDisabilityAnswers(String partnerCode);

  Future<void> setPermanentWorkDisability(
      String partnerCode, PermanentWorkDisabilityModel permanentWorkDisability);

  Future<DisabilityModel> getDisabilityFields(
      String partnerCode,
      Map<String, String>? processedTypes,
      Map<String, String>? unresolvedProceduresTypes);

  Future<void> setDisability(String partnerCode, DisabilityModel disability);

  Future<DisabilityModel> getPreviousDisabilityAnswers(String partnerCode);

  Future<DependencyModel> getDependencyFields(
      String partnerCode,
      Map<String, String>? processedTypes,
      Map<String, String>? unresolvedProceduresTypes,
      Map<String, String>? dependencyLevelTypes,
      Map<String, String>? dependencyServicesTypes,
      Map<String, String>? dependencyOrdersOfPaymenTypes);

  Future<void> setDependency(String partnerCode, DependencyModel dependency);

  Future<DependencyModel> getPreviousDependencyAnswers(String partnerCode);
}
