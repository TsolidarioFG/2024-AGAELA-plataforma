import 'package:agaela_app/features/edit_social_procedures/models/common_fields_model.dart';

class PermanentWorkDisabilityModel extends CommonFieldsModel {
  Map<String, String> resolvedDisabilityTypes = {};
  String? resolvedDisabilitySelected;

  PermanentWorkDisabilityModel();

  factory PermanentWorkDisabilityModel.fromJson(Map<String, dynamic> json) {
    bool notifiedUrgently = json['notificadaViaUrgencia'] as bool? ?? false;
    bool resolution = json['resolucion'] as bool? ?? false;
    String? processedTypeSelected;
    String? resolvedDisabilitySelected;
    String? unresolvedProcedureSelected;
    Map<String, dynamic>? processedTypeSelectedMap =
        json['tipoTramitado'] as Map<String, dynamic>?;
    Map<String, dynamic>? resolvedDisabilitySelectedMap =
        json['tipoIncapacidadResuelta'] as Map<String, dynamic>?;
    Map<String, dynamic>? unresolvedProcedureSelectedMap =
        json['tipoIncapacidadNoResuelta'] as Map<String, dynamic>?;
    if (processedTypeSelectedMap == null) {
      processedTypeSelected = null;
    } else {
      processedTypeSelected = processedTypeSelectedMap['id'] as String;
    }
    if (resolvedDisabilitySelectedMap == null) {
      resolvedDisabilitySelected = null;
    } else {
      resolvedDisabilitySelected =
          resolvedDisabilitySelectedMap['id'] as String;
    }
    if (unresolvedProcedureSelectedMap == null) {
      unresolvedProcedureSelected = null;
    } else {
      unresolvedProcedureSelected =
          unresolvedProcedureSelectedMap['id'] as String;
    }
    PermanentWorkDisabilityModel permanentWorkDisabilityModel =
        PermanentWorkDisabilityModel();
    permanentWorkDisabilityModel.notifiedUrgently = notifiedUrgently;
    permanentWorkDisabilityModel.resolutionSelected = resolution;
    permanentWorkDisabilityModel.processedTypeSelected = processedTypeSelected;
    permanentWorkDisabilityModel.resolvedDisabilitySelected =
        resolvedDisabilitySelected;
    permanentWorkDisabilityModel.unresolvedProcedureSelected =
        unresolvedProcedureSelected;
    return permanentWorkDisabilityModel;
  }

  Map<String, dynamic> toJson() => {
        'idTipoTramitado': processedTypeSelected,
        'notificadaViaUrgencia': notifiedUrgently ? 1 : 0,
        'idTipoIncapacidadResuelta': resolvedDisabilitySelected,
        'idTipoIncapacidadNoResuelta': unresolvedProcedureSelected,
        'resolucion': resolutionSelected ? 1 : 0
      };
}
