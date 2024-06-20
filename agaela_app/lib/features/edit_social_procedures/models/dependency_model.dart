class DependencyModel {
  Map<String, String> processedTypes = {};
  Map<String, String> unresolvedProceduresTypes = {};
  bool notifiedUrgently = false;
  bool resolutionSelected = false;
  bool individualizedAttentionPlan = false;
  bool gettingServices = false;
  String? processedTypeSelected;
  String? unresolvedProcedureSelected;

  DependencyModel();
}
