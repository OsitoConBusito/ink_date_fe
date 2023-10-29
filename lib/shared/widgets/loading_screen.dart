import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(final BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent.withOpacity(0.5),
        body: Center(
          child: Image.asset(AppAnimations.loader),
        ),
      );
}
