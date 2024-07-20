import 'package:agaela_app/features/edit_functional_state/screens/edit_functional_state_form.dart';
import 'package:agaela_app/features/edit_functional_state/screens/edit_functional_state_home.dart';
import 'package:agaela_app/features/edit_password/screens/edit_password.dart';
import 'package:agaela_app/features/edit_profile/screens/bank_details_and_permissions.dart';
import 'package:agaela_app/features/edit_profile/screens/edit_profile_home.dart';
import 'package:agaela_app/features/edit_profile/screens/identification_and_contact.dart';
import 'package:agaela_app/features/edit_profile/screens/localization_and_profession.dart';
import 'package:agaela_app/features/edit_social_procedures/screens/cards_and_income.dart';
import 'package:agaela_app/features/edit_social_procedures/screens/dependency.dart';
import 'package:agaela_app/features/edit_social_procedures/screens/disability.dart';
import 'package:agaela_app/features/edit_social_procedures/screens/edit_social_procedures_home.dart';
import 'package:agaela_app/features/edit_social_procedures/screens/permanent_work_disability.dart';
import 'package:agaela_app/features/forms/screens/cared_home.dart';
import 'package:agaela_app/features/forms/screens/carer_home.dart';
import 'package:agaela_app/features/forms/screens/default_home.dart';
import 'package:agaela_app/features/login/screens/login.dart';
import 'package:agaela_app/features/notifications/screens/notifications_home.dart';
import 'package:agaela_app/features/password_recovery/screens/password_recovery.dart';
import 'package:agaela_app/features/report_incident/screens/report_incident.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum RoutesNames {
  login,
  passwordRecovery,
  home,
  carerHome,
  caredHome,
  editProfile,
  identificationAndContact,
  bankDetailsAndPermissions,
  localizationAndProfession,
  editPassword,
  reportIncident,
  editFunctionalState,
  editFunctionalStateForm,
  notificationsHome,
  editSocialProcedures,
  cardsAndIncome,
  disability,
  dependency,
  permanentWorkDisability
}

final globalNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
    initialLocation: '/login',
    navigatorKey: globalNavigatorKey,
    routes: [
      GoRoute(
          name: RoutesNames.login.name,
          path: '/login',
          builder: (context, state) => const Login()),
      GoRoute(
          name: RoutesNames.passwordRecovery.name,
          path: '/password_recovery',
          builder: (context, state) => const PasswordRecovery()),
      GoRoute(
          name: RoutesNames.home.name,
          path: '/home',
          builder: (context, state) => const DefaultHome()),
      GoRoute(
          name: RoutesNames.carerHome.name,
          path: '/carer_home',
          builder: (context, state) => const CarerHome(),
          routes: [
            GoRoute(
                name: RoutesNames.caredHome.name,
                path: 'cared_home',
                builder: (context, state) => const CaredHome())
          ]),
      GoRoute(
          name: RoutesNames.editProfile.name,
          path: '/edit_profile',
          builder: (context, state) => const EditProfileHome(),
          routes: [
            GoRoute(
                name: RoutesNames.identificationAndContact.name,
                path: 'identification_and_contact',
                builder: (context, state) => const IdentificationAndContact()),
            GoRoute(
                name: RoutesNames.bankDetailsAndPermissions.name,
                path: 'bank_details_and_permissions',
                builder: (context, state) => const BankDetailsAndPermissions()),
            GoRoute(
                name: RoutesNames.localizationAndProfession.name,
                path: 'localization_and_prodession',
                builder: (context, state) => const LocalizationAndProfession()),
            GoRoute(
                name: RoutesNames.editPassword.name,
                path: 'edit_password',
                builder: (context, state) => const EditPassword())
          ]),
      GoRoute(
          name: RoutesNames.reportIncident.name,
          path: '/report_incident',
          builder: (context, state) => const ReportIncident()),
      GoRoute(
          name: RoutesNames.editFunctionalState.name,
          path: '/edit_functional_state',
          builder: (context, state) => const EditFunctionalStateHome(),
          routes: [
            GoRoute(
                name: RoutesNames.editFunctionalStateForm.name,
                path: 'form',
                builder: (context, state) => const EditFunctionalStateForm())
          ]),
      GoRoute(
          name: RoutesNames.notificationsHome.name,
          path: '/notifications_home',
          builder: (context, state) => const NotificationsHome()),
      GoRoute(
          name: RoutesNames.editSocialProcedures.name,
          path: '/edit_social_procedures',
          builder: (context, state) => const EditSocialProceduresHome(),
          routes: [
            GoRoute(
              name: RoutesNames.cardsAndIncome.name,
              path: 'cards_and_income',
              builder: (context, state) => const CardsAndIncome(),
            ),
            GoRoute(
                name: RoutesNames.disability.name,
                path: 'disability',
                builder: (context, state) => const Disability()),
            GoRoute(
              name: RoutesNames.dependency.name,
              path: 'dependency',
              builder: (context, state) => const Dependency(),
            ),
            GoRoute(
              name: RoutesNames.permanentWorkDisability.name,
              path: 'permanent_work_disability',
              builder: (context, state) => const PermanentWorkDisability(),
            )
          ])
    ]);
