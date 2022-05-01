import 'package:flutter/material.dart';

import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:game_app/helper/app_data.dart';
import 'package:game_app/helper/extensions.dart';
import 'package:game_app/ui/global_widgets/auth_custom_painter.dart';
import 'package:game_app/ui/global_widgets/form_header_title.dart';
import 'package:game_app/ui/pages/sign_in/widgets/forgot_text.dart';
import 'package:game_app/ui/pages/sign_in/widgets/register_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/ui/pages/sign_in/widgets/sign_in_form.dart';
import 'package:game_app/ui/pages/sign_in/widgets/social_sign_in.dart';

import '../../../helper/utils.dart';
import '../../global_widgets/loading_placeholder.dart';
import 'blocs/sign_in_bloc/sign_in_bloc.dart';

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
                left: 0,
                top: Utils.shared.percentPH(25),
                child: const FormHeaderTitle(text: "Sign In"),
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
              BlocBuilder<SignInBloc, SignInState>(
                buildWhen: (previous, current) =>
                    previous.authState != current.authState,
                builder: (context, state) => state.authState.isLoading
                    ? Container(
                        width: Utils.shared.percentW(100),
                        height: double.infinity,
                        child: const LoadingPlaceholder(),
                        color: Colors.black.withOpacity(0.8),
                      )
                    : const SizedBox(),
              ),
            ],
          )
        : const SizedBox();
  }
}
