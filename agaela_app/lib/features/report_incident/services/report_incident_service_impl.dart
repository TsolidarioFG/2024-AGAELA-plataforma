import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/report_incident/services/report_incident_service.dart';
import 'package:agaela_app/utils/token_utils.dart';
import 'package:http/http.dart' as http;

Future<Map<String, String>> _headers() async {
  String? token = await getToken();
  return <String, String>{
    'Content-Type': 'application/json',
    'X-Token': '$token'
  };
}

Object _body(String name, String message) {
  return jsonEncode(<String, dynamic>{'nombre': name, 'mensaje': message});
}

String _reportIncidentPath(code) => '/socio/incidencia/$code';

class ReportIncidentServiceImpl implements ReportIncidentService {
  @override
  Future<void> reportIncident(String code, String name, String incident) async {
    final response = await http.post(
        Uri.parse('$baseUrl${_reportIncidentPath(code)}'),
        headers: await _headers(),
        body: _body(name, incident));
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
