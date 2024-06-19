class DisabilityModel {
  Map<String, String> processedTypes = {};
  Map<String, String> unresolvedProceduresTypes = {};
  bool notifiedUrgently = false;
  bool resolutionSelected = false;
  bool mobilityScale = false;
  bool thirdPartyScale = false;
  String? processedTypeSelected;
  String? unresolvedProcedureSelected;
  String? disabilityPercentage;

  DisabilityModel();

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
