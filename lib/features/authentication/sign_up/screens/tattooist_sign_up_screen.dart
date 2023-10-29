import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../gen/strings.g.dart';
import '../../../../shared/widgets/ink_date_elevated_button.dart';
import '../../../../shared/widgets/ink_date_text_form_field.dart';
import '../../../../shared/widgets/sign_up_background.dart';
import '../../../../theme/theme.dart';

class TattooistSignUpScreen extends ConsumerStatefulWidget {
  const TattooistSignUpScreen({
    super.key,
  });

  @override
  ConsumerState<TattooistSignUpScreen> createState() =>
      _SignUpTattooistScreenState();
}

class _SignUpTattooistScreenState extends ConsumerState<TattooistSignUpScreen> {
  late TextEditingController _checkPasswordController;
  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _fullNameController;
  late TextEditingController _passwordController;
  late TextEditingController _studioEmailController;

  @override
  void initState() {
    _checkPasswordController = TextEditingController(text: '');
    _emailController = TextEditingController(text: '');
    _formKey = GlobalKey<FormState>();
    _fullNameController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
    _studioEmailController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    _checkPasswordController.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    _studioEmailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) => Stack(
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
                              const SizedBox(height: Sizes.medium),
                              InkDateTextFormField(
                                hintText: t.sign_up.hint_full_name,
                                keyboardType: TextInputType.name,
                                labelText: t.sign_up.full_name,
                                textEditingController: _fullNameController,
                                textInputAction: TextInputAction.next,
                                validator: (String? fullName) {},
                              ),
                              const SizedBox(height: Sizes.medium),
                              InkDateTextFormField(
                                hintText: t.login.hint_email,
                                keyboardType: TextInputType.emailAddress,
                                labelText: t.email,
                                textEditingController: _emailController,
                                textInputAction: TextInputAction.next,
                                validator: (String? email) {},
                              ),
                              const SizedBox(height: Sizes.medium),
                              InkDateTextFormField(
                                hintText: t.login.hint_password,
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                labelText: t.password,
                                textEditingController: _passwordController,
                                textInputAction: TextInputAction.next,
                                validator: (String? password) {},
                              ),
                              const SizedBox(height: Sizes.medium),
                              InkDateTextFormField(
                                hintText: t.login.hint_password,
                                isPassword: true,
                                keyboardType: TextInputType.visiblePassword,
                                labelText: t.sign_up.verify_password,
                                textEditingController: _checkPasswordController,
                                textInputAction: TextInputAction.next,
                                validator: (String? password) {},
                              ),
                              const SizedBox(height: Sizes.medium),
                              InkDateTextFormField(
                                hintText: t.sign_up.admin.hint_studio_email,
                                keyboardType: TextInputType.emailAddress,
                                labelText: t.sign_up.admin.studio_email,
                                textEditingController: _studioEmailController,
                                textInputAction: TextInputAction.next,
                                validator: (String? studioEmail) {},
                              ),
                              const SizedBox(height: Sizes.xLarge),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Expanded(
                                    child: InkDateElevatedButton(
                                      isNegative: true,
                                      text: t.cancel,
                                      onTap: () {},
                                    ),
                                  ),
                                  const SizedBox(width: Sizes.medium),
                                  Expanded(
                                    child: InkDateElevatedButton(
                                      text: t.confirm,
                                      textColor: AppColors.darkGreen,
                                      onTap: () {
                                        if (_formKey.currentState!
                                            .validate()) {}
                                      },
                                    ),
                                  )
                                ],
                              ),
                              const SizedBox(height: Sizes.xLarge),
                              InkDateElevatedButton(
                                text: t.sign_up.have_an_account,
                                textColor: AppColors.darkGreen,
                                onTap: () => Navigator.of(context)
                                  ..pop()
                                  ..pop(),
                              ),
                              const SizedBox(height: Sizes.xLarge),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
