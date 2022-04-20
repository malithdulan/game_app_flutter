import 'package:flutter/material.dart';

import 'package:game_app/helper/app_data.dart';
import 'package:game_app/ui/global_widgets/auth_custom_painter.dart';
import 'package:game_app/ui/pages/sign_in/widgets/forgot_text.dart';
import 'package:game_app/ui/pages/sign_in/widgets/register_text.dart';

import 'package:game_app/ui/pages/sign_in/widgets/sign_in_form.dart';
import 'package:game_app/ui/pages/sign_in/widgets/social_sign_in.dart';

import '../../../helper/utils.dart';

class SignInLayout extends StatelessWidget {
  const SignInLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.loose,
      children: [
        CustomPaint(
          size: AppData.shared.deviceSize,
          painter: AuthCustomPainter(),
        ),
        Positioned(
          left: 0,
          top: Utils.shared.percentPH(45),
          child: const SignInForm(),
        ),
        Positioned(
          left: Utils.shared.percentW(7),
          top: Utils.shared.percentPH(65),
          child: const SocialSignIn(),
        ),
        Positioned(
          left: Utils.shared.percentW(7),
          top: Utils.shared.percentPH(80),
          child: const RegisterText(),
        ),
        Positioned(
          right: Utils.shared.percentW(20),
          top: Utils.shared.percentPH(62),
          child: const ForgotText(),
        ),
      ],
    );
  }
}
