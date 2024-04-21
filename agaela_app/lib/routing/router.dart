import 'package:agaela_app/features/login/screens/login.dart';
import 'package:agaela_app/features/password_recovery/screens/password_recovery.dart';
import 'package:go_router/go_router.dart';

enum RoutesNames { login, passwordRecovery }

final GoRouter router = GoRouter(initialLocation: '/login', routes: [
  GoRoute(
      name: RoutesNames.login.name,
      path: '/login',
      builder: (context, state) => const Login()),
  GoRoute(
      name: RoutesNames.passwordRecovery.name,
      path: '/password_recovery',
      builder: (context, state) => const PasswordRecovery())
]);
