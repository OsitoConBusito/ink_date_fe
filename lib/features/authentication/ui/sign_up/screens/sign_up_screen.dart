part of com.features.authentication.sign_up.screens;

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
  });

  static const double selectorWidth = 150;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SignUpBackground(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ColoredBox(
                  color: AppColors.darkGreen,
                  child: Center(
                    child: SvgPicture.asset(
                      AppImages.inkDateLogoName,
                      width: MediaQuery.sizeOf(context).width * 0.5,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      t.sign_up.sign_up_as,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Spacing.verticalMedium,
                    InkWell(
                      onTap: () async => context.pushNamed(signUpAdminRoute),
                      child: Container(
                        width: selectorWidth,
                        padding: const EdgeInsets.all(Sizes.medium),
                        decoration: const BoxDecoration(
                          color: AppColors.darkGreen,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Sizes.medium),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            SvgPicture.asset(
                              AppImages.adminIcon,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            Spacing.verticalSmall,
                            Text(
                              t.admin,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Spacing.verticalMedium,
                    InkWell(
                      onTap: () async =>
                          context.pushNamed(signUpTattooistRoute),
                      child: Container(
                        width: selectorWidth,
                        padding: const EdgeInsets.all(Sizes.medium),
                        decoration: const BoxDecoration(
                          color: AppColors.darkGreen,
                          borderRadius: BorderRadius.all(
                            Radius.circular(Sizes.medium),
                          ),
                        ),
                        child: Column(
                          children: <Widget>[
                            SvgPicture.asset(
                              AppImages.tattooMachine,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                            Spacing.verticalSmall,
                            Text(
                              t.tattooist,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.medium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
