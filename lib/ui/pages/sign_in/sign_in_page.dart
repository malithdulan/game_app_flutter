import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/repositories/auth_repository.dart';
import 'package:game_app/ui/pages/sign_in/blocs/sign_in_bloc/sign_in_bloc.dart';

import 'package:game_app/ui/pages/sign_in/sign_in_layout.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) =>
            SignInBloc(repository: context.read<AuthRepository>()),
        child: BlocListener<SignInBloc, SignInState>(
          listenWhen: (previous, current) =>
              previous.isAuthenticated != current.isAuthenticated,
          listener: (context, state) => print(state.isAuthenticated),
          child: const SignInLayout(),
        ),
      ),
    );
  }
}
