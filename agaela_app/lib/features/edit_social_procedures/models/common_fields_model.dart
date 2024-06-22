abstract class CommonFieldsModel {
  Map<String, String> processedTypes = {};
  Map<String, String> unresolvedProceduresTypes = {};
  bool notifiedUrgently = false;
  bool resolutionSelected = false;
  String? processedTypeSelected;
  String? unresolvedProcedureSelected;

  CommonFieldsModel();
}
