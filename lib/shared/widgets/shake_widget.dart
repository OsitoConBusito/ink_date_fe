import 'dart:math';
import 'package:flutter/material.dart';

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    required this.child,
    required this.shakeOffset,
    super.key,
    this.shakeCount = 3,
    this.shakeDuration = const Duration(milliseconds: 400),
  });

  final Widget child;
  final int shakeCount;
  final Duration shakeDuration;
  final double shakeOffset;

  @override
  State<ShakeWidget> createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    AnimationController(vsync: this, duration: widget.shakeDuration);
    animationController.addStatusListener(_updateStatus);
  }

  @override
  void dispose() {
    animationController.removeStatusListener(_updateStatus);
    super.dispose();
  }

  void _updateStatus(final AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      animationController.reset();
    }
  }

  void shake() {
    animationController.forward();
  }

  @override
  Widget build(final BuildContext context) => AnimatedBuilder(
        animation: animationController,
        child: widget.child,
        builder: (
          final context,
          final child,
        ) =>
            Transform.translate(
          offset: Offset(
            sin(widget.shakeCount * 2 * pi * animationController.value) *
                widget.shakeOffset,
            0,
          ),
          child: child,
        ),
      );
}
