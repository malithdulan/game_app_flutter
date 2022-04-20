import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/ui/pages/sign_in/blocs/sign_in_bloc/sign_in_bloc.dart';

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
            child: const Text("Google Sign In"),
          ),
          ElevatedButton(
            onPressed: () => _facebookSignIn(context),
            child: const Text("Facebook Sign In"),
          )
        ],
      ),
    );
  }
}
