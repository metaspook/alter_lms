import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:utils/utils.dart';

// Exposes routing interface for views.
export 'package:go_router/go_router.dart';

final class AppRouter {
  /// Routing configuration and handler implementation using GoRouter.
  /// * Prevents instance duplication based on initialLocation.
  factory AppRouter({
    required List<RouteBase> routes,
    String? initialLocation,
    GoRouterRedirect? redirect,
  }) => initialLocation == _instance?.initialLocation
      ? _instance ??= AppRouter._(
          redirect: redirect,
          routes: routes,
          initialLocation: initialLocation,
        )
      : _instance = AppRouter._(
          redirect: redirect,
          routes: routes,
          initialLocation: initialLocation,
        );

  AppRouter._({
    required List<RouteBase> routes,
    this.redirect,
    this.initialLocation,
  }) : config = GoRouter(
         //-- Register routes
         routes: _routes ??= routes,
         initialLocation: initialLocation,
         navigatorKey: _rootNavigatorKey ??= GlobalKey<NavigatorState>(),
         redirect: redirect,
       ) {
    // initial call to get current route.
    _listener();
  }

  static AppRouter? _instance;
  static List<RouteBase>? _routes;
  static GlobalKey<NavigatorState>? _rootNavigatorKey;
  // static GlobalKey<NavigatorState>? _shellNavigatorKey;
  final String? initialLocation;
  final GoRouterRedirect? redirect;
  final GoRouter config;

  void attachListener() =>
      config.routeInformationProvider.addListener(_listener);
  void detachListener() =>
      config.routeInformationProvider.removeListener(_listener);

  void _listener() {
    if (debugMode) {
      dev.log(
        'Current Route: ${config.routeInformationProvider.value.uri}',
        name: 'AppRouter',
      );
    }
  }
}

extension GoRouteExt on GoRoute {
  String get pathUnderRoot => '/$path';
}
