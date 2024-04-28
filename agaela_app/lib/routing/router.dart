import 'package:agaela_app/features/edit_password/screens/edit_password.dart';
import 'package:agaela_app/features/edit_profile/screens/edit_profile_home.dart';
import 'package:agaela_app/features/forms/screens/default_home.dart';
import 'package:agaela_app/features/login/screens/login.dart';
import 'package:agaela_app/features/password_recovery/screens/password_recovery.dart';
import 'package:go_router/go_router.dart';

enum RoutesNames { login, passwordRecovery, home, editProfile, editPassword }

final GoRouter router = GoRouter(initialLocation: '/login', routes: [
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
      name: RoutesNames.editProfile.name,
      path: '/edit_profile',
      builder: (context, state) => const EditProfileHome(),
      routes: [
        GoRoute(
            name: RoutesNames.editPassword.name,
            path: 'edit_password',
            builder: (context, state) => const EditPassword())
      ])
]);
