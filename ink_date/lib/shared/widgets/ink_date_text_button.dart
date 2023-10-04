import 'package:flutter/material.dart';

class InkDateTextButton extends StatelessWidget {
  const InkDateTextButton({
    required this.text,
    required this.onPressed,
    super.key,
    this.isBold = false,
  });

  final String text;
  final bool isBold;
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) => TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      );
}
