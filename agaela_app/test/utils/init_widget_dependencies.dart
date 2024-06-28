import 'package:agaela_app/features/edit_functional_state/services/edit_functional_state_service.dart';
import 'package:agaela_app/features/edit_password/services/edit_password_service.dart';
import 'package:agaela_app/features/edit_profile/services/edit_profile_service.dart';
import 'package:agaela_app/features/edit_social_procedures/services/edit_social_procedures_service.dart';
import 'package:agaela_app/features/login/services/login_service.dart';
import 'package:agaela_app/features/notifications/services/notifications_service.dart';
import 'package:agaela_app/features/password_recovery/services/password_recovery_service.dart';
import 'package:agaela_app/features/report_incident/services/report_incident_service.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/annotations.dart';

import 'init_widget_dependencies.mocks.dart';

GetIt testLocator = GetIt.instance;

@GenerateMocks([
  PasswordRecoveryService,
  LoginService,
  EditProfileService,
  EditPasswordService,
  ReportIncidentService,
  EditFunctionalStateService,
  NotificationsService,
  EditSocialProceduresService
])
void initWidgetDependencies() {
  testLocator.registerLazySingleton<PasswordRecoveryService>(
      () => MockPasswordRecoveryService());
  testLocator.registerLazySingleton<LoginService>(() => MockLoginService());
  testLocator.registerLazySingleton<EditProfileService>(
      () => MockEditProfileService());
  testLocator.registerLazySingleton<EditPasswordService>(
      () => MockEditPasswordService());
  testLocator.registerLazySingleton<ReportIncidentService>(
      () => MockReportIncidentService());
  testLocator.registerLazySingleton<EditFunctionalStateService>(
      () => MockEditFunctionalStateService());
  testLocator.registerLazySingleton<NotificationsService>(
      () => MockNotificationsService());
  testLocator.registerLazySingleton<EditSocialProceduresService>(
      () => MockEditSocialProceduresService());
}
