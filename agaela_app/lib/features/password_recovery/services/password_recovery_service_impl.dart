import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/password_recovery/services/password_recovery_service.dart';
import 'package:agaela_app/utils/common_headers.dart';
import 'package:http/http.dart' as http;

const _path = '/auth/recordatorio';

Object _body(String dni) {
  return jsonEncode(<String, dynamic>{'login': dni});
}

class PasswordRecoveryServiceImpl implements PasswordRecoveryService {
  @override
  Future<void> restorePassword(String dni) async {
    final response = await http.post(Uri.parse('$baseUrl$_path'),
        headers: jsonHeaders, body: _body(dni));
    if (response.statusCode != 204) {
      throw Exception();
    }
  }
}
