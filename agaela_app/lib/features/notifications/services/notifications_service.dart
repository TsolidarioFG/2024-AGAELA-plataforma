import 'package:agaela_app/features/login/models/pending_form.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class NotificationsService {
  Future<List<PendingForm>> getNotifications(bool carer);

  Future<void> initNotifications(
      Future<void> Function(RemoteMessage) onNotification);
}
