import 'package:flutter/material.dart';
import 'package:game_app/ui/pages/sign_up/widgets/login_text.dart';
import 'package:game_app/ui/pages/sign_up/widgets/sign_up_form.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
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
          right: Utils.shared.percentW(20),
          top: Utils.shared.percentPH(82),
          child: const LoginText(),
        ),
        KeyboardVisibilityBuilder(
          builder: (context, isVisible) {
            double position = (isVisible)
                ? Utils.shared.keyboardHeightPercentage(context)
                : 28;
            return Positioned(
              left: 0,
              bottom: Utils.shared.percentPH(position),
              child: const SignUpForm(),
            );
          },
        ),
      ],
    );
  }
}
