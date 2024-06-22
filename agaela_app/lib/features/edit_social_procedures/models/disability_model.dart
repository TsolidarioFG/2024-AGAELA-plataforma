import 'package:agaela_app/features/edit_social_procedures/models/common_fields_model.dart';

class DisabilityModel extends CommonFieldsModel {
  bool mobilityScale = false;
  bool thirdPartyScale = false;
  String? disabilityPercentage;

  DisabilityModel();

  factory DisabilityModel.fromJson(Map<String, dynamic> json) {
    bool notifiedUrgently = json['notificadaViaUrgencia'] as bool? ?? false;
    bool resolution = json['resolucion'] as bool? ?? false;
    bool mobilityScale = json['baremoMovilidad'] as bool? ?? false;
    bool thirdPartyScale = json['baremoTerceraPersona'] as bool? ?? false;
    String? disabilityPercentage = json['porcentajeDiscapacidad'] as String?;
    String? processedTypeSelected;
    String? unresolvedProcedureSelected;
    Map<String, dynamic>? processedTypeSelectedMap =
        json['tipoTramitada'] as Map<String, dynamic>?;
    Map<String, dynamic>? unresolvedProcedureSelectedMap =
        json['tipoTramitadoNoResuelto'] as Map<String, dynamic>?;
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
    DisabilityModel disabilityModel = DisabilityModel();
    disabilityModel.notifiedUrgently = notifiedUrgently;
    disabilityModel.resolutionSelected = resolution;
    disabilityModel.mobilityScale = mobilityScale;
    disabilityModel.thirdPartyScale = thirdPartyScale;
    disabilityModel.disabilityPercentage = disabilityPercentage;
    disabilityModel.processedTypeSelected = processedTypeSelected;
    disabilityModel.unresolvedProcedureSelected = unresolvedProcedureSelected;
    return disabilityModel;
  }

  Map<String, dynamic> toJson() => {
        'idTipoTramitado': processedTypeSelected,
        'notificadaViaUrgencia': notifiedUrgently ? 1 : 0,
        'porcentajeDiscapacidad': disabilityPercentage,
        'baremoMovilidad': mobilityScale ? 1 : 0,
        'baremoTerceraPersona': thirdPartyScale ? 1 : 0,
        'idTipoTramiteNoResuelto': unresolvedProcedureSelected,
        'resolucion': resolutionSelected ? 1 : 0
      };
}
