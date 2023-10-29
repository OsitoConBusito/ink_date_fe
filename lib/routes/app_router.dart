import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/login_screen/screens/login_screen.dart';
import '../features/authentication/sign_up/screens/admin_sign_up_screen.dart';
import '../features/authentication/sign_up/screens/sign_up_screen.dart';
import '../features/authentication/sign_up/screens/tattooist_sign_up_screen.dart';
import '../features/splash/screens/splash_screen.dart';

final GoRouter appRouter = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: splashRoute,
      name: splashRoute,
      builder: (final BuildContext context, final GoRouterState state) =>
          const SplashScreen(),
      routes: <GoRoute>[
        GoRoute(
          path: loginRoute,
          name: loginRoute,
          builder: (BuildContext context, GoRouterState state) =>
              const LoginScreen(),
          routes: <GoRoute>[
            GoRoute(
              path: signUpRoute,
              name: signUpRoute,
              builder: (BuildContext context, GoRouterState state) =>
                  const SignUpScreen(),
            ),
            GoRoute(
              path: signUpAdminRoute,
              name: signUpAdminRoute,
              builder: (BuildContext context, GoRouterState state) =>
                  const AdminSignUpScreen(),
            ),
            GoRoute(
              path: signUpTattooistRoute,
              name: signUpTattooistRoute,
              builder: (BuildContext context, GoRouterState state) =>
                  const TattooistSignUpScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

const String splashRoute = '/';
const String loginRoute = 'login';
const String signUpRoute = 'signUp';
const String signUpAdminRoute = 'signUpAdmin';
const String signUpTattooistRoute = 'signUpTattooist';
