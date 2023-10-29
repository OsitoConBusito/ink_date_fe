import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../gen/strings.g.dart';
import '../../../../shared/widgets/ink_date_elevated_button.dart';
import '../../../../shared/widgets/ink_date_text_form_field.dart';
import '../../../../theme/theme.dart';

class RecoverPasswordDialog extends StatefulWidget {
  const RecoverPasswordDialog({
    required this.width,
    super.key,
  });

  final double width;

  @override
  State<RecoverPasswordDialog> createState() => _RecoverPasswordDialogState();
}

class _RecoverPasswordDialogState extends State<RecoverPasswordDialog> {
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) => Dialog(
        backgroundColor: AppColors.backgroundGrey.withOpacity(0.9),
        elevation: 3,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Wrap(
          children: <Widget>[
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.all(
                    Sizes.medium,
                  ),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: Sizes.xLarge + Sizes.medium,
                      ),
                      const Text(
                        'Enviaremos un correo electronico para la recuperacion de tu contrasena',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(
                        height: Sizes.large,
                      ),
                      InkDateTextFormField(
                        hintText: t.login.hint_email,
                        keyboardType: TextInputType.emailAddress,
                        labelText: t.email,
                        textEditingController: _emailController,
                        textInputAction: TextInputAction.send,
                      ),
                      const SizedBox(
                        height: Sizes.medium,
                      ),
                      // if (widget.loginViewModel.state ==
                      //     LoginViewState.forgottenPasswordLoading)
                      //   const Center(
                      //     child: CircularProgressIndicator(),
                      //   )
                      // else
                      InkDateElevatedButton(
                        text: t.confirm,
                        textColor: AppColors.darkGreen,
                        onTap: () async {
                          // widget.loginViewModel
                          //     .forgottenPassword(
                          //   email: _emailController.text.trim(),
                          // )
                          //     .then(
                          //   (_) {
                          //     if (widget.loginViewModel.state ==
                          //         LoginViewState.forgottenPasswordComplete) {
                          //       Navigator.of(context).pop();
                          //     }
                          //   },
                          // );
                        },
                      ),
                      const SizedBox(
                        height: Sizes.medium,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: widget.width * 0.28,
                  top: -50,
                  child: CircleAvatar(
                    backgroundColor: AppColors.beige,
                    radius: 50,
                    child: SvgPicture.asset(
                      'assets/images/ink_date_logo.svg',
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}
