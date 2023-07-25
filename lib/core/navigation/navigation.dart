import 'package:go_router/go_router.dart';

import '../../features/bindings.dart';
import '../../features/screens.dart';
import '../../initializer.dart';
import '../utils/provider.util.dart';
import 'routes.dart';

class Navigation {
  static final router = GoRouter(
    initialLocation: Initializer.initialRoute,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: Routes.home,
        name: Routes.home,
        builder: (context, state) => EntryProvider(
          onBuild: (_) => HomeScreen(),
          onInit: (_) => HomeControllerBinding.inject(),
          onDispose: (_) => HomeControllerBinding.dipose(),
        ),
      ),
      GoRoute(
        path: Routes.landing,
        name: Routes.landing,
        builder: (context, state) => EntryProvider(
          onBuild: (_) => const LandingScreen(),
          onInit: (_) => LandingControllerBinding.inject(),
          onDispose: (_) => LandingControllerBinding.dipose(),
        ),
        routes: [
          GoRoute(
            path: Routes.login,
            name: Routes.login,
            builder: (context, state) => EntryProvider(
              onBuild: (_) => const LoginScreen(),
              onInit: (_) => LoginControllerBinding.inject(),
              onDispose: (_) => LoginControllerBinding.dipose(),
            ),
          ),
          GoRoute(
            path: Routes.signUp,
            name: Routes.signUp,
            builder: (context, state) => EntryProvider(
              onBuild: (_) => const SignUpScreen(),
              onInit: (_) => SignUpControllerBinding.inject(),
              onDispose: (_) => SignUpControllerBinding.dipose(),
            ),
          ),
        ],
      ),
    ],
  );
}
