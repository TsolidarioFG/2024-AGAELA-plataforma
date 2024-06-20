class DependencyModel {
  Map<String, String> processedTypes = {};
  Map<String, String> unresolvedProceduresTypes = {};
  Map<String, String> dependencyLevelsTypes = {};
  bool notifiedUrgently = false;
  bool resolutionSelected = false;
  bool individualizedAttentionPlan = false;
  bool gettingServices = false;
  String? processedTypeSelected;
  String? unresolvedProcedureSelected;
  String? dependencyLevelSelected;
  String? serviceClarifications;

  DependencyModel();

  Map<String, dynamic> toJson() => {
        "idTipoTramitado": processedTypeSelected,
        "notificadaViaUrgencia": notifiedUrgently ? 1 : 0,
        "idTipoGradoDependecia": dependencyLevelSelected,
        "recibiendoPIA": individualizedAttentionPlan ? 1 : 0,
        "recibiendoServicio": gettingServices ? 1 : 0,
        "aclaracionesRecibiendoServicio": serviceClarifications,
        "idTipoTramiteNoResuelto": unresolvedProcedureSelected,
      };
}
