import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import "../features/splash/screens/splash_screen.dart";

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: splashRoute,
      name: splashRoute,
      builder: (final BuildContext context, final GoRouterState state) => const SplashScreen(),
    ),
  ],
);

const String splashRoute = '/';
const String loginRoute = 'login';
