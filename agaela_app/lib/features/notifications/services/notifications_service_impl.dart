import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';
import 'package:agaela_app/features/login/models/pending_form_carer.dart';
import 'package:agaela_app/features/login/models/pending_form_person_with_als.dart';
import 'package:agaela_app/features/notifications/services/notifications_service.dart';
import 'package:agaela_app/utils/token_utils.dart';
import 'package:http/http.dart' as http;

const _notificationsPath = '/perfil/notificaciones';

Future<Map<String, String>> _authHeaders() async {
  String? token = await getToken();
  return <String, String>{'X-Token': '$token'};
}

class NotificationsServiceImpl implements NotificationsService {
  @override
  Future<List<PendingForm>> getNotifications(bool carer) async {
    final response = await http.get(Uri.parse('$baseUrl$_notificationsPath'),
        headers: await _authHeaders());
    if (response.statusCode == 200) {
      Map<String, dynamic> json =
          jsonDecode(response.body) as Map<String, dynamic>;
      List<PendingForm> pendingForms = [];
      Iterable notificationsListList = json['data'];
      for (Iterable notificationsList in notificationsListList) {
        for (Map<String, dynamic> notification in notificationsList) {
          pendingForms.add(carer
              ? PendingFormCarer.fromJson(notification)
              : PendingFormPersonWithAls.fromJson(notification));
        }
      }
      return pendingForms;
    } else {
      return [];
    }
  }
}
