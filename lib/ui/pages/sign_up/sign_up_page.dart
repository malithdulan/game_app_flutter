import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/extensions.dart';

import 'package:game_app/ui/pages/sign_up/sign_up_layout.dart';

import '../../../helper/navigator_keys.dart';
import '../../../helper/utils.dart';
import '../../../repositories/auth_repository.dart';
import '../sign_in/sign_in_page.dart';
import 'blocs/sign_up_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  _pushToLoginPage(BuildContext context) {
    NavigatorKeys.globalNavKey.currentState?.pushReplacement(
      MaterialPageRoute(
        builder: (context) => const SignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) =>
            SignUpBloc(repository: context.read<AuthRepository>()),
        child: BlocListener<SignUpBloc, SignUpState>(
          listenWhen: (previous, current) =>
              previous.authState != current.authState,
          listener: (context, state) {
            if (state.authState.isValid) {
              _pushToLoginPage(context);
            } else if (state.authState.isInValid) {
              //dismiss keyboard
              FocusManager.instance.primaryFocus?.unfocus();
              Utils.shared.showErrorToastMessage(context, state.errorMessage);
            }
          },
          child: const SignUpLayout(),
        ),
      ),
    );
  }
}
