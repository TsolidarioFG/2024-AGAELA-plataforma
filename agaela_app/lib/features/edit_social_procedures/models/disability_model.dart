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
}
