import 'package:agaela_app/features/report_incident/services/report_incident_service.dart';

class ReportIncidentServiceMock implements ReportIncidentService {
  @override
  Future<void> reportIncident(int userId, String incident) async {
    const errorText = 'no';
    await Future.delayed(const Duration(seconds: 1));
    if ('error' == errorText) throw Exception();
  }
}
