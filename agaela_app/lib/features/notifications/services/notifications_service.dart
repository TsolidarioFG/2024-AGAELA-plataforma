import 'package:agaela_app/features/login/models/pending_form.dart';

abstract class NotificationsService {
  Future<List<PendingForm>> getNotifications(bool carer);

  Future<void> initNotifications();
}
