import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
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
    return (MediaQuery.of(context).size.height != 0)
        ? Stack(
            fit: StackFit.loose,
            children: [
              CustomPaint(
                size: AppData.shared.deviceSize,
                painter: AuthCustomPainter(),
              ),
              Positioned(
                left: Utils.shared.percentW(7),
                top: Utils.shared.percentPH(68),
                child: const SocialSignIn(),
              ),
              Positioned(
                left: Utils.shared.percentW(7),
                top: Utils.shared.percentPH(83),
                child: const RegisterText(),
              ),
              Positioned(
                right: Utils.shared.percentW(20),
                top: Utils.shared.percentPH(68),
                child: const ForgotText(),
              ),
              KeyboardVisibilityBuilder(
                builder: (context, isVisible) {
                  double position = (isVisible)
                      ? Utils.shared.keyboardHeightPercentage(context)
                      : 42;
                  return Positioned(
                    left: 0,
                    bottom: Utils.shared.percentPH(position),
                    child: const SignInForm(),
                  );
                },
              ),
            ],
          )
        : const SizedBox();
  }
}
