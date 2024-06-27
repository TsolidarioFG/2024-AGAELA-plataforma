import 'package:agaela_app/features/edit_social_procedures/models/cards_and_income_model.dart';
import 'package:test/test.dart';

void main() {
  test('Cards and income from json method works correctly', () {
    String healthCardId = '1';
    String parkingCardId = '2';
    String netIncomeId = '3';
    Map<String, dynamic> json = {
      'tarjetaSanitaria': {'id': healthCardId},
      'tarjetaEstacionamiento': {'id': parkingCardId},
      'ingresosNetos': {'id': netIncomeId}
    };
    CardsAndIncomeModel example = CardsAndIncomeModel.fromJson(json);
    expect(example.healthCardTypeSelected, healthCardId);
    expect(example.parkingCardTypeSelected, parkingCardId);
    expect(example.netIncomeTypeSelected, netIncomeId);
  });

  test('Cards and income to json method works correctly', () {
    String healthCardId = '1';
    String parkingCardId = '2';
    String netIncomeId = '3';
    Map<String, dynamic> json = {
      'tarjetaSanitaria': {'id': healthCardId},
      'tarjetaEstacionamiento': {'id': parkingCardId},
      'ingresosNetos': {'id': netIncomeId}
    };
    CardsAndIncomeModel example = CardsAndIncomeModel.fromJson(json);
    Map<String, dynamic> jsonExpected = {
      'idTipoTarjetaSanitaria': healthCardId,
      'idTipoTarjetaEstacionamiento': parkingCardId,
      'idTipoIngresosNetos': netIncomeId
    };
    expect(example.toJson(), jsonExpected);
  });
}
