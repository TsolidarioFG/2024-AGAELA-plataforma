import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/login/models/carer.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/person_with_als.dart';
import 'package:agaela_app/features/login/services/login_service.dart';
import 'package:http/http.dart' as http;

const _path = '/auth/login';

const _headers = <String, String>{'Content-Type': 'application/json'};

Object body(String dni, String password) {
  return jsonEncode(<String, dynamic>{'login': dni, 'password': password});
}

class LoginServiceImpl implements LoginService {
  @override
  Future<LoggedUser> login(String dni, String password) async {
    final response = await http.post(Uri.parse('$baseUrl$_path'),
        headers: _headers, body: body(dni, password));
    if (response.statusCode == 200) {
      LoggedUser user;
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      json['data']['perfil']['tipoPerfil']['nombre'] == 'Afectado'
          ? user = PersonWithAls.fromJson(json)
          : user = Carer.fromJson(json);
      return user;
    } else {
      throw Exception();
    }
  }
}
