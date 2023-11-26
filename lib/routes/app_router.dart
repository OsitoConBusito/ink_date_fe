import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../features/authentication/ui/login/screens/login_screen.dart';
import '../features/authentication/ui/sign_up/screens/confirm_email_code_screen.dart';
import '../features/authentication/ui/sign_up/screens/screens.dart';
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
            GoRoute(
              path: confirmEmailRoute,
              name: confirmEmailRoute,
              builder: (BuildContext context, GoRouterState state) =>
                  const ConfirmationEmailCodeScreen(),
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
const String confirmEmailRoute = 'confirmEmail';
