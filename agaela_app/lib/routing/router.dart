import 'package:agaela_app/features/login/screens/login.dart';
import 'package:go_router/go_router.dart';

enum RoutesNames { login }

final GoRouter router = GoRouter(initialLocation: '/login', routes: [
  GoRoute(
      name: RoutesNames.login.name,
      path: '/login',
      builder: (context, state) => const Login())
]);
