import 'package:flutter/material.dart';

import "../../theme/theme.dart";

SnackBar showInkDateSnackBar(final String message) => SnackBar(
    backgroundColor: AppColors.beige,
    content: Text(
      "⚠  $message",
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.red,
        fontSize: 18,
      ),
    ),
    duration: const Duration(
      milliseconds: 1000,
    ),
    padding: const EdgeInsets.symmetric(
      horizontal: Spacing.small,
      vertical: Spacing.small,
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
    ),
  );