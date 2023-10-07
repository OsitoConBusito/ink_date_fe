import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class InkDateElevatedButton extends StatelessWidget {
  const InkDateElevatedButton({
    required this.text,
    required this.onTap,
    this.isNegative = false,
    this.textColor = Colors.white,
    this.backgroundColor = AppColors.beige,
    super.key,
  });

  final Color backgroundColor;
  final bool isNegative;
  final String text;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            backgroundColor: isNegative ? AppColors.darkGreen : backgroundColor,
          ),
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
