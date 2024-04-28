import 'package:agaela_app/features/login/models/pending_form.dart';

abstract class LoggedUser {
  final String name;
  final List<PendingForm> pendingForms;
  final bool isCarer;

  LoggedUser(
      {required this.name, required this.pendingForms, required this.isCarer});
}
