import 'package:agaela_app/features/edit_social_procedures/models/common_fields_model.dart';

class DependencyModel extends CommonFieldsModel {
  Map<String, String> dependencyLevelsTypes = {};
  Map<String, String> dependencyOrdersOfPaymentTypes = {};
  Map<String, String> dependencyServices = {};
  bool individualizedAttentionPlan = false;
  bool gettingServices = false;
  String? dependencyLevelSelected;
  String? serviceClarifications;
  List<String> dependencyOrdersOfPaymentSelected = [];
  List<String> dependencyServicesSelected = [];

  DependencyModel();

  factory DependencyModel.fromJson(Map<String, dynamic> json) {
    bool notifiedUrgently = json['notificadaViaUrgencia'] as bool? ?? false;
    bool resolution = json['resolucion'] as bool? ?? false;
    bool individualizedAttentionPlan = json['recibiendoPIA'] as bool? ?? false;
    bool gettingServices = json['recibiendoServicio'] as bool? ?? false;
    String? serviceClarifications =
        json['aclaracionesRecibiendoServicio'] as String?;
    Iterable dependencyOrdersOfPaymentSelectedJson = json['libranzas'] ?? [];
    List<String> dependencyOrdersOfPaymentSelected = [];
    for (Map<String, dynamic> dependencyOrderSelected
        in dependencyOrdersOfPaymentSelectedJson) {
      dependencyOrdersOfPaymentSelected
          .add(dependencyOrderSelected['id'] as String);
    }
    Iterable dependencyServicesSelectedJson = json['servicios'] ?? [];
    List<String> dependencyServicesSelected = [];
    for (Map<String, dynamic> dependencyServiceSelected
        in dependencyServicesSelectedJson) {
      dependencyServicesSelected.add(dependencyServiceSelected['id'] as String);
    }
    String? processedTypeSelected;
    String? unresolvedProcedureSelected;
    String? dependencyLevelSelected;
    Map<String, dynamic>? processedTypeSelectedMap =
        json['tipoTramitado'] as Map<String, dynamic>?;
    Map<String, dynamic>? unresolvedProcedureSelectedMap =
        json['tipoTramitadoNoResuelto'] as Map<String, dynamic>?;
    Map<String, dynamic>? dependencyLevelSelectedMap =
        json['tipoGradoDependencia'] as Map<String, dynamic>?;
    if (processedTypeSelectedMap == null) {
      processedTypeSelected = null;
    } else {
      processedTypeSelected = processedTypeSelectedMap['id'] as String;
    }
    if (unresolvedProcedureSelectedMap == null) {
      unresolvedProcedureSelected = null;
    } else {
      unresolvedProcedureSelected =
          unresolvedProcedureSelectedMap['id'] as String;
    }
    if (dependencyLevelSelectedMap == null) {
      dependencyLevelSelected = null;
    } else {
      dependencyLevelSelected = dependencyLevelSelectedMap['id'] as String;
    }
    DependencyModel disabilityModel = DependencyModel();
    disabilityModel.notifiedUrgently = notifiedUrgently;
    disabilityModel.resolutionSelected = resolution;
    disabilityModel.individualizedAttentionPlan = individualizedAttentionPlan;
    disabilityModel.gettingServices = gettingServices;
    disabilityModel.serviceClarifications = serviceClarifications;
    disabilityModel.processedTypeSelected = processedTypeSelected;
    disabilityModel.unresolvedProcedureSelected = unresolvedProcedureSelected;
    disabilityModel.dependencyLevelSelected = dependencyLevelSelected;
    disabilityModel.dependencyOrdersOfPaymentSelected =
        dependencyOrdersOfPaymentSelected;
    disabilityModel.dependencyServicesSelected = dependencyServicesSelected;
    return disabilityModel;
  }

  Map<String, dynamic> toJson() => {
        'idTipoTramitado': processedTypeSelected,
        'notificadaViaUrgencia': notifiedUrgently ? 1 : 0,
        'idTipoGradoDependecia': dependencyLevelSelected,
        'recibiendoPIA': individualizedAttentionPlan ? 1 : 0,
        'recibiendoServicio': gettingServices ? 1 : 0,
        'aclaracionesRecibiendoServicio': serviceClarifications,
        'idTipoTramiteNoResuelto': unresolvedProcedureSelected,
        'resolucion': resolutionSelected ? 1 : 0,
        'servicios': dependencyServicesSelected,
        'libranzas': dependencyOrdersOfPaymentSelected
      };
}
