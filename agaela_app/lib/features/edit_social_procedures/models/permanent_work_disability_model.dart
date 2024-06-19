class PermanentWorkDisabilityModel {
  Map<String, String> processedTypes;
  Map<String, String> resolvedDisabilityTypes;
  Map<String, String> unresolvedProceduresTypes;
  bool notifiedUrgently = false;
  bool resolutionSelected = false;
  String processedTypeSelected = '';
  String? resolvedDisabilitySelected;
  String? unresolvedProcedureSelected;

  PermanentWorkDisabilityModel(this.processedTypes,
      this.resolvedDisabilityTypes, this.unresolvedProceduresTypes);

  Map<String, dynamic> toJson() => {
        'idTipoTramitado': processedTypeSelected,
        'notificadaViaUrgencia': notifiedUrgently ? 1 : 0,
        'idTipoIncapacidadResuelta': resolvedDisabilitySelected,
        'idTipoIncapacidadNoResuelta': unresolvedProcedureSelected,
        'resolucion': resolutionSelected ? 1 : 0
      };
}
