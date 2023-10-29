import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../gen/strings.g.dart';
import '../../../../shared/widgets/ink_date_elevated_button.dart';
import '../../../../shared/widgets/ink_date_text_form_field.dart';
import '../../../../shared/widgets/number_adder.dart';
import '../../../../shared/widgets/sign_up_background.dart';
import '../../../../theme/theme.dart';
import '../../models/profile.dart';
import '../provider/sign_up_provider.dart';

class AdminSignUpScreen extends ConsumerStatefulWidget {
  const AdminSignUpScreen({
    super.key,
  });

  @override
  ConsumerState<AdminSignUpScreen> createState() => _AdminSignUpScreenState();
}

class _AdminSignUpScreenState extends ConsumerState<AdminSignUpScreen> {
  static const int maxNumberSpaces = 5;

  late TextEditingController _checkPasswordController;
  late TextEditingController _emailController;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _fullNameController;
  late TextEditingController _passwordController;
  late TextEditingController _placeNameController;

  @override
  void initState() {
    _checkPasswordController = TextEditingController(text: '');
    _emailController = TextEditingController(text: '');
    _formKey = GlobalKey<FormState>();
    _fullNameController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
    _placeNameController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    _checkPasswordController.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    _placeNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final NumberAdder numberAdder = NumberAdder(
      onNumberChanged: (int p0) {},
      maxNumber: maxNumberSpaces,
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          t.sign_up.admin.sign_up_as_admin,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: Sizes.medium,
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          SignUpBackground(
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(Sizes.large),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Spacing.verticalMedium,
                      InkDateTextFormField(
                        hintText: t.sign_up.hint_full_name,
                        keyboardType: TextInputType.name,
                        labelText: t.sign_up.full_name,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        textEditingController: _fullNameController,
                        validator: (String? fullName) {},
                      ),
                      Spacing.verticalMedium,
                      InkDateTextFormField(
                        hintText: t.login.hint_email,
                        keyboardType: TextInputType.emailAddress,
                        labelText: t.email,
                        textInputAction: TextInputAction.next,
                        textEditingController: _emailController,
                        validator: (String? email) {},
                      ),
                      Spacing.verticalMedium,
                      InkDateTextFormField(
                        hintText: t.login.hint_password,
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: t.password,
                        textInputAction: TextInputAction.next,
                        textEditingController: _passwordController,
                        validator: (String? password) {},
                      ),
                      Spacing.verticalMedium,
                      InkDateTextFormField(
                        hintText: t.login.hint_password,
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: t.sign_up.verify_password,
                        textInputAction: TextInputAction.next,
                        textEditingController: _checkPasswordController,
                        validator: (String? password) {},
                      ),
                      Spacing.verticalMedium,
                      InkDateTextFormField(
                        hintText: t.sign_up.admin.hint_studio_name,
                        keyboardType: TextInputType.name,
                        labelText: t.sign_up.admin.studio_name,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        textEditingController: _placeNameController,
                        validator: (String? placeName) {
                          if (placeName == null || placeName.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                      Spacing.verticalXLarge,
                      Row(
                        children: <Widget>[
                          const SizedBox(width: Sizes.small),
                          Expanded(
                            child: Text(
                              t.sign_up.admin.places,
                              style: const TextStyle(fontSize: 22),
                            ),
                          ),
                          const SizedBox(width: Sizes.medium),
                          numberAdder,
                        ],
                      ),
                      Spacing.verticalXLarge,
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: InkDateElevatedButton(
                              isNegative: true,
                              text: t.cancel,
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          const SizedBox(width: Sizes.medium),
                          Expanded(
                            child: InkDateElevatedButton(
                              textColor: AppColors.darkGreen,
                              text: t.confirm,
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  ref
                                      .read(signUpProvider.notifier)
                                      .signUp(Profile.admin);
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                      Spacing.verticalXLarge,
                      InkDateElevatedButton(
                        text: t.sign_up.have_an_account,
                        textColor: AppColors.darkGreen,
                        onTap: () => Navigator.of(context)
                          ..pop()
                          ..pop(),
                      ),
                      Spacing.verticalXLarge,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
