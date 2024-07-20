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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

const _notificationsPath = '/perfil/notificaciones';

@pragma('vm:entry-point')
Future<void> onBackgroundMessage(RemoteMessage message) async {}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel',
  'High Importance Channel',
  description: 'This channel is used for important notifications',
  importance: Importance.max,
  playSound: true,
  enableLights: true,
);

class NotificationsServiceImpl implements NotificationsService {
  final _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

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

  Future<void> updateNotifications() async {
    LoggedUser? loggedUser = Provider.of<LoggedUserProvider>(
            globalNavigatorKey.currentContext!,
            listen: false)
        .loggedUser;
    if (loggedUser != null) {
      List<PendingForm> pendingForms =
          await getNotifications(loggedUser.isCarer);
      Provider.of<LoggedUserProvider>(globalNavigatorKey.currentContext!,
              listen: false)
          .loggedUser!
          .pendingForms = pendingForms;
    }
  }

  Future<void> onMessageWhileAppRunning() async {
    await updateNotifications();
    LoggedUser? loggedUser = Provider.of<LoggedUserProvider>(
            globalNavigatorKey.currentContext!,
            listen: false)
        .loggedUser;
    final snackBar = SnackBar(
      content: Text(AppLocalizations.of(globalNavigatorKey.currentContext!)!
          .newNotificationText),
      action: loggedUser != null
          ? SnackBarAction(
              label: AppLocalizations.of(globalNavigatorKey.currentContext!)!
                  .goToNotificationScreenSnackBar,
              onPressed: () => GoRouter.of(globalNavigatorKey.currentContext!)
                  .goNamed(RoutesNames.notificationsHome.name),
            )
          : null,
    );
    ScaffoldMessenger.of(globalNavigatorKey.currentContext!)
        .showSnackBar(snackBar);
  }

  Future<void> onMessageOpenedWhileAppRunning() async {
    await updateNotifications();
    LoggedUser? loggedUser = Provider.of<LoggedUserProvider>(
            globalNavigatorKey.currentContext!,
            listen: false)
        .loggedUser;
    if (loggedUser != null) {
      GoRouter.of(globalNavigatorKey.currentContext!)
          .goNamed(RoutesNames.notificationsHome.name);
    }
  }

  @override
  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: false,
        criticalAlert: true,
        provisional: false,
        sound: true);
    final token = await _firebaseMessaging.getToken();
    debugPrint('Token: $token');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      onMessageWhileAppRunning();
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      onMessageOpenedWhileAppRunning();
    });
    FirebaseMessaging.onBackgroundMessage(onBackgroundMessage);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
  }
}
