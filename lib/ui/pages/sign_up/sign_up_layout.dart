import 'package:flutter/material.dart';
import 'package:game_app/ui/pages/sign_up/widgets/login_text.dart';
import 'package:game_app/ui/pages/sign_up/widgets/sign_up_form.dart';

import '../../../helper/app_data.dart';
import '../../../helper/utils.dart';
import '../../global_widgets/auth_custom_painter.dart';

class SignUpLayout extends StatelessWidget {
  const SignUpLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: AppData.shared.deviceSize,
          painter: AuthCustomPainter(),
        ),
        Positioned(
          left: 0,
          top: Utils.shared.percentPH(48),
          child: SignUpForm(),
        ),
        Positioned(
          right: Utils.shared.percentW(20),
          top: Utils.shared.percentPH(82),
          child: const LoginText(),
        ),
      ],
    );
  }
}
