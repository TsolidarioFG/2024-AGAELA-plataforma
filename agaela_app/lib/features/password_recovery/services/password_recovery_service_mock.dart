import 'package:agaela_app/features/password_recovery/services/password_recovery_service.dart';

class PasswordRecoveryServiceMock implements PasswordRecoveryService {
  @override
  Future<void> restorePassword(String dni) async {
    const errorText = 'error';
    await Future.delayed(const Duration(seconds: 1));
    if (dni == errorText) throw Exception();
  }
}
