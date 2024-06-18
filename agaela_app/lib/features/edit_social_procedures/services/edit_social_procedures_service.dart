abstract class EditSocialProceduresService {
  Future<Map<String, String>> getHealthCardTypes();

  Future<Map<String, String>> getParkingCardTypes();

  Future<Map<String, String>> getNetIncomeCardTypes();

  Future<List<Map<String, String>>> getCardsAndIncomeTypes();

  Future<List<String>> getPreviousCardsAndIncomeAnswers(String partnerCode);

  Future<void> setCardsAndIncome(
      String partnerCode, List<String> cardsAndIncomeTypesId);
}
