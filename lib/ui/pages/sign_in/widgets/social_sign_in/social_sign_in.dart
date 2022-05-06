import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:game_app/helper/utils.dart';
import 'package:game_app/ui/pages/sign_in/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:game_app/ui/pages/sign_in/widgets/social_sign_in/social_button_content.dart';

class SocialSignIn extends StatelessWidget {
  const SocialSignIn({Key? key}) : super(key: key);

  _googleSignIn(BuildContext context) {
    context.read<SignInBloc>().add(GoogleSignIn());
  }

  _facebookSignIn(BuildContext context) {
    context.read<SignInBloc>().add(FacebookSignIn());
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () => _googleSignIn(context),
            child: const SocialButtonContent(
              icon: FontAwesomeIcons.google,
              text: "Sign In",
            ),
          ),
          SizedBox(
            width: Utils.shared.percentW(30),
            child: ElevatedButton(
              onPressed: () => _facebookSignIn(context),
              child: const SocialButtonContent(
                icon: FontAwesomeIcons.facebook,
                text: "Sign In",
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueAccent)),
            ),
          )
        ],
      ),
    );
  }
}
