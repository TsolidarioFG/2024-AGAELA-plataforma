import 'dart:io';

import 'package:agaela_app/features/password_recovery/services/password_recovery_service.dart';

class PasswordRecoveryServiceMock implements PasswordRecoveryService {
  @override
  Future<void> restorePassword(String dni) async {
    sleep(const Duration(seconds: 1));
  }
}
