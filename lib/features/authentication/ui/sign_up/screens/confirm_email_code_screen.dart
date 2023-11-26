import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

import '../../../../../gen/strings.g.dart';
import '../../../../../routes/app_router.dart';
import '../../../../../shared/widgets/ink_date_elevated_button.dart';
import '../../../../../shared/widgets/ink_date_snack_bar.dart';
import '../../../../../shared/widgets/ink_date_text_button.dart';
import '../../../../../shared/widgets/loading_screen.dart';
import '../../../../../shared/widgets/sign_up_background.dart';
import '../../../../../shared/widgets/succesfull_dialog.dart';
import '../../../../../theme/theme.dart';
import '../provider/sign_up_provider.dart';
import '../view_model/sign_up_state.dart';

class ConfirmationEmailCodeScreen extends ConsumerWidget {
  const ConfirmationEmailCodeScreen({
    super.key,
  });

  static const int codeLength = 6;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController codeController = TextEditingController();
    final SignUpState signUpState = ref.watch(signUpProvider);

    if (signUpState.signUpStatus == SignUpStatus.error) {
      showInkDateSnackBar(t.sign_up.admin.error_code);
    }
    if (signUpState.signUpStatus == SignUpStatus.resendSuccess) {
      showInkDateSnackBar(t.sign_up.admin.error_code);
    }
    if (signUpState.signUpStatus == SignUpStatus.success) {
      WidgetsBinding.instance.addPostFrameCallback(
        (_) async {
          await showDialog(
            context: context,
            builder: (BuildContext context) => SuccessfullDialog(
              message: t.sign_up.success_sign_up_description,
              onTap: () => context.pushReplacementNamed(loginRoute),
              title: t.sign_up.success_sign_up,
              width: double.infinity,
            ),
          );
        },
      );
    }

    return Scaffold(
      body: SignUpBackground(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(Sizes.large),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacing.verticalXLarge,
                  Center(
                    child: CircleAvatar(
                      backgroundColor: AppColors.beige,
                      radius: 50,
                      child: SvgPicture.asset(
                        AppImages.logoInkDate,
                      ),
                    ),
                  ),
                  Spacing.verticalXLarge,
                  Text(
                    t.sign_up.code_sent,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacing.verticalLarge,
                  Text(
                    t.sign_up.type_code,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Spacing.verticalMedium,
                  Center(
                    child: Pinput(
                      hapticFeedbackType: HapticFeedbackType.mediumImpact,
                      length: 6,
                      controller: codeController,
                      onCompleted: (String value) async => ref
                          .read(signUpProvider.notifier)
                          .confirmCode(code: value),
                      defaultPinTheme: PinTheme(
                        width: Sizes.xxLarge,
                        height: Sizes.xxLarge,
                        textStyle: const TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          border: Border.all(color: AppColors.darkGreen),
                        ),
                      ),
                    ),
                  ),
                  Spacing.verticalXLarge,
                  InkDateElevatedButton(
                    isNegative: true,
                    text: t.confirm,
                    onTap: () async => ref
                        .read(signUpProvider.notifier)
                        .confirmCode(code: codeController.text),
                  ),
                  Spacing.verticalLarge,
                  Center(
                    child: Text(
                      t.sign_up.code_not_sent,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Spacing.verticalSmall,
                  Center(
                    child: InkDateTextButton(
                      text: t.sign_up.resend_code,
                      onPressed: () async =>
                          ref.read(signUpProvider.notifier).resendCode(),
                    ),
                  ),
                ],
              ),
            ),
            if (signUpState.signUpStatus == SignUpStatus.loading)
              const LoadingScreen()
          ],
        ),
      ),
    );
  }
}
