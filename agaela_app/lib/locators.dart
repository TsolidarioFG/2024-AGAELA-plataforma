import 'package:agaela_app/features/password_recovery/services/password_recovery_service.dart';
import 'package:agaela_app/features/password_recovery/services/password_recovery_service_mock.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton<PasswordRecoveryService>(
      () => PasswordRecoveryServiceMock());
}
