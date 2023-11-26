import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../gen/strings.g.dart';
import '../../../../../routes/app_router.dart';
import '../../../../../shared/widgets/ink_date_elevated_button.dart';
import '../../../../../shared/widgets/ink_date_snack_bar.dart';
import '../../../../../shared/widgets/ink_date_text_button.dart';
import '../../../../../shared/widgets/ink_date_text_form_field.dart';
import '../../../../../shared/widgets/loading_screen.dart';
import '../../../../../shared/widgets/shake_widget.dart';
import '../../../../../shared/widgets/sign_up_background.dart';
import '../../../../../theme/theme.dart';
import '../../../../../utils/extensions/string.dart';
import '../provider/login_provider.dart';
import '../viewmodel/login_state.dart';
import '../viewmodel/login_view_model.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with SingleTickerProviderStateMixin {
  // final GlobalKey<ShakeWidgetState> shakeEmailKey =
  //     GlobalKey<ShakeWidgetState>();
  // final GlobalKey<ShakeWidgetState> shakePasswordKey =
  //     GlobalKey<ShakeWidgetState>();

  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _passwordController;
  late LoginViewModel loginViewModel;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
    _formKey = GlobalKey<FormState>();
    loginViewModel = ref.read(loginProvider.notifier);
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final LoginState loginState = ref.watch(loginProvider);

    if (loginState.hasPasswordError) {
      showInkDateSnackBar(t.mandatory_field);
    }

    if (loginState.emailError.isNotEmpty) {
      showInkDateSnackBar(loginState.emailError);
    }

    if (loginState.loginStatus == LoginStatus.failure) {
      showInkDateSnackBar(t.login.error);
    }

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) => Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            SignUpBackground(
              width: constraints.maxWidth,
              child: Padding(
                padding: const EdgeInsets.all(Sizes.large),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: constraints.maxHeight),
                    child: IntrinsicHeight(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            const Spacer(),
                            const SizedBox(
                              height: Sizes.xLarge,
                            ),
                            SvgPicture.asset(
                              AppImages.inkDateLogoName,
                              colorFilter: const ColorFilter.mode(
                                AppColors.darkGreen,
                                BlendMode.srcIn,
                              ),
                              width: size.width * 0.4,
                            ),
                            const Spacer(),
                            const SizedBox(
                              height: Sizes.xLarge,
                            ),
                            ShakeWidget(
                              // key: shakeEmailKey,
                              shakeOffset: 5,
                              child: InkDateTextFormField(
                                hintText: t.login.hint_email,
                                keyboardType: TextInputType.emailAddress,
                                icon: Icons.alternate_email,
                                labelText: t.email,
                                textInputAction: TextInputAction.next,
                                textEditingController: _emailController,
                                onChanged: loginViewModel.onChangeEmail,
                                validator: (String? emailText) {
                                  if (emailText == null || emailText.isEmpty) {
                                    return t.mandatory_field;
                                  }
                                  if (!emailText.isValidEmail) {
                                    return t.not_valid_email;
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: Sizes.medium,
                            ),
                            ShakeWidget(
                              // key: shakePasswordKey,
                              shakeOffset: 5,
                              child: InkDateTextFormField(
                                hintText: t.login.hint_password,
                                icon: Icons.lock,
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                labelText: t.password,
                                textEditingController: _passwordController,
                                validator: (String? text) {
                                  if (text == null || text.isEmpty) {
                                    return t.mandatory_field;
                                    // shakePasswordKey.currentState?.shake();
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(
                              height: Sizes.medium,
                            ),
                            InkDateElevatedButton(
                              text: t.login.login,
                              textColor: AppColors.darkGreen,
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  FocusManager.instance.primaryFocus?.unfocus();

                                  await ref.read(loginProvider.notifier).login(
                                        _emailController.text.trim(),
                                        _passwordController.text.trim(),
                                      );
                                }
                              },
                            ),
                            const Spacer(),
                            const SizedBox(
                              height: Sizes.xLarge,
                            ),
                            InkDateTextButton(
                              text: t.login.recover_password,
                              onPressed: () async {
                                // context.pushReplacementNamed(confirmEmailRoute);

                                // await showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) =>
                                //       RecoverPasswordDialog(
                                //     width: constraints.maxWidth,
                                //   ),
                                // );
                              },
                            ),
                            const SizedBox(
                              height: Sizes.small,
                            ),
                            InkDateTextButton(
                              isBold: true,
                              text: t.sign_up.sign_up,
                              onPressed: () async {
                                await context.pushNamed(signUpRoute);
                              },
                            ),
                            const Spacer(),
                            const SizedBox(
                              height: Sizes.large,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            if (loginState.loginStatus == LoginStatus.loading)
              const LoadingScreen()
          ],
        ),
      ),
    );
  }
}
