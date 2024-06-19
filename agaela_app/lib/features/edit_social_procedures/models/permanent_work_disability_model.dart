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
}
