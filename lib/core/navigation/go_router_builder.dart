import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/screens.dart';
import 'routes.dart';

part 'go_router_builder.g.dart';

@TypedGoRoute<LandingScreenRoute>(
  path: Routes.landing,
  routes: [
    TypedGoRoute<LoginScreenRoute>(path: Routes.login),
    TypedGoRoute<SignUpScreenRoute>(path: Routes.signUp),
  ],
)
@immutable
class LandingScreenRoute extends GoRouteData {
  @override
  Widget build(context, state) => const LandingScreen();
}

@immutable
class LoginScreenRoute extends GoRouteData {
  @override
  Widget build(context, state) => const LoginScreen();
}

@immutable
class SignUpScreenRoute extends GoRouteData {
  @override
  Widget build(context, state) => const SignUpScreen();
}

@immutable
class HomeScreenRoute extends GoRouteData {
  @override
  Widget build(context, state) => const HomeScreen();
}
