class CardsAndIncomeModel {
  Map<String, String> healthCardTypes = {};
  Map<String, String> parkingCardTypes = {};
  Map<String, String> netIncomeTypes = {};
  String? healthCardTypeSelected;
  String? parkingCardTypeSelected;
  String? netIncomeTypeSelected;

  CardsAndIncomeModel();

  factory CardsAndIncomeModel.fromJson(Map<String, dynamic> json) {
    String? healthCardId;
    String? parkingCardId;
    String? netIncomeId;
    Map<String, dynamic>? healthCardMap =
        json['tarjetaSanitaria'] as Map<String, dynamic>?;
    Map<String, dynamic>? parkingCardMap =
        json['tarjetaEstacionamiento'] as Map<String, dynamic>?;
    Map<String, dynamic>? netIncomeMap =
        json['ingresosNetos'] as Map<String, dynamic>?;
    if (healthCardMap == null) {
      healthCardId = null;
    } else {
      healthCardId = healthCardMap['id'] as String;
    }
    if (parkingCardMap == null) {
      parkingCardId = null;
    } else {
      parkingCardId = parkingCardMap['id'] as String;
    }
    if (netIncomeMap == null) {
      netIncomeId = null;
    } else {
      netIncomeId = netIncomeMap['id'] as String;
    }
    CardsAndIncomeModel cardsAndIncomeModel = CardsAndIncomeModel();
    cardsAndIncomeModel.healthCardTypeSelected = healthCardId;
    cardsAndIncomeModel.parkingCardTypeSelected = parkingCardId;
    cardsAndIncomeModel.netIncomeTypeSelected = netIncomeId;
    return cardsAndIncomeModel;
  }

  Map<String, dynamic> toJson() => {
        'idTipoTarjetaSanitaria': healthCardTypeSelected,
        'idTipoTarjetaEstacionamiento': parkingCardTypeSelected,
        'idTipoIngresosNetos': netIncomeTypeSelected
      };
}
