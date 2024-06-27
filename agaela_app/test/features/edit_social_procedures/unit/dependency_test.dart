import 'package:agaela_app/features/edit_social_procedures/models/dependency_model.dart';
import 'package:test/test.dart';

void main() {
  test('Dependency from json method works correctly', () {
    String processedId = '1';
    String unresolvedId = '3';
    bool resolution = true;
    bool notifiedUrgently = false;
    bool individualizedAttentionPlan = true;
    bool gettingServices = false;
    String dependencyLevelSelected = '2';
    String serviceClarifications = 'nothing';
    Map<String, dynamic> json = {
      'tipoTramitado': {'id': processedId},
      'tipoGradoDependencia': {'id': dependencyLevelSelected},
      'tipoTramitadoNoResuelto': {'id': unresolvedId},
      'resolucion': resolution,
      'notificadaViaUrgencia': notifiedUrgently,
      'recibiendoPIA': individualizedAttentionPlan,
      'recibiendoServicio': gettingServices,
      'aclaracionesRecibiendoServicio': serviceClarifications,
      'libranzas': [],
      'servicios': []
    };
    DependencyModel example = DependencyModel.fromJson(json);
    expect(example.processedTypeSelected, processedId);
    expect(example.dependencyLevelSelected, dependencyLevelSelected);
    expect(example.unresolvedProcedureSelected, unresolvedId);
    expect(example.resolutionSelected, resolution);
    expect(example.notifiedUrgently, notifiedUrgently);
    expect(example.individualizedAttentionPlan, individualizedAttentionPlan);
    expect(example.gettingServices, gettingServices);
    expect(example.serviceClarifications, serviceClarifications);
    expect(example.dependencyOrdersOfPaymentSelected, []);
    expect(example.dependencyServicesSelected, []);
  });

  test('Dependency to json method works correctly', () {
    String processedId = '1';
    String unresolvedId = '3';
    bool resolution = true;
    bool notifiedUrgently = false;
    bool individualizedAttentionPlan = true;
    bool gettingServices = false;
    String dependencyLevelSelected = '2';
    String serviceClarifications = 'nothing';
    Map<String, dynamic> json = {
      'tipoTramitado': {'id': processedId},
      'tipoGradoDependencia': {'id': dependencyLevelSelected},
      'tipoTramitadoNoResuelto': {'id': unresolvedId},
      'resolucion': resolution,
      'notificadaViaUrgencia': notifiedUrgently,
      'recibiendoPIA': individualizedAttentionPlan,
      'recibiendoServicio': gettingServices,
      'aclaracionesRecibiendoServicio': serviceClarifications,
      'libranzas': [],
      'servicios': []
    };
    DependencyModel example = DependencyModel.fromJson(json);
    Map<String, dynamic> jsonExpected = {
      'idTipoTramitado': processedId,
      'notificadaViaUrgencia': 0,
      'idTipoGradoDependecia': dependencyLevelSelected,
      'recibiendoPIA': 1,
      'recibiendoServicio': 0,
      'aclaracionesRecibiendoServicio': serviceClarifications,
      'idTipoTramiteNoResuelto': unresolvedId,
      'resolucion': 1,
      'servicios': [],
      'libranzas': []
    };
    expect(example.toJson(), jsonExpected);
  });
}
