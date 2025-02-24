

import 'package:compass_app/routing/routes.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../data/repositories/auth/auth_repository.dart';
import '../ui/auth/login/view_models/login_viewmodel.dart';
import '../ui/auth/login/widgets/login_screen.dart';

GoRouter router(AuthRepository authRepository) =>
  GoRouter(
    debugLogDiagnostics: true,
    refreshListenable: authRepository,
    routes: [
      GoRoute(
        path: Routes.login,
        builder: (context, state) {
          return LoginScreen(
              viewModel: LoginViewModel(authRepository: context.read()
          ));
        }
      ),
      GoRoute(
        path: Routes.home,
      )
    ]
  );