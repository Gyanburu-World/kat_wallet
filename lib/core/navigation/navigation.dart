import 'package:go_router/go_router.dart';

import '../../features/bindings.dart';
import '../../features/screens.dart';
import '../utils/provider.util.dart';
import 'routes.dart';

class Navigation {
  static GoRouter router(String initialRoute) => GoRouter(
        initialLocation: initialRoute,
        debugLogDiagnostics: true,
        routes: [
          GoRoute(
            path: Routes.home,
            name: Routes.home,
            builder: (context, state) => EntryProvider(
              onBuild: (_) => const HomeScreen(),
              onInit: (_) => HomeControllerBinding.inject(),
              onDispose: (_) => HomeControllerBinding.dipose(),
            ),
          ),
          GoRoute(
            path: Routes.login,
            name: Routes.login,
            builder: (context, state) => EntryProvider(
              onBuild: (_) => const LoginScreen(),
              onInit: (_) => LoginControllerBinding.inject(),
              onDispose: (_) => LoginControllerBinding.dipose(),
            ),
          ),
        ],
      );
}
