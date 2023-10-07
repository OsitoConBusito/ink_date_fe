import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../theme/theme.dart';

class SignUpBackground extends StatelessWidget {
  const SignUpBackground({
    required this.width,
    super.key,
  });

  final double width;

  @override
  Widget build(final BuildContext context) => Stack(
        children: <Widget>[
          Container(color: AppColors.backgroundGrey),
          Positioned(
            top: 20,
            left: width * 0.2,
            child: SvgPicture.asset(
              'assets/images/background.svg',
              color: AppColors.backgroundIcon,
            ),
          ),
        ],
      );
}
