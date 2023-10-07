import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../gen/strings.g.dart';
import '../../../theme/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(final BuildContext context) => Scaffold(
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
            bottom: Spacing.large,
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
