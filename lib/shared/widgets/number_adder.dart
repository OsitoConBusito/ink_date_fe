import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class NumberAdder extends StatefulWidget {
  const NumberAdder({
    required this.onNumberChanged,
    required this.maxNumber,
    super.key,
    this.initialNumber = 1,
  });

  final int initialNumber;
  final void Function(int) onNumberChanged;
  final int maxNumber;

  @override
  State<NumberAdder> createState() => _NumberAdderState();
}

class _NumberAdderState extends State<NumberAdder> {
  late int currentNumber;

  @override
  void initState() {
    currentNumber = widget.initialNumber;
    super.initState();
  }

  @override
  Widget build(final BuildContext context) => IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            OutlinedButton(
              onPressed: () {
                if (currentNumber > 1) {
                  setState(() => currentNumber--);
                  widget.onNumberChanged(currentNumber);
                }
              },
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
              child: const Text(
                '-',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              color: AppColors.darkGreen,
              width: 65,
              child: Text(
                currentNumber.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            OutlinedButton(
              onPressed: () {
                if (currentNumber < widget.maxNumber) {
                  setState(() => currentNumber++);
                  widget.onNumberChanged(currentNumber);
                }
              },
              style: OutlinedButton.styleFrom(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                  ),
                ),
              ),
              child: const Text(
                '+',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      );
}
