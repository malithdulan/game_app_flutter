import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/enums.dart';
import 'package:game_app/helper/extensions.dart';
import 'package:game_app/helper/utils.dart';
import 'package:game_app/repositories/auth_repository.dart';
import 'package:game_app/ui/pages/home/home_page.dart';
import 'package:game_app/ui/pages/sign_in/blocs/sign_in_bloc/sign_in_bloc.dart';

import 'package:game_app/ui/pages/sign_in/sign_in_layout.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  _pushToHomePage(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const HomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) =>
            SignInBloc(repository: context.read<AuthRepository>()),
        child: BlocListener<SignInBloc, SignInState>(
          listenWhen: (previous, current) =>
              previous.authState != current.authState,
          listener: (context, state) {
            if (state.authState.isValid) {
              _pushToHomePage(context);
            } else if (state.authState.isInValid) {
              Utils.shared.showErrorToastMessage(context, state.errorMessage);
            }
          },
          child: const SignInLayout(),
        ),
      ),
    );
  }
}
