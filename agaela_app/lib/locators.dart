import 'package:agaela_app/features/edit_password/services/edit_password_service.dart';
import 'package:agaela_app/features/edit_password/services/edit_password_service_mock.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service_mock.dart';
import 'package:agaela_app/features/login/services/login_service.dart';
import 'package:agaela_app/features/login/services/login_service_mock.dart';
import 'package:agaela_app/features/password_recovery/services/password_recovery_service.dart';
import 'package:agaela_app/features/password_recovery/services/password_recovery_service_mock.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton<PasswordRecoveryService>(
      () => PasswordRecoveryServiceMock());
  locator.registerLazySingleton<LoginService>(() => LoginServiceMock());
  locator.registerLazySingleton<EditProfileService>(
      () => EditProfileServiceMock());
  locator.registerLazySingleton<EditPasswordService>(
      () => EditPasswordServiceMock());
}
