part of com.features.authentication.sign_up.screens;

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
  Widget build(BuildContext context) {
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
          t.sign_up.tattooist.sign_up_as_tattooist,
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
                      const SizedBox(height: Sizes.medium),
                      InkDateTextFormField(
                        hintText: t.sign_up.hint_full_name,
                        keyboardType: TextInputType.name,
                        labelText: t.sign_up.full_name,
                        textEditingController: _fullNameController,
                        textInputAction: TextInputAction.next,
                        validator: (String? fullName) => null,
                      ),
                      const SizedBox(height: Sizes.medium),
                      InkDateTextFormField(
                        hintText: t.login.hint_email,
                        keyboardType: TextInputType.emailAddress,
                        labelText: t.email,
                        textEditingController: _emailController,
                        textInputAction: TextInputAction.next,
                        validator: (String? email) => null,
                      ),
                      const SizedBox(height: Sizes.medium),
                      InkDateTextFormField(
                        hintText: t.login.hint_password,
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: t.password,
                        textEditingController: _passwordController,
                        textInputAction: TextInputAction.next,
                        validator: (String? password) => null,
                      ),
                      const SizedBox(height: Sizes.medium),
                      InkDateTextFormField(
                        hintText: t.login.hint_password,
                        isPassword: true,
                        keyboardType: TextInputType.visiblePassword,
                        labelText: t.sign_up.verify_password,
                        textEditingController: _checkPasswordController,
                        textInputAction: TextInputAction.next,
                        validator: (String? password) => null,
                      ),
                      const SizedBox(height: Sizes.medium),
                      InkDateTextFormField(
                        hintText: t.sign_up.admin.hint_studio_email,
                        keyboardType: TextInputType.emailAddress,
                        labelText: t.sign_up.admin.studio_email,
                        textEditingController: _studioEmailController,
                        textInputAction: TextInputAction.next,
                        validator: (String? studioEmail) => null,
                      ),
                      const SizedBox(height: Sizes.xLarge),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: InkDateElevatedButton(
                              isNegative: true,
                              text: t.cancel,
                              onTap: () => Navigator.of(context)
                                ..pop()
                                ..pop(),
                            ),
                          ),
                          const SizedBox(width: Sizes.medium),
                          Expanded(
                            child: InkDateElevatedButton(
                              text: t.confirm,
                              textColor: AppColors.darkGreen,
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  await ref
                                      .read(signUpProvider.notifier)
                                      .signUp(
                                        profile: Profile.user,
                                        email: _emailController.text.trim(),
                                        fullName:
                                            _fullNameController.text.trim(),
                                        password:
                                            _passwordController.text.trim(),
                                      );
                                }
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
        ],
      ),
    );
  }
}
