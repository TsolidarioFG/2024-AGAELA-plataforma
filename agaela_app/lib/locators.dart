import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart';
import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service_impl.dart';
import 'package:agaela_app/features/edit_password/services/edit_password_service.dart';
import 'package:agaela_app/features/edit_password/services/edit_password_service_impl.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service_impl.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service_impl.dart';
import 'package:agaela_app/features/login/services/login_service.dart';
import 'package:agaela_app/features/login/services/login_service_impl.dart';
import 'package:agaela_app/features/notifications/services/notifications_service.dart';
import 'package:agaela_app/features/notifications/services/notifications_service_impl.dart';
import 'package:agaela_app/features/password_recovery/services/password_recovery_service.dart';
import 'package:agaela_app/features/password_recovery/services/password_recovery_service_impl.dart';
import 'package:agaela_app/features/report_incident/services/report_incident_service.dart';
import 'package:agaela_app/features/report_incident/services/report_incident_service_impl.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void initLocator() {
  locator.registerLazySingleton<PasswordRecoveryService>(
      () => PasswordRecoveryServiceImpl());
  locator.registerLazySingleton<LoginService>(() => LoginServiceImpl());
  locator.registerLazySingleton<EditProfileService>(
      () => EditProfileServiceImpl());
  locator.registerLazySingleton<EditPasswordService>(
      () => EditPasswordServiceImpl());
  locator.registerLazySingleton<ReportIncidentService>(
      () => ReportIncidentServiceImpl());
  locator.registerLazySingleton<EditFunctionalStateService>(
      () => EditFunctionalStateServiceImpl());
  locator.registerLazySingleton<NotificationsService>(
      () => NotificationsServiceImpl());
  locator.registerLazySingleton<EditSocialProceduresService>(
      () => EditSocialProceduresServiceImpl());
}
