library com.features.authentication.sign_up.screens;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../../gen/strings.g.dart';
import '../../../../../routes/app_router.dart';
import '../../../../../shared/widgets/ink_date_elevated_button.dart';
import '../../../../../shared/widgets/ink_date_snack_bar.dart';
import '../../../../../shared/widgets/ink_date_text_form_field.dart';
import '../../../../../shared/widgets/loading_screen.dart';
import '../../../../../shared/widgets/number_adder.dart';
import '../../../../../shared/widgets/sign_up_background.dart';
import '../../../../../theme/theme.dart';
import '../../../../../utils/extensions/string.dart';
import '../../../models/profile.dart';
import '../provider/sign_up_provider.dart';
import '../view_model/sign_up_state.dart';

part 'sign_up_screen.dart';
part 'admin_sign_up_screen.dart';
part 'tattooist_sign_up_screen.dart';
