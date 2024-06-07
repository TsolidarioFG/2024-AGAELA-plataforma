import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/edit_password/services/edit_password_service.dart';
import 'package:agaela_app/utils/token_utils.dart';
import 'package:http/http.dart' as http;

const _path = '/perfilSocio/password';

Future<Map<String, String>> _headers() async {
  String? token = await getToken();
  return <String, String>{
    'Content-Type': 'application/json',
    'X-Token': '$token'
  };
}

Object _body(String oldPassword, String newPassword) {
  return jsonEncode(<String, dynamic>{
    'old_password': oldPassword,
    'new_password': newPassword
  });
}

class EditPasswordServiceImpl implements EditPasswordService {
  @override
  Future<void> editPassword(String oldPassword, String newPassword) async {
    final response = await http.post(Uri.parse('$baseUrl$_path'),
        headers: await _headers(), body: _body(oldPassword, newPassword));
    if (response.statusCode != 200) {
      throw Exception();
    }
  }
}
