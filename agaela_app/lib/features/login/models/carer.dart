import 'package:agaela_app/features/login/models/cared.dart';
import 'package:agaela_app/features/login/models/logged_user.dart';

class Carer extends LoggedUser {
  final List<Cared> careds;

  Carer(
      {required this.careds,
      required super.name,
      required super.pendingForms,
      required super.isCarer});
}
