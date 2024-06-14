import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/carer.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';
import 'package:agaela_app/features/login/models/person_with_als.dart';
import 'package:agaela_app/features/login/services/login_service.dart';
import 'package:agaela_app/features/notifications/services/notifications_service.dart';
import 'package:agaela_app/locators.dart';
import 'package:agaela_app/utils/common_headers.dart';
import 'package:agaela_app/utils/token_utils.dart';
import 'package:http/http.dart' as http;

const _path = '/auth/login';

const _caredsPath = '/perfil/socios';

Object _body(String dni, String password) {
  return jsonEncode(<String, dynamic>{'login': dni, 'password': password});
}

class LoginServiceImpl implements LoginService {
  final NotificationsService _notificationsService =
      locator<NotificationsService>();

  @override
  Future<LoggedUser> login(String dni, String password) async {
    final response = await http.post(Uri.parse('$baseUrl$_path'),
        headers: jsonHeaders, body: _body(dni, password));
    if (response.statusCode == 200) {
      LoggedUser user;
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      await setToken(json['data']['token']);
      List<Cared> careds = await getCareds();
      if (json['data']['perfil']['tipoPerfil']['nombre'] == 'Afectado') {
        List<PendingForm> pendingForms =
            await _notificationsService.getNotifications(false);
        user = PersonWithAls.fromJson(json, careds.first.code, pendingForms);
      } else {
        List<PendingForm> pendingForms =
            await _notificationsService.getNotifications(true);
        user = Carer.fromJson(json, careds, pendingForms);
      }
      return user;
    } else {
      throw Exception();
    }
  }

  @override
  Future<List<Cared>> getCareds() async {
    final response = await http.get(Uri.parse('$baseUrl$_caredsPath'),
        headers: await authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      Iterable careds = json['data'];
      return List<Cared>.from(careds.map((cared) => Cared.fromJson(cared)));
    } else {
      return [];
    }
  }
}
