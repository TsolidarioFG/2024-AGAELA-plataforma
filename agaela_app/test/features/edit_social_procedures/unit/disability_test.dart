import 'package:agaela_app/features/edit_social_procedures/models/disability_model.dart';
import 'package:test/test.dart';

void main() {
  test('Disability from json method works correctly', () {
    String processedId = '1';
    String unresolvedId = '3';
    bool resolution = true;
    bool notifiedUrgently = false;
    bool mobilityScale = true;
    bool thirdPartyScale = false;
    String disabilityPercentage = '70.2';
    Map<String, dynamic> json = {
      'tipoTramitada': {'id': processedId},
      'tipoTramitadoNoResuelto': {'id': unresolvedId},
      'resolucion': resolution,
      'notificadaViaUrgencia': notifiedUrgently,
      'baremoMovilidad': mobilityScale,
      'baremoTerceraPersona': thirdPartyScale,
      'porcentajeDiscapacidad': disabilityPercentage
    };
    DisabilityModel example = DisabilityModel.fromJson(json);
    expect(example.processedTypeSelected, processedId);
    expect(example.disabilityPercentage, disabilityPercentage);
    expect(example.unresolvedProcedureSelected, unresolvedId);
    expect(example.resolutionSelected, resolution);
    expect(example.notifiedUrgently, notifiedUrgently);
    expect(example.mobilityScale, mobilityScale);
    expect(example.thirdPartyScale, thirdPartyScale);
  });

  test('Disability to json method works correctly', () {
    String processedId = '1';
    String unresolvedId = '3';
    bool resolution = true;
    bool notifiedUrgently = false;
    bool mobilityScale = true;
    bool thirdPartyScale = false;
    String disabilityPercentage = '70.2';
    Map<String, dynamic> json = {
      'tipoTramitada': {'id': processedId},
      'tipoTramitadoNoResuelto': {'id': unresolvedId},
      'resolucion': resolution,
      'notificadaViaUrgencia': notifiedUrgently,
      'baremoMovilidad': mobilityScale,
      'baremoTerceraPersona': thirdPartyScale,
      'porcentajeDiscapacidad': disabilityPercentage
    };
    DisabilityModel example = DisabilityModel.fromJson(json);
    Map<String, dynamic> jsonExpected = {
      'idTipoTramitado': processedId,
      'notificadaViaUrgencia': 0,
      'porcentajeDiscapacidad': disabilityPercentage,
      'baremoMovilidad': 1,
      'baremoTerceraPersona': 0,
      'idTipoTramiteNoResuelto': unresolvedId,
      'resolucion': 1
    };
    expect(example.toJson(), jsonExpected);
  });
}
