import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:game_app/ui/pages/sign_in/blocs/sign_in_bloc/sign_in_bloc.dart';

class SignInLayout extends StatelessWidget {
  const SignInLayout({Key? key}) : super(key: key);

  _googleSignIn(BuildContext context) {
    context.read<SignInBloc>().add(GoogleSignIn());
  }

  _facebookSignIn(BuildContext context) {
    context.read<SignInBloc>().add(FacebookSignIn());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IntrinsicWidth(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
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
      ),
    );
  }
}
