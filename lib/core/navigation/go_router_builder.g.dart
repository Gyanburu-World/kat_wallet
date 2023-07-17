// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router_builder.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $landingScreenRoute,
    ];

RouteBase get $landingScreenRoute => GoRouteData.$route(
      path: '/landing',
      factory: $LandingScreenRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'login',
          factory: $LoginScreenRouteExtension._fromState,
        ),
      ],
    );

extension $LandingScreenRouteExtension on LandingScreenRoute {
  static LandingScreenRoute _fromState(GoRouterState state) =>
      LandingScreenRoute();

  String get location => GoRouteData.$location(
        '/landing',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LoginScreenRouteExtension on LoginScreenRoute {
  static LoginScreenRoute _fromState(GoRouterState state) => LoginScreenRoute();

  String get location => GoRouteData.$location(
        '/landing/login',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
