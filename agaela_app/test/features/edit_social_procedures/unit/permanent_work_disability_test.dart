import 'package:agaela_app/features/edit_social_procedures/models/permanent_work_disability_model.dart';
import 'package:test/test.dart';

void main() {
  test('Permanent work disability from json method works correctly', () {
    String processedId = '1';
    String resolvedId = '2';
    String unresolvedId = '3';
    bool resolution = true;
    bool notifiedUrgently = false;
    Map<String, dynamic> json = {
      'tipoTramitado': {'id': processedId},
      'tipoIncapacidadResuelta': {'id': resolvedId},
      'tipoIncapacidadNoResuelta': {'id': unresolvedId},
      'resolucion': resolution,
      'notificadaViaUrgencia': notifiedUrgently
    };
    PermanentWorkDisabilityModel example =
        PermanentWorkDisabilityModel.fromJson(json);
    expect(example.processedTypeSelected, processedId);
    expect(example.resolvedDisabilitySelected, resolvedId);
    expect(example.unresolvedProcedureSelected, unresolvedId);
    expect(example.resolutionSelected, resolution);
    expect(example.notifiedUrgently, notifiedUrgently);
  });

  test('Permanent work disability to json method works correctly', () {
    String processedId = '1';
    String resolvedId = '2';
    String unresolvedId = '3';
    bool resolution = true;
    bool notifiedUrgently = false;
    Map<String, dynamic> json = {
      'tipoTramitado': {'id': processedId},
      'tipoIncapacidadResuelta': {'id': resolvedId},
      'tipoIncapacidadNoResuelta': {'id': unresolvedId},
      'resolucion': resolution,
      'notificadaViaUrgencia': notifiedUrgently
    };
    PermanentWorkDisabilityModel example =
        PermanentWorkDisabilityModel.fromJson(json);
    Map<String, dynamic> jsonExpected = {
      'idTipoTramitado': processedId,
      'notificadaViaUrgencia': 0,
      'idTipoIncapacidadResuelta': resolvedId,
      'idTipoIncapacidadNoResuelta': unresolvedId,
      'resolucion': 1
    };
    expect(example.toJson(), jsonExpected);
  });
}
