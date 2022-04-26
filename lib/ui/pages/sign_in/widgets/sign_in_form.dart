import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game_app/helper/extensions.dart';

import 'package:game_app/helper/utils.dart';
import 'package:game_app/ui/global_widgets/form_button.dart';
import 'package:game_app/ui/global_widgets/form_container.dart';
import 'package:game_app/ui/global_widgets/form_text_field_decoration.dart';
import 'package:game_app/ui/global_widgets/loading_placeholder.dart';

import '../../../../repositories/models/auth_models/sign_in_user.dart';
import '../blocs/sign_in_bloc/sign_in_bloc.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key}) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _signInFormKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _signIn(BuildContext context) {
    if (_signInFormKey.currentState!.validate()) {
      SignInUser user = SignInUser(
          email: emailController.text,
          password: passwordController.text,
          accountType: "email");
      context.read<SignInBloc>().add(EmailSignIn(user: user));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Utils.shared.percentW(100),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          FormContainer(
            child: Form(
              key: _signInFormKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: Utils.shared.percentPH(1)),
                  SizedBox(
                    height: Utils.shared.percentPH(6),
                    child: TextFormField(
                      controller: emailController,
                      decoration: const FormTextFieldDecoration(
                        iconData: Icons.account_circle_rounded,
                        text: "Email",
                      ),
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: Utils.shared.fScale(20)),
                      validator: (value) =>
                          Utils.shared.validationCheck("email", value),
                    ),
                  ),
                  SizedBox(height: Utils.shared.percentPH(1)),
                  SizedBox(
                    height: Utils.shared.percentPH(6),
                    child: TextFormField(
                      controller: passwordController,
                      decoration: const FormTextFieldDecoration(
                        iconData: Icons.password_rounded,
                        text: "Password",
                      ),
                      obscureText: true,
                      cursorColor: Colors.black,
                      style: TextStyle(fontSize: Utils.shared.fScale(20)),
                      validator: (value) =>
                          Utils.shared.validationCheck("password", value),
                    ),
                  ),
                  SizedBox(height: Utils.shared.percentPH(1)),
                ],
              ),
            ),
          ),
          Positioned(
            right: Utils.shared.percentW(19),
            //(formContainer height 17 / 2) - half height of submit button
            top: (Utils.shared.percentPH(17) / 2) - Utils.shared.percentW(6),
            child: BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (previous, current) =>
                  previous.authState != current.authState,
              builder: (context, state) => state.authState.isLoading
                  ? const LoadingPlaceholder()
                  : FormButton(
                      callback: () => _signIn(context),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
