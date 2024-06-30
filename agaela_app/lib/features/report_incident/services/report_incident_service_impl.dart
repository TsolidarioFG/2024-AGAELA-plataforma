import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/report_incident/services/report_incident_service.dart';
import 'package:agaela_app/utils/common_headers.dart';
import 'package:http/http.dart' as http;

Object _body(String name, String message) {
  return jsonEncode(<String, dynamic>{'nombre': name, 'mensaje': message});
}

String _reportIncidentPath(code) =>
    '/socio/incidencia${code != null ? '/$code' : ''}';

class ReportIncidentServiceImpl implements ReportIncidentService {
  @override
  Future<void> reportIncident(
      String? code, String name, String incident) async {
    final response = await http.post(
        Uri.parse('$baseUrl${_reportIncidentPath(code)}'),
        headers: await headersAuthAndJson(),
        body: _body(name, incident));
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
