import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../gen/strings.g.dart';
import '../../theme/theme.dart';

class SplashWidget extends StatelessWidget {
  const SplashWidget({
    super.key,
    this.environment,
    this.version,
  });

  final String? environment;
  final String? version;

  Widget _buildEnvironmetTag(final BuildContext context) {
    final String environmentTag = t.environment(
      environment: environment ?? '',
      version: version ?? '',
    );

    return Text(
      environmentTag,
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

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
              bottom: Sizes.large,
              child: _buildEnvironmetTag(context),
            ),
          ],
        ),
      );
}
