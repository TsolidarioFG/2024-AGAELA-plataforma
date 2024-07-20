import 'dart:convert';

import 'package:agaela_app/constants/global_constants.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';
import 'package:agaela_app/features/login/models/logged_user_provider.dart';
import 'package:agaela_app/features/login/models/pending_form.dart';
import 'package:agaela_app/features/login/models/pending_form_carer.dart';
import 'package:agaela_app/features/login/models/pending_form_person_with_als.dart';
import 'package:agaela_app/features/notifications/services/notifications_service.dart';
import 'package:agaela_app/routing/router.dart';
import 'package:agaela_app/utils/common_headers.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

const _notificationsPath = '/perfil/notificaciones';

class NotificationsServiceImpl implements NotificationsService {
  final _firebaseMessaging = FirebaseMessaging.instance;

  @override
  Future<List<PendingForm>> getNotifications(bool carer) async {
    final response = await http.get(Uri.parse('$baseUrl$_notificationsPath'),
        headers: await authHeaders());
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

  Future<void> onMessageWhileAppRunning() async {
    LoggedUser loggedUser = Provider.of<LoggedUserProvider>(
            globalNavigatorKey.currentContext!,
            listen: false)
        .loggedUser!;
    List<PendingForm> pendingForms = await getNotifications(loggedUser.isCarer);
    Provider.of<LoggedUserProvider>(globalNavigatorKey.currentContext!,
            listen: false)
        .loggedUser!
        .pendingForms = pendingForms;
    GoRouter.of(globalNavigatorKey.currentContext!)
        .goNamed(RoutesNames.notificationsHome.name);
  }

  @override
  Future<void> initNotifications(
      Future<void> Function(RemoteMessage) onNotification) async {
    await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true);
    final token = await _firebaseMessaging.getToken();
    debugPrint('Token: $token');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      onMessageWhileAppRunning();
    });
    FirebaseMessaging.onMessageOpenedApp
        .listen((RemoteMessage message) async => onMessageWhileAppRunning());
    FirebaseMessaging.onBackgroundMessage(onNotification);
  }
}
