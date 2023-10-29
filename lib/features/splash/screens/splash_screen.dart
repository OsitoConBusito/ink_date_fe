import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/strings.g.dart';
import '../../../routes/app_router.dart';
import '../../../theme/theme.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const Duration animationDuration = Duration(seconds: 3);

  @override
  Widget build(final BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        await Future<void>.delayed(
          animationDuration,
          () => context.pushReplacementNamed(loginRoute),
        );
      },
    );
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            color: AppColors.darkGreen,
          ),
          Center(
            child: Lottie.asset(AppAnimations.splashAnimation),
          ),
          Positioned(
            bottom: Sizes.large,
            child: Text(
              t.environment(environment: 'Dev', version: '1.0.0'),
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
