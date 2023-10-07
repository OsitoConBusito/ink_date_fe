import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class InkDateTextFormField extends StatefulWidget {
  const InkDateTextFormField({
    required this.hintText,
    required this.labelText,
    required this.textEditingController,
    super.key,
    this.height = 70,
    this.icon,
    this.isPassword = false,
    this.keyboardType = TextInputType.none,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction = TextInputAction.done,
    this.validator,
  });

  final double height;
  final String hintText;
  final IconData? icon;
  final bool isPassword;
  final TextInputType keyboardType;
  final String labelText;
  final int maxLines;
  final TextCapitalization textCapitalization;
  final TextEditingController textEditingController;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;

  @override
  State<InkDateTextFormField> createState() => _InkDateTextFormFieldState();
}

class _InkDateTextFormFieldState extends State<InkDateTextFormField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(final BuildContext context) => SizedBox(
        height: widget.height,
        child: TextFormField(
          controller: widget.textEditingController,
          decoration: _inputDecoration(),
          keyboardType: widget.keyboardType,
          maxLines: widget.maxLines,
          obscureText: widget.isPassword && !_isPasswordVisible,
          textCapitalization: widget.textCapitalization,
          textInputAction: widget.textInputAction,
          validator: widget.validator,
        ),
      );

  InputDecoration _inputDecoration() => InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            50,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: Spacing.large,
          horizontal: Spacing.large,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: AppColors.darkGreen,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        errorStyle: const TextStyle(height: 0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: AppColors.darkGreen,
            width: 3,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 3,
          ),
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: AppColors.darkGreen,
          fontSize: 20,
        ),
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          color: AppColors.darkGreen,
          fontSize: 20,
        ),
        prefixIcon: widget.icon != null
            ? Align(
                widthFactor: 3,
                child: Icon(
                  widget.icon,
                  color: AppColors.darkGreen,
                ),
              )
            : null,
        suffix: widget.isPassword
            ? Container(
                margin: const EdgeInsets.only(top: 20),
                child: IconButton(
                  color: AppColors.darkGreen,
                  constraints: const BoxConstraints(),
                  icon: _isPasswordVisible
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                  onPressed: () =>
                      setState(() => _isPasswordVisible = !_isPasswordVisible),
                ),
              )
            : null,
      );
}
