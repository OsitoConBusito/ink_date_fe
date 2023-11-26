part of com.features.authentication.sign_up.screens;

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
  late TextEditingController _studioNameController;

  int studioAreas = 1;

  @override
  void initState() {
    _checkPasswordController = TextEditingController(text: '');
    _emailController = TextEditingController(text: '');
    _formKey = GlobalKey<FormState>();
    _fullNameController = TextEditingController(text: '');
    _passwordController = TextEditingController(text: '');
    _studioNameController = TextEditingController(text: '');
    super.initState();
  }

  @override
  void dispose() {
    _checkPasswordController.dispose();
    _emailController.dispose();
    _fullNameController.dispose();
    _passwordController.dispose();
    _studioNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final NumberAdder numberAdder = NumberAdder(
      onNumberChanged: (int value) {
        studioAreas = value;
      },
      maxNumber: maxNumberSpaces,
    );
    final SignUpState signUpState = ref.watch(signUpProvider);

    ref.listen(
      signUpProvider,
      (SignUpState? previous, SignUpState next) async {
        if (next.signUpStatus == SignUpStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            showInkDateSnackBar(next.errorDescription),
          );
        }
        if (next.signUpStatus == SignUpStatus.success) {
          ref.read(signUpProvider.notifier).setInitial();
          context.pushReplacementNamed(confirmEmailRoute);
        }
      },
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
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Spacing.verticalSmall,
                      InkDateTextFormField(
                        hintText: t.sign_up.hint_full_name,
                        keyboardType: TextInputType.name,
                        labelText: t.sign_up.full_name,
                        textCapitalization: TextCapitalization.words,
                        textInputAction: TextInputAction.next,
                        textEditingController: _fullNameController,
                        validator: (String? fullName) {
                          if (fullName == null || fullName.isEmpty) {
                            return t.mandatory_field;
                          }
                          return null;
                        },
                      ),
                      Spacing.verticalSmall,
                      InkDateTextFormField(
                        hintText: t.login.hint_email,
                        keyboardType: TextInputType.emailAddress,
                        labelText: t.email,
                        textInputAction: TextInputAction.next,
                        textEditingController: _emailController,
                        validator: (String? email) {
                          if (email == null || email.isEmpty) {
                            return t.mandatory_field;
                          }
                          if (!email.isValidEmail) {
                            return t.not_valid_email;
                          }
                          return null;
                        },
                      ),
                      Spacing.verticalSmall,
                      InkDateTextFormField(
                        hintText: t.login.hint_password,
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: t.password,
                        textInputAction: TextInputAction.next,
                        textEditingController: _passwordController,
                        validator: (String? password) {
                          if (password == null || password.isEmpty) {
                            return t.mandatory_field;
                          }
                          if (!password.isValidPassword) {
                            return t.sign_up.not_valid_password;
                          }
                          return null;
                        },
                      ),
                      Spacing.verticalSmall,
                      InkDateTextFormField(
                        hintText: t.login.hint_password,
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: t.sign_up.verify_password,
                        textInputAction: TextInputAction.next,
                        textEditingController: _checkPasswordController,
                        validator: (String? password) {
                          if (password == null || password.isEmpty) {
                            return t.mandatory_field;
                          }
                          if (password.trim() !=
                              _passwordController.text.trim()) {
                            return t.sign_up.not_matched_password;
                          }
                          return null;
                        },
                      ),
                      Spacing.verticalSmall,
                      InkDateTextFormField(
                        hintText: t.sign_up.admin.hint_studio_name,
                        keyboardType: TextInputType.name,
                        labelText: t.sign_up.admin.studio_name,
                        textCapitalization: TextCapitalization.sentences,
                        textInputAction: TextInputAction.next,
                        textEditingController: _studioNameController,
                        validator: (String? placeName) {
                          if (placeName == null || placeName.isEmpty) {
                            return t.mandatory_field;
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
                                ref.read(signUpProvider.notifier).setSuccess();
                                // Navigator.of(context).pop();
                              },
                            ),
                          ),
                          const SizedBox(width: Sizes.medium),
                          Expanded(
                            child: InkDateElevatedButton(
                              textColor: AppColors.darkGreen,
                              text: t.confirm,
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  await ref
                                      .read(signUpProvider.notifier)
                                      .signUp(
                                        profile: Profile.admin,
                                        email: _emailController.text.trim(),
                                        fullName:
                                            _fullNameController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                        studioAreas: studioAreas,
                                        studioName:
                                            _studioNameController.text.trim(),
                                      );
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
          if (signUpState.signUpStatus == SignUpStatus.loading)
            const LoadingScreen(),
        ],
      ),
    );
  }
}
